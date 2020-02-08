#include <stdio.h>
#include <memory.h>
#include "Shared.h"


void (*vm_prims[257])();

CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL PC;

extern bool isBYE;
extern BYTE *the_memory;


// LITERAL - Doeswhat
void f_LITERAL()
{
	arg1 = GETAT(PC);
	PC += CELL_SZ;
	push(arg1);
}

// FETCH - Doeswhat
void f_FETCH()
{
    arg1 = GETTOS();
    arg2 = GETAT(arg1);
    SETTOS(arg2);
}

// STORE - Doeswhat
void f_STORE()
{
    arg2 = pop();
    arg1 = pop();
    SETAT(arg2, arg1);
}

// SWAP - Doeswhat
void f_SWAP()
{
    arg1 = GET2ND();
    arg2 = GETTOS();
    SET2ND(arg2);
    SETTOS(arg1);
}

// DROP - Doeswhat
void f_DROP()
{
    arg1 = pop();
}

// DUP - Doeswhat
void f_DUP()
{
	arg1 = GETTOS();
    push(arg1);
}

// SLITERAL - Doeswhat
void f_SLITERAL()
{
	// code goes here
}

// JMP - Doeswhat
void f_JMP()
{
	// code goes here
}

// JMPZ - Doeswhat
void f_JMPZ()
{
	// code goes here
}

// JMPNZ - Doeswhat
void f_JMPNZ()
{
	// code goes here
}

// CALL - Doeswhat
void f_CALL()
{
	// code goes here
}

// RET - Doeswhat
void f_RET()
{
	// code goes here
}

// ZTYPE - Doeswhat
void f_ZTYPE()
{
	// code goes here
}

// CLITERAL - Doeswhat
void f_CLITERAL()
{
	arg1 = the_memory[PC++];
	push(arg1);
}

// CFETCH - Doeswhat
void f_CFETCH()
{
	arg1 = GETTOS();
	arg2 = the_memory[arg1];
	SETTOS(arg2);
}

// CSTORE - Doeswhat
void f_CSTORE()
{
	arg1 = pop();
	arg2 = pop();
	the_memory[arg1] = (BYTE)arg2;
}

// ADD - Doeswhat
void f_ADD()
{
	arg1 = pop();
	arg2 = pop();
	push(arg2 + arg1);
}

// SUB - Doeswhat
void f_SUB()
{
	// code goes here
}

// MUL - Doeswhat
void f_MUL()
{
	// code goes here
}

// DIV - Doeswhat
void f_DIV()
{
	// code goes here
}

// LT - Doeswhat
void f_LT()
{
	// code goes here
}

// EQ - Doeswhat
void f_EQ()
{
	// code goes here
}

// GT - Doeswhat
void f_GT()
{
	// code goes here
}

// DICTP - Doeswhat
void f_DICTP()
{
	// code goes here
}

// EMIT - Doeswhat
void f_EMIT()
{
	// code goes here
}

// OVER - Doeswhat
void f_OVER()
{
    arg1 = GET2ND();
    push(arg1);
}

// COMPARE - Doeswhat
void f_COMPARE()
{
	// code goes here
}

// FOPEN - Doeswhat
void f_FOPEN()
{
	// code goes here
}

// FREAD - Doeswhat
void f_FREAD()
{
	// code goes here
}

// FREADLINE - Doeswhat
void f_FREADLINE()
{
	// code goes here
}

// FWRITE - Doeswhat
void f_FWRITE()
{
	// code goes here
}

// FCLOSE - Doeswhat
void f_FCLOSE()
{
	// code goes here
}

// DTOR - Doeswhat
void f_DTOR()
{
	// code goes here
}

// RTOD - Doeswhat
void f_RTOD()
{
	// code goes here
}

// UNUSED35 - Doeswhat
void f_UNUSED35()
{
	// code goes here
}

// UNUSED36 - Doeswhat
void f_UNUSED36()
{
	// code goes here
}

// PICK - Doeswhat
void f_PICK()
{
	// code goes here
}

// DEPTH - Doeswhat
void f_DEPTH()
{
	// code goes here
}

// GETCH - Doeswhat
void f_GETCH()
{
	// code goes here
}

// UNUSED41 - Doeswhat
void f_UNUSED41()
{
	// code goes here
}

// UNUSED42 - Doeswhat
void f_UNUSED42()
{
	// code goes here
}

// AND - Doeswhat
void f_AND()
{
	// code goes here
}

// OR - Doeswhat
void f_OR()
{
	// code goes here
}

// BRANCH - Doeswhat
void f_BRANCH()
{
	// code goes here
}

// BRANCHZ - Doeswhat
void f_BRANCHZ()
{
	// code goes here
}

// BRANCHNZ - Doeswhat
void f_BRANCHNZ()
{
	// code goes here
}

// COMPAREI - Doeswhat
void f_COMPAREI()
{
	// code goes here
}

// BREAK - Doeswhat
void f_BREAK()
{
	// code goes here
}

// RESET - Doeswhat
void f_RESET()
{
	// code goes here
}

// BYE - Doeswhat
void f_BYE()
{
	isBYE = true;
}

void init_vm_vectors()
{
    memset(vm_prims, 0, sizeof(vm_prims));
    // vm_prims[0] = f_BYE;
	vm_prims[1] = f_LITERAL;
	vm_prims[2] = f_FETCH;
	vm_prims[3] = f_STORE;
	vm_prims[4] = f_SWAP;
	vm_prims[5] = f_DROP;
	vm_prims[6] = f_DUP;
	// vm_prims[7] = f_SLITERAL;
	// vm_prims[8] = f_JMP;
	// vm_prims[9] = f_JMPZ;
	// vm_prims[10] = f_JMPNZ;
	// vm_prims[11] = f_CALL;
	// vm_prims[12] = f_RET;
	// vm_prims[13] = f_ZTYPE;
	vm_prims[14] = f_CLITERAL;
	vm_prims[15] = f_CFETCH;
	vm_prims[16] = f_CSTORE;
	vm_prims[17] = f_ADD;
	// vm_prims[18] = f_SUB;
	// vm_prims[19] = f_MUL;
	// vm_prims[20] = f_DIV;
	// vm_prims[21] = f_LT;
	// vm_prims[22] = f_EQ;
	// vm_prims[23] = f_GT;
	// vm_prims[24] = f_DICTP;
	// vm_prims[25] = f_EMIT;
	vm_prims[26] = f_OVER;
	// vm_prims[27] = f_COMPARE;
	// vm_prims[28] = f_FOPEN;
	// vm_prims[29] = f_FREAD;
	// vm_prims[30] = f_FREADLINE;
	// vm_prims[31] = f_FWRITE;
	// vm_prims[32] = f_FCLOSE;
	// vm_prims[33] = f_DTOR;
	// vm_prims[34] = f_RTOD;
	// vm_prims[35] = f_UNUSED35;
	// vm_prims[36] = f_UNUSED36;
	// vm_prims[37] = f_PICK;
	// vm_prims[38] = f_DEPTH;
	// vm_prims[39] = f_GETCH;
	// vm_prims[40] = f_UNUSED41;
	// vm_prims[41] = f_UNUSED42;
	// vm_prims[42] = f_AND;
	// vm_prims[43] = f_OR;
	// vm_prims[44] = f_BRANCH;
	// vm_prims[45] = f_BRANCHZ;
	// vm_prims[46] = f_BRANCHNZ;
	// vm_prims[47] = f_COMPAREI;
	// vm_prims[253] = f_BREAK;
	// vm_prims[254] = f_RESET;
	// vm_prims[255] = f_BYE;
}