#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

#define ORG_OFFSET 0x0040;
CELL ORG;
extern CELL HERE;
extern CELL LAST;
extern OPCODE_T theOpcodes[];

// ------------------------------------------------------------------------------------------
void dis_range(CELL start, CELL end, char *bytes)
{
	char x[8];
	while (start <= end)
	{
		BYTE val = GETBYTE(start++);
		sprintf(x, " %02x", (int)val);
		strcat(bytes, x);
	}
}

// ------------------------------------------------------------------------------------------
void dis_start(CELL start, int num, char *bytes)
{
    dis_range(start, start + num - 1, bytes);
}

// ------------------------------------------------------------------------------------------
void dis_rangeCell(CELL start, CELL end, char *bytes)
{
	char x[8];
	while (start <= end)
	{
		CELL val = GETCELL(start);
		start += 4;
		sprintf(x, " %08lx", (CELL)val);
		strcat(bytes, x);
	}
}

// ------------------------------------------------------------------------------------------
void dis_PC2(int num, char *bytes)
{
	char x[8];
	for (int i = 0; i < num; i++)
	{
		BYTE val = *(BYTE *)(PC++);
		sprintf(x, " %02x", (int)val);
		strcat(bytes, x);
	}
}

typedef struct {
	CELL opcode;
	CELL addr;
	char *name;
} DIS_PRIM_T;

DIS_PRIM_T *dis_prims = NULL;
extern void (*vm_prims[])();
int num_prims = 0;

void dis_add_prim(int opcode, void (*func)(), char *name)
{
	dis_prims[num_prims].opcode = opcode;
	dis_prims[num_prims].addr = (CELL)func;
	dis_prims[num_prims].name = name;
	num_prims++;
}

void init_prims()
{
	num_prims = 0;
	const CELL max_prims = 512;
	const CELL sz = sizeof(DIS_PRIM_T)*max_prims;
	dis_prims = (DIS_PRIM_T *)malloc(sz);
	memset(dis_prims, 0, sz);
	for (int i = 0; i < 256; i++)
	{
		OPCODE_T *op = &(theOpcodes[i]);
		if (op->opcode == 0)
			break;
		void (*func)() = vm_prims[op->opcode];
		dis_add_prim(op->opcode, func, op->forth_prim);
	}
	dis_add_prim(0, 0, 0);
}

OPCODE_T *opcodeFromPrim(CELL prim)
{
	for (int i = 0; i < 256; i++)
	{
		OPCODE_T *op = &(theOpcodes[i]);
		if (op->opcode == 0)
			break;
		if ((CELL)op->func == prim)
		{
			return op;
		}
	}
	return NULL;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL dis_one(char *bytes, char *desc)
{
	char add_this[256];
	CELL func = GETCELL(PC);
	OPCODE_T *op = opcodeFromPrim(func);
	sprintf(bytes, "%08lx: %08lx", PC, func);
	PC += CELL_SZ;

	if (!op)
	{
		sprintf(desc, "--UNKNOWN-- (%08lx)", func);
		return 0;
	}

	sprintf(desc, "%s", op->forth_prim);

	switch (op->opcode)
	{
	case LITERAL:
		arg1 = GETCELL(PC);
		// push(arg1);
		dis_rangeCell(PC, PC, bytes);
		sprintf(add_this, " $%08lx", arg1);
		strcat(desc, add_this);
		sprintf(add_this, ", #%d", arg1);
		strcat(desc, add_this);
		PC += CELL_SZ;
		return CELL_SZ;

	case CLITERAL:
		arg1 = GETBYTE(PC);
		dis_range(PC, PC, bytes);
		sprintf(add_this, " $%02lx", arg1);
		strcat(desc, add_this);
		sprintf(add_this, ", #%d", arg1);
		strcat(desc, add_this);
		if ((arg1 > 0x20) && (arg1 < 0x80) )
		{
			sprintf(add_this, ", '%c'", arg1);
			strcat(desc, add_this);
		}
		PC += 1;
		return 1;

	case JMP:
		// PC = GETCELL(PC);
		arg1 = GETCELL(PC);
		sprintf(desc, "JMP %08lx", arg1);
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case JMPZ:
		sprintf(desc, "JMPZ %08lx", GETCELL(PC));
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case JMPNZ:
		sprintf(desc, "JMPNZ %08lx", GETCELL(PC));
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case CALL:
		arg1 = GETCELL(PC);
		dis_rangeCell(PC, PC, bytes);
		dis_rangeCell(PC, PC, desc);
		PC += CELL_SZ;
		return CELL_SZ;

	case RET:
		sprintf(desc, "RET");
		return 0;

	case FETCH:
		sprintf(desc, "FETCH");
		return 0;

	case CFETCH:
		sprintf(desc, "CFETCH");
		return 0;

	case STORE:
		sprintf(desc, "STORE");
		return 0;

	case CSTORE:
		sprintf(desc, "CSTORE");
		return 0;

	case SLITERAL:
		// count, bytes, NULL - NULL delimited counted string
		// 0100 0101 0102 0103 0104 0105
		//   07   03   65   66   67   00
		// SLIT   03    A    B    C   00
		// PC starts at 0101, should be set to 0106

		//printf("SLITERAL (%08lx) [%lx]", PC+1, (char *)(PC+1));
		arg1 = GETBYTE(PC); // count-byte (and the beginning of the counted string)
		arg2 = arg1 + 2;    // count-byte + count + NULL
		sprintf(desc, "SLITERAL (%08lx) [%s]", PC+1, PC+1);
		dis_start(PC, (arg2 > 10) ? 10 : arg2, bytes);
		PC += arg2;
		return 0;

	case BRANCHF:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHF %ld (%08lx)", arg1, PC+arg1);
		dis_PC2(1, bytes);
		return 0;

	case BRANCHFZ:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHFZ %ld (%08lx)", arg1, PC+arg1);
		dis_PC2(1, bytes);
		return 0;

	case BRANCHFNZ:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHFNZ %ld (%08lx)", arg1, PC+arg1);
		dis_PC2(1, bytes);
		return 0;

	case BRANCHB:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHB %ld (%08lx)", arg1, PC-arg1);
		dis_PC2(1, bytes);
		return 0;

	case BRANCHBZ:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHBZ %ld (%08lx)", arg1, PC-arg1);
		dis_PC2(1, bytes);
		return 0;

	case BRANCHBNZ:
		arg1 = GETBYTE(PC);
		sprintf(desc, "BRANCHBNZ %ld (%08lx)", arg1, PC-arg1);
		dis_PC2(1, bytes);
		return 0;
	}
	return 0;
}

// ------------------------------------------------------------------------------------------
CELL dis_dict(FILE *write_to, CELL dict_addr)
{
	char bytes[128], desc[128];
	DICT_T_NEW *dp = (DICT_T_NEW *)dict_addr;
	CELL addr = dict_addr;

	// if (dp->next == 0)
	// {
	// 	sprintf(bytes, "%08lx:", addr);
	// 	dis_start(addr, CELL_SZ, bytes);
	// 	fprintf(write_to, "%-32s ; End.\n", bytes);
	// 	return;
	// }

	// Prev
	sprintf(bytes, "%08lx:", addr);
	dis_rangeCell(addr, addr, bytes);
	sprintf(desc, "PREV: %08lx", dp->prev);
	fprintf(write_to, ";\n%-32s ; %s\n", bytes, desc);
	addr += CELL_SZ;

	// Next
	sprintf(bytes, "%08lx:", addr);
	dis_rangeCell(addr, addr, bytes);
	sprintf(desc, "NEXT: %08lx", dp->next);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	addr += CELL_SZ;

	// Next
	sprintf(bytes, "%08lx:", addr);
	dis_rangeCell(addr, addr, bytes);
	sprintf(desc, "XT: %08lx", dp->XT);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	addr += CELL_SZ;

	// Flags, len
	sprintf(bytes, "%08lx: %02x %02x", addr, dp->flags, dp->len);
	sprintf(desc, "Flags: %02x, Len: %d", dp->flags, dp->len);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	dis_start(addr, 2, bytes);
	addr += 2;

	// Name
	sprintf(bytes, "%08lx:", addr);
	dis_start(addr, dp->len+1, bytes);
	sprintf(desc, "Name: %s", dp->name);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);

	addr += dp->len + 1;
	return addr;
}

// ------------------------------------------------------------------------------------------
void dis_vm(FILE *write_to)
{
	char bytes[128], desc[128];

	// Initial JMP
	PC = (CELL)the_memory;
	dis_one(bytes, desc);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	fflush(write_to);

	PC = (CELL)the_memory+0x08;
	sprintf(bytes, "%08lx:", PC);
	dis_rangeCell((CELL)PC, (CELL)PC+0x07, bytes);
	fprintf(write_to, "%s\n", bytes);

	PC = (CELL)the_memory+0x10;
	ORG = (CELL)the_memory+ORG_OFFSET;
	while (PC < ORG)
	{
		sprintf(bytes, "%08lx:", PC);
		dis_rangeCell(PC, PC+0x0f, bytes);
		fprintf(write_to, "%s\n", bytes);
		PC += 0x10;
	}

	fprintf(write_to, ";\n", bytes);
	fflush(write_to);

	// Code
	// PC = dis_vars(write_to);

	PC = ORG;
	while (PC < HERE)
	{
		DICT_T_NEW *curr_dp = (DICT_T_NEW *)(PC);
		CELL stop_here = curr_dp->next;
		stop_here = (stop_here > 0) ? stop_here : HERE;
		PC = dis_dict(write_to, PC);
		fflush(write_to);
		while (PC < stop_here)
		{
			dis_one(bytes, desc);
			// printf("got here: PC = %08lx\n", PC);
			fprintf(write_to, "%-32s ; %s\n", bytes, desc);
			fflush(write_to);
		}
		PC = stop_here;
	}

	fprintf(write_to, ";\n; End of code\n");
}

// *********************************************************************
void do_dis(char *output_fn)
{
    FILE *output_fp = fopen(output_fn, "wt");
    if (!output_fp)
    {
        printf("ERROR: Can't open disassembly file.\n");
        return;
    }

	#ifdef __VERBOSE__
    printf("disassembling to file %s... ", output_fn);
	#endif
    fprintf(output_fp, "; memory-size: %ld bytes, (%08lx hex)\n;\n", memory_size, memory_size);
	fflush(output_fp);
	dis_vm(output_fp);

    fclose(output_fp);
    output_fp = NULL;

	#ifdef __VERBOSE__
    printf(" done.\n");
	#endif
}
