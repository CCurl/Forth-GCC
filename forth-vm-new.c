#include <stdlib.h>
#include <string.h>

#include "forth-vm-new.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------
BYTE *the_memory;
long memory_size = 0;

int isEmbedded = false;
int isBYE = false;

int _QUIT_HIT = 0;
int MEM_SZ = 0;

CELL *DSP, *RSP;

// ------------------------------------------------------------------------------------------
void create_vm(int vm_size)
{
	memory_size = vm_size > 0 ? vm_size : MEM_SZ;

	if (the_memory != (BYTE*) NULL)
		free(the_memory);

	the_memory = malloc(memory_size);
	memset(the_memory, 0, memory_size);
	RSP = (CELL *)(&the_memory[memory_size]);
	DSP = (CELL *)(&the_memory[memory_size-256]);

	CELL_AT(ADDR_MEM_SZ) = memory_size;
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
void rpush(CELL val)
{
	*(--RSP) = val;
}

CELL rpop()
{
	return *(RSP++);
}

// ------------------------------------------------------------------------------------------
void push(CELL val)
{
	*(++DSP) = val;
}

CELL pop()
{
	return *(DSP--);
}

// ------------------------------------------------------------------------------------------
extern void rxFromForth(char);

void txOut(char c) {
	rxFromForth(c);
}

void txOutString(char *str) {
	while (*str) {
		txOut(*(str++));
	}
}

// ------------------------------------------------------------------------------------------
char rxBuf[128];
char *rxBufP;
char *inBufP = rxBuf;

void rxFromCon(char c)
{
	txOut(c);
	*(rxBufP++) = c;
	*(rxBufP) = 0;
}

// ------------------------------------------------------------------------------------------
char qRx() {
	if (*inBufP) {
		return *(inBufP++);
	}
	rxBufP = rxBuf;
	inBufP = rxBuf;
	return 0;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
void cpu_loop(CELL start)
{
	CELL PC = start;
	BYTE IR;
	int call_depth = 1;
	CELL eax, edx;

	isBYE = false;
	while (true)
	{
		IR = BYTE_AT(PC++);
		switch (IR)
		{
			case BYE:
			return;
			break;

			case QRX:
			break;

			case TX:
			txOut((char)pop());
			break;

			case IO:
			break;

			case doLIT:
			eax = CELL_AT(PC);
			PC += 4;
			break;

			case doLIST:
			// CALL
			eax = CELL_AT(PC);
			rpush(PC + 4);
			PC = eax;
			break;

			case NEXT:
			break;

			case QBRANCH:
			if (pop()) {
				PC = CELL_AT(PC);
			} else {
				PC += 4;
			}
			break;

			case BRANCH:
			PC = CELL_AT(PC);
			break;

			case EXECUTE:
			++call_depth;
			rpush(PC);
			eax = pop();
			PC = eax;
			break;

			case EXIT:
			// RETURN
			PC = rpop();
			if (--call_depth < 1)
				return;
			break;

			case STORE:
			edx = pop();
			eax = pop();
			CELL_AT(edx) = eax;
			break;

			case FETCH:
			edx = pop();
			push(CELL_AT(edx));
			break;

			case CSTORE:
			edx = pop();
			eax = pop();
			BYTE_AT(edx) = eax;
			break;

			case CFETCH:
			edx = pop();
			push(BYTE_AT(edx));
			break;

			case RPFETCH:
			push((CELL)RSP);
			break;

			case RPSTORE:
			RSP = (CELL *)pop();
			break;

			case DTOR:
			rpush(pop());
			break;

			case RFETCH:
			push(*RSP);
			break;

			case RTOD:
			push(rpop());
			break;

			case SPFETCH:
			push((CELL)DSP);
			break;

			case SPSTORE:
			DSP = (CELL *)pop();
			break;

			case DROP:
			pop();
			break;

			case DUP:
			push(*DSP);
			break;

			case SWAP:
			eax = pop();
			edx = pop();
			push(eax);
			push(edx);
			break;

			case OVER:
			eax = pop();
			edx = *DSP;
			push(eax);
			push(edx);
			break;

			case LESS:
			break;

			case AND:
			eax = pop();
			*DSP = (*DSP) & eax;
			break;

			case OR:
			eax = pop();
			*DSP = (*DSP) | eax;
			break;

			case XOR:
			eax = pop();
			*DSP = (*DSP) ^ eax;
			break;

			case UMPLUS:
			eax = pop();
			*DSP = (*DSP) + eax;
			break;

			default:
			txOutString("-unk-instr-");
			break;
		}
	}
	return;
}
