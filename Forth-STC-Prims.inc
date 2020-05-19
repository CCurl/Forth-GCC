; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
xxprim_LITERAL:                                   ; Implementation of LITERAL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_FETCH:                                     ; Implementation of FETCH
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_STORE:                                     ; Implementation of STORE
               m_pop edx
               m_pop eax
               mov [edx], eax
               ret
               
prim_SWAP:                                      ; Implementation of SWAP
               m_pop eax                        ; NB ebx is the TOS, SWAP
               m_getTOS ecx
               m_setTOS eax
               m_push ecx
               ret
               
xxprim_DROP:                                      ; Implementation of DROP
               m_pop eax
               ret
               
prim_DUP:                                       ; Implementation of DUP
               m_push ebx
               ret
               
prim_SLITERAL:                                  ; Implementation of SLITERAL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_JMP:                                       ; Implementation of JMP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_JMPZ:                                      ; Implementation of JMPZ
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_JMPNZ:                                     ; Implementation of JMPNZ
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_CALL:                                      ; Implementation of CALL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_RET:                                       ; Implementation of RET
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_OR:                                        ; Implementation of OR
               m_pop eax
               or ebx, eax
               ret
               
prim_XOR:                                        ; Implementation of OR
               m_pop eax
               xor ebx, eax
               ret
               
xxprim_CLITERAL:                                  ; Implementation of CLITERAL
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_CFETCH:                                    ; Implementation of CFETCH
               xor eax, eax
               mov al, [ebx]
               m_setTOS eax
               ret
               
prim_CSTORE:                                    ; Implementation of CSTORE
               m_pop edx
               m_pop eax
               mov [edx], al
               ret
               
prim_ADD:                                       ; Implementation of ADD
               m_pop eax
               add ebx, eax
               ret
               
prim_SUB:                                       ; Implementation of SUB
               m_pop eax
               sub ebx, eax
               ret
               
prim_MUL:                                       ; Implementation of MUL
               m_pop ecx
               m_getTOS eax
               mul ecx
               m_setTOS eax
               ret
               
prim_SLASHMOD:                                       ; Implementation of /MOD
               m_pop ecx
               m_pop eax
               cmp ecx, 0
               je smDivBy0
               xor edx, edx
               div ecx
               m_push eax
               m_push edx
               ret
smDivBy0:
    m_push '/'
    call prim_EMIT
    m_push 'm'
    call prim_EMIT
    m_push '?'
    call prim_EMIT
               m_push 0
               m_push 0
               ret;
               
prim_DIV:                                       ; Implementation of DIV
               m_pop ecx
               m_pop eax
               cmp ecx, 0
               je divBy0
               xor edx, edx
               div ecx
               m_push eax
               ret
divBy0:
    m_push 'v'
    call prim_EMIT
    m_push '?'
    call prim_EMIT
               m_setTOS 0
               ret;
               
prim_LT:                                        ; Implementation of LT
               m_pop eax
               cmp ebx, eax
               jl LT_T
               m_setTOS 0
               ret
LT_T:          
               m_setTOS 1
               ret
               
prim_EQ:                                        ; Implementation of EQ
               m_pop eax
               cmp ebx, eax
               je EQ_T
               m_setTOS 0
               ret
EQ_T:          m_setTOS 1
               ret
               
prim_GT:                                        ; Implementation of GT
               m_pop eax
               cmp ebx, eax
               jg GT_T
               m_setTOS 0
               ret
GT_T:          m_setTOS 1
               ret
               
xxprim_DICTP:                                     ; Implementation of DICTP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_EMIT:                                      ; Implementation of EMIT
                ; 
                ; BOOL WINAPI WriteConsole(
                ; _In_             HANDLE  hConsoleOutput,
                ; _In_             const VOID    *lpBuffer,
                ; _In_             DWORD   nNumberOfCharsToWrite,
                ; _Out_opt_        LPDWORD lpNumberOfCharsWritten,
                ; _Reserved_       LPVOID  lpReserved
                m_pop eax
                mov byte ptr tmp_buf, al
                push 0
                push 0
                push 1
                push tmp_buf
                push DWORD [STDOUT]
                call [WriteConsoleA]
                ret
               
prim_OVER:                                      ; Implementation of OVER
               m_pop ecx
               m_getTOS edx
               m_push ecx
               m_push edx
               ret
               
prim_COMPARE:                                   ; Implementation of COMPARE
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_COMPAREI:                                  ; Implementation of COMPAREI
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FOPEN:                                     ; Implementation of FOPEN
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FREAD:                                     ; Implementation of FREAD
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FREADLINE:                                 ; Implementation of FREADLINE
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FWRITE:                                    ; Implementation of FWRITE
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FCLOSE:                                    ; Implementation of FCLOSE
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_DTOR:                                      ; Implementation of DTOR
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
xxprim_RTOD:                                      ; Implementation of RTOD
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_LOGLEVEL:                                  ; Implementation of LOGLEVEL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_AND:                                       ; Implementation of AND
               m_pop eax
               and ebx, eax
               ret
               
prim_PICK:                                      ; Implementation of PICK
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_DEPTH:                                     ; Implementation of DEPTH
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret

GETCH_num_chars dd 0
prim_GETCH:                                     ; Implementation of GETCH
              ;BOOL WINAPI ReadConsole(
              ;  _In_     HANDLE  hConsoleInput,
              ;  _Out_    LPVOID  lpBuffer,
              ;  _In_     DWORD   nNumberOfCharsToRead,
              ;  _Out_    LPDWORD lpNumberOfCharsRead,
              ;  _In_opt_ LPVOID  pInputControl
              ;
              push 0
              push GETCH_num_chars
              push 1
              push tmp_buf
              push DWORD [STDIN]
              call [ReadConsoleA]
              xor eax, eax
              mov al, [tmp_buf]
              m_push eax
              ret
               
prim_USINIT:                                    ; Implementation of USINIT
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_USPUSH:                                    ; Implementation of USPUSH
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_USPOP:                                     ; Implementation of USPOP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_BREAK:                                     ; Implementation of BREAK
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_RESET:                                     ; Implementation of RESET
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_BYE:                                       ; Implementation of BYE
                m_push ' '
                call prim_EMIT
                m_push 'B'
                call prim_EMIT
                m_push 'Y'
                call prim_EMIT
                m_push 'E'
                call prim_EMIT
                push 0
                call [ExitProcess]
               ret
; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
