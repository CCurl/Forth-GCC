#ifndef __FORTH_SHARED__
#define __FORTH_SHARED__

// ************************************************************************************************
// The VM's instruction set
// ************************************************************************************************
#define LITERAL    1	// 01
#define FETCH      2	// 02
#define STORE      3	// 03
#define SWAP       4	// 04
#define DROP       5	// 05
#define DUP        6	// 06
#define SLITERAL   7	// 07
#define JMP        8	// 08
#define JMPZ       9	// 09
#define JMPNZ     10	// 0A
#define CALL      11	// 0B
#define RET       12	// 0C
#define OR		  13	// 0D
#define CLITERAL  14	// 0E
#define CFETCH    15	// 0F
#define CSTORE    16	// 10
#define ADD       17	// 11
#define SUB       18	// 12
#define MUL       19	// 13
#define DIV       20	// 14
#define LT        21	// 15
#define EQ        22	// 16
#define GT        23	// 17
#define DICTP     24	// 18
#define EMIT      25	// 19
#define OVER      26	// 1A
#define COMPARE   27	// 1B  ( addr1 addr2 -- bool )
#define FOPEN     28	// 1C  ( name mode -- fp status ) - mode: 0 = read, 1 = write
#define FREAD     29	// 1D  ( addr num fp -- count ) - fp == 0 means STDIN
#define FREADLINE 30	// 1E  ( addr fp -- count )
#define FWRITE    31	// 1F  ( addr num fp -- ) - fp == 0 means STDIN
#define FCLOSE    32	// 20  ( fp -- )
#define DTOR      33	// 21  >R (Data To Return)
#define RTOD      34	// 22  R> (Return To Data)
#define LOGLEVEL  35    // 23
#define AND       36	// 24
#define PICK      37	// 25
#define DEPTH     38	// 26
#define GETCH     39	// 27
#define COMPAREI  40	// 28 ( addr1 addr2 -- bool )
#define BREAK    253	// FD
#define RESET    254	// FE
#define BYE      255	// FF

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
} OPCODE_T;

// flags is a bit field:
#define IS_IMMEDIATE 0x01
#define IS_INLINE    0x02
#define IS_OPCODE    0x04

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

#define ADDR_BASE  0x06
#define ADDR_CELL  0x07
#define ADDR_HERE  0x10
#define ADDR_LAST  0x14

#define ONE_KB (1024)
#define ONE_MB (ONE_KB * ONE_KB)
#define MEM_SZ (64*ONE_KB)

//#define RSP_BASE (MEM_SZ - RSTACK_SZ)				// Start address of the return stack
//#define RSP_INIT (MEM_SZ - STACK_BUF_SZ)			// Initial value of the return stack pointer

//#define DSP_BASE ((MEM_SZ) - RSTACK_SZ - DSTACK_SZ)	// Start address of the data stack
//#define DSP_INIT (DSP_BASE + STACK_BUF_SZ)			// Initial value of the data stack pointer

#define GETAT(loc) *(CELL *)(&the_memory[loc])
#define SETAT(loc, val) *(CELL *)(&the_memory[loc]) = val

#define GETTOS() *(DSP-1)
#define GET2ND() *(DSP-2)
#define SETTOS(val) *(DSP-1) = (val)
#define SET2ND(val) *(DSP-2) = (val)

// #define push(val) *(++DSP) = (CELL)(val)
// #define pop() *(DSP--)

// #define rpush(val) *(--RSP) = (CELL)(val)
// #define rpop() *(RSP++)

#define _T(x) x

#define true 1
#define false 0

#define LPCTSTR char *

#endif
