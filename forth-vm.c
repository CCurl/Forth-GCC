#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include "forth-vm.h"

// ------------------------------------------------------------------------------------------
// The VM
CELL PC = 0;		// The "program counter"
BYTE IR = 0;		// The "instruction register"

CELL *dsp_init = NULL;
CELL *rsp_init = NULL;
CELL arg1, arg2, arg3;

CELL *RSP = NULL; // the return stack pointer
CELL *DSP = NULL; // the data stack pointer

bool isEmbedded = false;
bool isBYE = false;
BYTE *the_memory;
long memory_size = 0;

int _QUIT_HIT = 0;

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
	dsp_init = (CELL *)&the_memory[memory_size - STACKS_SZ];
	rsp_init = (CELL *)&the_memory[memory_size - CELL_SZ];
	RSP = rsp_init;
	DSP = dsp_init;
	PC = 0;
}

// ------------------------------------------------------------------------------------------
void init_vm(int vm_size)
{
	memory_size = vm_size > 0 ? vm_size : MEM_SZ;

	init_vm_vectors();
	create_vm();
	reset_vm();
}

// The data stack starts at (MEM_SZ - STACKS_SZ) and grows upwards towards the return stack
void push(CELL val)
{
	trace(" push(%ld, DSP=0x%08lx)\n", val, DSP);
	if (RSP <= DSP)
	{
		printf(" stack overflow!");
		reset_vm();
		_QUIT_HIT = 1;
		isBYE = 1;
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
		_QUIT_HIT = 1;
		isBYE = 1;
		return 0;
	}
	DSP--;
	trace(" pop(%ld, DSP=0x%08lx)\n", *(DSP), DSP);
	return *(DSP);
}

// The return stack starts at (MEM_SZ) and grows downwards towards the data stack
void rpush(CELL val)
{
	if (RSP <= DSP)
	{
		printf(" return stack overflow!");
		reset_vm();
		_QUIT_HIT = 1;
		isBYE = 1;
		return;
	}
	trace(" rpushing %ld", val);
	--RSP;
	*(RSP) = (CELL)(val);
}

CELL rpop()
{
	if (RSP >= rsp_init)
	{
		printf(" return stack underflow! (at PC=0x%04lx)", PC-1);
		reset_vm();
		_QUIT_HIT = 1;
		isBYE = 1;
		return PC;
	}
	CELL val = *(RSP);
	trace(" rpop(%ld)", val);
	RSP++;
	return val;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL cpu_step()
{
	IR = the_memory[PC++];
	trace("PC=%04lx, IR=%d - ", PC-1, (int)IR);
	void (*f)() = vm_prims[IR];
	if (f)
	{
		f();
		return 0;
	}

	switch (IR)
	{
	case PICK:
		arg1 = pop() + 1;
		arg2 = *(DSP - arg1);
		push(arg2);
		trace("PICK\n");
		return 0;

	case RET:
		trace("RET\n");
		// Empty return stack means done when embedded
		if ((RSP >= rsp_init) && (isEmbedded))
		{
			trace(" embedded BYE");
			isBYE = true;
			PC = 0;
		}
		else
		{
			PC = rpop();
		}
		return 0;

	case COMPARE:
		trace("COMPARE\n");
		arg2 = pop();
		arg1 = pop();
		{
			char *cp1 = (char *)&the_memory[arg1];
			char *cp2 = (char *)&the_memory[arg2];
			arg3 = strcmp(cp1, cp2) ? 0 : 1;
			push(arg3);
		}
		return 0;

	case COMPAREI:
		trace("COMPAREI\n");
		arg2 = pop();
		arg1 = pop();
		{
			char *cp1 = (char *)&the_memory[arg1];
			char *cp2 = (char *)&the_memory[arg2];
			arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
			push(arg3);
		}
		return 0;

	case SLITERAL:
		trace("SLITERAL\n");
		arg1 = PC; // addr
		arg2 = the_memory[PC]; // count byte
		push(arg1);
		PC += (arg2 + 2); // +2: count byte, NULL terminator
		return PC-arg1;

	case SUB:
		arg1 = pop();
		arg2 = pop();
		push(arg2 - arg1);
		trace("SUB %ld + %ld = %ld\n", arg2, arg1, arg2-arg1);
		return 0;

	case MUL:
		trace("MUL\n");
		arg1 = pop();
		arg2 = pop();
		push(arg2 * arg1);
		return 0;

	case DIV:
		trace("DIV\n");
		arg1 = pop();
		arg2 = pop();
		if (arg1 == 0)
		{
			printf("Divide by 0!");
			reset_vm();
		}
		else
		{
			push(arg2 / arg1);
		}
		return 0;

	case LT:
		trace("LT\n");
		arg1 = pop();
		arg2 = pop();
		push(arg2 < arg1 ? 1 : 0);
		return 0;

	case EQ:
		trace("EQ\n");
		arg1 = pop();
		arg2 = pop();
		push(arg2 == arg1 ? 1 : 0);
		return 0;

	case GT:
		trace("GT\n");
		arg1 = pop();
		arg2 = pop();
		push(arg2 > arg1 ? 1 : 0);
		return 0;

	case ZTYPE:
		arg1 = pop();		// addr
		{
			char *cp = (char *)&the_memory[arg1];
			printf("%s", cp);
		}
		trace("ZTYPE\n");
		return 0;

	case FOPEN:         // ( name mode type -- fp success )
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
		return 0;

	case FREAD:			// ( addr num fp -- count ) - fp == 0 means STDIN
		trace("FREAD\n");
		arg3 = pop();
		arg2 = pop();
		arg1 = pop();
		{
			BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
			int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
			push(num);
		}
		return 0;

	case FREADLINE:			// ( addr max-sz fp -- num-read )
		trace("(FREADLINE)");
		arg3 = pop();		// FP - 0 means STDIN
		arg2 = pop();		// max-sz
		arg1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
		{
			char *tgt = (char *)&the_memory[arg1];
			FILE *fp = arg3 ? (FILE *)arg3 : stdin;
			char *pBuf = tgt;
			if (fgets((pBuf+1), arg2, fp) != (pBuf+1))
			{
				trace("<EOF>");
				*(pBuf) = 0;
				*(pBuf+1) = (char)0;
				push(0);
				return 0; // ZERO means <EOF>
			}
			arg2 = (CELL)strlen(pBuf+1);
			// Strip off the trailing newline if there
			if ((arg2 > 0) && (pBuf[arg2] == '\n'))
			{
				pBuf[arg2--] = (char)NULL;
			}
			*(pBuf) = (char)(arg2);
			push((arg2 > 0) ? arg2 : 1);
			trace(".%d: [%s].", (int)pBuf[0], pBuf+1);
		}
		return 0;

	case FWRITE:			// ( addr num fp -- count ) - fp == 0 means STDIN
		arg3 = pop();
		arg2 = pop();
		arg1 = pop();
		{
			BYTE *pBuf = (BYTE *)&the_memory[arg1];
			int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
			push(num);
		}
		trace("FWRITE\n");
		return 0;

	case FCLOSE:
		arg1 = pop();
		if (arg1 != 0)
			fclose((FILE *)arg1);
		trace("FCLOSE\n");
		return 0;

	case GETCH:
		arg1 = getch();
		push(arg1);
		trace("GETCH\n");
		return 0;

	case DTOR:
		arg1 = pop();
		trace("DTOR (%d)\n", arg1);
		rpush(arg1);
		return 0;

	case RTOD:
		trace("RTOD\n");
		arg1 = rpop();
		push(arg1);
		return 0;

	case DEPTH:
		arg1 = DSP - dsp_init;
		trace("DEPTH (%ld)\n", arg1);
		push(arg1);
		return 0;

	case AND:
		arg1 = pop();
		arg2 = pop();
		trace("AND (%04x & %04x)\n", arg1, arg2);
		push(arg2 & arg1);
		return 0;

	case OR:
		arg1 = pop();
		arg2 = pop();
		trace("OR (%04x & %04x)\n", arg1, arg2);
		push(arg2 | arg1);
		return 0;

	case BREAK:
		{
			arg1 = the_memory[ADDR_HERE];
			arg2 = the_memory[ADDR_LAST];
			arg3 = arg2 - arg1;
		}
		trace("BREAK\n");
		isBYE = true;
		return 0;

	case BYE:
		isBYE = true;
		trace("BYE\n");
		return 0;

	case RESET:
	default:
		isBYE = isEmbedded;
		reset_vm();
		isEmbedded = isBYE;
		trace("RESET\n");
		return 0;
	}
	return 0;
}

// ------------------------------------------------------------------------------------------
CELL cpu_loop()
{
	isBYE = false;
	// debug("Running (PC=%04lx) ... ", PC);
	// int i = 0;
	// while (++i < 100)
	while (true)
	{
		cpu_step();
		if (isBYE)
		{
			// debug("BYE. PC=%04lx\n", PC);
			return GETTOS();
		}
	}
	// debug("done. PC=%04lx\n", PC);
	return 0;
}
