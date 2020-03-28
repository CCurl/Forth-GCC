#include <stdio.h>
#include <memory.h>
#include <conio.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

static inline CELL GETTOS() { return *(DSP-1); }
static inline CELL GET2ND() { return *(DSP-2); }
static inline void SETTOS(CELL val) { *(DSP-1) = (val); }
static inline void SET2ND(CELL val) { *(DSP-2) = (val); }

void (*vm_prims[257])();

CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL PC;
extern CELL *rsp_init;
extern CELL *dsp_init;

extern bool isBYE;
extern BYTE *the_memory;
extern int __DEBUG__;
extern int _QUIT_HIT;

// The data stack starts at (MEM_SZ - STACKS_SZ) and grows upwards towards the return stack
void push(CELL val)
{
	// trace(" push(%ld, DSP=0x%08lx) ", val, DSP);
	if (RSP <= DSP)
	{
		printf(" stack overflow!");
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
		return;
	}
	*(DSP) = (CELL)(val);
	++DSP;
}

CELL pop() 
{
	if (DSP <= dsp_init)
	{
		printf(" stack underflow!");
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
		return 0;
	}
	DSP--;
	// trace(" pop(%ld, DSP=0x%08lx) ", *(DSP), DSP);
	return *(DSP);
}

// The return stack starts at (MEM_SZ) and grows downwards towards the data stack
void rpush(CELL val)
{
	if (RSP <= DSP)
	{
		printf(" return stack overflow!");
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
		return;
	}
	// trace(" rpush %ld ", val);
	--RSP;
	*(RSP) = (CELL)(val);
}

CELL rpop()
{
	if (RSP >= rsp_init)
	{
		printf(" return stack underflow! (at PC=0x%04lx)", PC-1);
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
		return PC;
	}
	CELL val = *(RSP);
	// trace(" rpop(%ld) ", val);
	RSP++;
	return val;
}

// LITERAL - Doeswhat
void prim_LITERAL()
{
	arg1 = GETAT(PC);
	trace("LITERAL (%d, 0x%04lx)\n", arg1, arg1);
	PC += CELL_SZ;
	push(arg1);
}

// FETCH - Doeswhat
void prim_FETCH()
{
    arg1 = GETTOS();
    arg2 = GETAT(arg1);
	trace("FETCH (from 0x%04lx - %04lx)\n", arg1, arg2);
    SETTOS(arg2);
}

// STORE - Doeswhat
void prim_STORE()
{
    arg2 = pop();
    arg1 = pop();
	trace("STORE (0x%04lx to 0x%04lx)\n", arg1, arg2);
    SETAT(arg2, arg1);
}

// SWAP - Doeswhat
void prim_SWAP()
{
    arg1 = GET2ND();
    arg2 = GETTOS();
	trace("SWAP (%ld and %ld)\n", arg1, arg2);
    SET2ND(arg2);
    SETTOS(arg1);
}

// DROP - Doeswhat
void prim_DROP()
{
	trace("DROP\n");
    arg1 = pop();
}

// DUP - Doeswhat
void prim_DUP()
{
	arg1 = GETTOS();
	trace("DUP (%ld)\n", arg1);
    push(arg1);
}

// SLITERAL - Doeswhat
void prim_SLITERAL()
{
	trace("SLITERAL\n");
	arg1 = PC; // addr
	arg2 = the_memory[PC]; // count-byte
	push(arg1);
	PC += (arg2 + 2); // +2 => count-byte and NULL-terminator
}

// JMP - Doeswhat
void prim_JMP()
{
	PC = GETAT(PC);
	trace("JMP (to %04lx)\n", PC);
}

// JMPZ - Doeswhat
void prim_JMPZ()
{
	arg1 = pop();
	arg2 = GETAT(PC);
	trace("JMPZ (to %04lx)\n", arg2);
	if (arg1 == 0)
		PC = arg2;
	else
		PC += CELL_SZ;
}

// JMPNZ - Doeswhat
void prim_JMPNZ()
{
	arg1 = pop();
	arg2 = GETAT(PC);
	trace("JMPNZ (to %04lx)\n", arg2);
	if (arg1 != 0)
		PC = arg2;
	else
		PC += CELL_SZ;
}

// CALL - Doeswhat
void prim_CALL()
{
	arg1 = GETAT(PC);
	trace("CALL %04lx\n", arg1);
	rpush(PC+CELL_SZ);
	PC = arg1;
}

// RET - Doeswhat
void prim_RET()
{
	// Empty return stack means done when embedded
	if ((RSP >= rsp_init) && (isEmbedded))
	{
		trace("RET embedded BYE\n");
		isBYE = true;
		PC = 0;
	}
	else
	{
		trace("RET\n");
		PC = rpop();
	}
}

// OR - Doeswhat
void prim_OR()
{
	arg1 = pop();
	arg2 = pop();
	trace("OR (%04x & %04x)\n", arg1, arg2);
	push(arg2 | arg1);
}

// CLITERAL - Doeswhat
void prim_CLITERAL()
{
	arg1 = the_memory[PC++];
	trace("CLITERAL (%ld)\n", arg1);
	push(arg1);
}

// CFETCH - Doeswhat
void prim_CFETCH()
{
	arg1 = GETTOS();
	arg2 = the_memory[arg1];
	trace("CFETCH (from 0x%04lx, %ld)\n", arg1, arg2);
	SETTOS(arg2);
}

// CSTORE - Doeswhat
void prim_CSTORE()
{
	arg1 = pop();
	arg2 = pop();
	trace("CSTORE (%ld to 0x%04lx)\n", arg2, arg1);
	the_memory[arg1] = (BYTE)arg2;
}

// ADD - Doeswhat
void prim_ADD()
{
	arg1 = pop();
	arg2 = pop();
	trace("ADD (%ld + %ld = %ld)\n", arg1, arg2, arg1+arg2);
	push(arg2 + arg1);
}

// SUB - Doeswhat
void prim_SUB()
{
	arg1 = pop();
	arg2 = pop();
	trace("SUB (%ld - %ld = %ld)\n", arg1, arg2, arg2-arg1);
	push(arg2 - arg1);
}

// MUL - Doeswhat
void prim_MUL()
{
	arg2 = pop();
	arg1 = pop();
	trace("SUB (%ld * %ld = %ld)\n", arg1, arg2, arg1*arg2);
	push(arg1 * arg2);
}

// DIV - Doeswhat
void prim_DIV()
{
	arg1 = pop();
	arg2 = pop();
	if (arg1 == 0)
	{
		printf("Divide by 0!");
		reset_vm();
	}
	else
	{
		trace("DIV\n");
		push(arg2 / arg1);
	}
}

// LT - Doeswhat
void prim_LT()
{
	trace("LT\n");
	arg1 = pop();
	arg2 = pop();
	push(arg2 < arg1 ? 1 : 0);
}

// EQ - Doeswhat
void prim_EQ()
{
	trace("EQ\n");
	arg1 = pop();
	arg2 = pop();
	push(arg2 == arg1 ? 1 : 0);
}

// GT - Doeswhat
void prim_GT()
{
	trace("GT\n");
	arg1 = pop();
	arg2 = pop();
	push(arg2 > arg1 ? 1 : 0);
}

// DICTP - Doeswhat
void prim_DICTP()
{
	arg1 = GETAT(PC);
	PC += CELL_SZ;
	trace("DICTP %04lx", arg1);
	trace(" ; %s\n", &(the_memory[arg1+10]));
}

// EMIT - Doeswhat
void prim_EMIT()
{
	arg1 = pop();
	putchar(arg1);
	trace("EMIT %02x\n", (int)arg1);
}

// OVER - Doeswhat
void prim_OVER()
{
    arg1 = GET2ND();
	trace("OVER (%ld)\n", arg1);
    push(arg1);
}

// COMPARE - Doeswhat
void prim_COMPARE()
{
	trace("COMPARE\n");
	arg2 = pop();
	arg1 = pop();
	{
		char *cp1 = (char *)&the_memory[arg1];
		char *cp2 = (char *)&the_memory[arg2];
		arg3 = strcmp(cp1, cp2) ? 0 : 1;
		push(arg3);
	}
}

// FOPEN:         // ( name mode type -- fp success )
void prim_FOPEN()
{
	arg3 = pop();   // type: 0 => text, 1 => binary
	arg2 = pop();   // mode: 0 => read, 1 => write
	arg1 = pop();   // name
	{
		char *fileName = (char *)&the_memory[arg1 + 1];
		char mode[4];
		sprintf(mode, "%c%c", (arg2 == 0) ? 'r' : 'w', (arg3 == 0) ? 't' : 'b');
		trace("FOPEN %s, %s\n", fileName, mode);
		FILE *fp = fopen(fileName, mode);
		arg1 = (CELL) fp;
		push(arg1);
		push(fp != NULL ? 1 : 0);
	}
}

// FREAD:			// ( addr num fp -- count ) - fp == 0 means STDIN
void prim_FREAD()
{
	trace("FREAD\n");
	arg3 = pop();
	arg2 = pop();
	arg1 = pop();
	{
		BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
		int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
		push(num);
	}
}

// FREADLINE:			// ( addr max-sz fp -- num-read )
void prim_FREADLINE()
{
	trace("FREADLINE ");
	arg3 = pop();		// FP - 0 means STDIN
	arg2 = pop();		// max-sz
	arg1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
	{
		char *tgt = (char *)&the_memory[arg1];
		FILE *fp = arg3 ? (FILE *)arg3 : stdin;
		char *pBuf = tgt;
		if (fgets((pBuf+1), arg2, fp) != (pBuf+1))
		{
			trace("<EOF>\n");
			*(pBuf) = 0;
			*(pBuf+1) = (char)0;
			push(0);
			return;
		}
		arg2 = (CELL)strlen(pBuf+1);
		// Strip off the trailing newline if there
		if ((arg2 > 0) && (pBuf[arg2] == '\n'))
		{
			pBuf[arg2--] = (char)NULL;
		}
		*(pBuf) = (char)(arg2);
		push((arg2 > 0) ? arg2 : 1);
		trace("%d: [%s]\n", (int)pBuf[0], pBuf+1);
	}
}

// FWRITE - Doeswhat
void prim_FWRITE()
{
	arg3 = pop();
	arg2 = pop();
	arg1 = pop();
	{
		BYTE *pBuf = (BYTE *)&the_memory[arg1];
		int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
		push(num);
	}
	trace("FWRITE\n");
}

// FCLOSE - Doeswhat
void prim_FCLOSE()
{
	trace("FCLOSE\n");
	arg1 = pop();
	if (arg1 != 0)
		fclose((FILE *)arg1);
}

// DTOR - Doeswhat
void prim_DTOR()
{
	arg1 = pop();
	trace("DTOR (%d)\n", arg1);
	rpush(arg1);
}

// RTOD - Doeswhat
void prim_RTOD()
{
	trace("RTOD\n");
	arg1 = rpop();
	push(arg1);
}

// LOGLEVEL - Doeswhat
void prim_LOGLEVEL()
{
	arg1 = pop();
	__DEBUG__ = arg1;
	printf("LOGLEVEL (set to %d)", arg1);
}

// AND - Doeswhat
void prim_AND()
{
		arg1 = pop();
		arg2 = pop();
		trace("AND (%04x & %04x)\n", arg1, arg2);
		push(arg2 & arg1);
}

// PICK - Doeswhat
void prim_PICK()
{
	arg1 = pop() + 1;
	arg2 = *(DSP - arg1);
	push(arg2);
	trace("PICK\n");
}

// DEPTH - Doeswhat
void prim_DEPTH()
{
	arg1 = DSP - dsp_init;
	trace("DEPTH (%ld)\n", arg1);
	push(arg1);
}

// GETCH - Doeswhat
void prim_GETCH()
{
	arg1 = getch();
	push(arg1);
}

// COMPAREI - Doeswhat
void prim_COMPAREI()
{
	trace("COMPAREI\n");
	arg2 = pop();
	arg1 = pop();
	{
		char *cp1 = (char *)&the_memory[arg1];
		char *cp2 = (char *)&the_memory[arg2];
		arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
		push(arg3);
	}
}

// User stacks look like this:
// [SP][last-valid-SP][data]
void prim_USINIT()
{
	arg1 = pop();		// User Stack start address
	arg2 = pop();		// size
	trace("USTACKINIT stack [0x%04lx], size=%ld\n", arg1, arg2);
	CELL firstOK = arg1 + (2*CELL_SZ);
	CELL lastOK = firstOK + ((arg2-1)*CELL_SZ);
	SETAT(arg1, firstOK);
	SETAT(arg1 + CELL_SZ, lastOK);
	push(lastOK + CELL_SZ);
}

void prim_USPUSH()
{
	arg1 = pop();		// User Stack start address
	arg2 = pop();		// Val
	trace("UPUSH %d to stack [0x%04lx]\n", arg2, arg1);
	CELL sp = GETAT(arg1);
	CELL firstOK = arg1 + (2 * CELL_SZ);
	CELL lastOK = GETAT(arg1 + CELL_SZ);
	if (sp <= lastOK)
	{
		SETAT(sp, arg2);
		sp = sp + CELL_SZ;
		SETAT(arg1, sp);
	}
	else
	{
		printf(" user stack [0x%04lx] overflow. (SP=0x%04lx, range=%04lx:%04lx)", arg1, sp, firstOK, lastOK);
		reset_vm();
	}
}

void prim_USPOP()
{
	arg1 = pop();		// User Stack start address
	CELL sp = GETAT(arg1);
	CELL firstOK = arg1 + (2 * CELL_SZ);
	CELL lastOK = GETAT(arg1 + CELL_SZ);
	trace("UPOP from stack [0x%04lx]\n", arg1);
	if (firstOK < sp)
	{
		sp = sp - CELL_SZ;
		arg2 = GETAT(sp);
		SETAT(arg1, sp);
		push(arg2);
	}
	else
	{
		printf(" user stack [0x%04lx] underflow. (SP=0x%04lx, range=%04lx:%04lx)", arg1, sp, firstOK, lastOK);
		reset_vm();
	}
}

// BREAK - Doeswhat
void prim_BREAK()
{
	// code goes here
}

// RESET - Doeswhat
void prim_RESET()
{
	// code goes here
}

// BYE - Doeswhat
void prim_BYE()
{
	isBYE = true;
}

void init_vm_vectors()
{
    memset(vm_prims, 0, sizeof(vm_prims));
    // vm_prims[0] = prim_BYE;
	vm_prims[1] = prim_LITERAL;
	vm_prims[2] = prim_FETCH;
	vm_prims[3] = prim_STORE;
	vm_prims[4] = prim_SWAP;
	vm_prims[5] = prim_DROP;
	vm_prims[6] = prim_DUP;
	vm_prims[7] = prim_SLITERAL;
	vm_prims[8] = prim_JMP;
	vm_prims[9] = prim_JMPZ;
	vm_prims[10] = prim_JMPNZ;
	vm_prims[11] = prim_CALL;
	vm_prims[12] = prim_RET;
	vm_prims[13] = prim_OR;
	vm_prims[14] = prim_CLITERAL;
	vm_prims[15] = prim_CFETCH;
	vm_prims[16] = prim_CSTORE;
	vm_prims[17] = prim_ADD;
	vm_prims[18] = prim_SUB;
	vm_prims[19] = prim_MUL;
	vm_prims[20] = prim_DIV;
	vm_prims[21] = prim_LT;
	vm_prims[22] = prim_EQ;
	vm_prims[23] = prim_GT;
	vm_prims[24] = prim_DICTP;
	vm_prims[25] = prim_EMIT;
	vm_prims[26] = prim_OVER;
	vm_prims[27] = prim_COMPARE;
	vm_prims[28] = prim_FOPEN;
	vm_prims[29] = prim_FREAD;
	vm_prims[30] = prim_FREADLINE;
	vm_prims[31] = prim_FWRITE;
	vm_prims[32] = prim_FCLOSE;
	vm_prims[33] = prim_DTOR;
	vm_prims[34] = prim_RTOD;
	vm_prims[35] = prim_LOGLEVEL;
	vm_prims[36] = prim_AND;
	vm_prims[37] = prim_PICK;
	vm_prims[38] = prim_DEPTH;
	vm_prims[39] = prim_GETCH;
	vm_prims[40] = prim_COMPAREI;
	vm_prims[41] = prim_USINIT;
	vm_prims[42] = prim_USPUSH;
	vm_prims[43] = prim_USPOP;
	// vm_prims[253] = prim_BREAK;
	// vm_prims[254] = prim_RESET;
	// vm_prims[255] = prim_BYE;
}