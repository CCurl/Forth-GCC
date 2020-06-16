format PE console 

include 'win32ax.inc'
include 'macros.s'

section '.code' code readable executable
entry $
        ; To clean up the stack after calls
        mov [InitialESP], esp
        mov ebp, esp

        invoke __getmainargs, argc, argv, env, 0, stup
        mov esp, ebp
        cmp [argc], 2
        jne argError
        mov esi, [argv]
        mov eax, [esi + 4]
        mov [fileName], eax

        ; Ensure that the file is there        
        push [fileName]
        call [GetFileAttributes]
        cmp eax, -1
        je fileError

        ; Open the file
        push openModeRB
        push [fileName]
        call [fopen]
        mov esp, ebp
        mov [stream], eax

        ; Get the file size ...
        ; fseek() to the end and then use ftell() to get the size
        ; fseek(fp, offset, from): - from: 0 => SEEK_SET, 1 => SEEK_CUR, 2 => SEEK_END
        push 2
        push 0
        push [stream]
        call [fseek]
        mov esp, ebp

        ; Get the file size
        push [stream]
        call [ftell]
        mov [fileSize], eax
        mov esp, ebp

        ; Reset the file position pointer to beginning of the file
        push 0
        push 0
        push [stream]
        call [fseek]
        mov esp, ebp

        ; Allocate memory for the file
        push [fileSize]
        call [malloc]
        mov [theMemory], eax
        mov esp, ebp

        ; Read the entire file into memory
        push [stream]
        push [fileSize]
        push 1
        push [theMemory]
        call [fread]
        mov esp, ebp

        ; Close the file
        push [stream]
        call f_FCLOSE
        mov esp, ebp

        ; RESET the VM
        call f_RESET

        ; **************************************************
        ;                 Register usage
        ; **************************************************
        ; eax: Free to use
        ; ebx is the VM's TOS (top-of-stack)
        ; ecx: Free to use
        ; edx is the start of the VM's address space
        ; esi is the VM's IP (instruction-pointer)
        ; edi is the start of the opcode jump table
        ; ebp is the VM's stack pointer
        ; **************************************************

cpuLoop:
        xor ecx, ecx
        mov cl, [esi]
        ; call dbgEsi
        inc esi
        mov eax, [edi+ecx*4]
        call eax
        jmp cpuLoop

; -------------------------------------------------------------------------------------
; RESET
f_RESET:
            ; Return stack
            mov eax, rStack
            add eax, CELL_SIZE
            mov [rStack], eax
            mov [rDepth], 0

            ; Data stack
            mov ebp, dStack
            mov [dDepth], 0

            ; opcode jump table
            mov edi, jmpTable

            ; edx = theMemory
            mov edx, [theMemory]

            ; esi = IP/PC
            mov esi, edx

            mov esp, [InitialESP]
            jmp cpuLoop

; -------------------------------------------------------------------------------------
dbgEsi:
        push ecx
        push esi
        push edi
        push edx
                sub esi, edx
                push ebx
                push ecx
                push esi
                push dbgEsiEcx
                call [printf]
                pop eax
                pop eax
                pop eax
                pop eax
        pop edx
        pop edi
        pop esi
        pop ecx
        ret

; -------------------------------------------------------------------------------------
f_TYPE: ; ( addr count -- )
        cmp ebx, 0
        je f_tpD
        call f_SWAP
        call f_DUP
        call f_CFETCH
        call f_EMIT
        call f_INC
        call f_SWAP
        call f_DEC
        jmp f_TYPE

f_tpD:  call f_DROP
        call f_DROP
        ret

; -------------------------------------------------------------------------------------
argError:
        invoke printf, printArgError
        jmp f_BYE
; -------------------------------------------------------------------------------------
fileError:
        invoke printf, printFileError, [fileName]
        jmp f_BYE

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; The VM primitives
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; LITERAL
f_LITERAL:
            mov eax, [esi]
            add esi, CELL_SIZE
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; FETCH
f_FETCH:
            add ebx, edx
            mov ebx, [ebx]
            ret

; -------------------------------------------------------------------------------------
; STORE
f_STORE:
            m_pop ecx
            m_pop eax
            add ecx, edx
            mov [ecx], eax
            ret

; -------------------------------------------------------------------------------------
; SWAP
f_SWAP:
            m_get2ND eax
            m_set2ND ebx
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; DROP
f_DROP:
            m_drop
            ret

; -------------------------------------------------------------------------------------
; DUP
f_DUP:
            m_push ebx
            ret

; -------------------------------------------------------------------------------------
; SLITERAL
f_SLITERAL:
            mov eax, esi
            sub eax, edx
            m_push eax
            xor eax, eax
            mov al, [esi]
            add esi, eax
            inc esi
            inc esi
            ret

; -------------------------------------------------------------------------------------
; JMP
f_JMP:
            mov esi, [esi]
            add esi, edx
            ret

; -------------------------------------------------------------------------------------
; JMPZ
f_JMPZ:
            m_pop eax
            cmp eax, 0
            je f_JMP
            ; jmp noJMP
noJMP:      add esi, CELL_SIZE
            ret

; -------------------------------------------------------------------------------------
; JMPNZ
f_JMPNZ:
            m_pop eax
            cmp eax, 0
            jne f_JMP
            jmp noJMP

; -------------------------------------------------------------------------------------
; CALL
f_CALL:
            push dword [esi]
            add esi, CELL_SIZE
            push esi
            call u_rPush
            pop esi
            pop esi
            add esi, edx
            ret

u_rPush:
        cmp [rDepth], 63
        jg rpO
        inc [rDepth]

        mov eax, [esp + 4]              ; the val to rpush
        push ebp
        mov ebp, [rStack]
        add ebp, CELL_SIZE
        mov [ebp], eax
        mov [rStack], ebp
        pop ebp
        ret

rpO:    ret ; RStack overflow

u_rPop:                                 ; returns the val in eax
       cmp [rDepth], 1
       jl rpU
       dec [rDepth]

       push ebp
       mov ebp, [rStack]
       mov eax, [ebp]
       sub ebp, CELL_SIZE
       mov [rStack], ebp
       pop ebp
       ret

rpU:   ret ; RStack underflow

; -------------------------------------------------------------------------------------
; RET
f_RET:
            cmp [rDepth], 1
            jl f_BYE

            call u_rPop
            mov esi, eax
            ret

; -------------------------------------------------------------------------------------
; OR
f_OR:
            m_pop eax
            or ebx, eax
            ret

; -------------------------------------------------------------------------------------
; CLITERAL
f_CLITERAL:
            xor eax, eax
            mov al, [esi]
            m_push eax
            inc esi
            ret

; -------------------------------------------------------------------------------------
; CFETCH
f_CFETCH:
            add ebx, edx
            xor eax, eax
            mov al, [ebx]
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; CSTORE
f_CSTORE:
            m_pop ecx
            m_pop eax
            add ecx, edx
            mov [ecx], al
            ret

; -------------------------------------------------------------------------------------
; ADD
f_ADD:
            m_pop eax
            add ebx, eax
            ret

; -------------------------------------------------------------------------------------
; SUB
f_SUB:
            m_pop eax
            sub ebx, eax
            ret

; -------------------------------------------------------------------------------------
; MUL
f_MUL:
            push edx
            m_pop eax
            xor edx, edx
            mul ebx
            m_setTOS eax
            pop edx
            ret

; -------------------------------------------------------------------------------------
; DIV
f_DIV:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; LT
f_LT:
            m_pop eax
            cmp ebx, eax
            jl eq_T
            jmp eq_F

; -------------------------------------------------------------------------------------
; EQ
f_EQ:
            m_pop eax
            cmp ebx, eax
            je eq_T
eq_F:       m_setTOS 0
            ret
eq_T:       m_setTOS -1
            ret

; -------------------------------------------------------------------------------------
; GT
f_GT:
            m_pop eax
            cmp ebx, eax
            jg eq_T
            jmp eq_F

; -------------------------------------------------------------------------------------
; DICTP
f_DICTP:
            add esi, CELL_SIZE
            ret

; -------------------------------------------------------------------------------------
; EMIT
f_EMIT:
            m_pop eax
            push edx
            push eax
            call [putchar]
            pop eax
            pop edx
            ret

; -------------------------------------------------------------------------------------
; OVER
f_OVER:
            m_get2ND eax
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; COMPARE
f_COMPARE:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; FOPEN
f_FOPEN: ; ( name mode -- fp )
            m_pop eax
            m_pop ecx
            add eax, edx
            add ecx, edx
            push edx
            push eax
            push ecx
            call [fopen]
            m_push eax
            pop eax
            pop eax
            pop edx
            ret

; -------------------------------------------------------------------------------------
; FREAD
f_FREAD:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; FREADLINE
f_FREADLINE:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; FWRITE
f_FWRITE:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; FCLOSE
f_FCLOSE:   ; ( fp -- )
            m_pop eax
            push edx
            push eax
            call [fclose]
            pop eax
            pop edx
            ret

; -------------------------------------------------------------------------------------
; DTOR
f_DTOR:
            m_pop eax
            push eax
            call u_rPush
            pop eax
            ret

; -------------------------------------------------------------------------------------
; RTOD
f_RTOD:
            call u_rPop
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; LOGLEVEL
f_LOGLEVEL:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; AND
f_AND:
            m_pop eax
            and ebx, eax
            ret

; -------------------------------------------------------------------------------------
; PICK
f_PICK:
        ;push edx
        ;push 1
        ;push prtHere
        ;call [printf]
        ;pop eax
        ;pop eax
        ;pop edx
            m_pop eax
            shl eax, CELL_SHIFT
            mov ecx, ebp
            sub ecx, eax
            mov eax, [ecx]
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; DEPTH
f_DEPTH:
            mov eax, [dDepth]
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; GETCH
f_GETCH:
        ;push edx
        ;push 2
        ;push prtHere
        ;call [printf]
        ;pop eax
        ;pop eax
        ;pop edx
            push edx
            call [getch]
            pop edx
            cmp eax, 3
            je f_BYE
            m_push eax
            ret

; -------------------------------------------------------------------------------------
; COMPAREI
f_COMPAREI:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; UNUSED1
f_UNUSED1:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; USPUSH
f_USPUSH:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; USPOP
f_USPOP:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; INC
f_INC:
            inc ebx
            ret

; -------------------------------------------------------------------------------------
; RDEPTH
f_RDEPTH:
            m_push [rDepth]
            ret

; -------------------------------------------------------------------------------------
; DEC
f_DEC:
            dec ebx
            ret

; -------------------------------------------------------------------------------------
; GETTICK
f_GETTICK:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; BREAK
f_BREAK:
            ; TODO: fill this in
            m_pop eax
            m_push eax
            m_getTOS eax
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; BYE
f_BYE:
            invoke printf, printBye
            pop eax

            push 0
            call [ExitProcess]
            ret

f_UnknownOpcode:
            push ecx
            push unknownOpcode
            call [printf]
            pop eax
            pop eax

            jmp f_BYE
            jmp f_RESET

; -------------------------------------------------------------------------------------

section '.bss' data readable writable
argc dd ?
argv dd ?
env dd ?
stup dd ?

stream dd ?
one_char dd 0
InitialESP dd 0

fileName dd ?
fileSize dd ?
theMemory dd ?
dDepth dd 0
dStack dd 64 dup (0)
rDepth dd 0
rStack dd 64 dup (0)
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
jmpTable dd f_UnknownOpcode ; 0
dd f_LITERAL ; 1
dd f_FETCH ; 2
dd f_STORE ; 3
dd f_SWAP ; 4
dd f_DROP ; 5
dd f_DUP ; 6
dd f_SLITERAL ; 7
dd f_JMP ; 8
dd f_JMPZ ; 9
dd f_JMPNZ ; 10
dd f_CALL ; 11
dd f_RET ; 12
dd f_OR ; 13
dd f_CLITERAL ; 14
dd f_CFETCH ; 15
dd f_CSTORE ; 16
dd f_ADD ; 17
dd f_SUB ; 18
dd f_MUL ; 19
dd f_DIV ; 20
dd f_LT ; 21
dd f_EQ ; 22
dd f_GT ; 23
dd f_DICTP ; 24
dd f_EMIT ; 25
dd f_OVER ; 26
dd f_COMPARE ; 27
dd f_FOPEN ; 28
dd f_FREAD ; 29
dd f_FREADLINE ; 30
dd f_FWRITE ; 31
dd f_FCLOSE ; 32
dd f_DTOR ; 33
dd f_RTOD ; 34
dd f_LOGLEVEL ; 35
dd f_AND ; 36
dd f_PICK ; 37
dd f_DEPTH ; 38
dd f_GETCH ; 39
dd f_COMPAREI ; 40
dd f_UnknownOpcode ; 41
dd f_USPUSH ; 42
dd f_USPOP ; 43
dd f_INC ; 44
dd f_RDEPTH ; 45
dd f_DEC ; 46
dd f_GETTICK ; 47
dd f_UnknownOpcode ; 48
dd f_UnknownOpcode ; 49
dd f_UnknownOpcode ; 50
dd f_UnknownOpcode ; 51
dd f_UnknownOpcode ; 52
dd f_UnknownOpcode ; 53
dd f_UnknownOpcode ; 54
dd f_UnknownOpcode ; 55
dd f_UnknownOpcode ; 56
dd f_UnknownOpcode ; 57
dd f_UnknownOpcode ; 58
dd f_UnknownOpcode ; 59
dd f_UnknownOpcode ; 60
dd f_UnknownOpcode ; 61
dd f_UnknownOpcode ; 62
dd f_UnknownOpcode ; 63
dd f_UnknownOpcode ; 64
dd f_UnknownOpcode ; 65
dd f_UnknownOpcode ; 66
dd f_UnknownOpcode ; 67
dd f_UnknownOpcode ; 68
dd f_UnknownOpcode ; 69
dd f_UnknownOpcode ; 70
dd f_UnknownOpcode ; 71
dd f_UnknownOpcode ; 72
dd f_UnknownOpcode ; 73
dd f_UnknownOpcode ; 74
dd f_UnknownOpcode ; 75
dd f_UnknownOpcode ; 76
dd f_UnknownOpcode ; 77
dd f_UnknownOpcode ; 78
dd f_UnknownOpcode ; 79
dd f_UnknownOpcode ; 80
dd f_UnknownOpcode ; 81
dd f_UnknownOpcode ; 82
dd f_UnknownOpcode ; 83
dd f_UnknownOpcode ; 84
dd f_UnknownOpcode ; 85
dd f_UnknownOpcode ; 86
dd f_UnknownOpcode ; 87
dd f_UnknownOpcode ; 88
dd f_UnknownOpcode ; 89
dd f_UnknownOpcode ; 90
dd f_UnknownOpcode ; 91
dd f_UnknownOpcode ; 92
dd f_UnknownOpcode ; 93
dd f_UnknownOpcode ; 94
dd f_UnknownOpcode ; 95
dd f_UnknownOpcode ; 96
dd f_UnknownOpcode ; 97
dd f_UnknownOpcode ; 98
dd f_UnknownOpcode ; 99
dd f_UnknownOpcode ; 100
dd f_UnknownOpcode ; 101
dd f_UnknownOpcode ; 102
dd f_UnknownOpcode ; 103
dd f_UnknownOpcode ; 104
dd f_UnknownOpcode ; 105
dd f_UnknownOpcode ; 106
dd f_UnknownOpcode ; 107
dd f_UnknownOpcode ; 108
dd f_UnknownOpcode ; 109
dd f_UnknownOpcode ; 110
dd f_UnknownOpcode ; 111
dd f_UnknownOpcode ; 112
dd f_UnknownOpcode ; 113
dd f_UnknownOpcode ; 114
dd f_UnknownOpcode ; 115
dd f_UnknownOpcode ; 116
dd f_UnknownOpcode ; 117
dd f_UnknownOpcode ; 118
dd f_UnknownOpcode ; 119
dd f_UnknownOpcode ; 120
dd f_UnknownOpcode ; 121
dd f_UnknownOpcode ; 122
dd f_UnknownOpcode ; 123
dd f_UnknownOpcode ; 124
dd f_UnknownOpcode ; 125
dd f_UnknownOpcode ; 126
dd f_UnknownOpcode ; 127
dd f_UnknownOpcode ; 128
dd f_UnknownOpcode ; 129
dd f_UnknownOpcode ; 130
dd f_UnknownOpcode ; 131
dd f_UnknownOpcode ; 132
dd f_UnknownOpcode ; 133
dd f_UnknownOpcode ; 134
dd f_UnknownOpcode ; 135
dd f_UnknownOpcode ; 136
dd f_UnknownOpcode ; 137
dd f_UnknownOpcode ; 138
dd f_UnknownOpcode ; 139
dd f_UnknownOpcode ; 140
dd f_UnknownOpcode ; 141
dd f_UnknownOpcode ; 142
dd f_UnknownOpcode ; 143
dd f_UnknownOpcode ; 144
dd f_UnknownOpcode ; 145
dd f_UnknownOpcode ; 146
dd f_UnknownOpcode ; 147
dd f_UnknownOpcode ; 148
dd f_UnknownOpcode ; 149
dd f_UnknownOpcode ; 150
dd f_UnknownOpcode ; 151
dd f_UnknownOpcode ; 152
dd f_UnknownOpcode ; 153
dd f_UnknownOpcode ; 154
dd f_UnknownOpcode ; 155
dd f_UnknownOpcode ; 156
dd f_UnknownOpcode ; 157
dd f_UnknownOpcode ; 158
dd f_UnknownOpcode ; 159
dd f_UnknownOpcode ; 160
dd f_UnknownOpcode ; 161
dd f_UnknownOpcode ; 162
dd f_UnknownOpcode ; 163
dd f_UnknownOpcode ; 164
dd f_UnknownOpcode ; 165
dd f_UnknownOpcode ; 166
dd f_UnknownOpcode ; 167
dd f_UnknownOpcode ; 168
dd f_UnknownOpcode ; 169
dd f_UnknownOpcode ; 170
dd f_UnknownOpcode ; 171
dd f_UnknownOpcode ; 172
dd f_UnknownOpcode ; 173
dd f_UnknownOpcode ; 174
dd f_UnknownOpcode ; 175
dd f_UnknownOpcode ; 176
dd f_UnknownOpcode ; 177
dd f_UnknownOpcode ; 178
dd f_UnknownOpcode ; 179
dd f_UnknownOpcode ; 180
dd f_UnknownOpcode ; 181
dd f_UnknownOpcode ; 182
dd f_UnknownOpcode ; 183
dd f_UnknownOpcode ; 184
dd f_UnknownOpcode ; 185
dd f_UnknownOpcode ; 186
dd f_UnknownOpcode ; 187
dd f_UnknownOpcode ; 188
dd f_UnknownOpcode ; 189
dd f_UnknownOpcode ; 190
dd f_UnknownOpcode ; 191
dd f_UnknownOpcode ; 192
dd f_UnknownOpcode ; 193
dd f_UnknownOpcode ; 194
dd f_UnknownOpcode ; 195
dd f_UnknownOpcode ; 196
dd f_UnknownOpcode ; 197
dd f_UnknownOpcode ; 198
dd f_UnknownOpcode ; 199
dd f_UnknownOpcode ; 200
dd f_UnknownOpcode ; 201
dd f_UnknownOpcode ; 202
dd f_UnknownOpcode ; 203
dd f_UnknownOpcode ; 204
dd f_UnknownOpcode ; 205
dd f_UnknownOpcode ; 206
dd f_UnknownOpcode ; 207
dd f_UnknownOpcode ; 208
dd f_UnknownOpcode ; 209
dd f_UnknownOpcode ; 210
dd f_UnknownOpcode ; 211
dd f_UnknownOpcode ; 212
dd f_UnknownOpcode ; 213
dd f_UnknownOpcode ; 214
dd f_UnknownOpcode ; 215
dd f_UnknownOpcode ; 216
dd f_UnknownOpcode ; 217
dd f_UnknownOpcode ; 218
dd f_UnknownOpcode ; 219
dd f_UnknownOpcode ; 220
dd f_UnknownOpcode ; 221
dd f_UnknownOpcode ; 222
dd f_UnknownOpcode ; 223
dd f_UnknownOpcode ; 224
dd f_UnknownOpcode ; 225
dd f_UnknownOpcode ; 226
dd f_UnknownOpcode ; 227
dd f_UnknownOpcode ; 228
dd f_UnknownOpcode ; 229
dd f_UnknownOpcode ; 230
dd f_UnknownOpcode ; 231
dd f_UnknownOpcode ; 232
dd f_UnknownOpcode ; 233
dd f_UnknownOpcode ; 234
dd f_UnknownOpcode ; 235
dd f_UnknownOpcode ; 236
dd f_UnknownOpcode ; 237
dd f_UnknownOpcode ; 238
dd f_UnknownOpcode ; 239
dd f_UnknownOpcode ; 240
dd f_UnknownOpcode ; 241
dd f_UnknownOpcode ; 242
dd f_UnknownOpcode ; 243
dd f_UnknownOpcode ; 244
dd f_UnknownOpcode ; 245
dd f_UnknownOpcode ; 246
dd f_UnknownOpcode ; 247
dd f_UnknownOpcode ; 248
dd f_UnknownOpcode ; 249
dd f_UnknownOpcode ; 250
dd f_UnknownOpcode ; 251
dd f_UnknownOpcode ; 252
dd f_UnknownOpcode ; 253
dd f_UnknownOpcode ; 254
dd f_UnknownOpcode ; 255
dd f_BREAK ; 253
dd f_RESET ; 254
dd f_BYE ; 255

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------

section '.rdata' data readable
printArgError db 'Error: Wrong number of arguments. Run file with "program.exe <file>"', 0
printFileError db 'Error: File [%s] does not exist. Check spelling and try again.', 0
printFileSize db 'File [%s], size: %ld', 13, 10, 0
dbgEsiEcx db ' (ESI: 0x%04lx, ECX: %02x, TOS: %d) ', 0
printTheMemory db 'Memory: %08lX', 13, 10, 0
unknownOpcode db 'unknown opcode! 0x%02X', 13, 10, 0
printOneCharH db '%02x ', 0
printOneCharD db '%d ', 0
jmpCalled db ' JMP called!', 0
printOneChar db '%c', 0
printBye db ' bye', 0
prtHere db '(here %d)', 0
openModeRB db 'rb', 0

CELL_SIZE = 4
CELL_SHIFT = 2

; -------------------------------------------------------------------------------------
section '.idata' data readable import

library kernel32, 'kernel32.dll', msvcrt, 'msvcrt.dll', conio, 'conio.dll'

import kernel32, ExitProcess,'ExitProcess', GetFileAttributes, 'GetFileAttributesA' \
    , VirtualAlloc, 'VirtualAllocA'

import msvcrt, printf, 'printf', __getmainargs, '__getmainargs' \
    , fopen,'fopen', fclose, 'fclose', fseek, 'fseek', ftell, 'ftell' \
    , fread, 'fread', fgetc, 'fgetc', malloc, 'malloc', putchar, 'putchar', getch, '_getch'

    ; the end
