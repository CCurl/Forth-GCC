#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <conio.h>
#include "forth-vm.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------
BYTE *the_memory;
long memory_size = 0;

CELL dStack[DSTACK_SZ], sp = 0;
CELL rStack[RSTACK_SZ], rsp = 0;

//CELL depth = 0;	// the data stack
//CELL *DSP = dStack, *DSS = dStack, *DSE = &(dStack[DSTACK_SZ-1]);

// CELL rdepth = 0;	// the return stack
// CELL *RSP = rStack, *RSS = rStack, *RSE = &(rStack[RSTACK_SZ-1]);

// CELL TOS = 0;					// The top element on the stack
#define TOS  dStack[sp]
#define NOS  dStack[sp-1]
#define RTOS rStack[rsp]

bool isEmbedded = false;
bool isBYE = false;

int _QUIT_HIT = 0;
int MEM_SZ = 0;

CELL src, dst;
CELL arg1, arg2, arg3;
HANDLE hStdin = NULL, hStdout = NULL;

static inline CELL GETTOS() { return TOS; }
static inline CELL GET2ND() { return NOS; }
static inline void SETTOS(CELL val) { TOS = (val); }
static inline void SET2ND(CELL val) { NOS = (val); }
// ------------------------------------------------------------------------------------------
void destroy_vm()
{
    if (the_memory)
    {
        free(the_memory);
        the_memory = (BYTE*) NULL;
    }
}

// ------------------------------------------------------------------------------------------
void init_vm(int vm_size)
{
    memory_size = vm_size > 0 ? vm_size : MEM_SZ;
    sp = rsp = 0;

    if (the_memory != NULL)
        free(the_memory);

    the_memory = malloc(memory_size);
    if (the_memory != NULL) {
        memset(the_memory, 0, memory_size);
        CELL_AT(ADDR_MEM_SZ) = memory_size;
    }
}

inline void push(CELL val) { dStack[++sp] = val; }
inline CELL pop() { return dStack[sp--]; }

inline void rpush(CELL val) { rStack[++rsp] = val; }
inline CELL rpop() { return rStack[rsp--]; }

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
#define NEXT goto next

void cpu_loop(CELL start)
{
    CELL PC = start;
    BYTE IR;
    int call_depth = 1;

    isBYE = false;
    TRACE("Running ... ");
 next:
    TRACE("(PC=%04lx, IR=%d)", PC-1, IR);
    switch (the_memory[PC++])
    {
    case LITERAL:
        push(CELL_AT(PC));
        TRACE("-LIT #%d ($%lx)-", TOS, TOS);
        PC += CELL_SZ;
        NEXT;
    case FETCH:
        TRACE("-FETCH ($%lx", TOS);
        TOS = CELL_AT(TOS);
        TRACE(",$%lx)-", TOS);
        NEXT;
    case STORE:
        arg2 = pop();
        arg1 = pop();
        TRACE("-STORE $%lx<-#%ld-", arg2, arg1);
        CELL_AT(arg2) = arg1;
        NEXT;
    case SWAP:
        arg1 = GET2ND();
        TRACE("-SWAP #%d,#%d-", arg1, TOS);
        SET2ND(TOS);
        TOS = arg1;
        NEXT;
    case DROP:
        TRACE("-DROP-");
        pop();
        NEXT;
    case DUP:
        TRACE("-DUP-");
        push(TOS);
        NEXT;
    case SLITERAL:
        TRACE("-SLIT %d,%s-", BYTE_AT(PC), (char *)(&the_memory[PC+1]));
        push(PC);
        PC += BYTE_AT(PC);
        PC += 2;
        NEXT;
    case JMP:
        PC = CELL_AT(PC);
        TRACE("-JMP to %lx-", PC);
        NEXT;
    case JMPZ:
        TRACE("-JMPZ to %lx-", CELL_AT(PC));
        if (pop())
            PC += CELL_SZ;
        else
            PC = CELL_AT(PC);
        NEXT;
    case JMPNZ:
        TRACE("-JMPNZ to %lx-", CELL_AT(PC));
        if (pop())
            PC = CELL_AT(PC);
        else
            PC += CELL_SZ;
        NEXT;
    case CALL:
        TRACE("-CALL %lx-", CELL_AT(PC));
        rpush(PC+CELL_SZ);
        PC = CELL_AT(PC);
        ++call_depth;
        NEXT;
    case RET:
        TRACE("-RET-");
        if (--call_depth < 1)		
            return;
        PC = rpop();
        NEXT;
    case OR:
        arg1 = pop();
        TOS |= arg1;
        NEXT;
    case CLITERAL:
        arg1 = the_memory[PC];
        TRACE("-CLIT #%d-", arg1);
        push(arg1);
        PC += 1;
        NEXT;
    case CFETCH:
        TRACE("-CFETCH (%lx),", TOS);
        TOS = the_memory[TOS];
        TRACE("#%d-", TOS);
        NEXT;
    case CSTORE:
        arg2 = pop();
        arg1 = pop();
        TRACE("-STORE %lx<-#%d-", arg2, arg1);
        the_memory[arg2] = (BYTE)arg1;
        NEXT;
    case ADD: NOS += TOS; --sp; NEXT;
    case SUB: NOS -= TOS; --sp; NEXT;
    case MUL: NOS *= TOS; --sp; NEXT;
    case DIV: NOS /= TOS; --sp; NEXT;
    case LT:
        arg1 = pop();
        TRACE("-LT %d<%d-", TOS, arg1);
        TOS = (TOS < arg1) ? -1 : 0 ;
        NEXT;
    case EQ:
        arg1 = pop();
        TRACE("-EQ %d==%d-", TOS, arg1);
        TOS = (TOS == arg1) ? -1 : 0 ;
        NEXT;
    case GT:
        arg1 = pop();
        TRACE("-GT %d>%d-", TOS, arg1);
        TOS = (TOS > arg1) ? -1 : 0 ;
        NEXT;
    case DICTP: PC += CELL_SZ; NEXT;
    case EMIT: putchar(pop()); NEXT;
    case OVER: push(NOS);      NEXT;
    case COMPARE:
        arg2 = pop();
        arg1 = pop();
        {
            char *cp1 = (char *)&the_memory[arg1];
            char *cp2 = (char *)&the_memory[arg2];
            arg3 = strcmp(cp1, cp2) ? 0 : 1;
            push(arg3);
        }
        NEXT;
    case COMPAREI:
        arg2 = pop();
        arg1 = pop();
        {
            char* cp1 = (char*)&the_memory[arg1];
            char* cp2 = (char*)&the_memory[arg2];
            arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
            push(arg3);
        }
        NEXT;
    case FOPEN:
        arg3 = pop();   // type: 0 => text, 1 => binary
        arg2 = pop();   // mode: 0 => read, 1 => write
        arg1 = pop();   // name
        {
            char *fileName = (char *)&the_memory[arg1 + 1];
            char mode[4];
            sprintf(mode, "%c%c", (arg2 == 0) ? 'r' : 'w', (arg3 == 0) ? 't' : 'b');
            TRACE("FOPEN %s, %s\n", fileName, mode);
            FILE *fp = fopen(fileName, mode);
            arg1 = (CELL) fp;
            push(arg1);
            push(fp != NULL ? 1 : 0);
        }
        NEXT;
    case FREAD:
        arg3 = pop();
        arg2 = pop();
        arg1 = pop();
        {
            BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
            int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
            push(num);
        }
        NEXT;
    case FREADLINE:
        arg3 = pop();		// FP - 0 means STDIN
        arg2 = pop();		// max-sz
        arg1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
        {
            char *tgt = (char *)&the_memory[arg1];
            FILE *fp = arg3 ? (FILE *)arg3 : stdin;
            char *pBuf = tgt;
            if (fgets((pBuf+1), arg2, fp) != (pBuf+1))
            {
                // printf("<EOF>\n");
                *(pBuf) = 0;
                *(pBuf+1) = (char)0;
                push(0);
                NEXT;
            }
            arg2 = (CELL)strlen(pBuf+1);
            // Strip off the trailing newline if there
            if ((arg2 > 0) && (pBuf[arg2] == '\n'))
            {
                pBuf[arg2--] = (char)NULL;
            }
            *(pBuf) = (char)(arg2);
            push((arg2 > 0) ? arg2 : 1);
            // printf("%d: [%s]\n", (int)pBuf[0], pBuf+1);
        }
        NEXT;
    case FWRITE:
        arg3 = pop();
        arg2 = pop();
        arg1 = pop();
        {
            BYTE *pBuf = (BYTE *)&the_memory[arg1];
            int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
            push(num);
        }
        NEXT;
    case FCLOSE:
        arg1 = pop();
        // printf("(fclose %lx)", arg1);
        if (arg1 != 0)
            fclose((FILE *)arg1);
        NEXT;
    case NOT: TOS = TOS == 0 ? -1 : 0;   NEXT;
    case COM: TOS = ~TOS;                NEXT;
    case AND: arg1 = pop(); TOS &= arg1; NEXT;
    case PICK: TOS = dStack[sp-TOS-1];   NEXT;
    case DEPTH: push(sp);                NEXT;
    case GETCH: push(_getch());          NEXT;
    case SLASHMOD:
        arg1 = NOS;
        arg2 = TOS;
        TOS = arg1/arg2;		// quotient
        NOS = arg1%arg2;		// remainder
        NEXT;
    case DTOR: rpush(pop());     NEXT;
    case RTOD: push(rpop());     NEXT;
    case RFETCH: push(RTOS);     NEXT;
    case RDEPTH: push(rsp);      NEXT;
    case INC: ++TOS;             NEXT;
    case DEC: --TOS;             NEXT;
    case GETTICK: push(clock()); NEXT;
    case SHIFTLEFT:
        arg1 = pop();
        TOS = TOS << (arg1 & 0x1F);
        NEXT;
    case SHIFTRIGHT:
        arg1 = pop();
        TOS = TOS >> (arg1 & 0x1F);
        NEXT;
    case PLUSSTORE:
        arg2 = pop();
        arg1 = pop();
        // arg3 = CELL_AT(arg2);
        CELL_AT(arg2) += arg1;
        NEXT;
    case OPENBLOCK:
        { 
            char fn[64];
            arg1 = pop();
            sprintf(fn, "block-%04d.fs", arg1);
            FILE *fp = fopen(fn, "rt");
            push((CELL)fp);
            push(TOS ? -1 : 0);
        }
        NEXT;
    case GOTOXY: 
        arg1 = pop();
        arg2 = pop();
        printf("%c[%d;%dH", 27, arg1, arg2);
        NEXT;
    case TOSRC: src = pop();                  NEXT;
    case SRCQ: push(src);                     NEXT;
    case SRCP4: push(CELL_AT(src)); src += 4; NEXT;
    case SRCP1: push(BYTE_AT(src++));         NEXT;
    case TODST: dst = pop();                  NEXT;
    case DSTQ: push(dst);                     NEXT;
    case DSTP4: CELL_AT(dst)=pop(); dst += 4; NEXT;
    case DSTP1: BYTE_AT(dst++) = pop()&0xFF;  NEXT;
    case DBGDOT: printf("[%d] ", pop());      NEXT;
    case DBGDOTS:
        printf("(%d)[", sp);
        for (int i = 1; i < sp; i++)
        {
            printf("(%d)",dStack[i]);
        }
        printf("]");
        NEXT;
    case NOP:   NEXT;
    case BREAK: NEXT;
    case RESET:
        printf("-RESET at $%04lX-", PC-1);
        PC = 0;
        //DSP = dStack;
        sp = rsp = 0;
        NEXT;
    case BYE: return;
    default:
        IR = the_memory[PC-1];
        printf("-unknown inst %d at %lx-", IR, PC-1);
        NEXT;
    }
    return;
}
