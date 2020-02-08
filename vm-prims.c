#include <stdio.h>
#include <memory.h>
#include "Shared.h"
#include "logger.h"

void (*vm_prims[257])();

CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL PC;

extern bool isBYE;
extern BYTE *the_memory;


// LITERAL - Doeswhat
void prim_LITERAL()
{
	arg1 = GETAT(PC);
	PC += CELL_SZ;
	push(arg1);
}

// FETCH - Doeswhat
void prim_FETCH()
{
    arg1 = GETTOS();
    arg2 = GETAT(arg1);
    SETTOS(arg2);
}

// STORE - Doeswhat
void prim_STORE()
{
    arg2 = pop();
    arg1 = pop();
    SETAT(arg2, arg1);
}

// SWAP - Doeswhat
void prim_SWAP()
{
    arg1 = GET2ND();
    arg2 = GETTOS();
    SET2ND(arg2);
    SETTOS(arg1);
}

// DROP - Doeswhat
void prim_DROP()
{
    arg1 = pop();
}

// DUP - Doeswhat
void prim_DUP()
{
	arg1 = GETTOS();
    push(arg1);
}

// SLITERAL - Doeswhat
void prim_SLITERAL()
{
	// code goes here
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
	// code goes here
}

// JMPNZ - Doeswhat
void prim_JMPNZ()
{
	// code goes here
}

// CALL - Doeswhat
void prim_CALL()
{
	// code goes here
}

// RET - Doeswhat
void prim_RET()
{
	// code goes here
}

// ZTYPE - Doeswhat
void prim_ZTYPE()
{
	// code goes here
}

// CLITERAL - Doeswhat
void prim_CLITERAL()
{
	arg1 = the_memory[PC++];
	push(arg1);
}

// CFETCH - Doeswhat
void prim_CFETCH()
{
	arg1 = GETTOS();
	arg2 = the_memory[arg1];
	SETTOS(arg2);
}

// CSTORE - Doeswhat
void prim_CSTORE()
{
	arg1 = pop();
	arg2 = pop();
	the_memory[arg1] = (BYTE)arg2;
}

// ADD - Doeswhat
void prim_ADD()
{
	arg1 = pop();
	arg2 = pop();
	push(arg2 + arg1);
}

// SUB - Doeswhat
void prim_SUB()
{
	// code goes here
}

// MUL - Doeswhat
void prim_MUL()
{
	// code goes here
}

// DIV - Doeswhat
void prim_DIV()
{
	// code goes here
}

// LT - Doeswhat
void prim_LT()
{
	// code goes here
}

// EQ - Doeswhat
void prim_EQ()
{
	// code goes here
}

// GT - Doeswhat
void prim_GT()
{
	// code goes here
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
    push(arg1);
}

// COMPARE - Doeswhat
void prim_COMPARE()
{
	// code goes here
}

// FOPEN - Doeswhat
void prim_FOPEN()
{
	// code goes here
}

// FREAD - Doeswhat
void prim_FREAD()
{
	// code goes here
}

// FREADLINE - Doeswhat
void prim_FREADLINE()
{
	// code goes here
}

// FWRITE - Doeswhat
void prim_FWRITE()
{
	// code goes here
}

// FCLOSE - Doeswhat
void prim_FCLOSE()
{
	// code goes here
}

// DTOR - Doeswhat
void prim_DTOR()
{
	// code goes here
}

// RTOD - Doeswhat
void prim_RTOD()
{
	// code goes here
}

// UNUSED35 - Doeswhat
void prim_UNUSED35()
{
	// code goes here
}

// UNUSED36 - Doeswhat
void prim_UNUSED36()
{
	// code goes here
}

// PICK - Doeswhat
void prim_PICK()
{
	// code goes here
}

// DEPTH - Doeswhat
void prim_DEPTH()
{
	// code goes here
}

// GETCH - Doeswhat
void prim_GETCH()
{
	// code goes here
}

// UNUSED41 - Doeswhat
void prim_UNUSED41()
{
	// code goes here
}

// UNUSED42 - Doeswhat
void prim_UNUSED42()
{
	// code goes here
}

// AND - Doeswhat
void prim_AND()
{
	// code goes here
}

// OR - Doeswhat
void prim_OR()
{
	// code goes here
}

// BRANCH - Doeswhat
void prim_BRANCH()
{
	// code goes here
}

// BRANCHZ - Doeswhat
void prim_BRANCHZ()
{
	// code goes here
}

// BRANCHNZ - Doeswhat
void prim_BRANCHNZ()
{
	// code goes here
}

// COMPAREI - Doeswhat
void prim_COMPAREI()
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
	// vm_prims[7] = prim_SLITERAL;
	vm_prims[8] = prim_JMP;
	// vm_prims[9] = prim_JMPZ;
	// vm_prims[10] = prim_JMPNZ;
	// vm_prims[11] = prim_CALL;
	// vm_prims[12] = prim_RET;
	// vm_prims[13] = prim_ZTYPE;
	vm_prims[14] = prim_CLITERAL;
	vm_prims[15] = prim_CFETCH;
	vm_prims[16] = prim_CSTORE;
	vm_prims[17] = prim_ADD;
	// vm_prims[18] = prim_SUB;
	// vm_prims[19] = prim_MUL;
	// vm_prims[20] = prim_DIV;
	// vm_prims[21] = prim_LT;
	// vm_prims[22] = prim_EQ;
	// vm_prims[23] = prim_GT;
	vm_prims[24] = prim_DICTP;
	vm_prims[25] = prim_EMIT;
	vm_prims[26] = prim_OVER;
	// vm_prims[27] = prim_COMPARE;
	// vm_prims[28] = prim_FOPEN;
	// vm_prims[29] = prim_FREAD;
	// vm_prims[30] = prim_FREADLINE;
	// vm_prims[31] = prim_FWRITE;
	// vm_prims[32] = prim_FCLOSE;
	// vm_prims[33] = prim_DTOR;
	// vm_prims[34] = prim_RTOD;
	// vm_prims[35] = prim_UNUSED35;
	// vm_prims[36] = prim_UNUSED36;
	// vm_prims[37] = prim_PICK;
	// vm_prims[38] = prim_DEPTH;
	// vm_prims[39] = prim_GETCH;
	// vm_prims[40] = prim_UNUSED41;
	// vm_prims[41] = prim_UNUSED42;
	// vm_prims[42] = prim_AND;
	// vm_prims[43] = prim_OR;
	// vm_prims[44] = prim_BRANCH;
	// vm_prims[45] = prim_BRANCHZ;
	// vm_prims[46] = prim_BRANCHNZ;
	// vm_prims[47] = prim_COMPAREI;
	// vm_prims[253] = prim_BREAK;
	// vm_prims[254] = prim_RESET;
	// vm_prims[255] = prim_BYE;
}