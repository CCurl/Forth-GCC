#ifndef __SHARED__
#define __SHARED__

// ************************************************************************************************
// The VM's instruction set
// ************************************************************************************************
#define NOP 0
#define BYE 1
#define QRX 2
#define TX 3
#define IO 4
#define doLIT 5
#define doLIST 6
#define NEXT 7
#define QBRANCH 8
#define BRANCH 9
#define EXECUTE 10
#define EXIT 11
#define STORE 12
#define FETCH 13
#define CSTORE 14
#define CFETCH 15
#define RPFETCH 16
#define RPSTORE 17
#define DTOR 18
#define RFETCH 19
#define RTOD 20
#define SPFETCH 21
#define SPSTORE 22
#define DROP 23
#define DUP 24
#define SWAP 25
#define OVER 26
#define LESS 27
#define AND 28
#define OR 29
#define XOR 30
#define UMPLUS 31

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

typedef unsigned char BYTE;
typedef unsigned long CELL;				// Use long for a 32-bit implementation, short for a 16-bit
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
	CELL next, XT;
	BYTE flags;
	BYTE len;
	char name[30];
} DICT_T;

#undef NULL
#define NULL (0)
#define CELL_SZ (sizeof(CELL))

extern CELL ADDR_CELL;     // 0x08
extern CELL ADDR_HERE;     // 0x10
extern CELL ADDR_LAST;     // 0x14
extern CELL ADDR_BASE;     // 0x18
extern CELL ADDR_STATE;    // 0x20
extern CELL ADDR_MEM_SZ;   // 0x24

#define ONE_KB (1024)
#define ONE_MB (ONE_KB * ONE_KB)
extern int MEM_SZ;

#define CELL_AT(loc) *(CELL *)(&the_memory[loc])
#define BYTE_AT(loc) (the_memory[loc])

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
