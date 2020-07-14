#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include "forth-vm.h"
#include "Shared.h"
#include "logger.h"
#include "string.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;
int mem_size_KB = 64;

CELL HERE, LAST, STATE, BASE;

bool isNew = true;
bool run_vm = true;

extern int _QUIT_HIT;
bool _ALL_OK;

extern void do_dis(char *);
extern void (*vm_prims[])();

OPCODE_T theOpcodes[] = {
		  { ".LITERAL.",    LITERAL,       "LITERAL",     prim_LITERAL,   IS_IMMEDIATE }
		, { ".FETCH.",      FETCH,         "FETCH",       prim_FETCH,     IS_IMMEDIATE }
		, { ".STORE.",      STORE,         "STORE",       prim_STORE,     IS_IMMEDIATE }
		, { ".SWAP.",       SWAP,          "SWAP",        prim_SWAP,      IS_IMMEDIATE }
		, { ".DROP.",       DROP,          "DROP",        prim_DROP,      IS_IMMEDIATE }
		, { ".DUP.",        DUP,           "DUP",         prim_DUP,       IS_IMMEDIATE }
		, { ".SLITERAL.",   SLITERAL,      "SLITERAL",    prim_SLITERAL,  IS_IMMEDIATE }
		, { ".JMP.",        JMP,           "JMP",         prim_JMP,       IS_IMMEDIATE }
		, { ".JMPZ.",       JMPZ,          "JMPZ",        prim_JMPZ,      IS_IMMEDIATE }
		, { ".JMPNZ.",      JMPNZ,         "JMPNZ",       prim_JMPNZ,     IS_IMMEDIATE }
		, { ".CALL.",       CALL,          "CALL",        prim_CALL,      IS_IMMEDIATE }
		, { ".RET.",        RET,           "RET",         prim_RET,       IS_IMMEDIATE }
		, { ".OR.",         OR,            "OR",          prim_OR,        IS_IMMEDIATE }
		, { ".CLITERAL.",   CLITERAL,      "CLITERAL",    prim_CLITERAL,  IS_IMMEDIATE }
		, { ".CFETCH.",     CFETCH,        "CFETCH",      prim_CFETCH,    IS_IMMEDIATE }
		, { ".CSTORE.",     CSTORE,        "CSTORE",      prim_CSTORE,    IS_IMMEDIATE }
		, { ".ADD.",        ADD,           "ADD",         prim_ADD,       IS_IMMEDIATE }
		, { ".SUB.",        SUB,           "SUB",         prim_SUB,       IS_IMMEDIATE }
		, { ".MUL.",        MUL,           "MUL",         prim_MUL,       IS_IMMEDIATE }
		, { ".DIV.",        DIV,           "DIV",         prim_DIV,       IS_IMMEDIATE }
		, { ".LT.",         LT,            "LT",          prim_LT,        IS_IMMEDIATE }
		, { ".EQ.",         EQ,            "EQ",          prim_EQ,        IS_IMMEDIATE }
		, { ".GT.",         GT,            "GT",          prim_GT,        IS_IMMEDIATE }
		, { ".DICTP.",      DICTP,         "DICTP",       prim_DICTP,     IS_IMMEDIATE }
		, { ".EMIT.",       EMIT,          "EMIT",        prim_EMIT,      IS_IMMEDIATE }
		, { ".OVER.",       OVER,          "OVER",        prim_OVER,      IS_IMMEDIATE }
		, { ".COMPARE.",    COMPARE,       "COMPARE",     prim_COMPARE,   IS_IMMEDIATE }
		, { ".FOPEN.",      FOPEN,         "FOPEN",       prim_FOPEN,     IS_IMMEDIATE }
		, { ".FREAD.",      FREAD,         "FREAD",       prim_FREAD,     IS_IMMEDIATE }
		, { ".FREADLINE.",  FREADLINE,     "FREADLINE",   prim_FREADLINE, IS_IMMEDIATE }
		, { ".FWRITE.",     FWRITE,        "FWRITE",      prim_FWRITE,    IS_IMMEDIATE }
		, { ".FCLOSE.",     FCLOSE,        "FCLOSE",      prim_FCLOSE,    IS_IMMEDIATE }
		, { ".DTOR.",       DTOR,          "DTOR",        prim_DTOR,      IS_IMMEDIATE }
		, { ".RTOD.",       RTOD,          "RTOD",        prim_RTOD,      IS_IMMEDIATE }
		, { ".LOGLEVEL.",   LOGLEVEL,      "LOGLEVEL",    prim_LOGLEVEL,  IS_IMMEDIATE }
		, { ".AND.",        AND,           "AND",         prim_AND,       IS_IMMEDIATE }
		, { ".PICK.",       PICK,          "PICK",        prim_PICK,      IS_IMMEDIATE }
		, { ".DEPTH.",      DEPTH,         "DEPTH",       prim_DEPTH,     IS_IMMEDIATE }
		, { ".GETCH.",      GETCH,         "GETCH",       prim_GETCH,     IS_IMMEDIATE }
		, { ".COMPAREI.",   COMPAREI,      "COMPAREI",    prim_COMPAREI,  IS_IMMEDIATE }
		, { ".SLASHMOD.",   SLASHMOD,      "SLASHMOD",    prim_SLASHMOD,  IS_IMMEDIATE }
		, { ".NOT.",        NOT,           "NOT",         prim_NOT,       IS_IMMEDIATE }
		, { ".RFETCH.",     RFETCH,        "RFETCH",      prim_RFETCH,    IS_IMMEDIATE }
		, { ".INC.",        INC,           "INC",         prim_INC,       IS_IMMEDIATE }
		, { ".RDEPTH.",     RDEPTH,        "RDEPTH",      prim_RDEPTH,    IS_IMMEDIATE }
		, { ".DEC.",        DEC,           "DEC",         prim_DEC,       IS_IMMEDIATE }
		, { ".GETTICK.",    GETTICK,       "GETTICK",     prim_GETTICK,   IS_IMMEDIATE }
		, { ".SHIFTLEFT.",  SHIFTLEFT,     "SHIFTLEFT",   prim_SHIFTLEFT, IS_IMMEDIATE }
		, { ".SHIFTRIGHT.", SHIFTRIGHT,    "SHIFTRIGHT",  prim_SHIFTRIGHT IS_IMMEDIATE }
		, { ".PLUSSTORE.",  PLUSSTORE,     "PLUSSTORE",   prim_PLUSSTORE, IS_IMMEDIATE }
		, { ".BRANCHF.",    BRANCHF,       "BRANCHF",     prim_BRANCHF,   IS_IMMEDIATE }
		, { ".BRANCHFZ.",   BRANCHFZ,      "BRANCHFZ",    prim_BRANCHFZ,  IS_IMMEDIATE }
		, { ".BRANCHFNZ.",  BRANCHFNZ,     "BRANCHFNZ",   prim_BRANCHFNZ, IS_IMMEDIATE }
		, { ".BRANCHB.",    BRANCHB,       "BRANCHB",     prim_BRANCHB,   IS_IMMEDIATE }
		, { ".BRANCHBZ.",   BRANCHBZ,      "BRANCHBZ",    prim_BRANCHBZ,  IS_IMMEDIATE }
		, { ".BRANCHBNZ.",  BRANCHBNZ,     "BRANCHBNZ",   prim_BRANCHBNZ, IS_IMMEDIATE }
		, { ".DBGDOT.",     DBGDOT,        "DBGDOT",      prim_DBGDOT,    IS_IMMEDIATE }
		, { ".DBGDOTS.",    DBGDOTS,       "DBGDOTS",     prim_DBGDOTS,   IS_IMMEDIATE }
		, { ".NOP.",        NOP,           "NOP",         prim_NOP,       IS_IMMEDIATE }
		, { ".BREAK.",      BREAK,         "BREAK",       prim_BREAK,     IS_IMMEDIATE }
		, { ".RESET.",      RESET,         "RESET",       prim_RESET,     IS_IMMEDIATE }
			, { ".BYE.",        BYE,           "BYE",         prim_BYE,       IS_IMMEDIATE }
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
	SETCELL(HERE, num);
	HERE += CELL_SZ;
}

void CComma(BYTE num)
{
	SETBYTE(HERE, num);
	HERE += 1;
}

CELL ExecuteXT(CELL XT)
{
	PC = XT;
	isBYE = false;
	isEmbedded = true;
	CELL ret = cpu_loop();

	return ret;
}

CELL FindWord(LPCTSTR word)
{
	int i = 0;
	// printf("\nlooking for word [%s]", word);
	CELL cur = LAST;
	do
	{
		DICT_T_NEW *dp = (DICT_T_NEW *)(cur);
		// printf("(%lx, [%s]==[%s]?)", cur, word, dp->name);
		if (string_equals(word, dp->name))
		{
			return cur;
		}
		// printf("next, %lx", dp->prev);
		cur = dp->prev;
	} while (cur > 0);

	return cur;
}

BYTE GetFlags(CELL addr)
{
	addr += CELL_SZ;
	addr += CELL_SZ;
	return GETBYTE(addr);
}

CELL GetXT(CELL addr)
{
	addr += CELL_SZ;			// prev
	addr += CELL_SZ;			// next
	addr += 1;					// flags
	addr += GETBYTE(addr);	    // word-len
	addr += 2;					// len byte, null-terminator

	return addr;
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
	int len = strlen(word);
	CELL newLAST = HERE;

	// printf("Defining word [%s] at %04lx, LAST=%04lx\n", word, HERE, LAST);

	// Doubly linked list
	if (LAST > 0)
	{
		CELL next = LAST + CELL_SZ;
		SETCELL(next, newLAST);
	}

	Comma(LAST);	// prev
	Comma(0);		// next
	CComma(flags);
	CComma(len);
	for (int i = 0; i < len; i++)
	{
		CComma(word[i]);
	}
	CComma(0);
	LAST = newLAST;
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
		
		// CComma(DICTP);
		// Comma(LAST);
		STATE = 1;

		return line;
	}


	if (string_equals(word, ".VARIABLE."))
	{
		trace("\n");
		line = GetWord(line, word);
		DefineWord(word, 0);
		CComma(LITERAL);
		Comma(HERE + 5);
		CComma(RET);
		Comma(0);
		return line;
	}

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
			Comma((CELL)vm_prims[CLITERAL]);
			CComma(val);
		}
		return line;
	}

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
				Comma((CELL)vm_prims[CLITERAL]);
				CComma(val);
			}
			else
			{
				Comma((CELL)vm_prims[LITERAL]);
				Comma(val);
			}
		}
		return line;
	}

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
				Comma((CELL)vm_prims[CLITERAL]);
				CComma(val);
			}
			else
			{
				Comma((CELL)vm_prims[LITERAL]);
				CComma(val);
			}
			
		}
		return line;
	}

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
				Comma((CELL)vm_prims[CLITERAL]);
				CComma(val);
			}
			else
			{
				Comma((CELL)vm_prims[LITERAL]);
				Comma(val);
			}
			
		}
		return line;
	}

	if (strcmp(word, ".INLINE.") == 0)
	{
		DICT_T_NEW *dp = (DICT_T_NEW *)(LAST);
		dp->flags |= IS_INLINE;
		return line;
	}

	if (strcmp(word, ".IMMEDIATE.") == 0)
	{
		if (isNew)
		{
			DICT_T_NEW *dp = (DICT_T_NEW *)(LAST);
			dp->flags |= IS_IMMEDIATE;
		}
		return line;
	}

	// "Assembler" words
	for (int i = 0; ; i++)
	{
		OPCODE_T *op = &(theOpcodes[i]);
		if (op->opcode == 0)
		{
			break;
		}

		// printf("[%s] == [%s]?\n", word, op->asm_instr);
		if (strcmp(word, op->asm_instr) == 0)
		{
			Comma((CELL)vm_prims[op->opcode]);
			return line;
		}

	}

	// These words are only for : definitions
	if (STATE == 1)
	{
		if (string_equals(word, ";"))
		{
			Comma((CELL)vm_prims[RET]);
			STATE = 0;
			return line;
		}

		if (strcmp(word, ".IF") == 0)
		{
			Comma((CELL)vm_prims[BRANCHFZ]);
			push(HERE);
			CComma(0);
			return line;
		}

		if (strcmp(word, ".THEN") == 0)
		{
			CELL tmp = pop();
			CELL offset = HERE - tmp;
			SETBYTE(tmp, offset);
			return line;
		}

		if (string_equals(word, "S\""))
		{
			Comma((CELL)vm_prims[SLITERAL]);
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
			SETBYTE(cur_here, count);
			return line;
		}
	}

	CELL wordAddr = FindWord(word);
	if (wordAddr != 0)
	{
		CELL xt = GetXT(wordAddr);
		CELL flags = GetFlags(wordAddr);
		// printf("\nFORTH word (%s) at [%08lx]. STATE=%ld ...", word, wordAddr, STATE);
		if (STATE == 1)
		{
			// printf("compiling into current word\n");
			if (flags & IS_IMMEDIATE)
			{
				// printf("Immediate at 0x%08lx ...", xt);
				ExecuteXT(xt);
			}
			else if (flags & IS_INLINE)
			{
				// Skip the DICTP instruction
				CELL addr = xt; // + 1 + CELL_SZ;
				// printf("inlining 0x%08lx ...", xt);

				CELL addrRET = (CELL)vm_prims[RET];
				// Copy bytes until the first RET
				while (true)
				{
					if (GETCELL(addr) == addrRET)
					{
						break;
					}
					CComma(GETBYTE(addr++));
				}
			}
			else
			{
				Comma((CELL)vm_prims[CALL]);
				Comma(xt);
			}
		}
		else
		{
			// printf("executing it ...\n");
			ExecuteXT(xt);
		}
		return line;
	}

	// printf("checking if number ...");
	CELL num = 0;
	if (MakeNumber(word, &num))
	{
		// printf("IsNumber: %ld (%04lx), STATE=%ld\n", num, num, STATE);
		if (STATE == 1) // Compiling
		{
			if ((0 <= num) && (num <= 0xFF))
			{
				Comma((CELL)vm_prims[CLITERAL]);
				CComma((BYTE)num);
			}
			else
			{
				Comma((CELL)vm_prims[LITERAL]);
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
	_ALL_OK = false;
	printf("ERROR: '%s'??\n", word);
	return line;
}

void ParseLine(char *line)
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

void CompilerInit()
{
	init_vm(MEM_SZ);
	the_memory[0] = RET;
	isEmbedded = true;

	HERE = PC + 0x0040;
	LAST = 0;
	STATE = 0;
	BASE = 10;
}

void GenerateWord(char *name, BYTE flags, CELL *opcodes)
{
	DefineWord(name, flags);
	// printf("GenerateWord(): %d", opcodes[0]);
	for (int i = 0; opcodes[i] != 0; i++)
	{
		BYTE opcode = opcodes[i];
		Comma((CELL)vm_prims[opcode]);
		if (opcode == LITERAL)
		{
			Comma(opcodes[++i]);
		}
		if (opcode == CLITERAL)
		{
			CComma(opcodes[++i]);
		}
		if (opcode == CALL)
		{
			Comma(opcodes[++i]);
		}
	}
}

CELL xt4(char *name)
{
	CELL addr = FindWord(name);
	return (addr > 0) ? GetXT(addr) : 0;
}

void GenerateVariable(char *name, CELL addr)
{
	DefineWord(name, IS_INLINE);
	if (addr < 0x0100)
	{
		Comma((CELL)vm_prims[CLITERAL]);
		CComma(addr);
	}
	else
	{
		Comma((CELL)vm_prims[LITERAL]);
		Comma(addr);
	}
	Comma((CELL)vm_prims[RET]);
}

void GeneratePrimitive(char *name, BYTE opcode, BYTE flags)
{
	DefineWord(name, flags);
	if (flags == IS_IMMEDIATE)
	{
		Comma((CELL)vm_prims[LITERAL]);
		Comma((CELL)vm_prims[opcode]);
		Comma((CELL)vm_prims[CALL]);
		Comma(xt4(","));
	}
	else if (flags == IS_COMPILE)
	{
		Comma((CELL)vm_prims[LITERAL]);
		Comma((CELL)vm_prims[opcode]);
		Comma((CELL)vm_prims[CALL]);
		Comma(xt4(","));
	}
	else
	{
		Comma((CELL)vm_prims[opcode]);
	}
	Comma((CELL)vm_prims[RET]);
}

void GeneratePrimitives()
{
	GenerateVariable("(HERE)", (CELL) &HERE);
	GenerateVariable("(LAST)", (CELL) &LAST);
	GenerateVariable("BASE", (CELL) &BASE);
	GenerateVariable("STATE", (CELL) &STATE);
	GenerateVariable("CELL", (CELL) CELL_SZ);

	GenerateWord("HERE", 0, (CELL[]){ LITERAL, (CELL) &HERE, FETCH, RET, 0});
	GenerateWord("C,", 0, (CELL[]){ CALL, xt4("HERE"), CSTORE, 
		CALL, xt4("(HERE)"), DUP, FETCH, INC, SWAP, STORE, 
		RET, 0});
	GenerateWord(",", 0, (CELL[]){ CALL, xt4("HERE"), STORE, 
		CALL, xt4("(HERE)"), DUP, FETCH, CLITERAL, CELL_SZ, ADD, SWAP, STORE, 
		RET, 0});
	GenerateWord("LAST", 0, (CELL[]){ LITERAL, (CELL) &LAST, FETCH, RET, 0});

	for (int i = 0;; i++)
	{
		OPCODE_T x = theOpcodes[i];
		if (x.opcode == 0)
		{
			break;
		}
		GeneratePrimitive(x.forth_prim, x.opcode, x.flags);
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
		// printf("(%d) HERE = 0x%04lx\n", line_no, HERE);
        strcpy(line, buf);
        ParseLine(buf);
		if (_QUIT_HIT == 1)
		{
			printf("QUIT hit on line %d: %s\n", line_no, line);
			break;
		}
    }
    fclose(fp_in);

	CELL addr = FindWord("main");
	if (addr == NULL)
	{
		addr = FindWord("MAIN");
		if (addr == NULL)
		{
			addr = LAST;
		}
	}

	Store(0, (CELL)vm_prims[JMP]);
	Store(4, GetXT(addr));
}

void do_compile()
{
    printf("compiling from %s...\n", input_fn);
	CompilerInit();
	GeneratePrimitives();
	// return;

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("can't open input file!");
        exit(1);
    }

	Compile(input_fp);
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
    else if (*arg == 'n')
    {
		run_vm = false;
    }
    else if (*arg == '?')
    {
        printf("usage: forth3 [args]\n");
        printf("  -i:inputFile (full or relative path)\n");
        printf("      default inputFile is block-0000.fs\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth3.bin\n");
        printf("  -m:<KB> - Memory size in KB\n");
        printf("      default value is 64\n");
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
    strcpy(input_fn, "block-0000.fs");
    strcpy(output_fn, "forth.bin");
	_ALL_OK = true;
	debug_off();
	run_vm = true;

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

	// MEM_SZ = mem_size_KB * 1024;
    do_compile();
	write_output_file();
	do_dis("forth3.lst");

	if (run_vm && _ALL_OK)
	{
		PC = (CELL)the_memory;
		isBYE = false;
		isEmbedded = true;
		CELL ret = cpu_loop();
	}

    return 0;
}
