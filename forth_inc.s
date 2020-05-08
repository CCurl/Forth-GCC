; ------------------------------------------------------------------------------
  sys_init:
        mov [stk_ptr], stk_ptr
        mov [rstk_ptr], rstk_ptr
        mov ebp, stk_ptr

        mov [rstk_ptr], rstk_ptr
        mov ebp, stk_ptr

        mov [HERE_ADDR], HERE
        mov [LAST_ADDR], LAST

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax

        mov [PC], L00000916
        ret

; ------------------------------------------------------------------------------
  run_loop:
        jmp run_loop

; ------------------------------------------------------------------------------
  main_loop:
        m_push '.'
        m_push 'k'
        m_push 'O'
        m_push ' '

        call prim_EMIT
        call prim_EMIT
        call prim_EMIT
        call prim_EMIT
        call fw_CR              ; CR

        call do_tests
        call prim_BYE
        jmp main_loop

        ret

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
sys_reset:
              call sys_init
              jmp main_loop

; -------------------------------------------------------------------------------------
prim_PUSH_doesntwork:                                        ; Implementation of PUSH
              push eax
              mov eax, 0 ; [esp+8], 
              add ebp, 4
              mov [ebp], eax
              pop eax
              ret

; -------------------------------------------------------------------------------------
  prim_LITERAL:
                ; xxx
                m_push 10
                ret
; -------------------------------------------------------------------------------------
; 
; 
; next0: [00000][flags][emit-A][literal-xt][65][emit-xt][next-xt]
; next1: [next0][flags][emit-B][literal-xt][66][emit-xt][next-xt]
; name2: [next1][flags][emit-C][literal-xt][67][emit-xt][next-xt]
; next3: [next2][flags][emit-D][literal-xt][68][emit-xt][next-xt]
; 
; When emit-C is executed, the state is this::
; 
; RETURN-STACK                    DATA-STACK
; [...] <- SP (grows down)        [...] <- DSP (grows down)
; 
; [00000] (next0:)                  [next0] (next1:)                [next1] (next2)
; [flags] (4)                       [flags]                         [flags]
; [LITERAL]                         [emit-B]                        [emit-AB]
; [LITERAL-xt]                      [LITERAL-xt]                    [emit-A-xt] <-- WIP
; [65]                              [66]                            [emit-B-xt]
; [EMIT-xt]                         [EMIT-xt]                       [CR-xr]
; [next-xt]                         [next-xt]                       [next-xt]
;
; The process is this:
; reg1 = [WIP]
; WIP = WIP + CELL                                  [emit-A-xt] <- WIP
; call []
; -------------------------------------------------------------------------------------
;
; 
; [00000] (next0:) 
; [flags] (4)
; [prim_ENTER]
; [LITERAL]
; [65]
; [EMIT-xt]
; [next-xt]


; Every FOTH word looks like this:
; [Word def][CODE][PARAMETER]
; 
;
; This is the CODE handler for FORTH words
;
; NB register ESI is the IP
;
  prim_ENTER:
        add esi, 4
        mov edx, [esi]
        ret

  prim_NEXT:
                ; This is essentially 5 actions in one:
                ; NOTE: the instruction pointer (IP) was incremented BEFORE the value was PUSHed onto the stack
                ; 1. POP the top value from the RETURN-STACK.
                ; 2. Set PC to that value.
                ; 3. Retrieve the address pointed to by IP to a TEMP spot
                ; 4 Increment IP by a word
                ; 5. PUSH the new IP onto the RETURN-STACK
                ; 6. Set IP to the value retrieved in step 3.
                ; 7. CALL that location, beginning the execution of the primitive.
                ; NOTE: Any primitive that takes values from after IP in the instruction stream (eg - LITERAL)
                ;       will need to change the IP that is stored on top of the RETURN-STACK

                ; Notes, the RETURN-STACK is the standard stack
                
                ; So, here we go ...
                m_rsPOP eax                     ; Get the val
                mov [IP], eax
                mov ebx, [eax]
                push ebx
                add eax, 4
                push ebx

                ret

  prim_DROP:
                ; xxx
                m_pop eax               
                ret

  prim_FOPEN:
                ; xxx
                m_pop eax               
                ret

  prim_FCLOSE:
                ; xxx
                m_pop eax               
                ret

  prim_FREAD:
                ; xxx
                m_pop eax               
                ret

  prim_FREADLINE:
                ; xxx
                m_pop eax               
                ret

  prim_FWRITE:
                ; xxx
                m_pop eax               
                ret

  prim_LOGLEVEL:
                ; xxx
                m_pop eax               
                ret

  prim_AND:
                ; xxx
                m_pop eax               
                ret

  prim_OR:
                ; xxx
                m_pop eax               
                ret

  prim_PICK:
                ; TODO
                m_pop eax               
                ret

  prim_DEPTH:
                ; TODO
                m_pop eax               
                ret

  prim_GETCH:
                ; TODO
                m_pop eax               
                ret

  prim_JMP:
                ; TODO
                m_pop eax               
                ret

  prim_JMPZ:
                ; TODO
                m_pop eax               
                ret

  prim_JMPNZ:
                ; TODO
                m_pop eax               
                ret

  prim_SLITERAL:
                ; TODO
                m_pop eax               
                ret

; -------------------------------------------------------------------------------------
  prim_EMIT:
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
                push [STDOUT]
                call [WriteConsoleA]
                ret

; -------------------------------------------------------------------------------------
prim_FETCH:                                     ; Implementation of FETCH
        ;m_push '@'
        ;call prim_EMIT
        ;call prim_DUP
        ;call prim_DOT
               m_pop edx
               mov eax, [edx]
               m_push eax
        ;call prim_DUP
        ;call prim_DOT
               ret
               
; -------------------------------------------------------------------------------------
prim_CFETCH:                                    ; Implementation of CFETCH
               m_pop edx
               xor eax, eax
               mov al, [edx]
               m_push eax
               ret
               
prim_STORE:                                     ; Implementation of STORE
        ;m_push '!'
        ;call prim_EMIT
        ;call prim_DUP
        ;call prim_DOT
               m_pop edx
        ;push edx
        ;call prim_DUP
        ;call prim_DOT
        ;pop edx
               m_pop eax
               mov [edx], eax
               ret
               
; -------------------------------------------------------------------------------------
prim_CSTORE:                                    ; Implementation of CSTORE
               m_pop edx
               m_pop eax
               mov [edx], al
               ret
               
; -------------------------------------------------------------------------------------
prim_DUP:                                       ; Implementation of DUP
               m_getTOS eax
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_SWAP:                                      ; Implementation of SWAP
               m_pop edx
               m_pop eax
               m_push edx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_OVER:                                      ; Implementation of OVER
               m_pop eax
               m_getTOS ebx

               m_push eax
               m_push ebx
               ret
               
; -------------------------------------------------------------------------------------
prim_ADD:                                       ; Implementation of ADD
               m_pop ebx
               m_pop eax
               add eax, ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_SUB:                                       ; Implementation of SUB
               m_pop ebx
               m_pop eax
               sub eax, ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_MUL:                                       ; Implementation of MUL
               m_pop ebx
               m_pop eax
               mul ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_DIV:                                       ; Implementation of DIV (TODO)
               m_pop ebx
               m_pop eax
               mov edx, 0
               div ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
prim_DTOR:                                      ; Implementation of DTOR
               ; Get the value to move (into %eax) ...
               m_pop eax

               ; Put the value onto the RETURN stack ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               add ebx, 4
               mov [ebx], eax
               mov [rstk_ptr], ebx                    ; Save it back

               ret
               
; -------------------------------------------------------------------------------------
prim_RTOD:                                      ; Implementation of RTOD
               ; Get the value to move (into %eax) ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               mov eax, [ebx]
               sub ebx, 4
               mov [rstk_ptr], ebx                    ; Save it back

               ; Put the value onto the RETURN stack ...
               m_push eax

               ret
               
; -------------------------------------------------------------------------------------
prim_COMPARE:                                      ; Implementation of COMPARE (TODO)
               ; Get the value to move (into %eax) ...
               m_pop eax

               ; Put the value onto the RETURN stack ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               add ebx, 4
               mov [ebx], eax
               mov [rstk_ptr], ebx                    ; Save it back

               ret
               
; -------------------------------------------------------------------------------------
prim_BYE:                                      ; Implementation of BYE

               m_push 'E'
               m_push 'Y'
               m_push 'B'
               m_push ' '

               call prim_EMIT            
               call prim_EMIT            
               call prim_EMIT            
               call prim_EMIT            

               push 0
               call [ExitProcess]
               ret
               
; -------------------------------------------------------------------------------------

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
fw_DUP:
        ret
fw_CR:
        ret
fw_BASE:
        ret
fw_HERE_ADDR:
        ret
fw_HERE:
        ret
fw_LAST:
        ret
fw_LAST_ADDR:
        ret

fw_DOT:
        call L00000A73
        ret

fw_STORE:
        call L000000B8
        ret
fw_FETCH:
        call L000000B1
        ret

fw_SUB:
        call L0000014B
        ret

fw_EMIT:
        call L00000182
        ret

L0000FDFC: DD 0

; ------------------------------------------------------------------------------
do_tests:
        m_push 10
        call fw_BASE
        call fw_STORE
 ; STORE

        m_push 0
        call fw_DOT                                      ; WORD .

        call fw_HERE_ADDR                                      ; (HERE)
        call fw_DOT                                      ; WORD .

        call fw_HERE
        call fw_DOT                                      ; WORD .

        call fw_LAST_ADDR                                          ; (LAST)
        call fw_DOT                                      ; WORD .

        call fw_LAST
        call fw_DOT                                      ; WORD .

        call fw_LAST
        call fw_HERE
        call fw_SUB                                      ;  -
        call fw_DOT                                      ; WORD .

        call fw_CR                  ; CR

        m_push 0x3344
        call fw_HERE                ; HERE
        call fw_STORE              ; !

        call fw_HERE                ; HERE
        call fw_FETCH              ; @
        call fw_DUP
        call fw_DOT              ; .
        m_push 16
        call fw_BASE
        call fw_STORE

        call fw_DOT              ; .

        call fw_CR              ; CR

        ret
; ------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
