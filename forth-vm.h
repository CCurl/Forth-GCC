#include "Shared.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------

extern CELL t1, t2, t3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer
extern CELL TOS; // The top of the stack

extern bool isEmbedded;
extern bool isBYE;
extern BYTE *the_memory;
extern long memory_size;

// ------------------------------------------------------------------------------------------
extern void push(CELL);
extern CELL pop();
extern void rpush(CELL);
extern CELL rpop();
extern void create_vm();
extern void destroy_vm();
extern void init_vm(int);
extern void reset_vm();
extern void cpu_loop(CELL);