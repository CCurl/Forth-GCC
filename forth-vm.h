#include "Shared.h"
#include "logger.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------

extern CELL PC;		// The "program counter"
extern CELL IR;		// The "instruction register"

// extern CELL *dsp_init;
// extern CELL *rsp_init;
extern CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL TOS; // The top of the stack

extern bool isEmbedded;
extern bool isBYE;
extern BYTE the_memory[];
extern long memory_size;
extern OPCODE_T theOpcodes[];
extern void (*vm_prims[])();
extern void init_vm_vectors();

// ------------------------------------------------------------------------------------------
extern void push(CELL);
extern CELL pop();
extern void rpush(CELL);
extern CELL rpop();
extern void create_vm();
extern void destroy_vm();
extern void init_vm(int);
extern void reset_vm();
extern CELL cpu_step();
extern CELL cpu_loop();
extern CELL GetXT(CELL);





extern void prim_LITERAL();
extern void prim_FETCH();
extern void prim_STORE();
extern void prim_SWAP();
extern void prim_DROP();
extern void prim_DUP();
extern void prim_SLITERAL();
extern void prim_JMP();
extern void prim_JMPZ();
extern void prim_JMPNZ();
extern void prim_CALL();
extern void prim_RET();
extern void prim_OR();
extern void prim_CLITERAL();
extern void prim_CFETCH();
extern void prim_CSTORE();
extern void prim_ADD();
extern void prim_SUB();
extern void prim_MUL();
extern void prim_DIV();
extern void prim_LT();
extern void prim_EQ();
extern void prim_GT();
extern void prim_DICTP();
extern void prim_EMIT();
extern void prim_OVER();
extern void prim_COMPARE();
extern void prim_FOPEN();
extern void prim_FREAD();
extern void prim_FREADLINE();
extern void prim_FWRITE();
extern void prim_FCLOSE();
extern void prim_DTOR();
extern void prim_RTOD();
extern void prim_LOGLEVEL();
extern void prim_AND();
extern void prim_PICK();
extern void prim_DEPTH();
extern void prim_GETCH();
extern void prim_COMPAREI();
extern void prim_SLASHMOD();
extern void prim_NOT();
extern void prim_RFETCH();
extern void prim_INC();
extern void prim_RDEPTH();
extern void prim_DEC();
extern void prim_GETTICK();
extern void prim_SHIFTLEFT();
extern void prim_SHIFTRIGHT();
extern void prim_PLUSSTORE();
extern void prim_BRANCHF();
extern void prim_BRANCHFZ();
extern void prim_BRANCHFNZ();
extern void prim_BRANCHB();
extern void prim_BRANCHBZ();
extern void prim_BRANCHBNZ();
extern void prim_DBGDOT();
extern void prim_DBGDOTS();
extern void prim_NOP();
extern void prim_BREAK();
extern void prim_RESET();
extern void prim_BYE();
extern void prim_INLINE();
extern void prim_IMMEDIATE();
extern void prim_LOAD();
extern void prim_CREATE();
extern void prim_VARIABLE();
extern void prim_COMMA();
extern void prim_CCOMMA();
extern void prim_QCOMMA();
extern void prim_PARSELINE();
extern void prim_GETLINE();
