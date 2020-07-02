#include <winbase.h>
#include <stdio.h>
#include <memory.h>
#include <conio.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

CELL dStack[128];
CELL rStack[128];

static inline CELL GETTOS() { return TOS; }
static inline CELL GET2ND() { return *(DSP); }
static inline void SETTOS(CELL val) { TOS = (val); }
static inline void SET2ND(CELL val) { *(DSP) = (val); }

void (*vm_prims[257])();

CELL arg1, arg2, arg3;

extern CELL *RSP, rdepth;		// the return stack pointer
extern CELL *DSP, depth;  		// the data stack pointer
extern CELL TOS; 				// the top of stack
extern CELL PC;					// The program counter
extern CELL *rsp_init;
extern CELL *dsp_init;

extern bool isBYE;
extern BYTE *the_memory;
extern int __DEBUG__;
extern int _QUIT_HIT;

// A stack looks like this: [sp][top-addr][data]
void stk_push(CELL stack, CELL val)
{
	CELL sp = GETAT(stack);
	CELL top = GETAT(stack+CELL_SZ);
	if ( sp > top )
	{
		printf("Stack full.");
		reset_vm();
		return;
	}

	SETAT(sp, val);
	sp += CELL_SZ;
	SETAT(stack, sp);
}

// A stack looks like this: [sp][top-addr][data]
CELL stk_pop(CELL stack)
{
	CELL sp = GETAT(stack);
	CELL bottom = stack+(CELL_SZ*2);
	sp -= CELL_SZ;
	if ( sp < bottom )
	{
		SETAT(stack, bottom);
		printf("Stack empty.");
		reset_vm();
		return 0;
	}

	SETAT(stack, sp);
	return GETAT(sp);
}

// The data stack starts at (MEM_SZ - STACKS_SZ) and grows upwards towards the return stack
void overflow()
{
		printf(" stack overflow! (at 0x%04lx)", PC-1);
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
}

void underflow()
{
		printf(" stack underflow!");
		reset_vm();
		// _QUIT_HIT = 1;
		// isBYE = 1;
}

void push(CELL val)
{
	// trace(" push(%ld, DSP=0x%08lx) ", val, DSP);
	if (depth < 64)
	{
		++depth;
		*(++DSP) = TOS;
		TOS = val;
		return;
	}
	overflow();
}

CELL pop()
{
	if (depth > 0)
	{
		CELL ret = TOS;
		--depth;
		TOS = *(DSP--);
		return ret;
	}
	underflow();
	return 0;
}

void drop()
{
	if (depth > 0)
	{
		--depth;
		TOS = *(DSP--);
	}
	else
	{
		underflow();
	}
}

// The return stack starts at (MEM_SZ) and grows downwards towards the data stack
void rpush(CELL val)
{
	if (rdepth  < 64)
	{
		++rdepth;
		*(--RSP) = (CELL)(val);
		return;
	}

	printf(" return stack overflow!");
	reset_vm();
	// _QUIT_HIT = 1;
	// isBYE = 1;
}

CELL rpop()
{
	if (rdepth > 0)
	{
		--rdepth;
		return *(RSP++);
	}
	printf(" return stack underflow! (at PC=0x%04lx)", PC-1);
	reset_vm();
	// _QUIT_HIT = 1;
	// isBYE = 1;
	return PC;
}

// LITERAL - Doeswhat
void prim_LITERAL()
{
	arg1 = GETAT(PC);
	// trace("LITERAL (%d, 0x%04lx)\n", arg1, arg1);
	PC += CELL_SZ;
	push(arg1);
}

// FETCH - Doeswhat
void prim_FETCH()
{
	// printf("FETCH (from 0x%04lx - %04lx)\n", TOS, GETAT(TOS));
    TOS = GETAT(TOS);
}

// STORE - Doeswhat
void prim_STORE()
{
    arg2 = pop();
    arg1 = pop();
	// printf("STORE (0x%04lx to 0x%04lx)\n", arg1, arg2);
    SETAT(arg2, arg1);
}

// SWAP - Doeswhat
void prim_SWAP()
{
	if (depth < 1)
	{
		underflow();
		return;
	}
    arg1 = GET2ND();
    arg2 = GETTOS();
	// trace("SWAP (%ld and %ld)\n", arg1, arg2);
    SET2ND(arg2);
    SETTOS(arg1);
}

// DROP - Doeswhat
void prim_DROP()
{
	//trace("DROP\n");
	if (depth)
	{
    	drop();
	}
	else
	{
		underflow();
	}
}

// DUP - Doeswhat
void prim_DUP()
{
	//trace("DUP (%ld)\n", arg1);
	if (depth)
	{
    	push(TOS);
	}
	else
	{
		underflow();
	}
}

// SLITERAL - Doeswhat
void prim_SLITERAL()
{
	// trace("SLITERAL\n");
	arg2 = the_memory[PC]; // count-byte
	push(PC);
	PC += (arg2 + 2); // +2 => count-byte and NULL-terminator
}

// JMP - Doeswhat
void prim_JMP()
{
	PC = GETAT(PC);
	// trace("JMP (to %04lx)\n", PC);
}

// JMPZ - Doeswhat
void prim_JMPZ()
{
	if (TOS == 0)
	{
		PC = GETAT(PC);
	}
	else
	{
		PC += CELL_SZ;
	}
	drop();
}

// JMPNZ - Doeswhat
void prim_JMPNZ()
{
	if (TOS != 0)
	{
		PC = GETAT(PC);
	}
	else
	{
		PC += CELL_SZ;
	}
	drop();
}

// CALL - Doeswhat
void prim_CALL()
{
	rpush(PC+CELL_SZ);
	PC = GETAT(PC);
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
	trace("OR (%04x & %04x)\n", arg1, arg2);
	TOS = (TOS | arg1);
}

// CLITERAL - Doeswhat
void prim_CLITERAL()
{
	arg1 = the_memory[PC++];
	// trace("CLITERAL (%ld)\n", arg1);
	push(arg1);
}

// CFETCH - Doeswhat
void prim_CFETCH()
{
	TOS = the_memory[TOS];
}

// CSTORE - Doeswhat
void prim_CSTORE()
{
	arg1 = pop();
	arg2 = pop();
	// printf("CSTORE (%ld to 0x%04lx)\n", arg2, arg1);
	the_memory[arg1] = (BYTE)arg2;
}

// ADD - Doeswhat
void prim_ADD()
{
	arg1 = pop();
	TOS += arg1;
}

// SUB - Doeswhat
void prim_SUB()
{
	arg1 = pop();
	TOS -= arg1;
}

// MUL - Doeswhat
void prim_MUL()
{
	arg1 = pop();
	TOS *= arg1;
}

// DIV - Doeswhat
void prim_DIV()
{
	if (TOS == 0)
	{
		printf("Divide by 0!");
		reset_vm();
	}
	else
	{
		arg1 = pop();
		TOS /= arg1;
	}
}

// LT - Doeswhat
void prim_LT()
{
	// trace("LT\n");
	arg1 = pop();
	TOS = (TOS < arg1) ? 1 : 0;
}

// EQ - Doeswhat
void prim_EQ()
{
	// trace("EQ\n");
	arg1 = pop();
	TOS = (TOS == arg1) ? 1 : 0;
}

// GT - Doeswhat
void prim_GT()
{
	// trace("GT\n");
	arg1 = pop();
	TOS = (TOS > arg1) ? 1 : 0;
}

// DICTP - Doeswhat
void prim_DICTP()
{
	arg1 = GETAT(PC);
	PC += CELL_SZ;
	//trace("DICTP %04lx", arg1);
	//trace(" ; %s\n", &(the_memory[arg1+10]));
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
    // arg1 = GET2ND();
	// trace("OVER (%ld)\n", arg1);
    push(GET2ND());
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
	rpush(pop());
}

// RTOD - Doeswhat
void prim_RTOD()
{
	push(rpop());
}

// RFETCH - "peeks" the top of the return stack
void prim_RFETCH()
{
	if (rdepth > 0)
	{
		push(*RSP);
		return;
	}
	printf(" the return stack is empty! (at PC=0x%04lx)", PC-1);
	reset_vm();
}



// LOGLEVEL - Doeswhat
void prim_LOGLEVEL()
{
	arg1 = pop();
	__DEBUG__ = arg1;
	// printf("LOGLEVEL (set to %d)", arg1);
}

// AND - Doeswhat
void prim_AND()
{
		arg1 = pop();
		TOS = (TOS & arg1);
}

// PICK - Doeswhat
void prim_PICK()
{
	arg1 = TOS;
	TOS = *(DSP - (arg1));
	trace("PICK\n");
}

// DEPTH - Doeswhat
void prim_DEPTH()
{
	//trace("DEPTH (%ld)\n", depth);
	push(depth);
}

// GETCH - Doeswhat
void prim_GETCH()
{
	push(getch());
}

// COMPAREI - Doeswhat
void prim_COMPAREI()
{
	//trace("COMPAREI\n");
	arg2 = pop();
	arg1 = pop();
	{
		char *cp1 = (char *)&the_memory[arg1];
		char *cp2 = (char *)&the_memory[arg2];
		arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
		push(arg3);
	}
}

// SLASHMOD ( n1 n2 -- r q ) - q = n2/n1, r = n1 mod n2
void prim_SLASHMOD()
{
	arg1 = GET2ND();
	arg2 = GETTOS();
	SET2ND(arg1%arg2);		// remainder
	SETTOS(arg1/arg2);		// quotient
}

// NOT - Does NOTHING
void prim_NOT()
{
	TOS = TOS == 0 ? -1 : 0;
}

void prim_USPOP()
{
	arg1 = pop();		// User Stack start address
	CELL sp = GETAT(arg1);
	CELL firstOK = arg1 + (2 * CELL_SZ);
	CELL lastOK = GETAT(arg1 + CELL_SZ);
	// trace("USPOP from stack [0x%04lx]\n", arg1);
	arg2 = stk_pop(arg1);
	push(arg2);
}

// INC - Doeswhat
void prim_INC()
{
	++TOS;
}

// RDEPTH - Doeswhat
void prim_RDEPTH()
{
	push(rdepth);
}

// INC - Doeswhat
void prim_DEC()
{
	--TOS;
}

// GETTICK - Doeswhat
void prim_GETTICK()
{
	arg1 = GetTickCount();
	push(arg1);
}

// SHIFTLEFT - Shifts TOS left <x> bits
void prim_SHIFTLEFT()
{
	arg1 = pop();
	TOS = TOS << (arg1 & 0x1F);
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_SHIFTRIGHT()
{
	arg1 = pop();
	TOS = TOS >> (arg1 & 0x1F);
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_DBGDOT()
{
	arg1 = pop();
	printf("[%d] ", arg1);
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_DBGDOTS()
{
	printf("(%d)[", depth);
	for (int i = 0; i < depth; i++)
	{
		printf("(%d)",i);
		push(i);
		prim_PICK();
		prim_DBGDOT();
	}
	printf("]");
}

// NOP - Does NOTHING
void prim_NOP()
{
	// code goes here
}

// BREAK - Doeswhat
void prim_BREAK()
{
	// code goes here
}

// RESET - Doeswhat
void prim_RESET()
{
	reset_vm();
}

// BYE - Doeswhat
void prim_BYE()
{
	isBYE = true;
}

// Unknown - Doeswhat
void prim_Unknown()
{
    printf("Unknown instruction at addr: 0x%04lx, (0x%02x)", PC-1, IR);
    reset_vm();
	// isBYE = true;
}

void init_vm_vectors()
{
    memset(vm_prims, 0, sizeof(vm_prims));
    for (int i = 0; i < 256; i++)
    {
        vm_prims[i] = prim_Unknown;
    }
	vm_prims[ 1] = prim_LITERAL;
	vm_prims[ 2] = prim_FETCH;
	vm_prims[ 3] = prim_STORE;
	vm_prims[ 4] = prim_SWAP;
	vm_prims[ 5] = prim_DROP;
	vm_prims[ 6] = prim_DUP;
	vm_prims[ 7] = prim_SLITERAL;
	vm_prims[ 8] = prim_JMP;
	vm_prims[ 9] = prim_JMPZ;
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
	vm_prims[41] = prim_SLASHMOD;
	vm_prims[42] = prim_NOT;
	vm_prims[43] = prim_RFETCH;
	vm_prims[44] = prim_INC;
	vm_prims[45] = prim_RDEPTH;
	vm_prims[46] = prim_DEC;
	vm_prims[47] = prim_GETTICK;
	vm_prims[48] = prim_SHIFTLEFT;
	vm_prims[49] = prim_SHIFTRIGHT;
	//vm_prims[100] = prim_DBGDOT;
	//vm_prims[101] = prim_DBGDOTS;
	vm_prims[252] = prim_NOP;
	vm_prims[253] = prim_BREAK;
 	vm_prims[254] = prim_RESET;
	vm_prims[255] = prim_BYE;
}
