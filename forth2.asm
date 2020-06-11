; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; A P-Code implementation of Forth
;
; Written by Chris Curl
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; In this implementation, the code starts at the beginning of the memory space, and the dictionary
; starts at the end. They grow towards each other.
;
; There are 2 stacks in this virtual machine: the data stack, and the return stack. EBP is the pointer for
; the data stack. The return stack is a counted array of DWORDs.
;
; A dictionary entry looks like this:
;
; Offset
; 00-03		dw		Prev		; Address of previous entry: the current LAST.
; 04-07		dw		XT			; Execution Token: the current HERE.
; 08-08		db 		Flags		; Flags ... see below.
; 09-09		db		Count		; Name length, not including the count or the NULL delimiter
; 10-xx		db(?)		Name		; The word's name, NULL delimited
;
; Flags:
;		Bit 0 (Flags AND 0x01) is the immediate flag.		A ONE here means the word is immediate.
;		Bit 1 (Flags AND 0x02) is the ready bit.			A ONE here means the word is ready for use.
;		Bit 2 (Flags AND 0x04) is not currently used.
;		Bit 3 (Flags AND 0x08) is not currently used.
;		Bit 4 (Flags AND 0x10) is the primitive bit.		A ONE here means the word is machine code.
;		Bit 5 (Flags AND 0x20) is not currently used.
;		Bit 6 (Flags AND 0x40) is not currently used.
;		Bit 7 (Flags AND 0x80) is the compile_only bit.		A ONE here means the word is only for compile time (STATE=1).
;
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
include 'win32ax.inc'

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------
section '.data' data readable writeable executable

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 1 - Constants
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------

oneKilo			EQU 400h
oneMB			EQU oneKilo * oneKilo

SIZE_DWORD		EQU 4
SIZE_WORD		EQU 2
SIZE_CHAR		EQU 1

memorySize		EQU oneKilo*16		; The default memory size

; NB: the memory size can be changed as follows:
; This is done in the beginning of BootStrap.4th
; 1024 DUP * 32 * MEM_SIZE !
; restart!

inpBuf_SZ		EQU	 0100h			; the size of the input buffer

; For Dictionary entries
IMM_BIT				EQU 01h
READY_BIT			EQU 02h
x86_BIT				EQU 10h
COMPILE_ONLY_BIT	EQU 80h
NEXT_OFFSET			EQU  0
XT_OFFSET			EQU  4
FLAGS_OFFSET		EQU  8
NAME_OFFSET			EQU  9
ENTRY_OVERHEAD		EQU 10

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; VM opcodes

	; opcode 0 is unused
	I_FETCH			EQU   1
	I_STORE			EQU   2
	I_LITERAL		EQU   3
	I_DUP			EQU   4
	I_SWAP			EQU   5
	I_DROP			EQU   6
	I_PICK			EQU   7
	I_ROT			EQU   8
	I_ONEPLUS		EQU   9
	I_PLUS			EQU  10		; 0Ah
	I_MINUS			EQU  11
	I_MULT			EQU  12		; 0Ch
	I_DIV			EQU  13
	I_EQ			EQU  14		; 0Eh
	I_CALL			EQU  15
	I_LT			EQU  16		; 10h
	I_GT			EQU  17
	I_TO_R			EQU  18		; 12h
	I_R_FROM		EQU  19
	I_R_AT			EQU  20		; 14h
	I_JMPZ			EQU  21
	I_LOOKUP		EQU  22		; 16h
	I_X86			EQU  23
	I_JMPNZ			EQU  24		; 18h
	I_SLITERAL		EQU  25
	I_DEPTH			EQU  26		; 1ah
	I_ONEMINUS		EQU  27
	I_AND			EQU  28		; 1ch
	I_OR			EQU  29
	I_XOR			EQU  30		; 1eh
	I_DIVMOD		EQU  31
	I_EMIT			EQU  32		; 20h
	I_DICTP			EQU  33
	I_TWOTIMES		EQU  34		; 22h
	I_TWODIV		EQU  35
	I_FOPEN			EQU  36		; 24h
	I_FCLOSE		EQU  37
	I_FREAD			EQU  38		; 26h
	I_FWRITE		EQU  39
	I_FGETC			EQU  40		; 28h
	I_FETCH_8		EQU  41
	I_STORE_8		EQU  42		; 2ah
	I_LITERAL_8		EQU  43
	I_COMMA			EQU  44		; 2ch
	I_COMMA_8		EQU  45
	I_OVER			EQU  46		; 2eh
	I_STRCMP		EQU  47
	I_STRCMPI		EQU  48		; 30h
	I_CREATE		EQU  49
	I_WORD			EQU  50		; 32h
	I_BRANCHF		EQU  51
	I_GOTO			EQU  52		; 34h
	I_EXECUTE		EQU  53
	I_DOT			EQU  54		; 36h
	; opcodes 55 -> 97 are unused
	I_BREAK			EQU  98		; 62h
	I_RETURN		EQU  99		; 63h
	; opcodes 100 -> 255 are unused

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 2 - Macros
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
include "./Forth-STC-Macros.inc"
; The stack pointer is EBP

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 3 - Program data
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
.data

req_MEMSIZE	dw memorySize
cur_MEMSIZE	dw memorySize

; Each primitive is implemented as a procedure. A pointer the that routine is stored here.
primVectors	dw 256 DUP (0)

welcome		db	"Hello, Chris.", 0
msgOK		db	" ", 0
msgPrompt	db	13, 10, "ok. ", 0
cmdBye		db	3, "bye", 0
cmdRestart	db	8, "restart!", 0
resetOK		db	"restarted.", 0
msgBye		db	"Good bye.", 0
msgBad_PRE	db	"Sorry, I don't know '", 0
msgBad_POST	db	"'.", 0
msgMemOR	db	"Memory reference out of range.", 0
msgStackE	db	"Stack empty.", 0
msgRStackE	db	"Return stack empty.", 0
msgStackU	db	"Stack underflow.", 0
msgStackO	db	"Stack overflow.", 0
msgDivByZero db	"Divide by zero.", 0
msgNoName	db	"Cannot create dictionary entry with no name.", 0
msgBadOP	db	"Invalid opcode encountered.", 0
msgNoMem	db	"Fatal error - memory allocation failed!", 0
msgBadMem	db	"Fatal error - memory addresses out of expected range!", 0
char2Num	db	"0123456789ABCDEF", 0

theMemory	dw 0
bytesRead	dw 0

hStdIn		dw 0
hStdOut		dw 0
SizeReadWrite dw 0

initialESPVal	dw 0

var_Depth		db 0
dStack			dw 64 dup (0)

var_rDepth		db 0
rStack			dw 64 dup (0)

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 4 - Variables for creating the built-in words
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
		

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 5 - Code
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; .code

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 6 - Primitives
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
;
; In this implementation:
;
;		EBP is defined to be the stack pointer for the data stack.
;		PUSH increments the pointer, and POP decrements it. 
;       EBX is the TOS, [EBP] is the second value on the stack.
;		
;		The return stack is implemented as an array of DWORDs.
;
;		Both stacks have depth counters.
; 
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
stackEmpty:

		; mov				edx, offset msgStackE
		jmp				doError

stackEmpty_end:

; ---------------------------------------------------------------------------------------------------------
stackUnderFlow:			; If we get here, the stack could be hosed ...

		; mov				edx, offset msgStackU
		jmp				doError

stackUnderFlow_end:

; ---------------------------------------------------------------------------------------------------------
stackOverFlow:			; If we get here, the stack could be hosed ...

		; mov				edx, offset msgStackO
		jmp				doError

stackOverFlow_end:

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
;
;
;			FORTH PRIMITIVES
;
;
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
; FETCH (@) - this is the 32 bit version
fFETCH:

		add			ebx, the_Memory
		mov			ebx, [ebx]
		ret

fFETCH_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
; FETCH_8 (C@)
fFETCH_8:

		add			ebx, the_Memory
		mov			ebx, [ebx]
		and			ebx, 0x000000FF
		ret

fFETCH_8_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
; STORE (!) - this is the 32 bit version
fSTORE:

		m_pop		edx
		m_pop		eax
		add			edx, the_Memory
		mov			[edx], eax
		ret

fSTORE_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
; fSTORE_8 (C!)
fSTORE_8:

		m_pop		edx
		m_pop		eax
		add			edx, the_Memory
		mov			[edx], al
		ret

fSTORE_8_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fLITERAL:

		mov			edx, [esi]
		m_push		edx
		add			esi, SIZE_DWORD
		ret

fLITERAL_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fLITERAL_8:

        xor			edx, edx
		mov			dl,[esi]
		m_push		edx
		inc			esi
		ret

fLITERAL_8_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fDUP:

		m_push		ebx
		ret

fDUP_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fSWAP:

		m_get2ND	eax
		m_set2ND	ebx
		m_setTOS	eax
		ret

fSWAP_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fPICK:

		m_pop		edx
		shl			edx, 2
		mov			eax, ebp
		add			eax, edx
		cmp			eax, dStack_MAX
		jg			stackUnderFlow
		mov			eax, [eax]
		m_push eax
		ret

fPICK_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fROT:

		m_pop		eax
		m_pop		ecx
		m_pop		edx

		m_push		ecx
		m_push		eax
		m_push		edx
		
		ret

fROT_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fONEPLUS:

		inc  ebx
		ret

fONEPLUS_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fONEMINUS:

		dec  ebx
		ret

fONEMINUS_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fPLUS:

		m_pop		eax
		add			ebx, eax
		ret

fPLUS_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fMINUS:

		m_pop		eax
		sub			ebx, eax
		ret

fMINUS_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fMULT:

		m_pop		ecx
		m_getTOS	eax
		mul			ecx
		m_setTOS	eax
		ret

fMULT_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
; /MOD - return quotient and remainder of division
; ( dv dd -- rem quot  )
f_DIVMOD:
		m_pop		ecx		; Dividend
		m_pop		eax		; Divisor

		cmp			ecx, 0
		je			divByZero

		xor			edx, edx	; DIV uses EDX and EAX
		jns			doDiv
		dec			edx

doDiv:	div			ecx			; EAX gets quotient, EDX gets remainder
		m_push		edx
		m_push		eax
		ret

divByZero:
		; mov			edx, offset msgDivByZero
		m_drop
		jmp			doError

f_DIV_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fEQ:

		m_pop		eax
		cmp			ebx, eax
		je			fEQ_T
		; fall through to false

fEQ_F:
		m_setTOS 0
		ret
fEQ_T:
		m_setTOS -1
		ret

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fLT:

		m_pop		eax
		cmp			ebx, eax
		jl			fEQ_T
		jmp			fEQ_F

fLT_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fGT:

		m_pop		eax
		cmp			ebx, eax
		jg			fEQ_T
		jmp			fEQ_F

fGT_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fCALL:

		mov			edx, [esi]
		add			edx, the_Memory
		add			esi, SIZE_DWORD
		sub			esi, the_Memory
		m_rpush		esi
		mov			esi, edx			; Put the current IP (ESI) on the return stack
		ret

fCALL_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fTO_R:

		m_rpush 	ebx
		m_drop
		ret

fTO_R_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fR_FROM:

		m_rpop		eax
		m_push		eax
		ret

fR_FROM_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fR_AT:
	
		m_rpop		eax
		m_rpush		eax
		m_push		eax
		ret

fR_AT_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fJMPZ:

		m_pop		eax
		cmp			eax, 0
		je			jmp_T
		jmp			jmp_F

jmp_T:
        mov			esi, [esi]		; The address here is an absolute 32 bit address
		add			esi, the_Memory
		ret
jmp_F:
        add			esi, 4			; Move the IP
        ret

fJMPZ_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fJMPNZ:

		m_pop		eax
		cmp			eax, 0
		jne			jmp_T
		jmp			jmp_F

fJMPNZ_end:

; ---------------------------------------------------------------------------------------------------------
fSLITERAL:

	m_push		esi
	xor			eax, eax
	lodsb
	add			esi, eax
	mov			al, [esi]			; the string may be NULL terminated
	if	(al == 0)
		inc		esi
	end if
	ret

fSLITERAL_end:

; ---------------------------------------------------------------------------------------------------------
fX86:

		mov			ecx, [esi]
		add			esi, SIZE_DWORD
		jmp		ecx

fX86_end:

; ---------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------
fDEPTH:

	m_push var_Depth
	ret

fDEPTH_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
f22:

	ret

f22_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
f23:

	ret

f23_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
f24:

	ret

f24_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
f25:

	ret

f25_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fAND:

		m_pop		eax
		and			ebx, eax
		ret

fAND_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
f_OR:

		m_pop		eax
		or			ebx, eax
		ret

f_OR_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fXOR:

		m_pop		eax
		xor			ebx, eax
		ret

fXOR_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fEMIT:

		m_pop	eax
		mov		edx, hStdOut
		call	WriteChar
		ret

fEMIT_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fDICTP:

	add  esi, SIZE_DWORD
	ret

fDICTP_end:

; ---------------------------------------------------------------------------------------------------------
fTwoTimes:

			shl			ebx, 1
			ret

fTwoTimes_end:

; ---------------------------------------------------------------------------------------------------------
fTwoDiv:

			shr			ebx, 1
			ret

fTwoDiv_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fSPUSH:					; string push (append char) ( c addr -- )

	; push edi

	; call	fPop			; get string offset (relative to theMemory)
	; push	eax				; remember it
	; call	fPop			; get the byte from the dataStack
	; pop		edx				; 
	; vmToAbsolute edi, edx	; resolve string actual location
	; call stkPush_8			; append the byte

	; pop  edi
	ret

fSPUSH_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fSPOP:					; string pop (remove last char) ( addr -- c )

	; push	edi

	; call	fPop			; get string offset (relative to theMemory)
	; vmToAbsolute edi, eax	; resolve string actual location
	; call	stkPop_8		; get the character (decrements string length)
	; call	fPush			; put the char on the dataStack

	; pop		edi
	ret

fSPOP_end:

; ---------------------------------------------------------------------------------------------------------
fFOPEN	proc

		m_pop		eax
		m_pop		edx
		m_pop		ecx
		invoke		CreateFile, eax, GENERIC_READ or GENERIC_WRITE, \
						FILE_SHARE_READ or FILE_SHARE_WRITE, \
						NULL, 4, FILE_ATTRIBUTE_NORMAL, \
						NULL
		m_push		eax
		call GetLastError
	ret

fFOPEN_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fFCLOSE:

	m_pop		edx
	invoke CloseHandle, edx
	ret

fFCLOSE_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fFREAD:

	; ( addr count hFile -- numRead )
	; invoke ReadFile,hFile,pMemory,MEMSIZE-1,ADDR SizeReadWrite,NULL 
	push		ebx

	m_pop		eax
	m_pop		ecx
	m_pop		edx
	; mov			ebx, offset SizeReadWrite
	invoke ReadFile, eax, edx, ecx, offset SizeReadWrite, NULL 
	mov			eax, SizeReadWrite
	m_push		eax

	pop			ebx
	ret

fFREAD_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fFWRITE:

	; invoke WriteFile,hFile,pMemory,eax,ADDR SizeReadWrite,NULL
	ret

fFWRITE_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fFGETC:

	ret

fFGETC_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fOVER:

		m_pop		ebx
		m_getTOS	eax
		m_push		ebx
		m_push		eax
		ret

fOVER_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fSTRCMP:

	push		esi
	push		ecx
	push		ebx
	push		edi

	m_pop		esi
	m_pop		edi
	call		strCmpC
	m_push		eax

	pop			edi
	pop			ebx
	pop			ecx
	pop			esi
	
	ret

fSTRCMP_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fSTRCMPi:

	push		esi
	push		ecx
	push		ebx
	push		edi

	m_pop		esi
	m_pop		edi
	call		strCmpCi
	m_push		eax

	pop			edi
	pop			ebx
	pop			ecx
	pop			esi
	ret

fSTRCMPI_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
fBREAK:

	;mov	edx, offset var_dStack
	ret

fBREAK_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fBRANCHF:		; Branch forward relative

	mov		esi, [esi]
	ret

fBRANCHF_end:

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
fGOTO:		; Branch backward

	mov		esi, [esi]
	ret

fGOTO_end:

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 7 - Helpers
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Case sensitive counted string compare - string 1 in [EDI], string 2 in [ESI]
; First db is the count
; Returns edx = 0 if not the same
strCmpC: 

	xor  ecx, ecx
	mov  cl, [edi]			; max is 255 chars
	inc  ecx				; include the count byte
	; inc  ecx				; include the NULL terminator
L1:
	mov  dl, [esi]			; get a character from source
	cmp  dl, [edi]			; compare it to the target
	jne	 notEqual
	inc  esi				; move to next character
	inc  edi
	loop L1					; repeat for entire string
	mov  edx, 1
	ret

notEqual:
	xor  edx, edx
	ret

strCmpC_end:

; ---------------------------------------------------------------------------------------------------------
tolower:
	
			cmp		dl, 'A'
			jl		allDone
			cmp		dl, 'Z'
			jg		allDone
			add		dl, 32

allDone:	ret

tolower_end:

; ---------------------------------------------------------------------------------------------------------
; ** TESTED **
; Case insensitive counted string compare - string 1 in [EDI], string 2 in [ESI]
; First db is the count
; Returns EAX = 1 if the same, else EAX = 0
strCmpCi: 

			xor		eax, eax
			xor		ecx, ecx
			mov		cl, [edi]			; max is 255 chars
			inc		ecx					; include the count byte
			; inc  ecx					; We are NOT including the NULL terminator

L1:			mov		dl, [esi]			; get a character from source
			call	tolower
			mov		al, dl
			mov		dl, [edi]			; compare it to the target
			call	toLower
			cmp		al, dl
			jnz		notEqual
			inc		esi					; move to next characters
			inc		edi
			loop	L1					; repeat for entire string
			mov		eax, 1
			ret

notEqual:	xor  eax, eax
			ret

strCmpCi_end:

; ---------------------------------------------------------------------------------------------------------
; Copies counted strings - source string in [ESI], destination string in [EDI]
; First db is the count
strCpyC: 
	
	push ecx

	xor  ecx, ecx
	mov  cl, [esi]
	add ecx, 2				; include the count and trailing null
	cld						; make sure the direction flag is correct
	rep movsb

	pop ecx
	ret

strCpyC_end:

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 8 - Initialization
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
macro PutVector nOpcode, pProc
{
    	mov  edi, primVectors
		mov  esi, nOpcode
		mov  edx, pProc
		mov  [edi][esi*4], edx
}

; ---------------------------------------------------------------------------------------------------------
unkOpcode:

		mov		edx, msgBadOP
		jmp		doError

unkOpcode_end:

; ---------------------------------------------------------------------------------------------------------
bsVectors	proc

	xor		ecx, ecx
L1:
	PutVector ecx, unkOpcode
    inc     ecx
    cmp     ecx, 256
	jl      L1

	PutVector I_FETCH, fFETCH
	PutVector I_STORE, fSTORE
	PutVector I_LITERAL, fLITERAL
	PutVector I_DUP, fDUP
	PutVector I_SWAP, fSWAP
	PutVector I_DROP, fDrop
	PutVector I_PICK, fPICK
	PutVector I_ROT, fROT
	PutVector I_ONEPLUS, fONEPLUS
	PutVector I_PLUS, fPLUS
	PutVector I_MINUS, fMINUS
	PutVector I_MULT, fMULT
	PutVector I_DIV, f_SLMOD
	PutVector I_EQ, fEQ
	PutVector I_CALL, fCALL
	PutVector I_LT, fLT
	PutVector I_GT, fGT
	PutVector I_TO_R, fTO_R
	PutVector I_R_FROM, fR_FROM
	PutVector I_R_AT, fR_AT
	PutVector I_JMPZ, fJMPZ
	PutVector I_LOOKUP, fLOOKUP
	PutVector I_X86, fX86
	PutVector I_JMPNZ, fJMPNZ
	PutVector I_SLITERAL, fSLITERAL
	PutVector I_DEPTH, fDEPTH
	PutVector I_ONEMINUS, fONEMINUS
	PutVector I_AND, fAND
	PutVector I_OR, f_OR
	PutVector I_XOR, fXOR
	PutVector I_DIVMOD, f_DIVMOD
	PutVector I_EMIT, fEMIT
	PutVector I_DICTP, fDICTP
	PutVector I_TWOTIMES, fTwoTimes
	PutVector I_TWODIV, fTwoDiv
	PutVector I_FOPEN, fFOPEN
	PutVector I_FCLOSE, fFCLOSE
	PutVector I_FREAD, fFREAD
	PutVector I_FWRITE, fFWRITE
	PutVector I_FGETC, fFGETC
	PutVector I_FETCH_8, fFETCH_8
	PutVector I_STORE_8, fSTORE_8
	PutVector I_LITERAL_8, fLITERAL_8
	PutVector I_COMMA, fCOMMA
	PutVector I_COMMA_8, fCOMMA_8
	PutVector I_OVER, fOVER
	PutVector I_STRCMP, fSTRCMP
	PutVector I_STRCMPI, fSTRCMPI
	PutVector I_CREATE, fCreate
	PutVector I_WORD, fWord2
	PutVector I_BRANCHF, fBRANCHF
	PutVector I_GOTO, fGOTO
	PutVector I_EXECUTE, fEXECUTE
	PutVector I_DOT, fDOT

	; Opcodes 51 -> 97 are not used ... yet

	PutVector I_BREAK, fBREAK
	; PutVector I_RETURN, fRETURN

	ret

bsVectors	endp

; ---------------------------------------------------------------------------------------------------------
; ** NOT TESTED **
bootStrap:

	call bsVectors

	invoke GetStdHandle, STD_INPUT_HANDLE
	mov  hStdIn, eax

    invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov  hStdOut, eax

	if theMemory != 0
		mov			edx, cur_MEMSIZE
		INVOKE		VirtualFree, theMemory, edx, MEM_RELEASE
		mov			theMemory, 0
	end if

	mov		edx, req_MEMSIZE
	mov		cur_MEMSIZE, edx
	invoke			VirtualAlloc, 0, edx, MEM_COMMIT or MEM_RESERVE, PAGE_EXECUTE_READWRITE
	if eax = 0
		mov			edx, offset msgNoMem
		call		WriteString
		INVOKE	ReadConsole, hStdIn, edx, 10, ADDR bytesRead, 0
		INVOKE	ExitProcess,1
	end if
	mov				edi, eax
	mov				theMemory, edi

	; A little test to make sure we can execute code in the allocated memory
	mov				ecx, theMemory
	add				ecx, 4
	mov	byte ptr	[ecx], 0xBA
	mov	dw ptr	    [ecx+1], 0x11223344
	mov	byte ptr	[ecx+5], 00c3h
	call			ecx					; EDX should get 11223344h in it
	; End of the little test

	; Initialize (HERE), (LAST), (SOURCE)
	; HERE starts at the beginning.
	mov				var_HERE, eax

	; LAST starts at the end.
	add				eax, cur_MEMSIZE
	sub				eax, SIZE_DWORD
	mov				var_LAST, eax
	xor				edx, edx
	mov				[eax], edx

	mov				var_SOURCE, offset var_InpBuf

	; Allocate the stack
	invoke			VirtualAlloc, 0, dStackSize, MEM_COMMIT or MEM_RESERVE, PAGE_EXECUTE_READWRITE

	if eax = 0
		mov			edx, offset msgNoMem
		call		WriteString
		INVOKE	ReadConsole, hStdIn, edx, 10, ADDR bytesRead, 0
		invoke ExitProcess,0
	end if
	mov				dStack_MIN, eax
	add				eax, dStackSize
	mov				ebp, eax
	sub				eax, SIZE_DWORD
	mov				dStack_MAX, eax

	; Initialize the stacks
	xor				edi, edi
	mov				var_rStack, edi

	; load forth.bin
    ; TODO

	ret

bootStrap_end:

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 9 - Built in words
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 10 - The run time interpreter
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; This is used to execute one VM instruction.
; EDX = opcode, ESI = IP (aka PC)
executeOpcode:						

	mov		    ecx, primVectors[edx*4]
	jmp         ecx

executeOpcode_end:

; ---------------------------------------------------------------------------------------------------------
; This is the main execution loop for the interpreter.
; ESI = IP (aka PC)

runVM:	
    xor         edx, edx
	mov			dl, [esi]
	inc			esi
	cmp			dl, I_RETURN
	je			doRet

	mov		    ecx, primVectors[edx*4]
	call        ecx
	jmp			L1

doRet:
	if var_rDepth > 0
		dec var_rDepth
		m_rPop esi
		jmp  runVM
	end if

allDone:
	ret

runVM_end:

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 11 - The user interaction loop
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 12 - The main loop
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------

; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; Section 13 - Program entry point
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------
main:

	mov			edx, offset welcome		; string addr in edx
	call		WriteString

	mov			initialESPVal, esp
	call		bootStrap 
	jmp			runVM

main_end:
end main

; ---------------------------------------------------------------------------------------------------------
