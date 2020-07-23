// ------------------------------------------------------------
// inpsired by these:
// http://www.ultratechnology.com/mfp21.htm#source
// http://www.ultratechnology.com/aha.htm
// ------------------------------------------------------------

#include <stdio.h>
#include <string.h>
#include <winbase.h>
// #include <stdarg.h>
#include <stdlib.h>
// #include <ctype.h>
// #include "forth-vm.h"
// #include "Shared.h"
// #include "logger.h"
// #include "string.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;

typedef unsigned long CELL;
typedef unsigned char BYTE;

CELL HERE, STATE;
CELL BASE = 10;
#define CELL_SZ 4

// ------------------------------------------------------------
CELL PC;
CELL addr;
CELL tmp;
CELL MEM_SZ = (1024*4);

// Circular stacks - no over/under-flow!
// - the top of data stack is TOS
// - the top of return stack is TOSR

#define DSZ 64
CELL dstk[DSZ];
CELL *DSS = dstk;
CELL *DSE = &(dstk[DSZ-1]);
CELL *DSP = dstk;

#define RSZ 64
CELL rstk[RSZ];
CELL *RSS = rstk;
CELL *RSE = &(rstk[RSZ-1]);
CELL *RSP = rstk;

#define TOS  (*DSP)
#define TOSR (*RSP)

#define MAX_WORDS 2048
typedef struct {
	CELL xt;
	BYTE flags;
	char name[30];
} ENTRY_T;

BYTE *the_memory = NULL;
ENTRY_T *the_dict = NULL;
int num_words = 0;

void (*prims[64])();

extern int _QUIT_HIT;

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
void push(CELL v)
{
	if (++DSP > DSE)
		DSP = DSS;
	*DSP = v; 
}

// ------------------------------------------------------------
CELL pop()
{
	CELL v = *DSP;
	if (--DSP < DSS)
		DSP = DSE;
	return v;
}

// ------------------------------------------------------------
void dumpStack(int num)
{
	num = (num == 0) ? DSZ : num;
	printf("( ");
	for (int i = 0; i < num; i++)
		printf("%d ", pop());
	printf(")");
}

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
void rpush(CELL v)
{
	if (++RSP > RSE)
		RSP = RSS;
	*RSP = v; 
}

// ------------------------------------------------------------
CELL rpop()
{
	CELL v = *RSP;
	if (--RSP < RSS)
		RSP = RSE;
	return v;
}

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
void a()
{
	push(addr);
}

// ------------------------------------------------------------
void fetch()
{
	printf("\nfetch from %08lx, ", TOS);
	addr = TOS;
	TOS = *(CELL *)addr;
	printf("val is %08lx", TOS);
}

// ------------------------------------------------------------
void dup()
{
	tmp = TOS;
	push(tmp);
}

// ------------------------------------------------------------
void drop()
{
	tmp = pop(0);
}

// ------------------------------------------------------------
void store()
{
	addr = pop();
	*(CELL *)addr = pop();
}

// ------------------------------------------------------------
void seta()
{
	addr = pop();
}

// ------------------------------------------------------------
void jump()
{
	PC = *(CELL *)PC;
}

// ------------------------------------------------------------
void call()
{
    rpush(PC);
	PC = *(CELL *)PC;
}

// ------------------------------------------------------------
void emit()
{
    printf("%c", pop());
}

// ------------------------------------------------------------
void ret()
{
	PC = rpop();
}

// ------------------------------------------------------------
void add()
{
	tmp = pop();
	TOS += tmp;
}

// ------------------------------------------------------------
void sub()
{
	tmp = pop();
	TOS -= tmp;
}

// ------------------------------------------------------------
void mult()
{
	tmp = pop();
	TOS *= tmp;
}

// ------------------------------------------------------------
void mdiv()
{
	tmp = pop();
	TOS /= tmp;
}

// ------------------------------------------------------------
void at_plus()
{
    push(*(CELL *)(addr++));
}

// ------------------------------------------------------------
void store_plus()
{
	*(CELL *)(addr++) = pop();
}

// ------------------------------------------------------------
void plus_star()
{
	// WHAT TO DO HERE
    return;
}

// ------------------------------------------------------------
void over()
{
	push(dstk[1]);
}

// ------------------------------------------------------------
void until()
{
	// WHAT TO DO HERE
}

void until_neg()
{
	// WHAT TO DO HERE
}

// ------------------------------------------------------------
void minus_until()
{
	// WHAT TO DO HERE
}

// ------------------------------------------------------------
void invert()
{
	// WHAT TO DO HERE
}

// ------------------------------------------------------------
void t_eq_0()
{
	if (TOS == 0)
		PC = *(CELL *)PC;
	else
		PC += CELL_SZ;
}

// ------------------------------------------------------------
void c_eq_0()
{
	// WHAT TO DO HERE
}

// ------------------------------------------------------------
void p_colon()
{
	// WHAT TO DO HERE
}

// ------------------------------------------------------------
void dtor()
{
	rpush(pop());
}

// ------------------------------------------------------------
void rtod()
{
	push(rpop());
}

// ------------------------------------------------------------
void and()
{
	tmp = pop();
	TOS &= tmp;
}

// ------------------------------------------------------------
void xor()
{
	tmp = pop();
	TOS ^= tmp;
}

// ------------------------------------------------------------
void times2()
{
	TOS = TOS << 1;
}

// ------------------------------------------------------------
void divide2()
{
	TOS = TOS >> 1;
}

// ------------------------------------------------------------
void nop()
{
}

// ------------------------------------------------------------
void bye()
{
	exit(0);
}

// ------------------------------------------------------------
typedef struct {
	char *asm_instr;
	BYTE opcode;
	void (*func)();
} OPCODE_T;

enum {
	NOP = 0, A, FETCH, STORE, DROP, DUP, SETA, EMIT,
	JUMP, CALL, RET, ADD, SUB, MULT, DIV, AT_PLUS, STORE_PLUS, PLUS_STAR, 
	OVER, UNTIL, UNTIL_NEG, INVERT, T_EQ_0, C_EQ_0,
	p_COLON, DTOR, RTOD, AND, XOR, TIMES2, DIVIDE2, BYE,
} OPCODES;

OPCODE_T theOpcodes[] = {   
          { "nop",     NOP,         nop        }
		, { "a",       A,           a,         }
        , { "@",       FETCH,       fetch      }
        , { "!",       STORE,       store      }
        , { "drop",    DROP,        drop       }
        , { "dup",     DUP,         dup        }
        , { "a!",      SETA,        seta       }
        , { "jump",    JUMP,        jump       }
		, { "call",    CALL,        call       }
		, { "emit",    EMIT,        emit       }
        , { ";",       RET,         ret        }
        , { "+",       ADD,         add        }
        , { "-",       SUB,         sub        }
		, { "*",       MULT,        mult       }
        , { "/",       DIV,         mdiv       }
        , { "@+",      AT_PLUS,     at_plus    }
        , { "!+",      STORE_PLUS,  store_plus }
        , { "+*",      PLUS_STAR,   plus_star  }
        , { "over",    OVER,        over       }
        , { "until",   UNTIL,       until      }
        , { "-until",  UNTIL_NEG,   until_neg  }
        , { "invert",  INVERT,      invert     }
        , { "T=0",     T_EQ_0,      t_eq_0     }
        , { "C=0",     C_EQ_0,      c_eq_0     }
        , { "(:)",     p_COLON,     p_colon    }
        , { ">r",      DTOR,        dtor       }
        , { "r>",      RTOD,        rtod       }
        , { "and",     AND,         and        }
        , { "xor",     XOR,         xor        }
        , { "2*",      TIMES2,      times2     }
        , { "2/",      DIVIDE2,     divide2    }
        , { "bye",     BYE,         bye        }
        , { NULL,      0,           NULL              }
 };


/*
NB build this in somehow to enable usage of VT100 ECSAPE sequences to control the screen

	HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD dwMode = 0;
	GetConsoleMode(hOut, &dwMode);
	dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
	SetConsoleMode(hOut, dwMode);
*/

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------

void set_byte(CELL tgt, BYTE val)
{
	*(BYTE *)(tgt) = val;
}

void set_cell(CELL tgt, CELL val)
{
	*(CELL *)(tgt) = val;
}

void CComma(BYTE val)
{
	set_byte(HERE++, val);
}

void Comma(CELL val)
{
	push(val);
	push(HERE);
	store();
	HERE += CELL_SZ;
}

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
void define_word(char *word)
{
	printf("\ndefine_word(%s, %d)", word, num_words+1);
	ENTRY_T *ep = (ENTRY_T *)&(the_dict[++num_words]);
	int maxLen = sizeof(ep->name)-1;
	if (strlen(word) > maxLen)
		word[maxLen] = (char)0;

	ep->xt = HERE;
	ep->flags = 0;
	strcpy(ep->name, word);
}

ENTRY_T *find_word(char *word)
{
	for (int i = num_words; i > 0; i--)
	{
		ENTRY_T *ep = (ENTRY_T *)&(the_dict[i]);
		if (strcmpi(word, ep->name) == 0)
		{
			return ep;
		}
	}
	return NULL;
}

void dump_words()
{
	for (int i = num_words; i > 0; i--)
	{
		ENTRY_T *ep = (ENTRY_T *)&(the_dict[i]);
		printf("\n%4d, %08lx, %08lx, %02x, %s", i, ep, ep->xt, ep->flags, ep->name);
	}
}

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------

// Returns a pointer to the first char after the first word in the line
// NB: this is NOT a counted string
char *getword(char *line, char *word)
{
    char *cp = word;

    // Skip beginning WS
    while ((*line) && (*line <= ' '))
    {
        line++;
    }

    // Copy chars up to ' ' or EOL or 1st non-printable char
    while ((*line) && (*line > ' '))
	{
		*(cp++) = *(line++);
	}
	*cp = 0;

    return line;
}

char *parseword(char *line, char *word)
{
	if (word[0] == '\\')
	{
		*line = 0;
		return line;
	}
	if (strcmpi(word, ":") == 0)
	{
		line = getword(line, word);
		if (strlen(word) > 0)
		{
			define_word(word);
		}
		return line;
	}
	if (strcmpi(word, "jump") == 0)
	{
		line = getword(line, word);
		CComma(JUMP);
		Comma(0xFFFFFFFF);
		printf("-jump:%s-", word);
		return line;
	}
	if (strcmpi(word, "t=0") == 0)
	{
		CComma(T_EQ_0);
		Comma(0xFFFFFFFF);
		printf("-%s-", word);
		return line;
	}
	if (strcmpi(word, "c=0") == 0)
	{
		CComma(C_EQ_0);
		Comma(0xFFFFFFFF);
		printf("-%s-", word);
		return line;
	}
	for (int i = 0; ; i++)
	{
		OPCODE_T op = theOpcodes[i];
		if (op.asm_instr == NULL)
		{
			break;
		}
		// printf(".%s|%s?=%d.", word, op.asm_instr, strcmpi(word, op.asm_instr));
		if (strcmpi(word, op.asm_instr) == 0)
		{
			printf(" (%s->%d)", word, op.opcode);
			CComma(op.opcode);
			return line;
		}
	}
	printf(" ??%s??", word);
	return line;
}

void parse(char *line)
{
	char word[64];
	// printf("%s", line);
	line = getword(line, word);
	while (word[0])
	{
		line = parseword(line, word);
		line = getword(line, word);
	}
}

void doTest()
{
	CELL stop = 1000*1000*250;
	CELL start = GetTickCount();

	printf("Tests: push() ...");
	for (CELL i = 1; i <= stop; i++)
	{
		push(i);
	}
	printf(" pop() ... ");
	for (CELL i = 0; i < stop; i++)
	{
		tmp = pop();
	}
	CELL end = GetTickCount();
	CELL tt = end - start;
	printf(" %d.%d seconds\n", tt/1000, tt%1000);
	dumpStack(8); printf("\n");

	Comma(0x22222222); define_word("test0");
	Comma(0x33333333); define_word("test1");
	Comma(0x44444444); define_word("test2");
	Comma(0x55555555); define_word("test1");
	dump_words();

	ENTRY_T *ep;
	ep = find_word("test0"); printf("\n%lx", ep);
	ep = find_word("test1"); printf(" %lx", ep);
	ep = find_word("test3"); printf(" %lx", ep);
	push(' '); emit();
	push('O'); emit();
	push('K'); emit();
	push('\n'); emit();
}

void compile()
{
	HERE = (CELL)the_memory;
	CComma(JUMP);
	Comma(0xEEEEEEEE);

	for (int i = 0; ; i++)
	{
		OPCODE_T op = theOpcodes[i];
		if (op.asm_instr == NULL)
		{
			break;
		}
		prims[op.opcode] = op.func;
	}

	doTest();
	return;

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("can't open input file!");
        exit(1);
    }

	char buf[256];
	while (fgets(buf, 256, input_fp) == buf)
	{
		parse(buf);
	}
	set_cell((CELL)&the_memory[1], the_dict[num_words].xt);

    fclose(input_fp);
    input_fp = NULL;
}

// *********************************************************************
void run_program(CELL start)
{
	CELL IR;
	int callDepth = 0;
	PC = start;
	void (*func)();

	while (1)
	{
		IR = the_memory[PC];
		if (IR == CALL)
		{
			++callDepth;
		}
		if (IR == RET)
		{
			if (--callDepth < 1 )
				return;
		}
		PC += CELL_SZ;
		if ((IR >= NOP) && (IR <= BYE))
			prims[IR]();
		else
		{
			printf("-invalid opcode %d at 0x%08lx-", IR, PC);
			return;
		}
	}
}

// *********************************************************************
void write_output_file()
{
    output_fp = fopen(output_fn, "wb");
    if (!output_fp)
    {
        printf("ERROR: Can't open output file!");
        exit(1);
    }

	int num = fwrite(the_memory, 1, MEM_SZ, output_fp);
    fclose(output_fp);
    output_fp = NULL;
    printf("\n%s, %d bytes written.\n", output_fn, num);
}

int main (int argc, char **argv)
{
    strcpy(input_fn, "mfc.src");
    strcpy(output_fn, "mfc.bin");

	the_memory = malloc(MEM_SZ);
	memset(the_memory, 0, MEM_SZ);

	CELL dict_sz = MAX_WORDS * sizeof(ENTRY_T);
	the_dict = malloc(dict_sz);
	memset(the_dict, 0, dict_sz);

    compile();
	write_output_file();

    return 0;
}
