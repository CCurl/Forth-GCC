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
BYTE *the_bytes;
CELL *the_cells;
long memory_size = 0;

CELL dStack[DSTACK_SZ], sp = 0;
CELL rStack[RSTACK_SZ], rsp = 0;

#define TOS     dStack[sp]
#define NOS     dStack[sp-1]
#define RTOS    rStack[rsp]
#define DROP1   sp--
#define DROP2   sp-=2

int isEmbedded = false;
int isBYE = false;

int MEM_SZ = 0;

CELL src, dst, t1, t2, t3;

// ------------------------------------------------------------------------------------------
void init_vm(int vm_size)
{
    memory_size = vm_size > 0 ? vm_size : MEM_SZ;
    sp = rsp = 0;

    if (the_bytes != NULL)
        free(the_bytes);

    the_bytes = malloc(memory_size);
    the_cells = (CELL*)the_bytes;
    if (the_bytes != NULL) {
        memset(the_bytes, 0, memory_size);
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
    isBYE = false;
 
next:
    switch (the_bytes[PC++]) {
    case LITERAL: push(CELL_AT(PC));
        PC += CELL_SZ;
        NEXT;
    case FETCH: TOS = CELL_AT(TOS);
        NEXT;
    case STORE: CELL_AT(TOS) = NOS;
        DROP2;
        NEXT;
    case SWAP: t1 = NOS;
        NOS = TOS;
        TOS = t1;
        NEXT;
    case DROP: pop();    NEXT;
    case DUP: push(TOS); NEXT;
    case CTYPE: t1=pop();
        t2 = BYTE_AT(t1++);
        for (int x=0; x<t2; x++) { putchar(BYTE_AT(t1++)); }
        NEXT;
    case JMP: PC = CELL_AT(PC); NEXT;
    case JMPZ: if (pop()) PC += CELL_SZ;
        else PC = CELL_AT(PC);
        NEXT;
    case JMPNZ: if (pop()) PC = CELL_AT(PC);
        else PC += CELL_SZ;
        NEXT;
    case CALL: rpush(PC+CELL_SZ);
        PC = CELL_AT(PC);
        NEXT;
    case RET: if (rsp < 1) return;
        PC = rpop();
        NEXT;
    case CLITERAL: push(the_bytes[PC++]); NEXT;
    case CFETCH: TOS = the_bytes[TOS];    NEXT;
    case CSTORE: the_bytes[TOS] = (BYTE)NOS;
        DROP2;
        NEXT;
    case ADD: NOS += TOS; DROP1; NEXT;
    case SUB: NOS -= TOS; DROP1; NEXT;
    case MUL: NOS *= TOS; DROP1; NEXT;
    case DIV: NOS /= TOS; DROP1; NEXT;
    case LT: NOS = (NOS  < TOS) ? -1 : 0 ;  DROP1;  NEXT;
    case EQ: NOS = (NOS == TOS) ? -1 : 0 ;  DROP1;  NEXT;
    case GT: NOS = (NOS  > TOS) ? -1 : 0 ;  DROP1;  NEXT;
    case DICTP: PC += CELL_SZ; NEXT;
    case EMIT: putchar(pop()); NEXT;
    case OVER: push(NOS);      NEXT;
    case COMPARE:
        t2 = pop();
        t1 = pop();
        {
            char *cp1 = (char *)&the_bytes[t1];
            char *cp2 = (char *)&the_bytes[t2];
            t3 = strcmp(cp1, cp2) ? 0 : 1;
            push(t3);
        }
        NEXT;
    case COMPAREI:
        t2 = pop();
        t1 = pop();
        {
            char* cp1 = (char*)&the_bytes[t1];
            char* cp2 = (char*)&the_bytes[t2];
            t3 = _strcmpi(cp1, cp2) ? 0 : 1;
            push(t3);
        }
        NEXT;
    case FOPEN:
        t3 = pop();   // type: 0 => text, 1 => binary
        t2 = pop();   // mode: 0 => read, 1 => write
        t1 = pop();   // name
        {
            char *fileName = (char *)&the_bytes[t1 + 1];
            char mode[4];
            sprintf(mode, "%c%c", (t2 == 0) ? 'r' : 'w', (t3 == 0) ? 't' : 'b');
            FILE *fp = fopen(fileName, mode);
            t1 = (CELL) fp;
            push(t1);
            push(fp != NULL ? 1 : 0);
        }
        NEXT;
    case FREAD:
        t3 = pop();
        t2 = pop();
        t1 = pop();
        {
            BYTE *pBuf = (BYTE *)&the_bytes[t1 + 1];
            int num = fread(pBuf, sizeof(BYTE), t2, (t3 == 0) ? stdin : (FILE *)t3);
            push(num);
        }
        NEXT;
    case FREADLINE:
        t3 = pop();		// FP - 0 means STDIN
        t2 = pop();		// max-sz
        t1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
        {
            char *tgt = (char *)&the_bytes[t1];
            FILE *fp = t3 ? (FILE *)t3 : stdin;
            char *pBuf = tgt;
            if (fgets((pBuf+1), t2, fp) != (pBuf+1))
            {
                // printf("<EOF>\n");
                *(pBuf) = 0;
                *(pBuf+1) = (char)0;
                push(0);
                NEXT;
            }
            t2 = (CELL)strlen(pBuf+1);
            // Strip off the trailing newline if there
            if ((t2 > 0) && (pBuf[t2] == '\n'))
            {
                pBuf[t2--] = (char)NULL;
            }
            *(pBuf) = (char)(t2);
            push((t2 > 0) ? t2 : 1);
            // printf("%d: [%s]\n", (int)pBuf[0], pBuf+1);
        }
        NEXT;
    case FWRITE:
        t3 = pop();
        t2 = pop();
        t1 = pop();
        {
            BYTE *pBuf = (BYTE *)&the_bytes[t1];
            int num = fwrite(pBuf, sizeof(BYTE), t2, t3 == 0 ? stdin : (FILE *)t3);
            push(num);
        }
        NEXT;
    case FCLOSE:
        t1 = pop();
        // printf("(fclose %lx)", arg1);
        if (t1 != 0)
            fclose((FILE *)t1);
        NEXT;
    case NOT: TOS = TOS == 0 ? -1 : 0;   NEXT;
    case COM: TOS = ~TOS;                NEXT;
    case AND: NOS &= TOS; DROP1;         NEXT;
    case OR: NOS |= TOS; DROP1;          NEXT;
    case XOR: NOS ^= TOS; DROP1;         NEXT;
    case PICK: TOS = dStack[sp-TOS-1];   NEXT;
    case DEPTH: push(sp);                NEXT;
    case GETCH: push(_getch());          NEXT;
    case SLASHMOD:
        t1 = NOS;
        t2 = TOS;
        TOS = t1/t2;		// quotient
        NOS = t1%t2;		// remainder
        NEXT;
    case DTOR: rpush(pop());     NEXT;
    case RTOD: push(rpop());     NEXT;
    case RFETCH: push(RTOS);     NEXT;
    case RDEPTH: push(rsp);      NEXT;
    case INC: ++TOS;             NEXT;
    case DEC: --TOS;             NEXT;
    case TIMER: push(clock()); NEXT;
    case SHIFTLEFT:
        t1 = pop();
        TOS = TOS << (t1 & 0x1F);
        NEXT;
    case SHIFTRIGHT:
        t1 = pop();
        TOS = TOS >> (t1 & 0x1F);
        NEXT;
    case PLUSSTORE:
        t2 = pop();
        t1 = pop();
        // arg3 = CELL_AT(arg2);
        CELL_AT(t2) += t1;
        NEXT;
    case OPENBLOCK:
        { 
            char fn[64];
            t1 = pop();
            sprintf(fn, "block-%04d.fs", t1);
            FILE *fp = fopen(fn, "rt");
            push((CELL)fp);
            push(TOS ? -1 : 0);
        }
        NEXT;
    case GOTOXY:
        t1 = pop();
        t2 = pop();
        printf("%c[%d;%dH", 27, t1, t2);
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
        for (int i = 1; i < sp; i++) {
            printf("(%d)",dStack[i]);
        }
        printf("]");
        NEXT;
    case NOP:   NEXT;
    case BREAK: NEXT;
    case RESET:
        printf("-RESET at $%04lX-", PC-1);
        PC = 0;
        sp = rsp = 0;
        NEXT;
    case BYE: return;
    default:
        printf("-unknown inst %d at %lx-", the_bytes[PC-1], PC-1);
        NEXT;
    }
    return;
}
