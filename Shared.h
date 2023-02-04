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
#define CALL       11	// 0B
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
#define COMPARE    27	// 1B  ( addr1 addr2 -- int )
#define FOPEN      28	// 1C  ( name mode -- fp status ) - mode: 0 = read, 1 = write
#define FREAD      29	// 1D  ( addr num fp -- count ) - fp == 0 means STDIN
#define FREADLINE  30	// 1E  ( addr fp -- count )
#define FWRITE     31	// 1F  ( addr num fp -- ) - fp == 0 means STDIN
#define FCLOSE     32	// 20  ( fp -- )
#define DTOR       33	// 21  >R (Data To Return)
#define RTOD       34	// 22  R> (Return To Data)
#define COM        35	// 23
#define AND        36	// 24
#define PICK       37	// 25
#define DEPTH      38	// 26
#define GETCH      39	// 27
#define COMPAREI   40	// 28 ( addr1 addr2 -- int )
#define SLASHMOD   41	// 29
#define NOT        42	// 2A ( val1 -- val2 )
#define RFETCH     43	// 2B ( addr -- val )
#define INC        44	// 2C 
#define RDEPTH     45	// 2D
#define DEC        46	// 2E 
#define TIMER    47   // 2F
#define SHIFTLEFT  48   // 30
#define SHIFTRIGHT 49   // 31
#define PLUSSTORE  50   // 32
#define OPENBLOCK  51   // 33
#define GOTOXY     52   // 34
#define TOSRC      53   // 35
#define SRCQ       54   // 36
#define SRCP4      55   // 37
#define SRCP1      56   // 38
#define TODST      57   // 39
#define DSTQ       58   // 3A
#define DSTP4      59   // 3B
#define DSTP1      60   // 3C
#define XOR        61   // 3D
// unused 61-99
#define DBGDOT    100
#define DBGDOTS   101
// unused 102-251
#define NOP       252	// FC
#define BREAK     253	// FD
#define RESET     254	// FE
#define BYE       255	// FF

// ************************************************************************************************
// ************************************************************************************************
// ************************************************************************************************

typedef unsigned char BYTE;
typedef long CELL;				// Use long for a 32-bit implementation, short for a 16-bit
// #define CELL long;				// Use long for a 32-bit implementation, short for a 16-bit
//typedef int int;
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

#define DSTACK_SZ 64
#define RSTACK_SZ 64

// extern CELL ADDR_CELL;     // 0x08
// extern CELL ADDR_HERE;     // 0x10
// extern CELL ADDR_LAST;     // 0x14
// extern CELL ADDR_BASE;     // 0x18
// extern CELL ADDR_STATE;    // 0x20
// extern CELL ADDR_MEM_SZ;   // 0x24

#define ONE_KB (1024)
#define ONE_MB (ONE_KB * ONE_KB)
extern int MEM_SZ;

#define CELL_AT(loc) *(CELL *)(&the_bytes[loc])
#define BYTE_AT(loc) (the_bytes[loc])

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
