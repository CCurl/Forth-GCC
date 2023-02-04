; **************************************************************************
;
; This is a program that implements a forth CPU/VM.
; The CPU's 'opcodes' are identified by their order in the [jmpTable].
; The VM's memory space is the reserved buffer at THE_MEMORY.
; When the 'VM' starts up, the PC/IP is set to point to memory address 0.
; This should be a JMP to the program's entry point.
;
; **************************************************************************
;                 x86 Register usage
; **************************************************************************
;
REG1 equ eax         ; Free register #1
REG2 equ ebx         ; Free register #2
REG3 equ ecx         ; Free register #3
REG4 equ edx         ; Free register #4
TOS  equ edi         ; Top-Of-Stack
PCIP equ esi         ; Program-Counter/Instruction-Pointer
STKP equ ebp         ; Stack-Pointer
;
; **************************************************************************

format PE console 

include 'win32ax.inc'

; -------------------------------------------------------------------------------------
section '.idata' data readable import

library kernel32, 'kernel32.dll', msvcrt, 'msvcrt.dll', conio, 'conio.dll'

import kernel32, ExitProcess,'ExitProcess', GetFileAttributes, 'GetFileAttributesA' \
    , GetConsoleMode, 'GetConsoleMode', SetConsoleMode, 'SetConsoleMode', GetStdHandle, 'GetStdHandle' \
    , GetTickCount, 'GetTickCount', SetConsoleCursorPosition, 'SetConsoleCursorPosition'

import msvcrt, printf, 'printf', __getmainargs, '__getmainargs' \
    , fopen,'fopen', fclose, 'fclose', fseek, 'fseek', ftell, 'ftell' \
    , fread, 'fread', fwrite, 'fwrite', fgetc, 'fgetc', malloc, 'malloc' \
    , putchar, 'putchar', getch, '_getch', fgets, 'fgets'

; -------------------------------------------------------------------------------------
; section '.bss' data readable writable executable
section '.bss' data readable writable

printArgError db 'Error: Wrong number of arguments. Run file with "program.exe <file>"', 0
printFileError db 'Error: File [%s] does not exist. Check spelling and try again.', 0
unknownOpcode db 'unknown opcode! 0x%02X at 0x%04lx', 13, 10, 0
divByZero db 'cannot divide by 0.', 0
openModeRB db 'rb', 0
openModeRT db 'rt', 0

CELL_SIZE = 4
STD_INPUT_HANDLE = -10
STD_OUTPUT_HANDLE = -11
STD_ERROR_HANDLE = -12

argc dd ?
argv dd ?
env dd ?
stup dd ?

STDIN dd ?
STDOUT dd ?
SRC dd ?
DST dd ?
stream dd ?
InitialESP dd 0

fileName dd ?
fileSize dd ?
rDepth dd 0
rStackPtr dd 0
tmpBuf1 db  16 dup (0)          ; Buffer for data stack
dStack  dd 256 dup (0)

dstackE db  16 dup (0)          ; Buffer between stacks

rStack  dd 256 dup (0)
tmpBuf3 db  16 dup (0)          ; Buffer for return stack

stopHere db 'stop here!', 0
dsUnderFlow db '(Stack underflow!)', 0
dsOverFlow  db '(Stack overflow!)', 0

blockFile db "block-0000.fs", 0

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
jmpTable dd f_UnknownOpcode ; 0
dd f_LITERAL            ; Hex: 01 (1)
dd f_FETCH              ; Hex: 02 (2)
dd f_STORE              ; Hex: 03 (3)
dd f_SWAP               ; Hex: 04 (4)
dd f_DROP               ; Hex: 05 (5)
dd f_DUP                ; Hex: 06 (6)
dd f_SLITERAL           ; Hex: 07 (7)
dd f_JMP                ; Hex: 08 (8)
dd f_JMPZ               ; Hex: 09 (9)
dd f_JMPNZ              ; Hex: 0A (10)
dd f_CALL               ; Hex: 0B (11)
dd f_RET                ; Hex: 0C (12)
dd f_OR                 ; Hex: 0D (13)
dd f_CLITERAL           ; Hex: 0E (14)
dd f_CFETCH             ; Hex: 0F (15)
dd f_CSTORE             ; Hex: 10 (16)
dd f_ADD                ; Hex: 11 (17)
dd f_SUB                ; Hex: 12 (18)
dd f_MUL                ; Hex: 13 (19)
dd f_DIV                ; Hex: 14 (20)
dd f_LT                 ; Hex: 15 (21)
dd f_EQ                 ; Hex: 16 (22)
dd f_GT                 ; Hex: 17 (23)
dd f_DICTP              ; Hex: 18 (24)
dd f_EMIT               ; Hex: 19 (25)
dd f_OVER               ; Hex: 1A (26)
dd f_COMPARE            ; Hex: 1B (27)
dd f_FOPEN              ; Hex: 1C (28)
dd f_FREAD              ; Hex: 1D (29)
dd f_FREADLINE          ; Hex: 1E (30)
dd f_FWRITE             ; Hex: 1F (31)
dd f_FCLOSE             ; Hex: 20 (32)
dd f_DTOR               ; Hex: 21 (33)
dd f_RTOD               ; Hex: 22 (34)
dd f_COM                ; Hex: 23 (35)
dd f_AND                ; Hex: 24 (36)
dd f_PICK               ; Hex: 25 (37)
dd f_DEPTH              ; Hex: 26 (38)
dd f_GETCH              ; Hex: 27 (39)
dd f_COMPAREI           ; Hex: 28 (40)
dd f_SLASHMOD           ; Hex: 29 (41)
dd f_NOT                ; Hex: 2A (42)
dd f_RFETCH             ; Hex: 2B (43)
dd f_INC                ; Hex: 2C (44)
dd f_RDEPTH             ; Hex: 2D (45)
dd f_DEC                ; Hex: 2E (46)
dd f_GETTICK            ; Hex: 2F (47)
dd f_SHIFTLEFT          ; Hex: 30 (48)
dd f_SHIFTRIGHT         ; Hex: 31 (49)
dd f_PLUSSTORE          ; Hex: 32 (50)
dd f_OPENBLOCK          ; Hex: 33 (51)
dd f_GOTOXY             ; Hex: 34 (52)
dd f_TOSRC              ; Hex: 35 (53)
dd f_SRCQ               ; Hex: 36 (54)
dd f_SRCP4              ; Hex: 37 (55)
dd f_SRCP1              ; Hex: 38 (56)
dd f_TODST              ; Hex: 35 (57)
dd f_DSTQ               ; Hex: 36 (58)
dd f_DSTP4              ; Hex: 37 (59)
dd f_DSTP1              ; Hex: 38 (60)
dd f_UnknownOpcode      ; Hex: 3D (61)
dd f_UnknownOpcode      ; Hex: 3E (62)
dd f_UnknownOpcode      ; Hex: 3F (63)
dd f_UnknownOpcode      ; Hex: 40 (64)
dd f_UnknownOpcode      ; Hex: 41 (65)
dd f_UnknownOpcode      ; Hex: 42 (66)
dd f_UnknownOpcode      ; Hex: 43 (67)
dd f_UnknownOpcode      ; Hex: 44 (68)
dd f_UnknownOpcode      ; Hex: 45 (69)
dd f_UnknownOpcode      ; Hex: 46 (70)
dd f_UnknownOpcode      ; Hex: 47 (71)
dd f_UnknownOpcode      ; Hex: 48 (72)
dd f_UnknownOpcode      ; Hex: 49 (73)
dd f_UnknownOpcode      ; Hex: 4A (74)
dd f_UnknownOpcode      ; Hex: 4B (75)
dd f_UnknownOpcode      ; Hex: 4C (76)
dd f_UnknownOpcode      ; Hex: 4D (77)
dd f_UnknownOpcode      ; Hex: 4E (78)
dd f_UnknownOpcode      ; Hex: 4F (79)
dd f_UnknownOpcode      ; Hex: 50 (80)
dd f_UnknownOpcode      ; Hex: 51 (81)
dd f_UnknownOpcode      ; Hex: 52 (82)
dd f_UnknownOpcode      ; Hex: 53 (83)
dd f_UnknownOpcode      ; Hex: 54 (84)
dd f_UnknownOpcode      ; Hex: 55 (85)
dd f_UnknownOpcode      ; Hex: 56 (86)
dd f_UnknownOpcode      ; Hex: 57 (87)
dd f_UnknownOpcode      ; Hex: 58 (88)
dd f_UnknownOpcode      ; Hex: 59 (89)
dd f_UnknownOpcode      ; Hex: 5A (90)
dd f_UnknownOpcode      ; Hex: 5B (91)
dd f_UnknownOpcode      ; Hex: 5C (92)
dd f_UnknownOpcode      ; Hex: 5D (93)
dd f_UnknownOpcode      ; Hex: 5E (94)
dd f_UnknownOpcode      ; Hex: 5F (95)
dd f_UnknownOpcode      ; Hex: 60 (96)
dd f_UnknownOpcode      ; Hex: 61 (97)
dd f_UnknownOpcode      ; Hex: 62 (98)
dd f_UnknownOpcode      ; Hex: 63 (99)
dd f_UnknownOpcode      ; Hex: 64 (100)
dd f_UnknownOpcode      ; Hex: 65 (101)
dd f_UnknownOpcode      ; Hex: 66 (102)
dd f_UnknownOpcode      ; Hex: 67 (103)
dd f_UnknownOpcode      ; Hex: 68 (104)
dd f_UnknownOpcode      ; Hex: 69 (105)
dd f_UnknownOpcode      ; Hex: 6A (106)
dd f_UnknownOpcode      ; Hex: 6B (107)
dd f_UnknownOpcode      ; Hex: 6C (108)
dd f_UnknownOpcode      ; Hex: 6D (109)
dd f_UnknownOpcode      ; Hex: 6E (110)
dd f_UnknownOpcode      ; Hex: 6F (111)
dd f_UnknownOpcode      ; Hex: 70 (112)
dd f_UnknownOpcode      ; Hex: 71 (113)
dd f_UnknownOpcode      ; Hex: 72 (114)
dd f_UnknownOpcode      ; Hex: 73 (115)
dd f_UnknownOpcode      ; Hex: 74 (116)
dd f_UnknownOpcode      ; Hex: 75 (117)
dd f_UnknownOpcode      ; Hex: 76 (118)
dd f_UnknownOpcode      ; Hex: 77 (119)
dd f_UnknownOpcode      ; Hex: 78 (120)
dd f_UnknownOpcode      ; Hex: 79 (121)
dd f_UnknownOpcode      ; Hex: 7A (122)
dd f_UnknownOpcode      ; Hex: 7B (123)
dd f_UnknownOpcode      ; Hex: 7C (124)
dd f_UnknownOpcode      ; Hex: 7D (125)
dd f_UnknownOpcode      ; Hex: 7E (126)
dd f_UnknownOpcode      ; Hex: 7F (127)
dd f_UnknownOpcode      ; Hex: 80 (128)
dd f_UnknownOpcode      ; Hex: 81 (129)
dd f_UnknownOpcode      ; Hex: 82 (130)
dd f_UnknownOpcode      ; Hex: 83 (131)
dd f_UnknownOpcode      ; Hex: 84 (132)
dd f_UnknownOpcode      ; Hex: 85 (133)
dd f_UnknownOpcode      ; Hex: 86 (134)
dd f_UnknownOpcode      ; Hex: 87 (135)
dd f_UnknownOpcode      ; Hex: 88 (136)
dd f_UnknownOpcode      ; Hex: 89 (137)
dd f_UnknownOpcode      ; Hex: 8A (138)
dd f_UnknownOpcode      ; Hex: 8B (139)
dd f_UnknownOpcode      ; Hex: 8C (140)
dd f_UnknownOpcode      ; Hex: 8D (141)
dd f_UnknownOpcode      ; Hex: 8E (142)
dd f_UnknownOpcode      ; Hex: 8F (143)
dd f_UnknownOpcode      ; Hex: 90 (144)
dd f_UnknownOpcode      ; Hex: 91 (145)
dd f_UnknownOpcode      ; Hex: 92 (146)
dd f_UnknownOpcode      ; Hex: 93 (147)
dd f_UnknownOpcode      ; Hex: 94 (148)
dd f_UnknownOpcode      ; Hex: 95 (149)
dd f_UnknownOpcode      ; Hex: 96 (150)
dd f_UnknownOpcode      ; Hex: 97 (151)
dd f_UnknownOpcode      ; Hex: 98 (152)
dd f_UnknownOpcode      ; Hex: 99 (153)
dd f_UnknownOpcode      ; Hex: 9A (154)
dd f_UnknownOpcode      ; Hex: 9B (155)
dd f_UnknownOpcode      ; Hex: 9C (156)
dd f_UnknownOpcode      ; Hex: 9D (157)
dd f_UnknownOpcode      ; Hex: 9E (158)
dd f_UnknownOpcode      ; Hex: 9F (159)
dd f_UnknownOpcode      ; Hex: A0 (160)
dd f_UnknownOpcode      ; Hex: A1 (161)
dd f_UnknownOpcode      ; Hex: A2 (162)
dd f_UnknownOpcode      ; Hex: A3 (163)
dd f_UnknownOpcode      ; Hex: A4 (164)
dd f_UnknownOpcode      ; Hex: A5 (165)
dd f_UnknownOpcode      ; Hex: A6 (166)
dd f_UnknownOpcode      ; Hex: A7 (167)
dd f_UnknownOpcode      ; Hex: A8 (168)
dd f_UnknownOpcode      ; Hex: A9 (169)
dd f_UnknownOpcode      ; Hex: AA (170)
dd f_UnknownOpcode      ; Hex: AB (171)
dd f_UnknownOpcode      ; Hex: AC (172)
dd f_UnknownOpcode      ; Hex: AD (173)
dd f_UnknownOpcode      ; Hex: AE (174)
dd f_UnknownOpcode      ; Hex: AF (175)
dd f_UnknownOpcode      ; Hex: B0 (176)
dd f_UnknownOpcode      ; Hex: B1 (177)
dd f_UnknownOpcode      ; Hex: B2 (178)
dd f_UnknownOpcode      ; Hex: B3 (179)
dd f_UnknownOpcode      ; Hex: B4 (180)
dd f_UnknownOpcode      ; Hex: B5 (181)
dd f_UnknownOpcode      ; Hex: B6 (182)
dd f_UnknownOpcode      ; Hex: B7 (183)
dd f_UnknownOpcode      ; Hex: B8 (184)
dd f_UnknownOpcode      ; Hex: B9 (185)
dd f_UnknownOpcode      ; Hex: BA (186)
dd f_UnknownOpcode      ; Hex: BB (187)
dd f_UnknownOpcode      ; Hex: BC (188)
dd f_UnknownOpcode      ; Hex: BD (189)
dd f_UnknownOpcode      ; Hex: BE (190)
dd f_UnknownOpcode      ; Hex: BF (191)
dd f_UnknownOpcode      ; Hex: C0 (192)
dd f_UnknownOpcode      ; Hex: C1 (193)
dd f_UnknownOpcode      ; Hex: C2 (194)
dd f_UnknownOpcode      ; Hex: C3 (195)
dd f_UnknownOpcode      ; Hex: C4 (196)
dd f_UnknownOpcode      ; Hex: C5 (197)
dd f_UnknownOpcode      ; Hex: C6 (198)
dd f_UnknownOpcode      ; Hex: C7 (199)
dd f_UnknownOpcode      ; Hex: C8 (200)
dd f_UnknownOpcode      ; Hex: C9 (201)
dd f_UnknownOpcode      ; Hex: CA (202)
dd f_UnknownOpcode      ; Hex: CB (203)
dd f_UnknownOpcode      ; Hex: CC (204)
dd f_UnknownOpcode      ; Hex: CD (205)
dd f_UnknownOpcode      ; Hex: CE (206)
dd f_UnknownOpcode      ; Hex: CF (207)
dd f_UnknownOpcode      ; Hex: D0 (208)
dd f_UnknownOpcode      ; Hex: D1 (209)
dd f_UnknownOpcode      ; Hex: D2 (210)
dd f_UnknownOpcode      ; Hex: D3 (211)
dd f_UnknownOpcode      ; Hex: D4 (212)
dd f_UnknownOpcode      ; Hex: D5 (213)
dd f_UnknownOpcode      ; Hex: D6 (214)
dd f_UnknownOpcode      ; Hex: D7 (215)
dd f_UnknownOpcode      ; Hex: D8 (216)
dd f_UnknownOpcode      ; Hex: D9 (217)
dd f_UnknownOpcode      ; Hex: DA (218)
dd f_UnknownOpcode      ; Hex: DB (219)
dd f_UnknownOpcode      ; Hex: DC (220)
dd f_UnknownOpcode      ; Hex: DD (221)
dd f_UnknownOpcode      ; Hex: DE (222)
dd f_UnknownOpcode      ; Hex: DF (223)
dd f_UnknownOpcode      ; Hex: E0 (224)
dd f_UnknownOpcode      ; Hex: E1 (225)
dd f_UnknownOpcode      ; Hex: E2 (226)
dd f_UnknownOpcode      ; Hex: E3 (227)
dd f_UnknownOpcode      ; Hex: E4 (228)
dd f_UnknownOpcode      ; Hex: E5 (229)
dd f_UnknownOpcode      ; Hex: E6 (230)
dd f_UnknownOpcode      ; Hex: E7 (231)
dd f_UnknownOpcode      ; Hex: E8 (232)
dd f_UnknownOpcode      ; Hex: E9 (233)
dd f_UnknownOpcode      ; Hex: EA (234)
dd f_UnknownOpcode      ; Hex: EB (235)
dd f_UnknownOpcode      ; Hex: EC (236)
dd f_UnknownOpcode      ; Hex: ED (237)
dd f_UnknownOpcode      ; Hex: EE (238)
dd f_UnknownOpcode      ; Hex: EF (239)
dd f_UnknownOpcode      ; Hex: F0 (240)
dd f_UnknownOpcode      ; Hex: F1 (241)
dd f_UnknownOpcode      ; Hex: F2 (242)
dd f_UnknownOpcode      ; Hex: F3 (243)
dd f_UnknownOpcode      ; Hex: F4 (244)
dd f_UnknownOpcode      ; Hex: F5 (245)
dd f_UnknownOpcode      ; Hex: F6 (246)
dd f_UnknownOpcode      ; Hex: F7 (247)
dd f_UnknownOpcode      ; Hex: F8 (248)
dd f_UnknownOpcode      ; Hex: F9 (249)
dd f_UnknownOpcode      ; Hex: FA (250)
dd f_UnknownOpcode      ; Hex: FB (251)
dd f_NOP                ; Hex: FC (252)
dd f_BREAK              ; Hex: FD (253)
dd f_RESET              ; Hex: FE (254)
dd f_BYE                ; Hex: FF (255)

; -------------------------------------------------------------------------------------
; section '.code' code readable writable executable
section '.code' code readable executable

include 'macros.s'

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; The VM opcodes (primitives)
; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; LITERAL (32-bit)
f_LITERAL:
            mov eax, [PCIP]
            add PCIP, CELL_SIZE
            m_push eax
            m_NEXT

; -------------------------------------------------------------------------------------
; FETCH
f_FETCH:
            add TOS, THE_MEMORY
            mov TOS, [TOS]
            m_NEXT

; -------------------------------------------------------------------------------------
; STORE
f_STORE:
            m_pop REG3
            m_pop eax
            add REG3, THE_MEMORY
            mov [REG3], eax
            m_NEXT

; -------------------------------------------------------------------------------------
; SWAP
f_SWAP:
            m_get2ND eax
            m_set2ND TOS
            m_setTOS eax
            m_NEXT

; -------------------------------------------------------------------------------------
; SWAP
s_SWAP:
            m_get2ND eax
            m_set2ND TOS
            m_setTOS eax
            ret

; -------------------------------------------------------------------------------------
; DROP
f_DROP:
            m_drop
            m_NEXT

; -------------------------------------------------------------------------------------
; DUP
f_DUP:
            m_push TOS
            m_NEXT

; -------------------------------------------------------------------------------------
; SLITERAL
f_SLITERAL:
            mov eax, PCIP
            sub eax, THE_MEMORY
            m_push eax
            xor eax, eax
            mov al, [PCIP]
            add PCIP, eax
            inc PCIP
            inc PCIP
            m_NEXT

; -------------------------------------------------------------------------------------
; JMP
f_JMP:
            mov PCIP, [PCIP]
            add PCIP, THE_MEMORY
            m_NEXT

; -------------------------------------------------------------------------------------
; JMPZ
f_JMPZ:
            m_pop eax
            cmp eax, 0
            je f_JMP
            ; jmp noJMP
noJMP:      add PCIP, CELL_SIZE
            m_NEXT

; -------------------------------------------------------------------------------------
; JMPNZ
f_JMPNZ:
            m_pop eax
            cmp eax, 0
            jne f_JMP
            jmp noJMP

; -------------------------------------------------------------------------------------
; CALL
f_CALL:
            push dword [PCIP]
            add PCIP, CELL_SIZE
            sub PCIP, THE_MEMORY
            m_rpush PCIP
            pop PCIP
            add PCIP, THE_MEMORY
            m_NEXT

; -------------------------------------------------------------------------------------
checkStack:
            cmp STKP, dStack
            jl csUF
            cmp STKP, dstackE
            jge csOF
            ret

csUF:       ; push dsUnderFlow
            mov STKP, dstackE
            sub STKP, CELL_SIZE
            ret
            ; call [printf]
            ; pop eax
            ; jmp f_RESET

csOF:       ; push dsOverFlow
            mov STKP, dStack
            ret
            ; call [printf]
            ; pop eax
            ; jmp f_RESET

; -------------------------------------------------------------------------------------
; RET
f_RET:
            call checkStack
            m_rpop PCIP
            add PCIP, THE_MEMORY
            m_NEXT

; -------------------------------------------------------------------------------------
; OR
f_OR:
            m_pop eax
            or TOS, eax
            m_NEXT

; -------------------------------------------------------------------------------------
; CLITERAL
f_CLITERAL:
            xor eax, eax
            mov al, [PCIP]
            m_push eax
            inc PCIP
            m_NEXT

; -------------------------------------------------------------------------------------
; CFETCH
f_CFETCH:
            xor eax, eax
            mov al, [TOS + THE_MEMORY]
            m_setTOS eax
            m_NEXT

; -------------------------------------------------------------------------------------
; CSTORE
f_CSTORE:
            m_pop REG3
            m_pop eax
            mov [REG3 + THE_MEMORY], al
            m_NEXT

; -------------------------------------------------------------------------------------
; ADD
f_ADD:
            m_pop eax
            add TOS, eax
            m_NEXT

; -------------------------------------------------------------------------------------
; SUB
f_SUB:
            m_pop eax
            sub TOS, eax
            m_NEXT

; -------------------------------------------------------------------------------------
; MUL
f_MUL:
            push edx
            m_pop eax
            xor edx, edx
            mul TOS
            m_setTOS eax
            pop edx
            m_NEXT

; -------------------------------------------------------------------------------------
f_SLASHMOD:
        call s_SLASHMOD
        m_NEXT

; -------------------------------------------------------------------------------------
s_SLASHMOD:
           m_pop REG3
           m_pop eax
           cmp REG3, 0
           je smDivBy0
           xor edx, edx
           div REG3
           m_push edx          ; Remainder
           m_push eax          ; Quotient
           ret

smDivBy0:
           push divByZero
           call [printf]
           pop eax
           jmp f_RESET

; -------------------------------------------------------------------------------------
; DIV
f_DIV:
            call s_SLASHMOD
            call s_SWAP
            jmp f_DROP

; -------------------------------------------------------------------------------------
; MOD
f_MOD:
            call s_SLASHMOD
            jmp f_DROP

; -------------------------------------------------------------------------------------
; LT
f_LT:
            m_pop eax
            cmp TOS, eax
            jl eq_T
            jmp eq_F

; -------------------------------------------------------------------------------------
; EQ
f_EQ:
            m_pop eax
            cmp TOS, eax
            je eq_T

eq_F:       m_setTOS 0
            m_NEXT

eq_T:       m_setTOS -1
            m_NEXT

; -------------------------------------------------------------------------------------
; GT
f_GT:
            m_pop eax
            cmp TOS, eax
            jg eq_T
            jmp eq_F

; -------------------------------------------------------------------------------------
; DICTP
f_DICTP:
            add PCIP, CELL_SIZE
            m_NEXT

; -------------------------------------------------------------------------------------
; EMIT
f_EMIT:
            push TOS
            call [putchar]
            pop eax
            m_drop
            m_NEXT

; -------------------------------------------------------------------------------------
; OVER
f_OVER:
            m_get2ND eax
            m_push eax
            m_NEXT

; -------------------------------------------------------------------------------------
; Makes al lowerCase if upperCase
u_ToLower:
                cmp al, 'A'
                jl u2lR
                cmp al, 'Z'
                jg u2lR
                add al, 32
u2lR:           ret

; -------------------------------------------------------------------------------------
; do_STRCMP
; Compare strings pointed to by PCIP and REG4
; case sensitive: REG2 = 0
; case insensitive: REG2 != 0
; return in eax: -1 => eax<REG3, 0 => same, 1 eax>REG3
do_STRCMP:
                mov al, [PCIP]
                mov ah, [REG4]

                test REG2, REG2
                jz cmp2
                call u_ToLower
                xchg al, ah
                call u_ToLower
                ;xchg al, ah
cmp2:           cmp ah, al
                jl cmpLT
                jg cmpGT
                test ax, ax
                jz cmpEQ
                inc PCIP
                inc REG4
                jmp do_STRCMP

cmpLT:          mov eax, -1
                ret
cmpGT:          mov eax, 1
                ret
cmpEQ:          mov eax, 0
                ret

; -------------------------------------------------------------------------------------
; do_COMPARE
; Compare strings pointed to by PCIP and REG4
; case sensitive: REG2 = 0
; case insensitive: REG2 != 0
; return in eax: -1 => strings are equal, 0 => strings are NOT equal
do_COMPARE:
                call do_STRCMP
                test eax, eax
                jz cmpT
                mov eax, 0
                ret
cmpT:           mov eax, -1
                ret

; -------------------------------------------------------------------------------------
; COMPARE
f_COMPARE:
                push PCIP

                m_pop REG4
                add REG4, THE_MEMORY
                m_pop PCIP
                add PCIP, THE_MEMORY
                xor REG2, REG2
                call do_COMPARE
                m_push eax

                pop PCIP

                m_NEXT

; -------------------------------------------------------------------------------------
; FOPEN: ( name mode type -- fp success )
f_FOPEN:
                ; mode has to go first in the openMode
                ; put that on the top of the stack
                call s_SWAP

                ; save these
                push REG2
                push REG4

                mov REG4, tmpBuf1

                m_pop REG3                       ; mode: 0 => read, 1 => write
                mov al, 'r'
                cmp REG3, 0
                je fopen1
                mov al, 'w'
fopen1:         mov [REG4], al

                m_pop REG3                       ; type: 0 => text, 1 => binary
                mov al, 't'
                cmp REG3, 0
                je fopen2
                mov al, 'b'
fopen2:         inc REG4
                mov [REG4], al

                inc REG4
                mov [REG4], byte 0
                ; now [tmpBuf1] has the openMode for fopen()

                ; now for the filename
                m_pop eax
                inc eax                         ; skip the count byte
                add eax, THE_MEMORY

                ; function signature is fp = fopen(name, openMode);
                push tmpBuf1
                push eax
                call [fopen]                    ; returns the FP in eax
                pop REG3                         ; clean up the stack
                pop REG3

                m_push eax
                m_push eax

                ; restore these
                pop REG4
                pop REG2
                m_NEXT

; -------------------------------------------------------------------------------------
; FREAD ( addr count fp -- num-read )
f_FREAD:
                ; save these
                push REG2

                ; signature is: num-read = fread(addr, size, count, fp);
                ; args for [fread]
                m_pop eax       ; Stream
                push eax
                m_pop eax       ; count
                push eax
                push 1          ; size
                m_pop eax       ; addr
                add eax, THE_MEMORY
                push eax
                call [fread]
                m_push eax       ; EAX = return val (num-read)
                ; clean up from call
                pop eax
                pop eax
                pop eax
                pop eax

                ; get these back
                pop REG2
                m_NEXT

; -------------------------------------------------------------------------------------
; FREADLINE ( addr max-sz fp -- num-read )
f_FREADLINE:
                ; signature is: buf = fgets(addr, size, fp);
                ; Returns addr if successful, NULL if EOF or Error
                ; NB: the strring returned at addr should be counted
                ;     and null-terminated

                ; Save REG2
                push REG2

                m_pop eax       ; FP
                push eax
                m_pop eax       ; max
                push eax
                m_pop eax       ; addr
                add eax, THE_MEMORY
                inc eax
                push eax
                call [fgets]    ; returns addr if OK, else NULL
                m_push eax
                pop REG3         ; addr (+1)
                pop eax         ; max
                pop eax         ; FP

                m_getTOS eax    ; NULL => done
                test eax, eax
                jz rdlEOF

                push REG3        ; remember the original addr (+1)
                xor eax, eax
rdlC:           mov ah, [REG3]
                cmp ah, 0
                jz rdlCX
                inc al          ; this is the length
                inc REG3
                jmp rdlC
                
rdlCX:          pop REG3         ; Make it a counted string
                dec REG3
                mov [REG3], al

rdlX:           m_setTOS eax
                ; Restore REG2
                pop REG2
                m_NEXT

rdlEOF:         dec REG3
                mov [REG3], word 0
                m_setTOS 0
                pop REG2
                m_NEXT

; -------------------------------------------------------------------------------------
; FWRITE: ( addr count fp -- num-written ) 
f_FWRITE:
                ; save these
                push REG2

                ; signature is: num-written = fwrite(addr, size, count, fp);
                ; args for [fread]
                m_pop eax       ; Stream
                push eax
                m_pop eax       ; count
                push eax
                push 1          ; size
                m_pop eax       ; addr
                add eax, THE_MEMORY
                push eax
                call [fwrite]
                m_push eax       ; EAX = return val (num-written)
                ; clean up from call
                pop eax
                pop eax
                pop eax
                pop eax

                ; get these back
                pop REG2
                m_NEXT

; -------------------------------------------------------------------------------------
; FCLOSE
f_FCLOSE:   ; ( fp -- )
            m_pop eax
            push REG2
            push eax
            call [fclose]
            pop eax
            pop REG2
            m_NEXT

; -------------------------------------------------------------------------------------
; DTOR
f_DTOR:
            m_pop eax
            m_rpush eax
            m_NEXT

; -------------------------------------------------------------------------------------
; RTOD
f_RTOD:
            m_rpop eax
            m_push eax
            m_NEXT

; -------------------------------------------------------------------------------------
; COM
f_COM:
            not TOS
            m_NEXT

; -------------------------------------------------------------------------------------
; RFETCH - R@ ( -- n)
f_RFETCH:
                mov REG3, [rStackPtr]
                mov eax, [REG3]
                m_push eax
                m_NEXT

; -------------------------------------------------------------------------------------
; AND
f_AND:
            m_pop eax
            and TOS, eax
            m_NEXT

; -------------------------------------------------------------------------------------
; NOT ( n1 -- n2 )
f_NOT:
            test TOS, TOS
            jz eq_T
            jmp eq_F

; -------------------------------------------------------------------------------------
; PICK
f_PICK:
            m_getTOS eax
            shl eax, 2
            mov REG3, STKP
            sub REG3, eax
            mov eax, [REG3]
            m_setTOS eax
            m_NEXT

; -------------------------------------------------------------------------------------
; DEPTH
f_DEPTH:
            mov eax, STKP
            sub eax, dStack
            shr eax, 2

            m_push eax
            m_NEXT

; -------------------------------------------------------------------------------------
; GETCH
f_GETCH:
            push REG2
            call [getch]
            pop REG2
            cmp eax, 3
            je f_BYE
            m_push eax
            m_NEXT

; -------------------------------------------------------------------------------------
; COMPAREI
f_COMPAREI:
                push PCIP
                push REG4
                push REG2

                m_pop REG4
                m_pop PCIP
                add REG4, THE_MEMORY
                add PCIP, THE_MEMORY
                mov REG2, 1
                call do_COMPARE
                m_push eax

                pop REG2
                pop REG4
                pop PCIP
                m_NEXT

; -------------------------------------------------------------------------------------
; INC
f_INC:
            inc TOS
            m_NEXT

; -------------------------------------------------------------------------------------
; RDEPTH
f_RDEPTH:
                m_push [rDepth]
                m_NEXT

; -------------------------------------------------------------------------------------
; DEC
f_DEC:
            dec TOS
            m_NEXT

; -------------------------------------------------------------------------------------
; TIMER
f_GETTICK:
                push REG2
                call [GetTickCount]
                m_push eax
                pop REG2
                m_NEXT

; -------------------------------------------------------------------------------------
f_SHIFTLEFT:
                m_pop REG3
                shl TOS, cl
                m_NEXT

; -------------------------------------------------------------------------------------
f_SHIFTRIGHT:
                m_pop REG3
                shr TOS, cl
                m_NEXT

; -------------------------------------------------------------------------------------
; PLUSSTORE
f_PLUSSTORE:
                m_pop eax
                m_pop REG3
                ; add eax, REG2
                add [eax+THE_MEMORY], REG3
                m_NEXT

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; Implementation of # ...
; i.e. : # BASE @ /MOD SWAP '0' + ;
;   input:
;     - eax = BASE
;     - REG3 = end of buffer for char
;   output:
;     - eax: unchanged
;     - REG3: REG3-1
s_NumToText:
                push REG3
                push eax
                m_push eax
                call s_SLASHMOD
                call s_SWAP
                add TOS, '0'
                pop eax
                pop REG3
                m_pop REG2
                mov [REG3], bl
                dec REG3
                ret
; -------------------------------------------------------------------------------------
; f_OPENBLOCK
f_OPENBLOCK:
                ; replace the "0000" in "block-0000.fs" with block #
                mov REG3, blockFile
                add REG3, 9
                mov eax, 10
                call s_NumToText
                call s_NumToText
                call s_NumToText
                call s_NumToText
                m_drop
                
                push REG2        ; save these
                push REG4

                push openModeRT
                push blockFile
                call [fopen]
                pop REG3
                pop REG3

                pop REG4         ; get them back
                pop REG2

                m_push eax
                m_push eax
                
                m_NEXT

; -------------------------------------------------------------------------------------
; f_GOTOXY ( X Y -- ) - top/left of screen is (0,0)
f_GOTOXY:
                m_pop eax       ; Y
                m_pop REG3       ; X
                shl eax, 16
                mov ax, cx

                push REG2
                push eax
                push [STDOUT]
                call [SetConsoleCursorPosition]
                pop REG2

                m_NEXT

; -------------------------------------------------------------------------------------
; TOSRC - >SRC
f_TOSRC:
                m_pop [SRC]
                m_NEXT

; -------------------------------------------------------------------------------------
; SRCQ - SRC?
f_SRCQ:
                m_push [SRC]
                m_NEXT

; -------------------------------------------------------------------------------------
; SRCP4 - SRC+
f_SRCP4:
                mov eax, [SRC]
                m_push [THE_MEMORY+eax]
                add [SRC], CELL_SIZE
                m_NEXT

; -------------------------------------------------------------------------------------
; SRCP4 - SRC+1
f_SRCP1:
                mov eax, [SRC]
                movzx REG2, BYTE [THE_MEMORY+eax]
                m_push REG2
                inc [SRC]
                m_NEXT

; -------------------------------------------------------------------------------------
; TODST - >SRC
f_TODST:
                m_pop [DST]
                m_NEXT

; -------------------------------------------------------------------------------------
; DSTQ - SRC?
f_DSTQ:
                m_push [DST]
                m_NEXT

; -------------------------------------------------------------------------------------
; DST4 - DST+
f_DSTP4:
                mov eax, [DST]
                m_pop REG2
                mov [THE_MEMORY+eax], REG2
                add [DST], CELL_SIZE
                m_NEXT

; -------------------------------------------------------------------------------------
; DSTP1 - DST+1
f_DSTP1:
                mov eax, [DST]
                m_pop REG2
                mov BYTE [THE_MEMORY+eax], bl
                inc [DST]
                m_NEXT

; -------------------------------------------------------------------------------------
; NOP
f_NOP:
                m_NEXT

; -------------------------------------------------------------------------------------
; BREAK
f_BREAK:
            mov REG3, REG4
            sub REG3, THE_MEMORY
            int3
            m_NEXT

; -------------------------------------------------------------------------------------
; BYE
f_BYE:
            push 0
            call [ExitProcess]
            pop eax
            m_NEXT

f_UnknownOpcode:
            mov eax, PCIP
            sub eax, THE_MEMORY
            dec eax
            push eax
            push REG3
            push unknownOpcode
            call [printf]
            pop eax
            pop eax
            pop eax

            ; jmp f_BYE
            jmp f_RESET

; -------------------------------------------------------------------------------------
; -------------------------------------------------------------------------------------
; RESET
f_RESET:
        call s_SYS_INIT
        mov esp, [InitialESP]
        jmp cpuLoop

; -------------------------------------------------------------------------------------
; s_SYS_INIT: Initialize the VM
s_SYS_INIT:
            ; Return stack
            mov eax, rStack - CELL_SIZE
            mov [rStackPtr], eax
            mov [rDepth], 0

            ; Data stack
            mov STKP, dStack

            ; PCIP = IP/PC
            mov PCIP, THE_MEMORY
            ret

; -------------------------------------------------------------------------------------
argError:
        invoke printf, printArgError
        jmp f_BYE

; -------------------------------------------------------------------------------------
fileError:
        invoke printf, printFileError, [fileName]
        jmp f_BYE


; -------------------------------------------------------------------------------------
entry $
        ; To clean up the stack after calls
        mov [InitialESP], esp
        mov STKP, esp

        ; -10 = SDTIN, -11 = STDOUT, -12 = STDERR
        push STD_INPUT_HANDLE
        call [GetStdHandle]
        mov [STDIN], eax
        mov esp, STKP

        push STD_OUTPUT_HANDLE
        call [GetStdHandle]
        mov [STDOUT], eax
        mov esp, STKP

        invoke __getmainargs, argc, argv, env, 0, stup
        mov esp, STKP
        cmp [argc], 2
        jne argError
        mov PCIP, [argv]
        mov eax, [PCIP + 4]
        mov [fileName], eax

        ; Ensure that the file is there        
        push [fileName]
        call [GetFileAttributes]
        cmp eax, -1
        je fileError

        ; Open the file
        push openModeRB
        push [fileName]
        call [fopen]
        mov esp, STKP
        mov [stream], eax

        ; Read in the file ...
        ; Get the file size, allocate memory, read file into memory ...

        ; Get the file size ...
        ; fseek() to the end and then use ftell() to get the size
        ; fseek(fp, offset, from): - from: 0 => SEEK_SET, 1 => SEEK_CUR, 2 => SEEK_END
        push 2
        push 0
        push [stream]
        call [fseek]
        mov esp, STKP

        ; Get the file size
        push [stream]
        call [ftell]
        mov [fileSize], eax
        mov esp, STKP

        ; Reset the file position pointer to beginning of the file
        push 0
        push 0
        push [stream]
        call [fseek]
        mov esp, STKP

        ; Read the file into memory
        push [stream]
        push [fileSize]
        push 1
        push THE_MEMORY
        call [fread]
        mov esp, STKP

        ; Close the file
        push [stream]
        call [fclose]
        mov esp, STKP

        ; Initialize the VM
        call s_SYS_INIT

; This is the main CPU Loop
cpuLoop:
        m_NEXT
; -------------------------------------------------------------------------------------
section '.mem' data readable writable
KILOBYTE = 1024
MEGABYTE = KILOBYTE*KILOBYTE

THE_MEMORY: rb MEGABYTE*128
MEM_END:
