#include "Shared.h"
#include "logger.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------

extern CELL PC;		// The "program counter"
extern BYTE IR;		// The "instruction register"

// extern CELL *dsp_init;
// extern CELL *rsp_init;
extern CELL arg1, arg2, arg3;

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
extern CELL cpu_step();
extern CELL cpu_loop();
