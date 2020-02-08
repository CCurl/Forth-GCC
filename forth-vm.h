#include "Shared.h"
#include "logger.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------

extern CELL PC;		// The "program counter"
extern BYTE IR;		// The "instruction register"

extern CELL *dsp_init;
extern CELL *rsp_init;
extern CELL arg1, arg2, arg3;

extern CELL *RSP; // the return stack pointer
extern CELL *DSP; // the data stack pointer

extern bool isEmbedded;
extern bool isBYE;
extern BYTE *the_memory;
extern long memory_size;

// ------------------------------------------------------------------------------------------
extern void create_vm(long);
extern void destroy_vm();
extern void init_vm(int);
extern void reset_vm();
extern CELL cpu_step();
extern CELL cpu_loop();
