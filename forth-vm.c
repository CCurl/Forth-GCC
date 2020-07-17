#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "forth-vm.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------
BYTE the_memory[MEM_SZ];
long memory_size = 0;

CELL PC = 0;		// The "program counter"
CELL IR = 0;		// The "instruction register"

CELL *RSP = NULL, rdepth = 0;	// the return stack
CELL *DSP = NULL, depth = 0;	// the data stack
CELL TOS = 0;					// The top element on the stack

CELL *dsp_init = NULL;
CELL *rsp_init = NULL;

bool isEmbedded = false;
bool isBYE = false;

int _QUIT_HIT = 0;

CELL dsBuf[4];
CELL dStack[256];
CELL buf1[4];
CELL rStack[256];
CELL rsBuf[4];

// ------------------------------------------------------------------------------------------
void create_vm()
{
	// if (the_memory != (BYTE*) NULL)
	// 	free(the_memory);

	// the_memory = malloc(memory_size);
	memset(the_memory, 0, memory_size);
}

// ------------------------------------------------------------------------------------------
void destroy_vm()
{
	// if (the_memory)
	// {
	// 	free(the_memory);
	// 	the_memory = (BYTE*) NULL;
	// }
}

// ------------------------------------------------------------------------------------------
void reset_vm()
{
	//dsp_init = (CELL *)&the_memory[memory_size - STACKS_SZ];
	//rsp_init = (CELL *)&the_memory[memory_size - CELL_SZ];
	dsp_init = dStack;
	rsp_init = (CELL *)rsBuf;
	RSP = rsp_init;
	DSP = dsp_init;
	PC = (CELL)the_memory;
	depth = 0;
	rdepth = 0;
}

// ------------------------------------------------------------------------------------------
void init_vm(int vm_size)
{
	// memory_size = vm_size > 0 ? vm_size : MEM_SZ;
	memory_size = MEM_SZ;

	init_vm_vectors();
	create_vm();
	reset_vm();
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL cpu_loop()
{
	isBYE = false;
	debug("Running (PC=%04lx) ... ", PC);

	void (*vm_prim)();

	while (true)
	{
		vm_prim = (void (*)())GETCELL(PC);
		PC += CELL_SZ;
		vm_prim();

        // IR = GETBYTE(PC++);
        // printf("PC=%04lx, IR=%d - ", PC-1, IR);
        // vm_prims[IR]();

		if (isBYE)
		{
			debug("done. PC=%04lx\n", PC);
			return 1;
		}
	}
	return 0;
}
