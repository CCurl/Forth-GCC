; A simple Forth kernel

format pe console

; you can simply switch between win32ax, win32wx, win64ax and win64wx here
include 'win32ax.inc'

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.data

stk_ptr dd 0
stk_data dd 256 dup (0)

rstk_ptr dd 0
rstk_data dd 256 dup (0)

get_memory dd 0

tmp_buf db 256 dup (0)

STDOUT dd 0

; ------------------------------------------------------------------------------
macro m_setTOS val
{
       mov dword ptr ebp, val
}

macro m_push val
{
       add ebp, 4
       m_setTOS val
}

; ------------------------------------------------------------------------------
macro m_getTOS val
{
       mov val, dword ptr ebp
}

macro m_pop val
{
       m_getTOS val
       sub ebp, 4
}

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.code

  start:

        call sys_init

        m_push 'H'
        call func_EMIT
        m_push 'e'
        call func_EMIT
        m_push 'l'
        call func_EMIT
        m_push 'l'
        call func_EMIT
        m_push 'o'
        call func_EMIT
        call func_CR

        call main_loop

        ; invoke  MessageBox, HWND_DESKTOP, hello, invoke GetCommandLine, MB_YESNO

        ; cmp eax, IDYES
        ; jnz no1
        ;        invoke  MessageBox,HWND_DESKTOP,"Hi! I'm the example program!","Hello!",MB_OK
;  no1:

        ret

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

        call func_EMIT
        call func_EMIT
        call func_EMIT

        push 0
        call [ExitProcess]

        ret

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
  func_CR:
        m_push 13
        m_push 10
        call func_EMIT
        call func_EMIT
        ret

; ------------------------------------------------------------------------------
  func_EMIT:
                ;
                ;  BOOL WINAPI WriteConsole(
                ;  _In_             HANDLE  hConsoleOutput,
                ;  _In_       const VOID    *lpBuffer,
                ;  _In_             DWORD   nNumberOfCharsToWrite,
                ;  _Out_opt_        LPDWORD lpNumberOfCharsWritten,
                ;  _Reserved_       LPVOID  lpReserved
        m_pop eax
        mov byte ptr tmp_buf, al
        push 0
        push 0
        push 1
        push tmp_buf
        push [STDOUT]
        call [WriteConsoleA]
        ret

; ------------------------------------------------------------------------------
.end start
