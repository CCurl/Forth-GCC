#include <winbase.h>
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include "forth-vm.h"

// ------------------------------------------------------------------------------------------
// The VM
// ------------------------------------------------------------------------------------------
BYTE *the_memory;
long memory_size = 0;

CELL dStack[DSTACK_SZ];
CELL rStack[RSTACK_SZ];

CELL depth = 0;	// the data stack
CELL *DSP = dStack, *DSS = dStack, *DSE = &(dStack[DSTACK_SZ-1]);

CELL rdepth = 0;	// the return stack
CELL *RSP = rStack, *RSS = rStack, *RSE = &(rStack[RSTACK_SZ-1]);

CELL TOS = 0;					// The top element on the stack

bool isEmbedded = false;
bool isBYE = false;

int _QUIT_HIT = 0;
int MEM_SZ = 0;

CELL src, dst;
CELL arg1, arg2, arg3;
HANDLE hStdin = NULL, hStdout = NULL;

static inline CELL GETTOS() { return TOS; }
static inline CELL GET2ND() { return *(DSP); }
static inline void SETTOS(CELL val) { TOS = (val); }
static inline void SET2ND(CELL val) { *(DSP) = (val); }

// ------------------------------------------------------------------------------------------
void create_vm()
{
	if (the_memory != (BYTE*) NULL)
		free(the_memory);

	the_memory = malloc(memory_size);
	memset(the_memory, 0, memory_size);
}

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

	create_vm();
	CELL_AT(ADDR_MEM_SZ) = memory_size;
}

// ------------------------------------------------------------------------------------------
void push(CELL val)
{
	++depth;
	if (++DSP > DSE) DSP = DSS;
	*(DSP) = TOS;
	TOS = val;
}

CELL pop()
{
	CELL val = TOS;
	--depth;
	TOS = (*DSP);
	if (--DSP < DSS) DSP = DSE;
	return val;
}

// ------------------------------------------------------------------------------------------
void rpush(CELL val)
{
	// printf("(rsp=%lx", RSP);
	if (++RSP > RSE) RSP = RSS;
	*(RSP) = val;
	// printf(",%lx),", RSP);
	++rdepth;
}

CELL rpop()
{
	// printf("(rsp=%lx", RSP);
	CELL val = *(RSP);
	if (--RSP < RSS) RSP = RSE;
	// printf(",%lx),", RSP);
	--rdepth;
	return val;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
void cpu_loop(CELL start)
{
	CELL PC = start;
	BYTE IR;
	int call_depth = 1;

	isBYE = false;
	TRACE("Running ... ");
	while (true)
	{
		IR = the_memory[PC++];
		TRACE("(PC=%04lx, IR=%d)", PC-1, IR);
		switch (IR)
		{
		case LITERAL:
			arg1 = CELL_AT(PC);
			TRACE("-LIT #%d ($%lx)-", arg1, arg1);
			push(arg1);
			PC += CELL_SZ;
			break;
		case FETCH:
			TRACE("-FETCH ($%lx", TOS);
			TOS = CELL_AT(TOS);
			TRACE(",$%lx)-", TOS);
			break;
		case STORE:
			arg2 = pop();
			arg1 = pop();
			TRACE("-STORE $%lx<-#%ld-", arg2, arg1);
			CELL_AT(arg2) = arg1;
			break;
		case SWAP:
			arg1 = GET2ND();
			TRACE("-SWAP #%d,#%d-", arg1, TOS);
			SET2ND(TOS);
			TOS = arg1;
			break;
		case DROP:
			TRACE("-DROP-");
			pop();
			break;
		case DUP:
			TRACE("-DUP-");
			push(TOS);
			break;
		case SLITERAL:
			TRACE("-SLIT %d,%s-", BYTE_AT(PC), (char *)(&the_memory[PC+1]));
			push(PC);
			PC += BYTE_AT(PC);
			PC += 2;
			break;
		case JMP:
			PC = CELL_AT(PC);
			TRACE("-JMP to %lx-", PC);
			break;
		case JMPZ:
			TRACE("-JMPZ to %lx-", CELL_AT(PC));
			arg1 = pop();
			if (arg1)
				PC += CELL_SZ;
			else
				PC = CELL_AT(PC);
			break;
		case JMPNZ:
			TRACE("-JMPNZ to %lx-", CELL_AT(PC));
			arg1 = pop();
			if (arg1)
				PC = CELL_AT(PC);
			else
				PC += CELL_SZ;
			break;
		case CALL:
			TRACE("-CALL %lx-", CELL_AT(PC));
			rpush(PC+CELL_SZ);
			PC = CELL_AT(PC);
			++call_depth;
			break;
		case RET:
			TRACE("-RET-");
			if (--call_depth < 1)		
				return;
			PC = rpop();
			break;
		case OR:
			arg1 = pop();
			TOS |= arg1;
			break;
		case CLITERAL:
			arg1 = the_memory[PC];
			TRACE("-CLIT #%d-", arg1);
			push(arg1);
			PC += 1;
			break;
		case CFETCH:
			TRACE("-CFETCH (%lx),", TOS);
			TOS = the_memory[TOS];
			TRACE("#%d-", TOS);
			break;
		case CSTORE:
			arg2 = pop();
			arg1 = pop();
			TRACE("-STORE %lx<-#%d-", arg2, arg1);
			the_memory[arg2] = (BYTE)arg1;
			break;
		case ADD:
			arg1 = pop();
			TOS += arg1;
			break;
		case SUB:
			arg1 = pop();
			TOS -= arg1;
			break;
		case MUL:
			arg1 = pop();
			TOS *= arg1;
			break;
		case DIV:
			arg1 = pop();
			TOS /= arg1;
			break;
		case LT:
			arg1 = pop();
			TRACE("-LT %d<%d-", TOS, arg1);
			TOS = (TOS < arg1) ? -1 : 0 ;
			break;
		case EQ:
			arg1 = pop();
			TRACE("-EQ %d==%d-", TOS, arg1);
			TOS = (TOS == arg1) ? -1 : 0 ;
			break;
		case GT:
			arg1 = pop();
			TRACE("-GT %d>%d-", TOS, arg1);
			TOS = (TOS > arg1) ? -1 : 0 ;
			break;
		case DICTP:
			PC += CELL_SZ;
			break;
		case EMIT:
			arg1 = pop();
			putchar(arg1);
			break;
		case OVER:
			arg1 = GET2ND();
			push(arg1);
			break;
		case COMPARE:
			arg2 = pop();
			arg1 = pop();
			{
				char *cp1 = (char *)&the_memory[arg1];
				char *cp2 = (char *)&the_memory[arg2];
				arg3 = strcmp(cp1, cp2) ? 0 : 1;
				push(arg3);
			}
			break;
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
			break;
		case FREAD:
			arg3 = pop();
			arg2 = pop();
			arg1 = pop();
			{
				BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
				int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
				push(num);
			}
			break;
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
					break;
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
			break;
		case FWRITE:
			arg3 = pop();
			arg2 = pop();
			arg1 = pop();
			{
				BYTE *pBuf = (BYTE *)&the_memory[arg1];
				int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
				push(num);
			}
			break;
		case FCLOSE:
			arg1 = pop();
			// printf("(fclose %lx)", arg1);
			if (arg1 != 0)
				fclose((FILE *)arg1);
			break;
		case DTOR:
			rpush(pop());
			break;
		case RTOD:
			push(rpop());
			break;
		case COM:
			TOS = ~TOS;
			break;
		case AND:
			arg1 = pop();
			TOS &= arg1;
			break;
		case PICK:
			arg1 = TOS;
			TOS = *(DSP - (arg1));
			break;
		case DEPTH:
			push(depth);
			break;
		case GETCH:
			push(getch());
			break;
		case COMPAREI:
			arg2 = pop();
			arg1 = pop();
			{
				char *cp1 = (char *)&the_memory[arg1];
				char *cp2 = (char *)&the_memory[arg2];
				arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
				push(arg3);
			}
			break;
		case SLASHMOD:
			arg1 = GET2ND();
			arg2 = GETTOS();
			SET2ND(arg1%arg2);		// remainder
			SETTOS(arg1/arg2);		// quotient
			break;
		case NOT:
			TOS = TOS == 0 ? -1 : 0;
			break;
		case RFETCH:
			push(*RSP);
			break;
		case INC:
			++TOS;
			break;
		case RDEPTH:
			push(rdepth);
			break;
		case DEC:
			--TOS;
			break;
		case GETTICK:
			arg1 = GetTickCount();
			push(arg1);
			break;
		case SHIFTLEFT:
		arg1 = pop();
		TOS = TOS << (arg1 & 0x1F);
			break;
		case SHIFTRIGHT:
			arg1 = pop();
			TOS = TOS >> (arg1 & 0x1F);
			break;
		case PLUSSTORE:
			arg2 = pop();
			arg1 = pop();
			// arg3 = CELL_AT(arg2);
			CELL_AT(arg2) += arg1;
			break;
		case OPENBLOCK:
			{ 
				char fn[64];
				arg1 = pop();
				sprintf(fn, "block-%04d.fs", arg1);
				FILE *fp = fopen(fn, "rt");
				push((CELL)fp);
				push(TOS ? -1 : 0);
			}
			break;
		case GOTOXY:
			{
				if (hStdout == NULL) {
					hStdin  = GetStdHandle(STD_INPUT_HANDLE);
					hStdout = GetStdHandle(STD_OUTPUT_HANDLE);
				}
				COORD pos;
				arg1 = pop();
				arg2 = pop();
				pos.Y = (short)arg2;
				pos.X = (short)arg1;
				SetConsoleCursorPosition(hStdout, pos);
			}
			break;
		case TOSRC:
			src = pop();
			break;
		case SRCQ:
			push(src);
			break;
		case SRCP4:
			push(CELL_AT(src));
			src += 4;
			break;
		case SRCP1:
			push(BYTE_AT(src));
			++src;
			break;
		case TODST:
			dst = pop();
			break;
		case DSTQ:
			push(dst);
			break;
		case DSTP4:
			arg1 = pop();
			CELL_AT(dst) = arg1;
			dst += 4;
			break;
		case DSTP1:
			arg1 = pop();
			BYTE_AT(dst) = arg1 & 0xFF;
			dst += 1;
			break;
		case DBGDOT:
			arg1 = pop();
			printf("[%d] ", arg1);
			break;
		case DBGDOTS:
			printf("(%d)[", depth);
			for (int i = 0; i < depth; i++)
			{
				printf("(%d)",i);
				push(i);
				pop();
			}
			printf("]");
			break;
		case NOP:
			break;
		case BREAK:
			break;
		case RESET:
			printf("-RESET at $%04lX-", PC-1);
			PC = 0;
			DSP = dStack;
			depth = 0;
			break;
		case BYE:
			return;
		default:
			printf("-unknown inst %d at %lx-", IR, PC-1);
			break;
		}
	}
	return;
}
