; A simple Forth kernel

format pe console

; you can simply switch between win32ax, win32wx, win64ax and win64wx here
include 'win32ax.inc'
include "macros.s"

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.data

MEMORY_SIZE = 0x8000

; our "MEMORY" starts here
STDOUT    dd 0
HERE_ADDR dd 0x11223344
LAST_ADDR dd 0x778899aa
BASE_ADDR dd 16

tmp_buf   db 256 dup (0)

HERE      db MEMORY_SIZE dup (0)
LAST      dd 0

stk_ptr   dd 0
stk_data  dd 256 dup (0)

rstk_ptr  dd 0
rstk_data dd 256 dup (0)
; our "MEMORY" ends here

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
        call func_CR                                      ; WORD CR

        jmp main_loop

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.end start
