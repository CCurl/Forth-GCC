#ifndef __FORTH_SHARED__
#define __FORTH_SHARED__

#define MEM_SZ_KB 16

// ************************************************************************************************
// The VM's instruction set
// ************************************************************************************************
#define LITERAL     1	// 01
#define FETCH       2	// 02
#define STORE       3	// 03
#define SWAP        4	// 04
#define DROP        5	// 05
#define DUP         6	// 06
#define SLITERAL    7	// 07
#define JMP         8	// 08
#define JMPZ        9	// 09
#define JMPNZ      10	// 0A
#define CALL       0x9a	// 0B
#define RET        12	// 0C
#define OR         13	// 0D
#define CLITERAL   14	// 0E
#define CFETCH     15	// 0F
#define CSTORE     16	// 10
#define ADD        17	// 11
#define SUB        18	// 12
#define MUL        19	// 13
#define DIV        20	// 14
#define LT         21	// 15
#define EQ         22	// 16
#define GT         23	// 17
#define DICTP      24	// 18
#define EMIT       25	// 19
#define OVER       26	// 1A
#define COMPARE    27	// 1B  ( addr1 addr2 -- bool )
#define FOPEN      28	// 1C  ( name mode -- fp status ) - mode: 0 = read, 1 = write
#define FREAD      29	// 1D  ( addr num fp -- count ) - fp == 0 means STDIN
#define FREADLINE  30	// 1E  ( addr fp -- count )
#define FWRITE     31	// 1F  ( addr num fp -- ) - fp == 0 means STDIN
#define FCLOSE     32	// 20  ( fp -- )
#define DTOR       33	// 21  >R (Data To Return)
#define RTOD       34	// 22  R> (Return To Data)
#define LOGLEVEL   35	// 23
#define AND        36	// 24
#define PICK       37	// 25
#define DEPTH      38	// 26
#define GETCH      39	// 27
#define COMPAREI   40	// 28 ( addr1 addr2 -- bool )
#define SLASHMOD   41	// 29
#define NOT        42	// 2A ( val1 -- val2 )
#define RFETCH     43	// 2B ( addr -- val )
#define INC        44	// 2C 
#define RDEPTH     45	// 2D
#define DEC        46	// 2E 
#define GETTICK    47   // 2F
#define SHIFTLEFT  48   // 30
#define SHIFTRIGHT 49   // 31
#define PLUSSTORE  50   // 32
// unused 51-89
#define BRANCHF    90   // 5A
#define BRANCHFZ   91   // 5B
#define BRANCHFNZ  92   // 5C
#define BRANCHB    93   // 5D
#define BRANCHBZ   94   // 5E
#define BRANCHBNZ  95   // 5F
// unused 96-99
#define DBGDOT    100
#define DBGDOTS   101
#define INLINE    102
// unused 102-251
#define NOP       252	// FC
#define BREAK     253	// FD
#define RESET     254	// FE
#define BYE       255	// FF

#define DYNAMIC   0x100
// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

typedef unsigned char BYTE;
typedef unsigned long CELL;				// Use long for a 32-bit implementation, short for a 16-bit
// #define CELL long;				// Use long for a 32-bit implementation, short for a 16-bit
typedef int bool;
typedef char *String;

typedef struct {
	char *asm_instr;
	CELL opcode;
	char *forth_prim;
	void (*func)();
	BYTE flags;
} OPCODE_T;

// flags is a bit field:
#define IS_IMMEDIATE 0x01
#define IS_INLINE    0x02
#define IS_COMPILE   0x04
#define IS_HIDDEN    0x10

typedef struct {
	CELL next, XT;
	BYTE flags;
	BYTE len;
	char name[64];
} DICT_T;

typedef struct {
	CELL prev;
	CELL next;
	BYTE flags;
	BYTE len;
	char name[64];
} DICT_T_NEW;

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
#define MEM_SZ (MEM_SZ_KB * ONE_KB)

#define GETCELL(loc) *(CELL *)(loc)
#define SETCELL(loc, val) *(CELL *)(loc) = val

#define GETBYTE(loc) *(BYTE *)(loc)
#define SETBYTE(loc, val) *(BYTE *)(loc) = val

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
