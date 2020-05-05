; A simple Forth kernel

format pe console

; you can simply switch between win32ax, win32wx, win64ax and win64wx here
include 'win32ax.inc'
include "macros.s"

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.data

; our "MEMORY" starts here
HERE_ADDR dd 0x11223344
LAST_ADDR dd 0x778899aa
tmp_buf db 256 dup (0)

HERE db 1024 dup (0)
LAST dd 0
stk_ptr dd 0
rstk_ptr dd 0
stk_data dd 256 dup (0)
rstk_data dd 256 dup (0)
; our "MEMORY" ends here

STDOUT dd 0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.code

; ------------------------------------------------------------------------------
include "../../GitRepos/Forth-GCC/forth_inc.s"
include "../../GitRepos/Forth-GCC/forth.s"
; ------------------------------------------------------------------------------

  start:

        call sys_init
        mov [HERE_ADDR], HERE
        mov [LAST_ADDR], LAST

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
        call L00000372                                      ; WORD CR

        jmp main_loop

; ------------------------------------------------------------------------------
.end start
