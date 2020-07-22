#ifndef __FORTH_SHARED__
#define __FORTH_SHARED__

// #define __VERBOSE__ 1

#ifdef __VERBOSE__
	#define TRACE(...) printf(__VA_ARGS__)
#else
	#define TRACE(...)
#endif

// ************************************************************************************************
// The VM's instruction set
// ************************************************************************************************
#define ADDR       1
#define FETCH      2
#define STORE      3
#define DROP       4
#define DUP        5
#define ASTORE     6
#define JMP        7
#define RET        8
#define ADD        9
#define ATPLUS     10
#define STOREPLUS  11
#define PLUSSTAR   12
#define OVER       13
#define UNTIL      14
#define UNTILNEG   15
#define INVERT     16
#define TEQ0       17
#define CEQ0       18
#define PCOLON     19
#define DTOR       20
#define RTOD       21
#define AND        22
#define XOR        23
#define TIMES2     24
#define DIVIDE2    25
#define NOP        26
#define BYE        27

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

typedef unsigned char BYTE;
typedef long CELL;				// Use long for a 32-bit implementation, short for a 16-bit
// #define CELL long;				// Use long for a 32-bit implementation, short for a 16-bit
typedef int bool;
typedef char *String;

typedef struct {
	char *asm_instr;
	BYTE opcode;
	char *forth_prim;
	void (*func)();
	CELL flags;
} OPCODE_T;

// flags is a bit field:
#define IS_IMMEDIATE 0x01
#define IS_INLINE    0x02
#define IS_HIDDEN    0x04

typedef struct {
	CELL next, XT;
	BYTE flags;
	BYTE len;
	char name[30];
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
extern int MEM_SZ;

#define GETAT(loc) *(CELL *)(&the_memory[loc])
#define SETAT(loc, val) *(CELL *)(&the_memory[loc]) = val

#define _T(x) x

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
