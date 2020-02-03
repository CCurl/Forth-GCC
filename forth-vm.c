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

void init_vm_vectors();
extern void (*funcs[])();

// ------------------------------------------------------------------------------------------
void create_vm(long memory_size)
{
	if (the_memory == (BYTE*) NULL)
	{
		the_memory = malloc(memory_size);
	}
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
void init_vm()
{
	init_vm_vectors();
	create_vm(MEM_SZ);
	dsp_init = (CELL *)&the_memory[DSP_INIT];
	rsp_init = (CELL *)&the_memory[RSP_INIT];
	DSP = dsp_init;
	RSP = rsp_init;
	isBYE = false;
	isEmbedded = false;
	PC = 0;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL cpu_step()
{
	IR = the_memory[PC++];
	trace("PC=%04lx, IR=%d - ", PC-1, (int)IR);
	void (*f)() = funcs[IR];
	if (f)
	{
		f();
		return 0;
	}

	switch (IR)
	{
	case LITERAL:
		// arg1 = GETAT(PC);
		// PC += CELL_SZ;
		// push(arg1);
		// trace("PUSH(%0lx) - %ld\n", arg1, arg1);
		return CELL_SZ;

	case CLITERAL:
		// arg1 = the_memory[PC++];
		// push(arg1);
		// trace("CPUSH(%02lx) - %d\n", (int)arg1, (int)arg1);
		return 1;

	case FETCH:
		// arg1 = GETTOS();
		// arg2 = GETAT(arg1);
		// SETTOS(arg2);
		// trace("FETCH(%04lx)=%04lx (%ld)\n", arg1, arg2, arg2);
		return 0;

	case STORE:
		// arg1 = pop();
		// arg2 = pop();
		// SETAT(arg1, arg2);
		// trace("STORE(%04lx, %04lx)\n", arg1, arg2);
		return 0;

	case SWAP:
		// arg1 = GET2ND();
		// arg2 = GETTOS();
		// SET2ND(arg2);
		// SETTOS(arg1);
		// trace("SWAP (%04lx and %04lx)\n", arg1, arg2);
		return 0;
		
	case DROP:
		// arg1 = pop();
		// trace("DROP (TOS was %04lx)\n", arg1);
		return 0;

	case DUP:
		// arg1 = GETTOS();
		// push(arg1);
		// trace("DUP (%04lx)\n", arg1);
		return 0;

	case OVER:
		// arg1 = GET2ND();
		// push(arg1);
		// trace("OVER (%04lx)\n", arg1);
		return 0;

	case PICK:
		arg1 = pop();
		arg2 = *(DSP - arg1);
		push(arg2);
		trace("PICK\n");
		return 0;

	case JMP:
		PC = GETAT(PC);
		trace("JMP\n");
		return CELL_SZ;

	case JMPZ:
		trace("JMPZ %04lx\n", GETAT(PC));
		if (pop() == 0)
		{
			PC = GETAT(PC);
		}
		else
		{
			PC += CELL_SZ;
		}
		return CELL_SZ;

	case JMPNZ:
		trace("JMPNZ %04lx\n", GETAT(PC));
		arg1 = pop();
		if (arg1 != 0)
		{
			PC = GETAT(PC);
		}
		else
		{
			PC += CELL_SZ;
		}
		return CELL_SZ;

	case BRANCH:
		arg1 = GETAT(PC);
		trace("BRANCH %04lx\n", arg1);
		PC += arg1;
		return CELL_SZ;

	case BRANCHZ:
		arg1 = GETAT(PC);
		trace("BRANCHZ %04lx\n", arg1);
		if (pop() == 0)
		{
			arg1 = GETAT(PC);
			PC += arg1;
		}
		else
		{
			PC += CELL_SZ;
		}
		return CELL_SZ;

	case BRANCHNZ:
		arg1 = GETAT(PC);
		trace("BRANCHNZ %04lx\n", arg1);
		if (pop() != 0)
		{
			arg1 = GETAT(PC);
			PC += arg1;
		}
		else
		{
			PC += CELL_SZ;
		}
		return CELL_SZ;

	case CALL:
		arg1 = GETAT(PC);
		trace("CALL %04lx\n", arg1);
		PC += CELL_SZ;
		rpush(PC);
		PC = arg1;
		return CELL_SZ;

	case RET:
		if (RSP == rsp_init)
		{
			if (isEmbedded)
			{
				isBYE = true;
			}
			else
			{
				PC = 0;
			}
		}
		else
		{
			PC = rpop();
		}
		trace("RET\n");
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
		arg1 = PC++;
		arg2 = the_memory[PC++];
		while (arg2)
		{
			arg2 = the_memory[PC++];
		}
		// PC++;
		push(arg1);
		return PC-arg1;

	case CFETCH:
		// arg1 = GETTOS();
		// arg2 = the_memory[arg1];
		// SETTOS(arg2);
		// trace("CFETCH(%04lx) = %02x (%d)\n", arg1, arg2, arg2);
		return 0;

	case CSTORE:
		// trace("CSTORE\n");
		// arg1 = pop();
		// arg2 = pop();
		// the_memory[arg1] = (BYTE)arg2;
		return 0;

	case ADD:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 + arg1);
		// trace("ADD %ld + %ld = %ld\n", arg2, arg1, arg2+arg1);
		return 0;

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
			init_vm();
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

	case DICTP:
		arg1 = GETAT(PC);
		PC += CELL_SZ;
		trace("DICTP %04lx", arg1);
		trace(" ; %s\n", &(the_memory[arg1+10]));
		return CELL_SZ;

	case EMIT:
		arg1 = pop();
		putchar(arg1);
		trace("EMIT %02x\n", (int)arg1);
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
		// trace_on();
		trace("(FREADLINE)");
		arg3 = pop();		// FP - 0 means STDIN
		arg2 = pop();		// max-sz
		arg1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
		{
			// char buf[200], *pBuf = buf;
			char *tgt = (char *)&the_memory[arg1];
			FILE *fp = arg3 ? (FILE *)arg3 : stdin;
			char *pBuf = tgt;
			if (fgets((pBuf+1), arg2, fp) != (pBuf+1))
			{
				trace("<EOF>");
				*(pBuf) = 0;
				*(pBuf+1) = (char)0;
				push(0);
				// debug_off();
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
		// debug_off();
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
		rpush(arg1);
		trace("DTOR\n");
		return 0;

	case RTOD:
		arg1 = rpop();
		push(arg1);
		trace("RTOD\n");
		return 0;

	case DEPTH:
		arg1 = DSP - dsp_init;
		push(arg1);
		trace("DEPTH\n");
		return 0;

	case AND:
		arg1 = pop();
		arg2 = pop();
		push(arg2 & arg1);
		trace("AND\n");
		return 0;

	case OR:
		arg1 = pop();
		arg2 = pop();
		push(arg2 | arg1);
		trace("OR\n");
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
		DSP = dsp_init;
		RSP = rsp_init;
		PC = 0;
		isBYE = isEmbedded;
		trace("RESET\n");
		return 0;
	}
	return 0;
}

// ------------------------------------------------------------------------------------------
CELL cpu_loop()
{
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
