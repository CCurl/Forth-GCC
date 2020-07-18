#include <winbase.h>
#include <stdio.h>
#include <memory.h>
#include <conio.h>
#include <stdio.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

extern CELL dStack[];
extern CELL rStack[];

static inline CELL GETTOS() { return TOS; }
static inline CELL GET2ND() { return *(DSP); }
static inline void SETTOS(CELL val) { TOS = (val); }
static inline void SET2ND(CELL val) { *(DSP) = (val); }

void (*vm_prims[257])();

CELL arg1, arg2, arg3;

extern CELL *rsp_init;
extern CELL *dsp_init;

extern CELL BASE, HERE, LAST, STATE;

extern BYTE the_memory[];
extern int __DEBUG__;
extern int _QUIT_HIT;
extern FILE *input_fp;
extern char input_fn[];
extern void Compile(FILE *);
extern void DefineWord(char *, BYTE);
extern void Comma(CELL);
extern char *GetWord(char *, char *);
extern char *ParseWord(char *, char *);
extern int string_rtrim(char *);

inline void push(CELL val) 
{ 
	*(++DSP) = TOS;
	TOS = val;
	++depth;
}

inline CELL pop()
{
	 CELL val = TOS; 
	 TOS = *(DSP--); 
	--depth;
	 return val; 
}

// The return stack starts at (MEM_SZ) and grows downwards towards the data stack
void rpush(CELL val)
{
	*(--RSP) = (CELL)(val);
	++rdepth;
}

CELL rpop()
{
	--rdepth;
	return *(RSP++);
}

void checkStacks()
{
	bool isOK = true;
	if (depth < 0)
	{
		printf(" stack underflow! (at PC=0x%08lx)", PC-CELL_SZ);
		isOK = false;
	}
	if (rdepth < 0)
	{
		printf(" return stack underflow! (at PC=0x%08lx)", PC-CELL_SZ);
		isOK = false;
	}
	if (depth > DSTACK_SZ)
	{
		printf(" stack overflow! (at PC=0x%08lx)", PC-CELL_SZ);
		isOK = false;
	}
	if (rdepth > RSTACK_SZ)
	{
		printf(" return stack overflow! (at PC=0x%08lx)", PC-CELL_SZ);
		isOK = false;
	}

	if (! isOK)
		isBYE = isEmbedded;
	else
		PC = (CELL)the_memory;
}

// Unknown - Doeswhat
void prim_Unknown()
{
    printf("Unknown instruction at addr: 0x%04lx, (0x%02x)", PC-1, IR);
    reset_vm();
	// isBYE = true;
}

void init_vm_vectors()
{
    memset(vm_prims, 0, sizeof(vm_prims));
    for (int i = 0; i < 256; i++)
    {
        vm_prims[i] = prim_Unknown;
    }
	OPCODE_T *op = theOpcodes;
	while (op->opcode > 0)
	{
		vm_prims[op->opcode] = op->func;
		++op;
	}
}

// LITERAL - Doeswhat
void prim_LITERAL()
{
	arg1 = GETCELL(PC);
	// trace("LITERAL (%d, 0x%04lx)\n", arg1, arg1);
	PC += CELL_SZ;
	push(arg1);
}

// FETCH - Doeswhat
void prim_FETCH()
{
	// printf("FETCH (from 0x%04lx - %04lx)\n", TOS, GETCELL(TOS));
    TOS = GETCELL(TOS);
}

// STORE - Doeswhat
void prim_STORE()
{
    arg2 = pop();
    arg1 = pop();
	// printf("STORE (0x%04lx to 0x%04lx)\n", arg1, arg2);
    SETCELL(arg2, arg1);
}

// SWAP - Doeswhat
void prim_SWAP()
{
    arg1 = GET2ND();
    SET2ND(TOS);
    SETTOS(arg1);
}

// DROP - Doeswhat
void prim_DROP()
{
   	pop();
}

// DUP - Doeswhat
void prim_DUP()
{
   	push(TOS);
}

// SLITERAL - Doeswhat
void prim_SLITERAL()
{
	// trace("SLITERAL\n");
	arg1 = GETBYTE(PC); // count-byte
	push(PC);
	PC += (arg1 + 2); // +2 => count-byte and NULL-terminator
}

// JMP - Doeswhat
void prim_JMP()
{
	PC = GETCELL(PC);
	// trace("JMP (to %04lx)\n", PC);
}

// JMPZ - Doeswhat
void prim_JMPZ()
{
	if (TOS == 0)
	{
		PC = GETCELL(PC);
	}
	else
	{
		PC += CELL_SZ;
	}
	prim_DROP();
}

// JMPNZ - Doeswhat
void prim_JMPNZ()
{
	if (TOS != 0)
	{
		PC = GETCELL(PC);
	}
	else
	{
		PC += CELL_SZ;
	}
	prim_DROP();
}

// CALL - Doeswhat
void prim_CALL()
{
	rpush(PC+CELL_SZ);
	PC = GETCELL(PC);
}

// RET - Doeswhat
void prim_RET()
{
	checkStacks();
	// Empty return stack means done when embedded
	if ((rdepth == 0) && (isEmbedded))
	{
		// printf("RET-embedded-BYE\n");
		isBYE = true;
		PC = 0;
	}
	else
	{
		trace("RET\n");
		PC = rpop();
	}
}

// OR - Doeswhat
void prim_OR()
{
	arg1 = pop();
	trace("OR (%04x & %04x)\n", arg1, arg2);
	TOS = (TOS | arg1);
}

// CLITERAL - Doeswhat
void prim_CLITERAL()
{
	arg1 = GETBYTE(PC++);
	// trace("CLITERAL (%ld)\n", arg1);
	push(arg1);
}

// CFETCH - Doeswhat
void prim_CFETCH()
{
	TOS = GETBYTE(TOS);
}

// CSTORE - Doeswhat
void prim_CSTORE()
{
	arg1 = pop();
	arg2 = pop();
	// printf("CSTORE (%ld to 0x%04lx)\n", arg2, arg1);
	SETBYTE(arg1, arg2);
}

// ADD - Doeswhat
void prim_ADD()
{
	arg1 = pop();
	// printf("(%d+%d", arg1, arg2);
	TOS += arg1;
	/// printf("=%d, depth=%d)", TOS, depth);
}

// SUB - Doeswhat
void prim_SUB()
{
	arg1 = pop();
	TOS -= arg1;
}

// MUL - Doeswhat
void prim_MUL()
{
	arg1 = pop();
	TOS *= arg1;
}

// DIV - Doeswhat
void prim_DIV()
{
	if (TOS == 0)
	{
		printf("Divide by 0!");
		reset_vm();
	}
	else
	{
		arg1 = pop();
		TOS /= arg1;
	}
}

// LT - Doeswhat
void prim_LT()
{
	// trace("LT\n");
	arg1 = pop();
	TOS = (TOS < arg1) ? 1 : 0;
}

// EQ - Doeswhat
void prim_EQ()
{
	// trace("EQ\n");
	arg1 = pop();
	TOS = (TOS == arg1) ? 1 : 0;
}

// GT - Doeswhat
void prim_GT()
{
	// trace("GT\n");
	arg1 = pop();
	TOS = (TOS > arg1) ? 1 : 0;
}

// DICTP - Doeswhat
void prim_DICTP()
{
	arg1 = GETCELL(PC);
	PC += CELL_SZ;
	//trace("DICTP %04lx", arg1);
	//trace(" ; %s\n", &(the_memory[arg1+10]));
}

// EMIT - Doeswhat
void prim_EMIT()
{
	arg1 = pop();
	putchar(arg1);
	trace("EMIT %02x\n", (int)arg1);
}

// OVER - Doeswhat
void prim_OVER()
{
    // arg1 = GET2ND();
	// trace("OVER (%ld)\n", arg1);
    push(GET2ND());
}

// COMPARE - Doeswhat
void prim_COMPARE()
{
	trace("COMPARE\n");
	arg2 = pop();
	arg1 = pop();
	{
		char *cp1 = (char *)arg1;
		char *cp2 = (char *)arg2;
		arg3 = strcmp(cp1, cp2) ? 0 : 1;
		push(arg3);
	}
}

// FOPEN:         // ( name mode type -- fp success )
void prim_FOPEN()
{
	arg3 = pop();   // type: 0 => text, 1 => binary
	arg2 = pop();   // mode: 0 => read, 1 => write
	arg1 = pop();   // name
	{
		char *fileName = (char *)(arg1 + 1);
		char mode[4];
		sprintf(mode, "%c%c", (arg2 == 0) ? 'r' : 'w', (arg3 == 0) ? 't' : 'b');
		trace("FOPEN %s, %s\n", fileName, mode);
		FILE *fp = fopen(fileName, mode);
		push((CELL)fp);
		push(fp != NULL ? 1 : 0);
	}
}

// FREAD:			// ( addr num fp -- count ) - fp == 0 means STDIN
void prim_FREAD()
{
	trace("FREAD\n");
	arg3 = pop();
	arg2 = pop();
	arg1 = pop();
	{
		BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
		int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
		push(num);
	}
}

// FREADLINE:			// ( addr max-sz fp -- num-read )
void prim_FREADLINE()
{
	trace("FREADLINE ");
	arg3 = pop();		// FP - 0 means STDIN
	arg2 = pop();		// max-sz
	arg1 = pop();		// to-addr - NB: this is a COUNTED and NULL-TERMINATED string!
	{
		char *tgt = (char *)arg1;
		FILE *fp = arg3 ? (FILE *)arg3 : stdin;
		char *pBuf = tgt;
		if (fgets((pBuf+1), arg2, fp) != (pBuf+1))
		{
			trace("<EOF>\n");
			*(pBuf) = 0;
			*(pBuf+1) = (char)0;
			push(0);
			return;
		}
		arg2 = (CELL)strlen(pBuf+1);
		// Strip off the trailing newline if there
		if ((arg2 > 0) && (pBuf[arg2] == '\n'))
		{
			pBuf[arg2--] = (char)NULL;
		}
		*(pBuf) = (char)(arg2);
		push((arg2 > 0) ? arg2 : 1);
		trace("%d: [%s]\n", (int)pBuf[0], pBuf+1);
	}
}

// FWRITE - Doeswhat
void prim_FWRITE()
{
	arg3 = pop();
	arg2 = pop();
	arg1 = pop();
	{
		BYTE *pBuf = (BYTE *)arg1;
		int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
		push(num);
	}
	trace("FWRITE\n");
}

// FCLOSE - Doeswhat
void prim_FCLOSE()
{
	trace("FCLOSE\n");
	arg1 = pop();
	if (arg1 != 0)
		fclose((FILE *)arg1);
}

// DTOR - Doeswhat
void prim_DTOR()
{
	rpush(pop());
}

// RTOD - Doeswhat
void prim_RTOD()
{
	push(rpop());
}

// RFETCH - "peeks" the top of the return stack
void prim_RFETCH()
{
	if (rdepth > 0)
	{
		push(*RSP);
		return;
	}
	printf(" the return stack is empty! (at PC=0x%08lx)", PC-4);
	reset_vm();
}



// LOGLEVEL - Doeswhat
void prim_LOGLEVEL()
{
	arg1 = pop();
	__DEBUG__ = arg1;
	// printf("LOGLEVEL (set to %d)", arg1);
}

// AND - Doeswhat
void prim_AND()
{
		arg1 = pop();
		TOS = (TOS & arg1);
}

// PICK - Doeswhat
void prim_PICK()
{
	arg1 = TOS;
	TOS = *(DSP - (arg1));
	trace("PICK\n");
}

// DEPTH - Doeswhat
void prim_DEPTH()
{
	push(depth);
}

// GETCH - Doeswhat
void prim_GETCH()
{
	push(getch());
}

// COMPAREI - Doeswhat
void prim_COMPAREI()
{
	//trace("COMPAREI\n");
	arg2 = pop();
	arg1 = pop();
	{
		char *cp1 = (char *)arg1;
		char *cp2 = (char *)arg2;
		arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
		push(arg3);
	}
}

// SLASHMOD ( n1 n2 -- r q ) - q = n2/n1, r = n1 mod n2
void prim_SLASHMOD()
{
	arg1 = GET2ND();
	arg2 = GETTOS();
	SET2ND(arg1%arg2);		// remainder
	SETTOS(arg1/arg2);		// quotient
}

// NOT - Does NOTHING
void prim_NOT()
{
	TOS = (TOS == 0) ? -1 : 0;
}

// INC - Doeswhat
void prim_INC()
{
	++TOS;
}

// RDEPTH - Doeswhat
void prim_RDEPTH()
{
	push(rdepth);
}

// INC - Doeswhat
void prim_DEC()
{
	--TOS;
}

// GETTICK - Doeswhat
void prim_GETTICK()
{
	arg1 = GetTickCount();
	push(arg1);
}

// SHIFTLEFT - Shifts TOS left <x> bits
void prim_SHIFTLEFT()
{
	arg1 = pop();
	TOS = TOS << (arg1 & 0x1F);
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_SHIFTRIGHT()
{
	arg1 = pop();
	TOS = TOS >> (arg1 & 0x1F);
}

// PLUSSTORE - !+
void prim_PLUSSTORE()
{
	arg2 = pop();
	arg1 = pop();
	arg3 = GETCELL(arg2);
	arg3 += arg1;
	SETCELL(arg2, arg3);
}


void prim_BRANCHF()
{
	arg1 = GETBYTE(PC);
	PC += arg1;
}

void prim_BRANCHFZ()
{
	arg1 = pop();
	if (arg1 == 0)
	{
		arg1 = GETBYTE(PC);
		PC += arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHFNZ()
{
	arg1 = pop();
	if (arg1 != 0)
	{
		arg1 = GETBYTE(PC);
		PC += arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHB()
{
	arg1 = GETCELL(PC);
	PC -= arg1;
}

void prim_BRANCHBZ()
{
	arg1 = pop();
	if (arg1 == 0)
	{
		arg1 = GETCELL(PC);
		PC -= arg1;
	}
	else
	{
		PC++;
	}
}

void prim_BRANCHBNZ()
{
	arg1 = pop();
	if (arg1 != 0)
	{
		arg1 = GETCELL(PC);
		PC -= arg1;
	}
	else
	{
		PC++;
	}
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_DBGDOT()
{
	arg1 = TOS;
	if (BASE == 10)
	{
		printf("%d", arg1);
	}
	else if (BASE == 0x10)
	{
		printf("%x", arg1);
	}
	else
	{
		printf("%d-in-base-%d", arg1, BASE);
	}
	prim_DROP();
}

// SHIFTRIGHT - Shifts TOS right <x> bits
void prim_DBGDOTS()
{
	if (depth > 0)
	{
		printf("( ");
		for (int i = (depth-1); i >= 0; i--)
		{
			push(i);
			prim_PICK();
			prim_DBGDOT();
			printf(" ");
		}
		printf(")");
	}
	else
	{
		printf("(%c)", 237);
	}
	
}

// NOP - Does NOTHING
void prim_NOP()
{
	// code goes here
}

// BREAK - Doeswhat
void prim_BREAK()
{
	// code goes here
}

// RESET - Doeswhat
void prim_RESET()
{
	reset_vm();
}

// BYE - Doeswhat
void prim_BYE()
{
    printf(" Bye!");
	ExitProcess(0);
}




void prim_INLINE()
{
	DICT_T_NEW *dp = (DICT_T_NEW *)LAST;
	dp->flags |= IS_INLINE;
}

void prim_IMMEDIATE()
{
	// printf("-pi=%lx-", (CELL)prim_IMMEDIATE);
	// printf("-IMM-");
	DICT_T_NEW *dp = (DICT_T_NEW *)LAST;
	dp->flags |= IS_IMMEDIATE;
}

void prim_LOAD()
{
	FILE *curr_fp = input_fp;
	arg1 = pop();
	sprintf(input_fn, "block-%04d.fs", arg1);
	TRACE("loading [%s]\n", input_fn);
	input_fp = fopen(input_fn, "rt");
	if (input_fp)
	{
		Compile(input_fp);
	}
	else
	{
		printf("Can't open [%s]\n", input_fn);
	}
	
	fclose(input_fp);
	input_fp = curr_fp;
}

void prim_CREATE()
{
	arg1 = pop();
	arg2 = pop();
	TRACE("CREATE('%s', %d)", arg1, arg2);
	DefineWord((char *)arg1, arg2);
}

void prim_VARIABLE()
{
	prim_CREATE();
	Comma((CELL)prim_LITERAL);
	Comma(HERE + 8);
	Comma((CELL)prim_RET);
	Comma(0);
}

void prim_COMMA()
{
	arg1 = pop();
	SETCELL(HERE, arg1);
	HERE += CELL_SZ;
}

void prim_CCOMMA()
{
	arg1 = pop();
	SETBYTE(HERE, arg1);
	++HERE;
}

void prim_QCOMMA()
{
	if ((TOS >= 0x00) && (TOS < 0x0100))
		prim_CCOMMA();
	else
		prim_COMMA();

}

void prim_PARSELINE()
{
	char *line = (char *)pop();
	// ParseLine(line);
	char word[128];

	// TRACE("Parse(): line=[%s]\n", line);

	// for debugging
	// if (0x05c8 < HERE)
	// {
	// 	trace_on();
	// }

	// for debugging
	// if (0x0680 < HERE)
	// {
	// 	debug_off();
	// }

	while (strlen(line) > 0)
	{
		line = GetWord(line, word);
		if (strcmp(word, "\\") == 0)
		{
			return;
		}

		if (strlen(word) == 0)
		{
			TRACE("-EOL-");
			// prim_DBGDOTS();
			return;
		}

		line = ParseWord(word, line);
		TRACE("(pw-%s)", strlen(word), word);
		if (line == NULL)
			return;

		push((CELL)word);
		prim_ISWORD();
		arg1 = pop();
		if (arg1)
		{
			
		}
	}
}

void prim_EXECUTEWORD()
{
	TRACE("(ew-%08lx,", PC);
	PC = pop();
	TRACE("%08lx)", PC);
}

// ( n1 a1 -- bool )
// n1: FILE-PTR
// a1: buf
void prim_GETLINE()
{
	char *buf = (char *)pop();
	FILE *fp = (FILE *)pop();
	char *chars = buf+1;
	size_t buf_sz = 256;

	if (fp)
	{
		// prim_DBGDOTS();
		if (chars == fgets(chars, buf_sz, fp))
		{
			*buf = (BYTE)strlen(chars);
			push(-1);
		}
		else
		{
			push(0);
		}
	}
	else
	{
		// TRACE("(get-line)");
		char *l = buf+1;
		size_t num = getline(&l, &buf_sz, stdin);
		string_rtrim(l);
		buf[0] = (BYTE)strlen(l);
		// TRACE("(HERE=%lx,buf=%lx,len=%d)", HERE, buf, buf[0]);
		push(-1);
	}
}

// ( a1 -- a2 a3 a4 )
// a1: line
// a2: word (counted string)
// a3: len
// a4: new-line (not counted, null-terminated)
void prim_GETWORD()
{
	static char word[66];
	char *line = (char *) pop();
	BYTE len = 0;

    // Skip beginning WS
    while ((*line) && ((*line) <= ' '))
    {
        line++;
    }

    // Copy chars up to ' ', EOL, or 1st non-printable char
	len = 0;
    while (((*line) > ' ') && (len < 64))
	{
		word[++len] = *(line++);
	}
	word[0] = len;

	push((CELL)word);
	push((CELL)len);
	push((CELL)line);
}

// if found:     ( c-str -- link true )
// if not found: ( c-str -- false )
// c-str: word
void prim_ISWORD()
{
	char *word = (char *) TOS;
	DICT_T_NEW *dp = (DICT_T_NEW *)FindWord(word+1);
	if (dp)
	{
		TOS = (CELL)dp;
		push(-1);
	}
	else
	{
		TOS = 0;
	}
}

// if is a number:     ( c-str -- num true )
// if not: ( c-str -- false )
// c-str: word
void prim_ISNUMBER()
{
	TOS - 0;
}

// ( XT -- )
void prim_DOCOL()
{
	void (*vm_prim)();

	rpush(PC);
	PC = pop();

	while (true)
	{
		vm_prim = (void (*)())GETCELL(PC);

		if (vm_prim == prim_RET)
		{
			PC = rpop();
			checkStacks();
			return;
		}
		else
		{
			PC += CELL_SZ;
			vm_prim();
		}
 	}
}
