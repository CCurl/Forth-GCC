; ------------------------------------------------------------------------------
  sys_init:
        mov [stk_ptr], stk_ptr
        mov [rstk_ptr], rstk_ptr
        mov ebp, stk_ptr

        mov [rstk_ptr], rstk_ptr
        mov ebp, stk_ptr

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax
        ret

; ------------------------------------------------------------------------------
  main_loop:
        m_push '.'
        m_push 'k'
        m_push 'O'
        m_push ' '

        call func_EMIT
        call func_EMIT
        call func_EMIT
        call func_EMIT
        call L00000372              ; CR

        m_push 3
        m_push 2
        call func_MUL
        call L00000A73                                      ; WORD .
;
;        m_push HERE_ADDR
;        call L00000A73                                      ; WORD .
;
;        mov eax, [HERE_ADDR]
;        m_push eax
;        call L00000A73                                      ; WORD .
;
;        m_push LAST_ADDR
;        call L00000A73                                      ; WORD .
;
;        mov eax, [LAST_ADDR]
;        m_push eax
;        call L00000A73                                      ; WORD .

        call func_BYE
        jmp main_loop

        ret

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
sys_reset:
              call sys_init
              jmp main_loop

; -------------------------------------------------------------------------------------
func_PUSH_doesntwork:                                        ; Implementation of PUSH
              push eax
              mov eax, 0 ; [esp+8], 
              add ebp, 4
              mov [ebp], eax
              pop eax
              ret

; -------------------------------------------------------------------------------------
  func_EMIT:
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
func_FETCH:                                     ; Implementation of FETCH
               m_pop edx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_CFETCH:                                    ; Implementation of CFETCH
               m_pop edx
               xor eax, eax
               mov al, [ebp]
               m_push eax
               ret
               
func_STORE:                                     ; Implementation of STORE
               m_pop edx
               m_pop eax
               mov [edx], eax
               ret
               
; -------------------------------------------------------------------------------------
func_CSTORE:                                    ; Implementation of CSTORE
               m_pop edx
               m_pop eax
               mov [edx], al
               ret
               
; -------------------------------------------------------------------------------------
func_DUP:                                       ; Implementation of DUP
               m_getTOS eax
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_SWAP:                                      ; Implementation of SWAP
               m_pop edx
               m_pop eax
               m_push edx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_OVER:                                      ; Implementation of OVER
               m_pop eax
               m_getTOS ebx

               m_push eax
               m_push ebx
               ret
               
; -------------------------------------------------------------------------------------
func_ADD:                                       ; Implementation of ADD
               m_pop ebx
               m_pop eax
               add eax, ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_SUB:                                       ; Implementation of SUB
               m_pop ebx
               m_pop eax
               sub eax, ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_MUL:                                       ; Implementation of MUL
               m_pop ebx
               m_pop eax
               mul ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_DIV:                                       ; Implementation of DIV (TODO)
               m_pop ebx
               m_pop eax
               mov edx, 0
               div ebx
               m_push eax
               ret
               
; -------------------------------------------------------------------------------------
func_DTOR:                                      ; Implementation of DTOR
               ; Get the value to move (into %eax) ...
               m_pop eax

               ; Put the value onto the RETURN stack ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               add ebx, 4
               mov [ebx], eax
               mov [rstk_ptr], ebx                    ; Save it back

               ret
               
; -------------------------------------------------------------------------------------
func_RTOD:                                      ; Implementation of RTOD
               ; Get the value to move (into %eax) ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               mov eax, [ebx]
               sub ebx, 4
               mov [rstk_ptr], ebx                    ; Save it back

               ; Put the value onto the RETURN stack ...
               m_push eax

               ret
               
; -------------------------------------------------------------------------------------
func_COMPARE:                                      ; Implementation of COMPARE (TODO)
               ; Get the value to move (into %eax) ...
               m_pop eax

               ; Put the value onto the RETURN stack ...
               mov ebx, [rstk_ptr]                    ; Get the RETURN SP
               add ebx, 4
               mov [ebx], eax
               mov [rstk_ptr], ebx                    ; Save it back

               ret
               
; -------------------------------------------------------------------------------------
func_BYE:                                      ; Implementation of BYE

               m_push 'E'
               m_push 'Y'
               m_push 'B'

               call func_EMIT            
               call func_EMIT            
               call func_EMIT            

               push 0
               call [ExitProcess]
               ret
               
; -------------------------------------------------------------------------------------
