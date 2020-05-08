; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
; -------------------------------------------------------------------------
prim_LITERAL:                                   ; Implementation of LITERAL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_FETCH:                                     ; Implementation of FETCH
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_STORE:                                     ; Implementation of STORE
               m_pop eax
               m_pop ecx
               mov [eax], ecx
               ret
               
prim_SWAP:                                      ; Implementation of SWAP
               m_pop eax                        ; NB ebx is the TOS, SWAP
               m_getTOS ecx
               m_setTOS eax
               m_push ecx
               ret
               
prim_DROP:                                      ; Implementation of DROP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_DUP:                                       ; Implementation of DUP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_SLITERAL:                                  ; Implementation of SLITERAL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_JMP:                                       ; Implementation of JMP
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_JMPZ:                                      ; Implementation of JMPZ
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_JMPNZ:                                     ; Implementation of JMPNZ
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_CALL:                                      ; Implementation of CALL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_RET:                                       ; Implementation of RET
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_OR:                                        ; Implementation of OR
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_CLITERAL:                                  ; Implementation of CLITERAL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_CFETCH:                                    ; Implementation of CFETCH
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_CSTORE:                                    ; Implementation of CSTORE
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_ADD:                                       ; Implementation of ADD
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_SUB:                                       ; Implementation of SUB
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_MUL:                                       ; Implementation of MUL
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_DIV:                                       ; Implementation of DIV
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_LT:                                        ; Implementation of LT
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_EQ:                                        ; Implementation of EQ
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_GT:                                        ; Implementation of GT
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_DICTP:                                     ; Implementation of DICTP
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
                ; _In_       const VOID    *lpBuffer,
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
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_COMPARE:                                   ; Implementation of COMPARE
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
               
prim_DTOR:                                      ; Implementation of DTOR
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
               ret
               
prim_RTOD:                                      ; Implementation of RTOD
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
               ; TODO
               m_push [HERE_ADDR]
               m_pop [ecx]
               m_getTOS edx
               m_setTOS eax
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
               
prim_GETCH:                                     ; Implementation of GETCH
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
