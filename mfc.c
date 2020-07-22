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

CELL HERE, LAST, STATE;
CELL BASE = 10;
#define CELL_SZ 4

// inpsired by these:
// http://www.ultratechnology.com/mfp21.htm#source
// http://www.ultratechnology.com/aha.htm

// ------------------------------------------------------------
CELL PC;
CELL addr;
CELL tmp;
CELL MEM_SZ;

// This has very small circular stacks - no over/under-flow!
// - the top of data stack is always dstk[0]
// - the top of return stack is always rstk[0]

#define SS 6
#define SSEND SS-1
CELL dstk[SS];
CELL rstk[SS];

BYTE *the_memory = NULL;

void (*prims[32])();

extern int _QUIT_HIT;

// ------------------------------------------------------------
void dumpStack()
{
	printf("( ");
	for (int i = 0; i < SS; i++)
		printf("%d ", dstk[i]);
	printf(")");
}

// ------------------------------------------------------------
void push(CELL x)
{
	// printf(" push(%d),", x);
	// int i = SSEND;

	int i = SSEND;

	while (i > 0)
	{
		// printf(".%d.%d.", i, dstk[i]);
		dstk[i] = dstk[i-1];
		--i;
	}

	dstk[0] = x;

	// dumpStack();
}

// ------------------------------------------------------------
CELL pop()
{
	// printf(" %d=pop(),", dstk[0]);
	tmp = dstk[0];
	int i = 0;

	while (i < SSEND)
	{
		// printf(".%d.%d.", i, dstk[i]);
		dstk[i] = dstk[i+1];
		++i;
	}

	dstk[SSEND] = tmp;
	// dumpStack();
	return tmp;
}

// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------
// ------------------------------------------------------------


// ------------------------------------------------------------
// ------------------------------------------------------------
// NB: top of return stack is always rstk[0]
// ------------------------------------------------------------
// ------------------------------------------------------------
void rpush(CELL x)
{
	for (int i = SS-1; i > 0; i--)
		rstk[i] = rstk[i-1];

	rstk[0] = x;
}

// ------------------------------------------------------------
CELL rpop()
{
	tmp = rstk[0];

	for (int i = 0; i < SS-1; i++)
		rstk[i] = rstk[i+1];

	rstk[SS-1] = tmp;
	return tmp;
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
	printf("\nfetch from %08lx, ", dstk[0]);
	addr = dstk[0];
	dstk[0] = *(CELL *)addr;
	printf("val is %08lx", dstk[0]);
}

// ------------------------------------------------------------
void dup()
{
	tmp = dstk[0];
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
void ret()
{
	PC = rpop();
}

// ------------------------------------------------------------
void add()
{
	tmp = pop();
	dstk[0] += tmp;
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
	dstk[0] = -dstk[0];
}

// ------------------------------------------------------------
void t_eq_0()
{
	// WHAT TO DO HERE
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
	dstk[0] &= tmp;
}

// ------------------------------------------------------------
void xor()
{
	tmp = pop();
	dstk[0] ^= tmp;
}

// ------------------------------------------------------------
void times2()
{
	dstk[0] = dstk[0] << 1;
}

// ------------------------------------------------------------
void divide2()
{
	dstk[0] = dstk[0] >> 1;
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



typedef struct {
	char *asm_instr;
	BYTE opcode;
	void (*func)();
} OPCODE_T;

enum {
	NOP = 0, A, FETCH, STORE, DROP, DUP, SETA,
	JUMP, RET, ADD, AT_PLUS, STORE_PLUS, PLUS_STAR, 
	OVER, UNTIL, UNTIL_NEG, INVERT, T_EQ_0, C_EQ_0,
	p_COLON, DTOR, RTOD, AND, XOR, TIMES2, DIVIDE2, BYE,
} OPCODES;

OPCODE_T theOpcodes[] = {   
          { "nop",     NOP,         nop       }
		, { "a",       A,        a,     }
        , { "@",       FETCH,       fetch     }
        , { "!",       STORE,       store     }
        , { "drop",    DROP,        drop      }
        , { "dup",     DUP,         dup       }
        , { "a!",      SETA,      seta    }
        , { "jump",    JUMP,         jump       }
        , { ";",       RET,         ret       }
        , { "+",       ADD,         add       }
        , { "@+",      AT_PLUS,      at_plus    }
        , { "!+",      STORE_PLUS,   store_plus }
        , { "+*",      PLUS_STAR,    plus_star  }
        , { "over",    OVER,        over      }
        , { "until",   UNTIL,       until     }
        , { "-until",  UNTIL_NEG,    until_neg  }
        , { "invert",  INVERT,      invert    }
        , { "T=0",     T_EQ_0,        t_eq_0      }
        , { "C=0",     C_EQ_0,        c_eq_0      }
        , { "(:)",     p_COLON,      p_colon    }
        , { ">r",      DTOR,        dtor      }
        , { "r>",      RTOD,        rtod      }
        , { "and",     AND,         and       }
        , { "xor",     XOR,         xor       }
        , { "2*",      TIMES2,      times2    }
        , { "2/",      DIVIDE2,     divide2   }
        , { "bye",     BYE,         bye       }
        , { NULL,      0,          NULL              }
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
		printf("-define-%s-", word);
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
	CELL stop = 1000*1000*50;
	CELL start = GetTickCount();

	printf("Initial: ");
	dumpStack();
	printf(", push() ...");
	for (CELL i = 1; i <= stop; i++)
	{
		push(i);
	}
	// dumpStack();
	printf(" pop()");
	for (CELL i = 0; i < stop; i++)
	{
		tmp = pop();
		// printf("%d ", pop());
	}
	CELL end = GetTickCount();
	CELL tt = end - start;
	printf("\n");
	dumpStack();
	printf(" %d.%d seconds\n", tt/1000, tt%1000);
}

void compile()
{
	doTest();
	for (int i = 0; ; i++)
	{
		OPCODE_T op = theOpcodes[i];
		if (op.asm_instr == NULL)
		{
			break;
		}
		prims[op.opcode] = op.func;
	}

	HERE = (CELL)the_memory;
	CComma(JUMP);
	Comma(0xEEEEEEEE);


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

    fclose(input_fp);
    input_fp = NULL;
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

	MEM_SZ = 2*1024;
	the_memory = malloc(MEM_SZ);
	memset(the_memory, 0, MEM_SZ);

    compile();
	write_output_file();

    return 0;
}
