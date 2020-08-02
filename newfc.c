#include <stdio.h>
#include "forth-vm.h"

typedef unsigned long CELL;
typedef unsigned char BYTE;

#define MEM_SZ 8*1024
BYTE the_memory[MEM_SZ];

CELL BASE = 10, STATE = 0;
CELL HERE, LAST;
CELL reg1, reg2, src, dst;

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
#define STK_SZ 32
CELL dstk[STK_SZ];
CELL *DSP = dstk;
CELL *DSS = &(dstk[0]);
CELL *DSE = &(dstk[STK_SZ-1]);

CELL rstk[STK_SZ];
CELL *RSP = rstk;
CELL *RSS = &(rstk[0]);
CELL *RSE = &(rstk[STK_SZ-1]);

#define TOS (*DSP)
#define CELL_AT(addr) *(CELL *)(addr)
#define BYTE_AT(addr) *(BYTE *)(addr)

// ---------------------------------------------------------------------
void push(CELL val)
{
	if (++DSP > DSE)
		DSP = DSS;
	TOS = val;
}

CELL pop()
{
	CELL ret = TOS;
	if (--DSP < DSS)
		DSP = DSE;
	return ret;
}

// ---------------------------------------------------------------------
// ---------------------------------------------------------------------
int main (int argc, char **argv)
{
	HERE = (CELL)the_memory;

	printf("HERE: %08lx, memory: %08lx", &HERE, the_memory);

    return 0;
}
