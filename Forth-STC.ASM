; A simple STC Forth implementation

format pe console

; you can simply switch between win32ax, win32wx, win64ax and win64wx here
include 'win32ax.inc'
include "./Forth-STC-Macros.inc"

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
section '.data' data readable writeable executable

MEMORY_SIZE = 1024*2
init_esp  dd 0

STDIN     dd 0
STDOUT    dd 0

tmp_buf   db 256 dup (0)

; The DATA stack
dstk_ptr   dd 0
dstk_data  dd 64 dup (0)
; our "MEMORY" starts here
the_memory      db MEMORY_SIZE dup (0)

; Leave room for 8 DWORDS
HERE_ADDR   = the_memory + 0x0020
LAST_ADDR   = HERE_ADDR + 4
BASE_ADDR   = LAST_ADDR + 4
STATE_ADDR  = BASE_ADDR + 4

; Code starts 8 DWORDS after the pointers
LAST      = the_memory + 0x0040
HERE      = LAST + 4

Hello db 5, 'Hello', 0
OK db 5, ' ok', 13, 10, 0

; ------------------------------------------------------------------------------

section '.text' code readable writable executable

; ------------------------------------------------------------------------------
  start:

        call sys_init

        ; Save the initial value of the stack pointer, esp
        mov [init_esp], esp

        m_push Hello
        call L0000037A        ; COUNT
        call L00000386        ; TYPE

        ;jmp L0000096B        ; main

        jmp mainLoop
        call prim_BYE

; ------------------------------------------------------------------------------
  sys_init:
        mov [dstk_ptr], dstk_ptr
        mov ebp, dstk_ptr

        mov DWORD [HERE_ADDR], HERE
        mov DWORD [LAST_ADDR], LAST
        mov DWORD [BASE_ADDR], 10
        mov DWORD [LAST], 0

        push STD_INPUT_HANDLE
        call [GetStdHandle]
        mov [STDIN], eax

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax
        ret

; ------------------------------------------------------------------------------
mainLoop:
        m_push OK
        call L0000037A        ; COUNT
        call L00000386        ; TYPE

        mov esp, [init_esp]

        call CCCtest
        jmp prim_BYE

        ; jmp mainLoop
        ret
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
include "./Forth-STC-Prims.inc"
; ------------------------------------------------------------------------------


doCopy:
        ; esi = start
        ; edi = dest
        ; ecx = number of bytes to move
        push esi
        push edi
        push ecx
        cld                                     ; CLD => auto-increment, STD => auto-decrement

c1:     rep movsb

        pop ecx
        pop edi
        pop esi
        ret

CopyStart:
        CCCtest2:
                m_push 'X'
                call prim_EMIT
                ret
CopyEnd:

CCCtest: 

        ; es=ds? yes
        ; cs=ds? no
        ; ss=ds? yes   (what is this for? - don't use)
        ; fs=ds? no    (what is this for? - don't use)
        ; gs=ds? yes   (what is this for? - don't use)

        m_push 20
        m_push 1
        call L00000BAA        ; countTo

        m_push 16
        m_push BASE_ADDR      ; (BASE)
        call prim_STORE

        ;m_push HERE_ADDR
        ;call L00000B06        ; .

        m_push 10
        m_push BASE_ADDR      ; (BASE)
        call prim_STORE

        call L00000BCB        ; doCount

        m_push OK
        call L0000037A        ; COUNT
        call L00000386        ; TYPE

        m_push [STDIN]        ;
        call L00000B06        ; .
        m_push [STDOUT]       ;
        call L00000B06        ; .

        m_push OK
        call L0000037A        ; COUNT
        call L00000386        ; TYPE

        m_push the_memory     ; start of memory buf
        call L00000B06        ; .

        m_push HERE_ADDR      ; (HERE)
        call L00000B06        ; .
        m_push LAST_ADDR      ; (LAST)
        call L00000B06        ; .

        m_push HERE_ADDR      ; HERE
        mov ebx, [ebx]        ; @
        call L00000B06        ; .
        m_push LAST_ADDR      ; LAST
        mov ebx, [ebx]        ; @
        call L00000B06        ; .

        m_push OK
        call L0000037A        ; COUNT
        call L00000386        ; TYPE

        call prim_GETCH
        call prim_EMIT
        
        m_push OK
        call L0000037A        ; COUNT
        call L00000386        ; TYPE
        call prim_EMIT

        ret

        ;push es
        ;pop eax
        ;push ds
        ;pop edx
        ;cmp eax, edx
        mov esi, CopyStart
        mov edi, HERE
        mov ecx, CopyEnd
        sub ecx, esi
        call doCopy

        mov al, [esi]
        mov ah, [edi]
        cmp al, 0
        je nn
        cmp al, ah
        je yy

nn:
        m_push '.'
        m_push 'n'
        jmp zz
yy:
        m_push '.'
        m_push 'y'
        mov edx, CCCtest2
        ; mov edx, HERE
        call edx
zz:
        call prim_EMIT
        call prim_EMIT

        ;mov edx, FIRST
        ;add edx, 4
        ;call RWORD [edx]

        ret

; The RETURN stack
;rstk_ptr  dd 0
;rstk_data dd 64 dup (0)
; our "MEMORY" ends here

; ------------------------------------------------------------------------------
include "./Forth-STC-Words.ASM"
; ------------------------------------------------------------------------------

xxx123:
; ------------------------------------------------------------------------------
.end start
