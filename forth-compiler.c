#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include "forth-vm.h"
#include "Shared.h"
#include "string.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;
int mem_size_KB = 64;

CELL HERE, LAST, STATE;
CELL BASE = 10;

CELL ADDR_CELL     = 0x08;
CELL ADDR_HERE     = 0x10;
CELL ADDR_LAST     = 0x14;
CELL ADDR_BASE     = 0x18;
CELL ADDR_STATE    = 0x20;
CELL ADDR_MEM_SZ   = 0x24;

extern int _QUIT_HIT;

OPCODE_T theOpcodes[] = {
          { ".LITERAL.",          LITERAL,          "LITERAL",        0 }
        , { ".FETCH.",            FETCH,            "FETCH",          IS_INLINE }
        , { ".STORE.",            STORE,            "STORE",          IS_INLINE }
        , { ".SWAP.",             SWAP,             "SWAP",           IS_INLINE }
        , { ".DROP.",             DROP,             "DROP",           IS_INLINE }
        , { ".DUP.",              DUP,              "DUP",            IS_INLINE }
        , { ".SLITERAL.",         SLITERAL,         "SLITERAL",       IS_INLINE }
        , { ".JMP.",              JMP,              "JMP",            0 }
        , { ".JMPZ.",             JMPZ,             "JMPZ",           0 }
        , { ".JMPNZ.",            JMPNZ,            "JMPNZ",          0 }
        , { ".CALL.",             CALL,             "CALL",           0 }
        , { ".RET.",              RET,              "RET",            0 }
        , { ".OR.",               OR,               "OR",             IS_INLINE }
        , { ".CLITERAL.",         CLITERAL,         "CLITERAL",       IS_INLINE }
        , { ".CFETCH.",           CFETCH,           "CFETCH",         IS_INLINE }
        , { ".CSTORE.",           CSTORE,           "CSTORE",         IS_INLINE }
        , { ".ADD.",              ADD,              "ADD",            IS_INLINE }
        , { ".SUB.",              SUB,              "SUB",            IS_INLINE }
        , { ".MUL.",              MUL,              "MUL",            IS_INLINE }
        , { ".DIV.",              DIV,              "DIV",            IS_INLINE }
        , { ".LT.",               LT,               "LT",             IS_INLINE }
        , { ".EQ.",               EQ,               "EQ",             IS_INLINE }
        , { ".GT.",               GT,               "GT",             IS_INLINE }
        , { ".DICTP.",            DICTP,            "DICTP",          IS_INLINE }
        , { ".EMIT.",             EMIT,             "EMIT",           IS_INLINE }
        , { ".OVER.",             OVER,             "OVER",           IS_INLINE }
        , { ".COMPARE.",          COMPARE,          "COMPARE",        IS_INLINE }
        , { ".FOPEN.",            FOPEN,            "FOPEN",          IS_INLINE }
        , { ".FREAD.",            FREAD,            "FREAD",          IS_INLINE }
        , { ".FREADLINE.",        FREADLINE,        "FREADLINE",      IS_INLINE }
        , { ".FWRITE.",           FWRITE,           "FWRITE",         IS_INLINE }
        , { ".FCLOSE.",           FCLOSE,           "FCLOSE",         IS_INLINE }
        , { ".DTOR.",             DTOR,             "DTOR",           IS_INLINE }
        , { ".RTOD.",             RTOD,             "RTOD",           IS_INLINE }
        , { ".COM.",              COM,              "COM",            IS_INLINE }
        , { ".AND.",              AND,              "AND",            IS_INLINE }
        , { ".PICK.",             PICK,             "PICK",           IS_INLINE }
        , { ".DEPTH.",            DEPTH,            "DEPTH",          IS_INLINE }
        , { ".GETCH.",            GETCH,            "GETCH",          IS_INLINE }
        , { ".COMPAREI.",         COMPAREI,         "COMPAREI",       IS_INLINE }
        , { ".SLASHMOD.",         SLASHMOD,         "SLASHMOD",       IS_INLINE }
        , { ".NOT.",              NOT,              "NOT",            IS_INLINE }
        , { ".RFETCH.",           RFETCH,           "RFETCH",         IS_INLINE }
        , { ".INC.",              INC,              "INC",            IS_INLINE }
        , { ".RDEPTH.",           RDEPTH,           "RDEPTH",         IS_INLINE }
        , { ".DEC.",              DEC,              "DEC",            IS_INLINE }
        , { ".GETTICK.",          GETTICK,          "GETTICK",        IS_INLINE }
        , { ".SHIFTLEFT.",        SHIFTLEFT,        "LSHIFT",         IS_INLINE }
        , { ".SHIFTRIGHT.",       SHIFTRIGHT,       "RSHIFT",         IS_INLINE }
        , { ".PLUSSTORE.",        PLUSSTORE,        "PLUSSTORE",      IS_INLINE }
        , { ".OPENBLOCK.",        OPENBLOCK,        "OPENBLOCK",      IS_INLINE }
        , { ".DBGDOT.",           DBGDOT,           "DBGDOT",         IS_INLINE }
        , { ".DBGDOTS.",          DBGDOTS,          "DBGDOTS",        IS_INLINE }
        , { ".NOP.",              NOP,              "NOP",            IS_INLINE }
        , { ".BREAK.",            BREAK,            "BREAK",          IS_INLINE }
        , { ".RESET.",            RESET,            "RESET",          IS_INLINE }
        , { ".BYE.",              BYE,              "BYE",            IS_INLINE }
        , { NULL,                 0,                 "",              IS_INLINE }
 };


/*
NB build this in somehow to enable usage of VT100 ECSAPE sequences to control the screen

	HANDLE hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	DWORD dwMode = 0;
	GetConsoleMode(hOut, &dwMode);
	dwMode |= ENABLE_VIRTUAL_TERMINAL_PROCESSING;
	SetConsoleMode(hOut, dwMode);
*/

// ------------------------------------------------------------------------------------------
void Store(CELL loc, CELL num)
{
	//TRACE("storing %4lx to %04lx", num, loc);
	*(CELL *)(&the_memory[loc]) = num;
}

void CStore(CELL loc, BYTE num)
{
	//TRACE("storing %d to %04lx", num, loc);
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
		// printf(" , %04lx (%04lx)", num, HERE);
		Store(HERE, num);
		HERE += CELL_SZ;
	}
	else
	{
		printf("Comma(%04lx): out of memory!\n", num);
		printf("HERE = %04lx, LAST = %04lx\n", HERE, LAST);
		exit(0);
	}
}

void CComma(BYTE num)
{
	if (HERE < LAST)
	{
		// printf(" C, %02lx (%04lx)", num, HERE);
		the_memory[HERE] = num;
		HERE += 1;
	}
	else
	{
		printf("CComma(%02x): out of memory!\n", (int)num);
		printf("HERE = %04lx, LAST = %04lx\n", HERE, LAST);
		exit(0);
	}
}

void SyncMem(bool isSet)
{
	if (isSet)
	{
		Store(ADDR_LAST,  LAST);
		Store(ADDR_HERE,  HERE);
		Store(ADDR_BASE,  BASE);
		Store(ADDR_STATE, STATE);
		Store(ADDR_MEM_SZ, MEM_SZ);
	}
	else
	{
		LAST  = Fetch(ADDR_LAST);
		HERE  = Fetch(ADDR_HERE);
		BASE  = Fetch(ADDR_BASE);
		STATE = Fetch(ADDR_STATE);
		TRACE("-STATE=%d-", STATE);
	}
}

void ExecuteXT(CELL XT)
{
	SyncMem(true);
	cpu_loop(XT);
	SyncMem(false);
}

DICT_T *FindWord(LPCTSTR word)
{
	TRACE(" looking for word [%s]\n", word);
	DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
	while (dp->next > 0)
	{
		if (string_equals(word, dp->name))
		{
			return dp;
		}
		TRACE("[next=%04lx]", dp->next);
		dp = (DICT_T *)(&the_memory[dp->next]);
	}

	return 0;
}

bool MakeNumber(LPCTSTR word, CELL *the_num)
{
	TRACE("(MakeNumber-%s)", word);
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
	TRACE("\nDefining word [%s] at %04lx, HERE=%04lx", word, LAST, HERE);

	DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
	dp->next = curLAST;
	dp->XT = HERE;
	dp->flags = flags;
	dp->len = string_len(word);
	strcpy(dp->name, word);
	SyncMem(true);
	TRACE(" ... done\n");
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

bool parseBinary(char *word, CELL *val)
{
	CELL ret = 0;
	char *cp = word+1;

	if (strlen(word) == 1) 
	{
		return false;
	}

	while (*cp)
	{
		ret = (ret << 1);
		char c = toupper(*cp);
		if (('0' <= c) && (c <= '1'))
		{
			ret += (c - '0');
		}
		else
		{
			return false;
		}
		++cp;
	}
	*val = ret;
	return true;
}

bool parseDecimal(char *word, CELL *val)
{
	CELL ret = 0;
	char *cp = word+1;

	if (strlen(word) == 1) 
	{
		return false;
	}

	while (*cp)
	{
		ret = (ret * 10);
		char c = toupper(*cp);
		if (('0' <= c) && (c <= '9'))
		{
			ret += (c - '0');
		}
		else
		{
			return false;
		}
		++cp;
	}
	*val = ret;
	return true;
}

bool parseHex(char *word, CELL *val)
{
	CELL ret = 0;
	char *cp = word+1;

	if (strlen(word) == 1) 
	{
		return false;
	}

	while (*cp)
	{
		ret = (ret << 4);
		char c = toupper(*cp);
		if (('0' <= c) && (c <= '9'))
		{
			ret += (c - '0');
		}
		else if (('A' <= c) && (c <= 'F'))
		{
			ret += (c - 'A');
			ret += 10;
		}
		else
		{
			return false;
		}
		++cp;
	}
	*val = ret;
	return true;
}

char *ParseWord(char *word, char *line)
{
	CELL val;

	TRACE("[pw-%s]", word);
	TRACE("Parse(%s), HERE=%04lx, LAST=%04lx, STATE=%ld\n", word, HERE, LAST, STATE);

	if (string_equals(word, ".QUIT"))
	{
		_QUIT_HIT = 1;
		return line;
	}

	TRACE("[pw-1]");
	if ((STATE < 0) || (STATE > 2))
	{
		printf("STATE (%ld) is messed up!\n", STATE);
		STATE = 0;
	}

	TRACE("[pw-2]");
	if (string_equals(word, ":"))
	{
		line = GetWord(line, word);
		DefineWord(word, 0);
		CComma(DICTP);
		Comma(LAST);
		STATE = 1;

		return line;
	}

	TRACE("[pw-3]");
	if (string_equals(word, ".VARIABLE."))
	{
		TRACE("\n");
		line = GetWord(line, word);
		DefineWord(word, 0);
		CComma(DICTP);
		Comma(LAST);
		CComma(LITERAL);
		Comma(HERE + 5);
		CComma(RET);

		if (strcmp(word, "(HERE)") == 0)
			ADDR_HERE = HERE;

		if (strcmp(word, "(LAST)") == 0)
			ADDR_LAST = HERE;

		if (strcmp(word, "BASE") == 0)
			ADDR_BASE = HERE;

		if (strcmp(word, "STATE") == 0)
		{
			ADDR_STATE = HERE;
			TRACE("-ADDR_STATE: %04lx-", ADDR_STATE);
		}

		if (strcmp(word, "(MEM_SZ)") == 0)
			ADDR_MEM_SZ = HERE;

		Comma(0);
		SyncMem(true);
		return line;
	}

	TRACE("[pw-4]");
	// Character literal? e.g. - 'X'
	if ((strlen(word) == 3) && (word[0] == '\'') && (word[2] == '\''))
	{
		val = word[1];
		if (STATE == 0)
		{
			push(val);
		}
		else
		{
			CComma(CLITERAL);
			CComma(val);
		}
		return line;
	}

	TRACE("[pw-5]");
	// HEX words look like this: $<hex-number>
	if ((word[0] == '$') && (parseHex(word, &val)))
	{
		if (STATE == 0)
		{
			push(val);
		}
		else
		{
			if (val < 256)
			{
				CComma(CLITERAL);
				CComma(val);
			}
			else
			{
				CComma(LITERAL);
				Comma(val);
			}
			
		}
		return line;
	}

	TRACE("[pw-6]");
	// DECIMAL words look like this: #<decimal-number>
	if ((word[0] == '#') && (parseDecimal(word, &val)))
	{
		if (STATE == 0)
		{
			push(val);
		}
		else
		{
			if (val < 256)
			{
				CComma(CLITERAL);
				CComma(val);
			}
			else
			{
				CComma(LITERAL);
				Comma(val);
			}
			
		}
		return line;
	}

	TRACE("[pw-7]");
	// BINARY words look like this: %<binary-number>
	if ((word[0] == '%') && (parseBinary(word, &val)))
	{
		if (STATE == 0)
		{
			push(val);
		}
		else
		{
			if (val < 256)
			{
				CComma(CLITERAL);
				CComma(val);
			}
			else
			{
				CComma(LITERAL);
				Comma(val);
			}
			
		}
		return line;
	}

	// if (strcmp(word, ".CSTORE.") == 0)
	// {
	// 	CComma(CSTORE);
	// 	return line;
	// }

	// if (strcmp(word, ".ADD.") == 0)
	// {
	// 	CComma(ADD);
	// 	return line;
	// }

	// if (strcmp(word, ".INC.") == 0)
	// {
	// 	CComma(INC);
	// 	return line;
	// }

	// if (strcmp(word, ".NOP.") == 0)
	// {
	// 	CComma(NOP);
	// 	return line;
	// }

	if (strcmp(word, ".INLINE.") == 0)
	{
		DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
		dp->flags |= IS_INLINE;
		return line;
	}

	if (strcmp(word, ".IMMEDIATE.") == 0)
	{
		DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
		dp->flags |= IS_IMMEDIATE;
		return line;
	}

	TRACE("[here]");
	// "Assembler" words
	for (int i = 0; ; i++)
	{
		TRACE(" %d", i);
		OPCODE_T *op = &(theOpcodes[i]);
		if (op->asm_instr == NULL)
		{
			break;
		}

		// TRACE("[%s] == [%s]?\n", word, op->asm_instr);
		if (strcmp(word, op->asm_instr) == 0)
		{
			CComma(op->opcode);
			return line;
		}

	}

	TRACE("[here]");
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
		TRACE("FORTH word [%s]. STATE=%ld ... ", dp->name, STATE);
		if (STATE == 1)
		{
			TRACE("compiling into current word\n", dp->name, dp->XT, STATE);
			if (dp->flags & IS_IMMEDIATE)
			{
				TRACE("executing 0x%04lx ...", dp->XT);
				SyncMem(true);
				cpu_loop(dp->XT);
				SyncMem(false);
			}
			else if (dp->flags & IS_INLINE)
			{
				// Skip the DICTP instruction
				CELL addr = dp->XT + 1 + CELL_SZ;
				TRACE("inlining 0x%04lx ...", dp->XT);

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
			TRACE("executing it ...\n");
			SyncMem(true);
			cpu_loop(dp->XT);
			SyncMem(false);
		}
		return line;
	}

	TRACE(" not a word, Number?");

	CELL num = 0;
	if (MakeNumber(word, &num))
	{
		TRACE("IsNumber: %ld (%04lx), STATE=%ld\n", num, num, STATE);
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

void ParseLine(char *line)
{
	char *source = line;
	char word[128];

	TRACE(", ParseLine('%s')", line);

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


void CompilerInit()
{
	init_vm(MEM_SZ);
	the_memory[0] = RET;
	isEmbedded = true;

	HERE = 0x0040;
	// LAST = MEM_SZ - STACKS_SZ - CELL_SZ;
	LAST = MEM_SZ - CELL_SZ;
	STATE = 0;

	Store(LAST, 0);
	Store(ADDR_CELL, CELL_SZ);
	Store(ADDR_BASE, BASE);
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
		TRACE("\n(%d) HERE = 0x%04lx", line_no, HERE);
        strcpy(line, buf);
        ParseLine(buf);
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
		dp = FindWord("MAIN");
		if (dp == NULL)
		{
			dp = (DICT_T *)&the_memory[LAST];
		}
	}

	CStore(0, JMP);
	Store(1, dp->XT);

	SyncMem(true);
}

void do_compile()
{
    printf("compiling from %s...\n", input_fn);
	CompilerInit();
	// return;

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("can't open input file!");
        exit(1);
    }

	Compile(input_fp);
	Store(ADDR_BASE, 10);
    fclose(input_fp);
    input_fp = NULL;
}

// *********************************************************************
void write_output_file()
{
    printf("writing output file %s ... ", output_fn);

    output_fp = fopen(output_fn, "wb");
    if (!output_fp)
    {
        printf("ERROR: Can't open output file!");
        exit(1);
    }

	int num = fwrite(the_memory, 1, MEM_SZ, output_fp);
    fclose(output_fp);
    output_fp = NULL;
    printf("%d bytes written.\n", num);
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
    else if (*arg == 'm')
    {
        arg = arg+2;
        mem_size_KB = atoi(arg);
    }
    else if (*arg == '?')
    {
        printf("usage: forth-compiler [args]\n");
        printf("  -i:inputFile (full or relative path)\n");
        printf("      default inputFile is forth.src\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth.bin\n");
        printf("  -m:<KB> - Memory size in KB\n");
        printf("      default value is 64\n");
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

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

	MEM_SZ = mem_size_KB * 1024;
    do_compile();
	write_output_file();

    return 0;
}
