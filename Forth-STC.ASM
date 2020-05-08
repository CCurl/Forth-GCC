; A simple STC Forth implementation

format pe console

; you can simply switch between win32ax, win32wx, win64ax and win64wx here
include 'win32ax.inc'
include "./Forth-STC-Macros.inc"

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.data
; ------------------------------------------------------------------------------
; .code

MEMORY_SIZE = 0x8000

; our "MEMORY" starts here
init_esp  dd 0
STDOUT    dd 0
HERE_ADDR dd 0x11223344
LAST_ADDR dd 0x778899aa
BASE_ADDR dd 16

tmp_buf   db 256 dup (0)

FIRST     dd 0
CCCtest: 
        m_push '-'
        m_push '!'

        ; call L00000B51

        m_push '.'
        call prim_EMIT
        call prim_EMIT
        call prim_EMIT
        ret

HERE      db MEMORY_SIZE dup (0)
; HERE2     db MEMORY_SIZE dup (0)
LAST      dd 0

; The DATA stack
dstk_ptr   dd 0
dstk_data  dd 64 dup (0)

; The RETURN stack
rstk_ptr  dd 0
rstk_data dd 64 dup (0)
; our "MEMORY" ends here

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; .code
; ------------------------------------------------------------------------------

include "./Forth-STC-Prims.inc"
include "./Forth-STC-Words.inc"


rstk_ptr1:  dd 0
rstk_data1: dd 256 dup (0)


; ------------------------------------------------------------------------------

  sys_init:
        mov [dstk_ptr], dstk_ptr
        mov [rstk_ptr], rstk_ptr
        mov ebp, dstk_ptr

        mov [rstk_ptr], rstk_ptr

        mov [HERE_ADDR], HERE
        mov [LAST_ADDR], LAST

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax
        ret
; ------------------------------------------------------------------------------

  start:

        call sys_init

        ; Save the initial value of the stack pointer, esp
        mov [init_esp], esp

        call CCCtest
        mov edx, FIRST
        add edx, 4
        ; call RWORD [edx]

        m_push 'H'
        call prim_EMIT
        m_push 'e'
        call prim_EMIT
        m_push 'l'
        call prim_EMIT
        m_push 'l'
        call prim_EMIT
        m_push 'o'
        call prim_EMIT
        call L00000372        ; WORD CR

        ;jmp L0000096B        ; main

        call L00000215        ; BYE

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
.end start
