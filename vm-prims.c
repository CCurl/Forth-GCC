#include <winbase.h>
#include <stdio.h>
#include <memory.h>
#include <conio.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

extern CELL dStack[];
extern CELL rStack[];

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

// SLITERAL - Doeswhat
void prim_SLITERAL()
{
	// trace("SLITERAL\n");
	arg2 = the_memory[PC]; // count-byte
	push(PC);
	PC += (arg2 + 2); // +2 => count-byte and NULL-terminator
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

// PLUSSTORE - !+
void prim_PLUSSTORE()
{
	arg2 = pop();
	arg1 = pop();
	arg3 = GETAT(arg2);
	arg3 += arg1;
	SETAT(arg2, arg3);
}

void prim_OPENBLOCK()
{
	char fn[64];
	arg1 = pop();
	sprintf(fn, "block-%04d.fs", arg1);
	FILE *fp = fopen(fn, "rt");
	push((CELL)fp);
	push(TOS ? -1 : 0);
}

void prim_BRANCHF()
{
	arg1 = the_memory[PC];
	PC += arg1;
}

void prim_BRANCHFZ()
{
	arg1 = pop();
	if (arg1 == 0)
	{
		arg1 = the_memory[PC];
		PC += arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHFNZ()
{
	arg1 = pop();
	if (arg1 != 0)
	{
		arg1 = the_memory[PC];
		PC += arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHB()
{
	arg1 = the_memory[PC];
	PC -= arg1;
}

void prim_BRANCHBZ()
{
	arg1 = pop();
	if (arg1 == 0)
	{
		arg1 = the_memory[PC];
		PC -= arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHBNZ()
{
	arg1 = pop();
	if (arg1 != 0)
	{
		arg1 = the_memory[PC];
		PC -= arg1;
	}
	else
	{
		PC++;
	}
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

// RESET - Doeswhat
void prim_RESET()
{
	reset_vm();
}
