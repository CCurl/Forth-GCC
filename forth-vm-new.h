#ifndef __FORTH_VM__
#define __FORTH_VM__

#include "Shared-new.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------

extern CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL TOS; // The top of the stack

extern int isEmbedded;
extern int isBYE;
extern BYTE *the_memory;
extern long memory_size;

// ------------------------------------------------------------------------------------------
extern void push(CELL);
extern CELL pop();
extern void rpush(CELL);
extern CELL rpop();
extern void create_vm(int);
extern void destroy_vm();
extern void cpu_loop(CELL);

#endif
