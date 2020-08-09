#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "forth-vm.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------
BYTE *the_memory;
long memory_size = 0;

CELL PC = 0;		// The "program counter"
BYTE IR = 0;		// The "instruction register"

CELL *RSP = NULL, rdepth = 0;	// the return stack
CELL *DSP = NULL, depth = 0;	// the data stack
CELL TOS = 0;					// The top element on the stack

CELL *dsp_init = NULL;
CELL *rsp_init = NULL;

bool isEmbedded = false;
bool isBYE = false;

int _QUIT_HIT = 0;
int MEM_SZ = 0;

CELL dStack[256];
CELL rStack[256];

static inline CELL GETTOS() { return TOS; }
static inline CELL GET2ND() { return *(DSP); }
static inline void SETTOS(CELL val) { TOS = (val); }
static inline void SET2ND(CELL val) { *(DSP) = (val); }

void init_vm_vectors();
extern void (*vm_prims[])();

// ------------------------------------------------------------------------------------------
void create_vm()
{
	if (the_memory != (BYTE*) NULL)
		free(the_memory);

	the_memory = malloc(memory_size);
	memset(the_memory, 0, memory_size);
}

// ------------------------------------------------------------------------------------------
void destroy_vm()
{
	if (the_memory)
	{
		free(the_memory);
		the_memory = (BYTE*) NULL;
	}
}

// ------------------------------------------------------------------------------------------
void reset_vm()
{
	//dsp_init = (CELL *)&the_memory[memory_size - STACKS_SZ];
	//rsp_init = (CELL *)&the_memory[memory_size - CELL_SZ];
	dsp_init = dStack;
	rsp_init = rStack;
	RSP = rsp_init;
	DSP = dsp_init;
	PC = 0;
	depth = 0;
	rdepth = 0;
}

// ------------------------------------------------------------------------------------------
void init_vm(int vm_size)
{
	memory_size = vm_size > 0 ? vm_size : MEM_SZ;

	init_vm_vectors();
	create_vm();
	reset_vm();
	SETAT(ADDR_MEM_SZ, memory_size);
}

// ------------------------------------------------------------------------------------------
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

// ------------------------------------------------------------------------------------------
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

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL cpu_loop()
{
	isBYE = false;
	debug("Running (PC=%04lx) ... ", PC);
	while (true)
	{
        // trace("PC=%04lx, IR=%d - ", PC, (int)the_memory[PC]);
        IR = the_memory[PC++];
        vm_prims[IR]();

		if (isBYE)
		{
			debug("done. PC=%04lx\n", PC);
			return 1;
		}
	}
	return 0;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL run(CELL start)
{
	CELL xPC = start;
	BYTE xIR;
	int call_depth = 1;

	isBYE = false;
	debug("Running (PC=%04lx) ... ", PC);
	while (true)
	{
		xIR = the_memory[xPC++];
		switch (xIR)
		{
		case NOP:
			break;
		
		case LITERAL:
			arg1 = GETAT(xPC);
			xPC += CELL_SZ;
			break;
		
		case CLITERAL:
			arg1 = GETAT(xPC);
			xPC += 1;
			break;
		
		case DUP:
			push(TOS);
			break;
		
		case SWAP:
			arg1 = GET2ND();
			SET2ND(TOS);
			TOS = arg1;
			break;
		
		case DROP:
			pop();
			break;
		
		case OVER:
			arg1 = GET2ND();
			push(arg1);
			break;
		
		case FETCH:
			TOS = GETAT(TOS);
			break;
		
		case CFETCH:
			TOS = the_memory[TOS];
			break;
		
		case STORE:
			arg2 = pop();
			arg1 = pop();
			// printf("STORE (0x%04lx to 0x%04lx)\n", arg1, arg2);
			SETAT(arg2, arg1);
			break;
		
		case CSTORE:
			arg2 = pop();
			arg1 = pop();
			// printf("STORE (0x%04lx to 0x%04lx)\n", arg1, arg2);
			the_memory[arg2] = (BYTE)arg1;
			break;
		
		case LT:
			arg1 = pop();
			TOS = (TOS < arg1) ? 0 : -1 ;
			break;
		
		case EQ:
			arg1 = pop();
			TOS = (TOS == arg1) ? 0 : -1 ;
			break;
		
		case GT:
			arg1 = pop();
			TOS = (TOS > arg1) ? 0 : -1 ;
			break;
		
		case JMP:
			xPC = GETAT(xPC);
			break;
		
		case JMPNZ:
			arg1 = pop();
			if (arg1)
				xPC = GETAT(xPC);
			else
				xPC += CELL_SZ;
			break;
		
		case JMPZ:
			arg1 = pop();
			if (arg1)
				xPC += CELL_SZ;
			else
				xPC = GETAT(xPC);
			break;
		
		case CALL:
			rpush(xPC+CELL_SZ);
			xPC = GETAT(xPC);
			++call_depth;
			break;
		
		case RET:
			if (--call_depth < 1)		
				return;
			xPC = rpop();
			break;
		
		case AND:
			arg1 = pop();
			TOS &= arg1;
			break;
		
		case OR:
			arg1 = pop();
			TOS |= arg1;
			break;
		
		case ADD:
			arg1 = pop();
			TOS += arg1;
			break;
		
		case SUB:
			arg1 = pop();
			TOS -= arg1;
			break;
		
		case MUL:
			arg1 = pop();
			TOS *= arg1;
			break;
		
		case DIV:
			arg1 = pop();
			TOS /= arg1;
			return;
		
		case BYE:
			return;
		
		default:
			break;
		}
        // trace("PC=%04lx, IR=%d - ", PC, (int)the_memory[PC]);
        IR = the_memory[PC++];
        vm_prims[IR]();

		if (isBYE)
		{
			debug("done. PC=%04lx\n", PC);
			return 1;
		}
	}
	return 0;
}
