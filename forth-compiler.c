#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include "forth-vm.h"
#include "Shared.h"
#include "logger.h"
#include "string.h"

void Parse(char *);
DICT_T *FindWord(char *word);

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;

CELL HERE, LAST, STATE;
CELL BASE = 10;

extern int _QUIT_HIT;

/*
NB build this in somehow to enable usage of VT100 ECSAPE sequences to control the screen

	HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD dwMode = 0;
	GetConsoleMode(hOut, &dwMode);
	dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
	SetConsoleMode(hOut, dwMode);
*/

// ------------------------------------------------------------------------------------------
OPCODE_T opcodes[] = {
	{ _T("PUSH"), LITERAL, _T("") }
	, { _T("CPUSH"), CLITERAL, _T("") }
	, { _T("FETCH"), FETCH, _T("@") }
	, { _T("STORE"), STORE, _T("!") }
	, { _T("CFETCH"), CFETCH, _T("C@") }
	, { _T("CSTORE"), CSTORE, _T("C!") }
	, { _T("SWAP"), SWAP, _T("SWAP") }
	, { _T("DROP"), DROP, _T("DROP") }
	, { _T("DUP"), DUP, _T("DUP") }
	, { _T("OVER"), OVER, _T("OVER") }
	, { _T("JMP"), JMP, _T("") }
	, { _T("JMPZ"), JMPZ, _T("") }
	, { _T("JMPNZ"), JMPNZ, _T("") }
	, { _T("CALL"), CALL, _T("") }
	, { _T("RET"), RET, _T("") }
	, { _T("COMPARE"), COMPARE, _T("COMPARE") }
	, { _T("COMPAREI"), COMPAREI, _T("COMPAREI") }
	, { _T("ADD"), ADD, _T("+") }
	, { _T("SUB"), SUB, _T("-") }
	, { _T("MUL"), MUL, _T("*") }
	, { _T("DIV"), DIV, _T("/") }
	, { _T("LT"), LT, _T("<") }
	, { _T("EQ"), EQ, _T("=") }
	, { _T("GT"), GT, _T(">") }
	, { _T("DICTP"), DICTP, _T("") }
	, { _T("EMIT"), EMIT, _T("EMIT") }
	, { _T("FOPEN"), FOPEN, _T("FOPEN") }
	, { _T("FREAD"), FREAD, _T("FREAD") }
	, { _T("FREADLINE"), FREADLINE, _T("FREADLINE") }
	, { _T("FWRITE"), FWRITE, _T("FWRITE") }
	, { _T("FCLOSE"), FCLOSE, _T("FCLOSE") }
	, { _T("SLITERAL"), SLITERAL, _T("") }
	, { _T("DTOR"), DTOR, _T(">R") }
	, { _T("RTOD"), RTOD, _T("R>") }
	, { _T("PICK"), PICK, _T("PICK") }
	, { _T("LOGLEVEL"), LOGLEVEL, _T("") }
	, { _T("DEPTH"), DEPTH, _T("DEPTH") }
	, { _T("AND"), AND, _T("AND") }
	, { _T("OR"), OR, _T("OR") }
	, { _T("GETCH"), GETCH, _T("GETCH") }
	, { _T("USTACKINIT"), USINIT, _T("USTACKINIT") }
	, { _T("UPUSH"), USPUSH, _T(">USTACK") }
	, { _T("UPOP"), USPOP, _T("USTACK>") }
	, { _T("BREAK"), BREAK, _T("BREAK") }
	, { _T("RESET"), RESET, _T("RESET") }
	, { _T("BYE"), BYE, _T("BYE") }
	, { _T(""), 0, _T("") }
};

// ------------------------------------------------------------------------------------------
void Store(CELL loc, CELL num)
{
	//trace("storing %4lx to %04lx", num, loc);
	*(CELL *)(&the_memory[loc]) = num;
}

void CStore(CELL loc, BYTE num)
{
	//trace("storing %d to %04lx", num, loc);
	the_memory[loc] = num;
}

CELL Fetch(CELL loc)
{
	return *(CELL *)(&the_memory[loc]);
}

CELL CFetch(CELL loc)
{
	return (CELL)the_memory[loc];
}

void Comma(CELL num)
{
	if ((0 <= HERE) && (HERE < LAST))
	{
		trace(", %04lx (%04lx)", num, HERE);
		Store(HERE, num);
		HERE += CELL_SZ;
	}
	else
	{
		printf("Comma(%04lx): out of memory!", num);
	}
}

void CComma(BYTE num)
{
	if (HERE < LAST)
	{
		trace("C, %02lx (%04lx)", num, HERE);
		the_memory[HERE] = num;
		HERE += 1;
	}
	else
	{
		printf("CComma(%02x): out of memory!", (int)num);
	}
}

void SyncMem(bool isSet)
{
	if (isSet)
	{
		Store(ADDR_LAST, LAST);
		Store(ADDR_HERE, HERE);
		CStore(ADDR_BASE, BASE);
		Store(ADDR_STATE, STATE);
	}
	else
	{
		LAST = Fetch(ADDR_LAST);
		HERE = Fetch(ADDR_HERE);
		BASE = CFetch(ADDR_BASE);
		STATE = Fetch(ADDR_STATE);
	}
}

void Compile(FILE *fp_in)
{
	int line_no = 0;
	char buf[128];
	char line[128];

    while (fgets(buf, sizeof(buf), fp_in) == buf)
    {
		string_rtrim(buf);
        ++line_no;
        strcpy(line, buf);
        Parse(buf);
		if (_QUIT_HIT == 1)
		{
			printf("QUIT hit on line %d: %s\n", line_no, line);
			break;
		}
    }
    fclose(fp_in);

	DICT_T *dp = FindWord("main");
	if (dp == NULL)
	{
		dp = (DICT_T *)&the_memory[LAST];
	}

	CStore(0, JMP);
	Store(1, dp->XT);

	SyncMem(true);
}

CELL ExecuteXT(CELL XT)
{
	SyncMem(true);
	PC = XT;
	isBYE = false;
	isEmbedded = true;
	CELL ret = cpu_loop();
	SyncMem(false);

	return ret;
}

DICT_T *FindWord(LPCTSTR word)
{
	trace(" looking for word [%s]\n", word);
	DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
	while (dp->next > 0)
	{
		if (string_equals(word, dp->name))
		{
			return dp;
		}
		dp = (DICT_T *)(&the_memory[dp->next]);
	}

	return 0;
}

bool MakeNumber(LPCTSTR word, CELL *the_num)
{
	bool is_neg = false;
	char *w = word;
	CELL my_num = 0;
	char *possible_chars = "0123456789abcdef";
	char valid_chars[24];
	strncpy(valid_chars, possible_chars, BASE);

	// One leading minus sign is OK
	if (*w == '-')
	{
		is_neg = true;
		w++;
	}

	while (*w)
	{
		char ch = *(w++);
		ch = tolower(ch);
		char *pos = strchr(valid_chars, ch);
		if (pos == 0)
		{
			return false;
		}
		CELL digit = (CELL)(pos - valid_chars);
		my_num = (my_num * BASE) + digit;
	}

	if (is_neg)
	{
		my_num = -my_num;
	}
    *the_num = my_num;
	return true;
}

void DefineWord(LPCTSTR word, BYTE flags)
{
	CELL curLAST = LAST;
	LAST -= ((CELL_SZ*2) + 3 + string_len(word));
	debug("Defining word [%s] at %04lx, HERE=%04lx\n", word, LAST, HERE);

	DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
	dp->next = curLAST;
	dp->XT = HERE;
	dp->flags = flags;
	dp->len = string_len(word);
	strcpy(dp->name, word);
	SyncMem(true);
}

// Returns a pointer to the first char after the first word in the line
// NB: this is NOT a counted string
char *GetWord(char *line, char *word)
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
	*cp = NULL;

    return line;
}

char *ParseWord(char *word, char *line)
{
	trace("Parse(): word=[%s], HERE=%04lx, LAST=%04lx, STATE=%ld\n", word, HERE, LAST, STATE);

	if (string_equals(word, ".QUIT"))
	{
		_QUIT_HIT = 1;
		return line;
	}

	if ((STATE < 0) || (STATE > 2))
	{
		printf("STATE (%ld) is messed up!\n", STATE);
		STATE = 0;
	}

	if (string_equals(word, ":"))
	{
		trace("\n");
		line = GetWord(line, word);
		DefineWord(word, 0);
		CComma(DICTP);
		Comma(LAST);
		STATE = 1;
		return line;
	}

	// These words are only for : definitions
	if (STATE == 1)
	{
		if (string_equals(word, ";"))
		{
			CComma(RET);
			STATE = 0;
			return line;
		}

		if (strcmp(word, ".IF") == 0)
		{
			CComma(JMPZ);
			push(HERE);
			Comma(0);
			return line;
		}

		if (strcmp(word, ".ELSE") == 0)
		{
			CELL tmp = pop();
			CComma(JMP);
			push(HERE);
			Comma(0);
			Store(tmp, HERE);
			return line;
		}

		if (strcmp(word, ".THEN") == 0)
		{
			CELL tmp = pop();
			Store(tmp, HERE);
			return line;
		}

		if (string_equals(word, "S\""))
		{
			CComma(SLITERAL);
			int count = 0;
			bool done = false;
			line += 1;
			CELL cur_here = HERE++;
			BYTE ch;
			while ((!done) && (!string_isEmpty(line)))
			{
				ch = *(line++);
				if (ch == '\"')
				{
					done = true;
				}
				else
				{
					CComma(ch);
					count++;
				}
			}
			CComma(0);
			CStore(cur_here, count);
			return line;
		}
	}

	DICT_T *dp = FindWord(word);
	if (dp != NULL)
	{
		debug("FORTH word [%s]. STATE=%ld ... ", dp->name, STATE);
		if (STATE == 1)
		{
			debug("compiling into current word\n", dp->name, dp->XT, STATE);
			if (dp->flags & IS_IMMEDIATE)
			{
				ExecuteXT(dp->XT);
			}
			else if (dp->flags & IS_INLINE)
			{
				// Skip the DICTP instruction
				CELL addr = dp->XT + 1 + CELL_SZ;

				// Copy bytes until the first RET
				while (true)
				{
					BYTE b = CFetch(addr++);
					if (b == RET)
					{
						break;
					}
					CComma(b);
				}
			}
			else
			{
				CComma(CALL);
				Comma(dp->XT);
			}
		}
		else
		{
			debug("executing it ...\n");
			ExecuteXT(dp->XT);
		}
		return line;
	}

	CELL num = 0;
	if (MakeNumber(word, &num))
	{
		trace("IsNumber: %ld (%04lx), STATE=%ld\n", num, num, STATE);
		if (STATE == 1) // Compiling
		{
			if ((0 <= num) && (num <= 0xFF))
			{
				CComma(CLITERAL);
				CComma((BYTE)num);
			}
			else
			{
				CComma(LITERAL);
				Comma(num);
			}
		}
		else 
		{
			push(num);
			return line;
		}
		return line;
	}

	_QUIT_HIT = 1;
	printf("ERROR: '%s'??\n", word);
	return line;
}

void Parse(char *line)
{
	char *source = line;
	char word[128];

	trace("Parse(): line=[%s]\n", line);

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

	while (string_len(line) > 0)
	{
		line = GetWord(line, word);
		if (string_equals(word, "\\"))
		{
			return;
		}

		if (string_len(word) == 0)
		{
			return;
		}

		line = ParseWord(word, line);
	}
}

CELL CComma_XT = 0;
void generate_CComma()
{
	DefineWord("C,", 0);
	CComma_XT = HERE;
	CComma(DICTP);
	Comma(LAST);
	CComma(CLITERAL);
	CComma(ADDR_HERE);
	CComma(FETCH);
	CComma(CSTORE);
	CComma(CLITERAL);
	CComma(ADDR_HERE);
	CComma(FETCH);
	CComma(CLITERAL);
	CComma(1);
	CComma(ADD);
	CComma(CLITERAL);
	CComma(ADDR_HERE);
	CComma(STORE);
	CComma(RET);
}

void generate_asm_words()
{
	char tmp[64];
	for (int i = 0; opcodes[i].opcode != 0; i++)
	{
		OPCODE_T *op = &(opcodes[i]);
		sprintf(tmp, "a.%s", op->asm_instr);
		DefineWord(tmp, IS_IMMEDIATE);
		CComma(DICTP);
		Comma(LAST);
		CComma(CLITERAL);
		CComma(opcodes[i].opcode);
		CComma(CALL);
		Comma(CComma_XT);
		CComma(RET);
	}
}

void generate_forth_prims()
{
	for (int i = 0; opcodes[i].opcode != 0; i++)
	{
		OPCODE_T *op = &(opcodes[i]);
		if (strlen(op->forth_prim) > 0)
		{
			DefineWord(op->forth_prim, IS_INLINE);
			CComma(DICTP);
			Comma(LAST);
			CComma(op->opcode);
			CComma(RET);
		}
	}
}

void generate_constant(char *name, BYTE val)
{
	DefineWord(name, IS_INLINE);
	CComma(DICTP);
	Comma(LAST);
	CComma(CLITERAL);
	CComma(val);
	CComma(RET);
}

void generate_constants()
{
	generate_constant("BASE", ADDR_BASE);
	generate_constant("CELL", CELL_SZ);
	generate_constant("DP", ADDR_HERE);
	generate_constant("(LAST)", ADDR_LAST);
	generate_constant("INPUT-FP", 0x001C);
	generate_constant("STATE", ADDR_STATE);
}

void write_output_file()
{
    printf("writing output file %s ... ", output_fn);

    output_fp = fopen(output_fn, "wb");
    if (!output_fp)
    {
        printf("ERROR: Can't open output file!");
        exit(1);
    }

	fwrite(the_memory, 1, MEM_SZ, output_fp);
    fclose(output_fp);
    output_fp = NULL;
    printf("done.");
}

void CompilerInit()
{
	init_vm(MEM_SZ);
	the_memory[0] = RET;
	isEmbedded = true;

	HERE = 0x0040;
	LAST = MEM_SZ - STACKS_SZ - CELL_SZ;
	STATE = 0;

	Store(LAST, 0);
	CStore(ADDR_CELL, CELL_SZ);
	CStore(ADDR_BASE, BASE);
}

void do_compile()
{
    printf("compiling from %s...\n", input_fn);
	CompilerInit();

	generate_constants();
	generate_CComma();
	generate_asm_words();
	generate_forth_prims();

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("can't open input file!");
        exit(1);
    }

	Compile(input_fp);
	CStore(ADDR_BASE, 10);
    fclose(input_fp);
    input_fp = NULL;
}

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == 'i') 
    {
        arg = arg+2;
        strcpy(input_fn, arg);
    }
    else if (*arg == 'o') 
    {
        arg = arg+2;
        strcpy(output_fn, arg);
    }
    else if (*arg == 't') 
    {
		trace_on();
		printf("log level set to trace.\n");
    }
    else if (*arg == 'd') 
    {
		debug_on();
		printf("log level set to debug.\n");
    }
    else if (*arg == '?') 
    {
        printf("usage: forth-compiler [args]\n");
        printf("  -i:inputFile (full or relative path)\n");
        printf("      default inputFile is forth.src\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth.bin\n");
        printf("  -t (set log level to trace)\n");
        printf("  -d (set log level to debug)\n");
        printf("  -? (prints this message)\n");
		exit(0);
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
    }
}

int main (int argc, char **argv)
{
    strcpy(input_fn, "forth.src");
    strcpy(output_fn, "forth.bin");
	debug_off();

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

    do_compile();
	write_output_file();

    return 0;
}
