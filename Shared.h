#ifndef __FORTH_SHARED__
#define __FORTH_SHARED__

// #define __VERBOSE__ 1

#ifdef __VERBOSE__
	#define TRACE(...) printf(__VA_ARGS__)
#else
	#define TRACE(...)
#endif

#define MEM_SZ (1024*64)
#define MAX_WORDS 2000

// ************************************************************************************************
// The VM's instruction set
// ************************************************************************************************
enum {
	LITERAL, FETCH, STORE, SWAP, DROP, DUP, SLITERAL, 
	JMP, JMPZ, JMPNZ, CALL, RET, OR, CLITERAL, CFETCH, 
	CSTORE, ADD, SUB, MUL, DIV, LT, EQ, GT, DICTP, EMIT, 
	OVER, COMPARE, FOPEN, FREAD, FREADLINE, FWRITE, FCLOSE, 
	DTOR, RTOD, LOGLEVEL, AND, PICK, DEPTH, GETCH, COMPAREI, 
	SLASHMOD, NOT, RFETCH, INC, RDEPTH, DEC, GETTICK, 
	SHIFTLEFT, SHIFTRIGHT, PLUSSTORE, OPENBLOCK, XOR, COM, BYE
}

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

typedef unsigned char BYTE;
typedef unsigned long CELL;				// Use long for a 32-bit implementation, short for a 16-bit
typedef int bool;
typedef char *String;

typedef struct {
	char *asm_instr;
	BYTE opcode;
	char *forth_prim;
	CELL flags;
} OPCODE_T;

// flags is a bit field:
#define IS_IMMEDIATE 0x01
#define IS_INLINE    0x02
#define IS_HIDDEN    0x04

typedef struct {
	CELL XT;
	BYTE flags;
	char name[31];
} DICT_T;

#undef NULL
#define NULL (0)
#define CELL_SZ (sizeof(CELL))

#define DSTACK_SZ (CELL_SZ * 64)
#define RSTACK_SZ (CELL_SZ * 64)
#define STACKS_SZ (DSTACK_SZ + RSTACK_SZ)

#define STACK_BUF_CELLS 2
#define STACK_BUF_SZ (STACK_BUF_CELLS * CELL_SZ)

extern CELL ADDR_CELL;     // 0x08
extern CELL ADDR_HERE;     // 0x10
extern CELL ADDR_LAST;     // 0x14
extern CELL ADDR_BASE;     // 0x18
extern CELL ADDR_STATE;    // 0x20
extern CELL ADDR_MEM_SZ;   // 0x24

#define ONE_KB (1024)
#define ONE_MB (ONE_KB * ONE_KB)

#define GETAT(loc) *(CELL *)(&the_memory[loc])
#define SETAT(loc, val) *(CELL *)(&the_memory[loc]) = val

#define true 1
#define false 0

#define LPCTSTR char *

typedef struct {
	int addr;
	char tag[24];
	char code[128];
	char comment[128];
} LINE_T;

#endif
