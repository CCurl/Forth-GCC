; Test to see if CS and DS are equal

format pe console

include 'win32ax.inc' ; you can simply switch between win32ax, win32wx, win64ax and win64wx here

section '.text' code readable writeable executable

STDIN  dd 0
STDOUT dd 0

; -----------------------------------------------------------------------------
macro m_PUSH val 
{ 
        add ebp, 4
        mov [ebp], ebx
        mov ebx, val
}

macro m_POP tgt 
{ 
        mov tgt, ebx 
        m_DROP
}

macro m_DROP 
{ 
        mov ebx, [ebp]
        sub ebp, 4
}

; -----------------------------------------------------------------------------
macro m_RPUSH val 
{ 
        push val
}

macro m_RPOP tgt 
{ 
        pop tgt
}

; -----------------------------------------------------------------------------
cs_PUSH:
        cmp ebp, DSTACKEND
        jl cspsOK
        invoke  MessageBox,HWND_DESKTOP,"Stack overflow", "xxx",MB_OK
cspsOK: ret

; -----------------------------------------------------------------------------
cs_POP:
        cmp ebp, DSTACK
        jg csppOK
        invoke  MessageBox,HWND_DESKTOP,"Stack underflow", "xxx",MB_OK
csppOK: ret

; -----------------------------------------------------------------------------
startup:

        push STD_INPUT_HANDLE
        call [GetStdHandle]
        mov [STDIN], eax

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax

        mov ebp, DSTACK
        mov ebx, 0

        m_PUSH 'c'
        m_PUSH 'b'
        m_PUSH 'a'
        call fEMIT_XT
        call fEMIT_XT
        call fEMIT_XT
        ret

; -----------------------------------------------------------------------------
mainLoop:
        call fWORDS_XT
        ret

; -----------------------------------------------------------------------------
buf0      db 16 dup 0
HERE_ADDR dd HERE_INIT
LAST_ADDR dd DICT_START
BASE_ADDR dd 10

HERE_INIT  dd 24
THE_MEMORY db (8*1024) dup 0

; -----------------------------------------------------------------------------
do_exec:
        push ecx
        add ecx, 4
        mov ecx, [ecx]
        call ecx
        pop ecx
        ret

; -----------------------------------------------------------------------------
macro dict_ENTRY dent, nxt, fl, ct, nm {
dent    dd nxt
        dd dent#_XT
        db fl
        db ct, nm, 0
dent#_XT:
}

; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
DICT_START:
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
; -----------------------------------------------------------------------------
dict_ENTRY fDUP, fOVER, 1, 3, "DUP"
        m_PUSH ebx
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fOVER, fDROP, 1, 4, "OVER"
        mov eax, [ebp]
        m_PUSH eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fDROP, fSWAP, 1, 4, "DROP"
        m_DROP
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fSWAP, fSLMOD, 1, 4, "SWAP"
        mov eax, [ebp]
        mov [ebp], ebx
        mov ebx, eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fSLMOD, fthMUL, 0, 4, "/MOD"
        m_POP ecx
        m_POP eax
        cmp ecx, 0
        je smDivBy0
        xor edx, edx
        div ecx
        m_PUSH eax              ; quotient
        m_PUSH edx              ; remainder
        ret
smDivBy0:
        m_PUSH 0
        m_PUSH 0
ret
; -----------------------------------------------------------------------------
dict_ENTRY fthMUL, fthDIV, 0, 1, "*"
        m_POP ecx
        mov eax, ebx
        mul ecx
        mov ebx, eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fthDIV, fthADD, 0, 1, "/"
        call fSLMOD_XT
        m_DROP
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fthADD, fthSUB, 0, 1, "+"
        m_POP eax
        add ebx, eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fthSUB, fGT, 0, 1, "-"
        m_POP eax
        sub ebx, eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fGT, fLT, 0, 1, ">"
        m_POP eax
        cmp ebx, eax
        jg  cmp_TT
        jmp cmp_FF
; -----------------------------------------------------------------------------
dict_ENTRY fLT, fEQ, 0, 1, "<"
        m_POP eax
        cmp ebx, eax
        jl  cmp_TT
        jmp cmp_FF
; -----------------------------------------------------------------------------
dict_ENTRY fEQ, fTRUE, 0, 1, "="
        m_POP eax
        cmp ebx, eax
        je cmp_TT
        ; ... fall through to FALSE
; -----------------------------------------------------------------------------
cmp_FF: mov ebx, 0
        ret
cmp_TT: mov ebx, 1
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fTRUE, fFALSE, 0, 4, "TRUE"
        m_PUSH 1
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fFALSE, fDOT2, 0, 5, "FALSE"
        m_PUSH 0
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fDOT2, fDOT1, 0, 1, "."
        call fDOT1_XT
        m_PUSH ' '
        call fEMIT_XT
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fDOT1, fCOUNT_TO, 0, 3, "(.)"
                m_PUSH ebx                      ; DUP
                m_PUSH 0                        ; CLITERAL (0000)
                call fEQ_XT
                m_POP eax
                cmp eax, 0
                je L00000A9B                    ; JMPZ
                m_DROP                          ; DROP
                m_PUSH '0'                       ; CLITERAL (0030)
                call fEMIT_XT
                ret
L00000A9B:      m_PUSH ebx                      ; DUP
                m_PUSH 0                        ; CLITERAL (0000)
                call fLT_XT
                m_POP eax
                cmp eax, 0
                je L00000AAE                    ; JMPZ
                m_PUSH 0                        ; CLITERAL (0000)
                call fthSUB_XT
                m_PUSH 1                        ; CLITERAL (0001)
                jmp L00000AB0                   ; JMP
L00000AAE:      m_PUSH 0                        ; CLITERAL (0000)
L00000AB0:      
                m_POP eax                       ; DTOR (>R)
                m_RPUSH eax
                m_PUSH 0                        ; CLITERAL (0000)
                call fSWAP_XT
L00000AB4:      m_PUSH ebx                      ; DUP
                m_POP eax
                cmp eax, 0
                je L00000ADA                    ; JMPZ
                call fBASE_XT
                call fFETCH_XT
                call fSLMOD_XT                  ; CALL 0A79, /MOD
                m_PUSH '0'                      ; '0' + 
                call fthADD_XT
                m_PUSH ebx                      ; DUP '9' > IF 7 + THEN
                m_PUSH '9'                      ; CLITERAL (0009)
                call fGT_XT
                m_POP eax
                cmp eax, 0
                je L00000AD3                    ; JMPZ
                m_PUSH 7                        ; CLITERAL (0007)
                call fthADD_XT
L00000AD3:     
                call fSWAP_XT
                jmp L00000AF7                   ; JMP
L00000ADA:      m_DROP                          ; DROP
                m_RPOP eax                      ; RTOD (R>)
                m_PUSH eax
                m_POP eax
                cmp eax, 0
                je L00000AE4                    ; JMPZ
                m_PUSH 45                       ; CLITERAL (002D)
                call fEMIT_XT
L00000AE4:      m_PUSH ebx                      ; DUP
                m_POP eax
                cmp eax, 0
                je L00000AF0                    ; JMPZ
                call fEMIT_XT
                jmp L00000AF2                   ; JMP
L00000AF0:      m_POP eax                       ; DROP
                ret
L00000AF2:      jmp L00000AE4                   ; JMP
L00000AF7:      jmp L00000AB4                   ; JMP
                ret

; -----------------------------------------------------------------------------
dict_ENTRY fCOUNT_TO, fCOUNT, 0, 8, "COUNT_TO"
        ;
        ; : COUNT_TO DO 1- DUP 0 > WHILE DROP ;
        ;
ct:                             ; DO
        dec ebx                 ; 1-
        m_PUSH ebx              ; DUP
        m_PUSH 0                ; 0
        call fGT_XT             ; >
        m_POP eax               ; WHILE
        cmp eax, 0
        jne ct
        m_DROP
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fCOUNT, fTYPE, 0, 5, "COUNT"
        xor eax, eax
        mov al, [ebx]
        inc ebx
        m_PUSH eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fTYPE, fFETCH, 0, 4, "TYPE"
        m_POP ecx
ty:
        cmp ecx, 0
        jg tyc
        m_POP eax
        ret
tyc:
        m_PUSH ebx
        call fCFETCH_XT
        push ecx
        call fEMIT_XT
        pop ecx

        inc ebx
        dec ecx
        jmp ty
; -----------------------------------------------------------------------------
dict_ENTRY fFETCH, fCFETCH, 1, 2, "C@"
        mov ebx, [ebx]
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fCFETCH, fCSTORE, 1, 1, "@"
        xor eax, eax
        mov al, [ebx]
        mov ebx, eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fCSTORE, fSTORE, 1, 2, "C!"
        m_POP edx
        m_POP eax
        mov [edx], al
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fSTORE, fEMIT, 1, 1, "!"
        m_POP edx
        m_POP eax
        mov [edx], eax
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fEMIT, fpWORD, 0, 4, "EMIT"

        ; 
        ; BOOL WINAPI WriteConsole(
        ; _In_             HANDLE  hConsoleOutput,
        ; _In_             const VOID    *lpBuffer,
        ; _In_             DWORD   nNumberOfCharsToWrite,
        ; _Out_opt_        LPDWORD lpNumberOfCharsWritten,
        ; _Reserved_       LPVOID  lpReserved
        m_POP eax
        push ebx

        mov byte ptr tmp_buf, al
        push 0
        push 0
        push 1
        push tmp_buf
        push DWORD [STDOUT]
        call [WriteConsoleA]

        pop ebx
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fpWORD, fWORDS, 0, 5, "WORDS"
        add ebx, 9
        call fCOUNT_XT
        jmp  fTYPE_XT

; -----------------------------------------------------------------------------
dict_ENTRY fWORDS, fSPACE, 0, 5, ".WORD"
        mov ecx, [LAST_ADDR]

wl:     cmp ecx, 0
        je wlx
        push ecx
        m_PUSH ecx
        call fSPACE_XT
        call fpWORD_XT
        pop ecx
        mov ecx, [ecx]
        jmp wl

wlx:    
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fSPACE, fBYE, 0, 5, "SPACE"
        m_PUSH ' '
        call fEMIT_XT
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fBYE, fComma, 0, 3, "BYE"
        m_PUSH ' '
        call fEMIT_XT

        push 0
        push 0
        push 3
        push fBYE+10
        push DWORD [STDOUT]
        call [WriteConsoleA]

        invoke  ExitProcess,0
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fComma, fCComma, 0, 1, ","
        mov eax, [HERE_ADDR]
        m_POP edx
        mov [eax], edx
        add eax, 4
        mov [HERE_ADDR], eax
        ; invoke  MessageBox,HWND_DESKTOP,"Comma called", "xxx",MB_OK
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fCComma, fBASE, 0, 2, "C,"
        mov eax, [HERE_ADDR]
        m_POP edx
        mov [eax], dl
        inc eax
        mov [HERE_ADDR], eax
        ; invoke  MessageBox,HWND_DESKTOP,"CComma called", "xxx",MB_OK
        ret

; -----------------------------------------------------------------------------
dict_ENTRY fBASE, fNewDot, 0, 4, "BASE"
        m_PUSH BASE_ADDR
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fNewDot, fPoundLt, 0, 2, "n."
        call fPoundLt_XT
        call fPoundS_XT
        call fPoundGt_XT
        call fTYPE_XT
        call fSPACE_XT
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fPoundLt, fPound, 0, 2, "<#"
;
; : <# ( u1 -- 0|1 u2 ) DUP 0 > IF 0 - 1 ELSE 0 THEN SWAP ;
;
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fPound, fPoundS, 0, 1, "#"
;
; : # ( u1 -- u2 ) BASE @ /MOD '0' + DUP '9' > IF 7 + THEN SWAP ;
;
        call  fBASE_XT
        mov   ebx, [ebx]
        call  fSLMOD_XT
        m_PUSH '0'
        call  fthADD_XT
        m_PUSH ebx
        m_PUSH '9'
        call  fGT_XT
        m_POP eax
        cmp   eax, 0
        je    lbr
        m_PUSH 7
        call  fthADD_XT
lbr:    
        call  fSWAP_XT
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fPoundS, fPoundGt, 0, 2, "#S"
;
; : #S ( u1 -- u2 ) DO # DUP WHILE ;
;
lbs1:   call fPound_XT
        cmp ebx, 0
        jne lbs1
        ret
; -----------------------------------------------------------------------------
dict_ENTRY fPoundGt, 0, 0, 2, "#>"
        ret
; -----------------------------------------------------------------------------
dict_ENTRY gth2, gth, 0, 4, "gth2"
        ;         : gth2 dup . ;
        m_PUSH ebx
        call fDOT2_XT
        ret

; -----------------------------------------------------------------------------
dict_ENTRY gth, 0, 0, 5, "(gth)" ; got-to-here
        push ebx

        push 0
        push 0
        push 13
        push gth+10
        push DWORD [STDOUT]
        call [WriteConsoleA]

        pop ebx
        ret

; -----------------------------------------------------------------------------
DSTACK dd 64 dup 0
DSTACKEND dd 0

tmp_buf db 256 dup 0
; -----------------------------------------------------------------------------
start:
        call startup
        call mainLoop

        call fSPACE_XT
        m_PUSH 'z'
        m_PUSH 'a'
        call fEMIT_XT
        m_PUSH 1000000000
        call fCOUNT_TO_XT
        call fEMIT_XT

        m_PUSH 10
        call fBASE_XT
        call fSTORE_XT

        m_PUSH HERE_ADDR
        call fDOT2_XT

        m_PUSH HERE_ADDR
        call fFETCH_XT
        call fDOT2_XT

        m_PUSH 13
        call fCComma_XT

        m_PUSH 37
        call fPoundS_XT
        m_DROP
        call fEMIT_XT
        call fEMIT_XT

        ;m_PUSH 37
        ;m_PUSH 10
        ;call fSLMOD_XT
        ;call fDOT2_XT
        ;call fDOT2_XT

        m_PUSH HERE_ADDR
        call fFETCH_XT
        call fDOT2_XT

        m_PUSH 1234
        call fComma_XT

        m_PUSH HERE_ADDR
        call fFETCH_XT
        call fDOT2_XT

        call fBYE_XT
done:   invoke  ExitProcess,0
; -----------------------------------------------------------------------------

.end start
