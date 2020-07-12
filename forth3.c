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

CELL HERE, LAST, STATE;
CELL BASE = 10;

CELL ADDR_CELL     = 0x08;
CELL ADDR_HERE     = 0x10;
CELL ADDR_LAST     = 0x14;
CELL ADDR_BASE     = 0x18;
CELL ADDR_STATE    = 0x20;
CELL ADDR_MEM_SZ   = 0x24;

bool isNew = true;

extern int _QUIT_HIT;
bool _ALL_OK;

OPCODE_T theOpcodes[] = {
       { ".LITERAL.", 1, "LITERAL" },
       { ".FETCH.", 2, "FETCH" },
       { ".STORE.", 3, "STORE" },
       { ".SWAP.", 4, "SWAP" },
       { ".DROP.", 5, "DROP" },
       { ".DUP.", 6, "DUP" },
       { ".SLITERAL.", 7, "SLITERAL" },
       { ".JMP.", 8, "JMP" },
       { ".JMPZ.", 9, "JMPZ" },
       { ".JMPNZ.", 10, "JMPNZ" },
       { ".CALL.", 11, "CALL" },
       { ".RET.", 12, "RET" },
       { ".OR.", 13, "OR" },
       { ".CLITERAL.", 14, "CLITERAL" },
       { ".CFETCH.", 15, "CFETCH" },
       { ".CSTORE.", 16, "CSTORE" },
       { ".ADD.", 17, "ADD" },
       { ".SUB.", 18, "SUB" },
       { ".MUL.", 19, "MUL" },
       { ".DIV.", 20, "DIV" },
       { ".LT.", 21, "LT" },
       { ".EQ.", 22, "EQ" },
       { ".GT.", 23, "GT" },
       { ".DICTP.", 24, "DICTP" },
       { ".EMIT.", 25, "EMIT" },
       { ".OVER.", 26, "OVER" },
       { ".COMPARE.", 27, "COMPARE" },
       { ".FOPEN.", 28, "FOPEN" },
       { ".FREAD.", 29, "FREAD" },
       { ".FREADLINE.", 30, "FREADLINE" },
       { ".FWRITE.", 31, "FWRITE" },
       { ".FCLOSE.", 32, "FCLOSE" },
       { ".DTOR.", 33, "DTOR" },
       { ".RTOD.", 34, "RTOD" },
       { ".LOGLEVEL.", 35, "LOGLEVEL" },
       { ".AND.", 36, "AND" },
       { ".PICK.", 37, "PICK" },
       { ".DEPTH.", 38, "DEPTH" },
       { ".GETCH.", 39, "GETCH" },
       { ".COMPAREI.", 40, "COMPAREI" },
       { ".SLASHMOD.", 41, "SLASHMOD" },
       { ".NOT.", 42, "NOT" },
       { ".RFETCH.", 43, "RFETCH" },
       { ".INC.", 44, "INC" },
       { ".RDEPTH.", 45, "RDEPTH" },
       { ".DEC.", 46, "DEC" },
       { ".GETTICK.", 47, "GETTICK" },
       { ".SHIFTLEFT.", 48, "SHIFTLEFT" },
       { ".SHIFTRIGHT.", 49, "SHIFTRIGHT" },
       { ".PLUSSTORE.", 50, "PLUSSTORE" },
       { ".BRANCHF.",   90, "BRANCHF" },
       { ".BRANCHB.",   91, "BRANCHB" },
       { ".BRANCHFZ.",  92, "BRANCHFZ" },
       { ".BRANCHBZ.",  93, "BRANCHBZ" },
       { ".BRANCHFNZ.", 94, "BRANCHFNZ" },
       { ".BRANCHBNZ.", 95, "BRANCHBNZ" },
       { ".NOP.", 252, "NOP" },
       { ".BREAK.", 253, "BREAK" },
       { ".RESET.", 254, "RESET" },
       { ".BYE.", 255, "BYE" },
	   { NULL, 0, NULL },
       { ".DBGDOT.", 100, "DBGDOT" },
       { ".DBGDOTS.", 101, "DBGDOTS" },
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
	Store(HERE, num);
	HERE += CELL_SZ;
	// if ((0 <= HERE) && (HERE < LAST))
	// {
	// 	// printf(" , %04lx (%04lx)", num, HERE);
	// 	Store(HERE, num);
	// 	HERE += CELL_SZ;
	// }
	// else
	// {
	// 	printf("Comma(%04lx): out of memory!\n", num);
	// 	printf("HERE = %04lx, LAST = %04lx\n", HERE, LAST);
	// 	exit(0);
	// }
}

void CComma(BYTE num)
{
	the_memory[HERE] = num;
	HERE += 1;
	// if (HERE < LAST)
	// {
	// 	// printf(" C, %02lx (%04lx)", num, HERE);
	// 	the_memory[HERE] = num;
	// 	HERE += 1;
	// }
	// else
	// {
	// 	printf("CComma(%02x): out of memory!\n", (int)num);
	// 	printf("HERE = %04lx, LAST = %04lx\n", HERE, LAST);
	// 	exit(0);
	// }
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
	}
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

CELL FindWord_NEW(LPCTSTR word)
{
	trace(" looking for word [%s]\n", word);
	CELL cur = LAST;
	while (cur > 0)
	{
		DICT_T_NEW *dp = (DICT_T_NEW *)(&the_memory[cur]);
		if (string_equals(word, dp->name))
		{
			return cur;
		}
		cur = dp->prev;
	}

	return cur;
}

CELL FindWord_OLD(LPCTSTR word)
{
	trace(" looking for word [%s]\n", word);
	CELL cur = LAST;
	while (cur > 0)
	{
		DICT_T *dp = (DICT_T *)(&the_memory[cur]);
		if (string_equals(word, dp->name))
		{
			return cur;
		}
		cur = dp->next;
	}

	return 0;
}

CELL FindWord(LPCTSTR word)
{
	if (isNew)
		return FindWord_NEW(word);
	else
		return FindWord_OLD(word);
}

BYTE GetFlags(CELL addr)
{
	addr += CELL_SZ;
	addr += CELL_SZ;
	return CFetch(addr);
}

CELL GetXT(CELL addr)
{
	if (isNew)
	{
		addr += CELL_SZ;			// next
		addr += CELL_SZ;			// prev
		addr += 1;					// flags
		addr += CFetch(addr);	    // word-len
		addr += 2;					// len byte, null-terminator

		return addr;
	}
	return Fetch(addr + CELL_SZ);
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

void DefineWord_NEW(LPCTSTR word, BYTE flags)
{
	int len = strlen(word);
	CELL oldLAST = LAST;

	debug("Defining word [%s] at %04lx, LAST=%04lx\n", word, HERE, LAST);

	// Doubly linked list
	if (oldLAST > 0)
		SETAT(oldLAST, HERE);

	LAST = HERE;
	Comma(0);		// next
	Comma(oldLAST);	// prev
	CComma(flags);
	CComma(len);
	for (int i = 0; i < len; i++)
	{
		CComma(word[i]);
	}
	CComma(0);

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
		_ALL_OK = false;
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
		if (isNew)
			DefineWord_NEW(word, 0);
		else
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
		if (isNew)
			DefineWord_NEW(word, 0);
		else
			DefineWord(word, 0);
		// CComma(DICTP);
		// Comma(LAST);
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
			ADDR_STATE = HERE;

		if (strcmp(word, "(MEM_SZ)") == 0)
			ADDR_MEM_SZ = HERE;

		Comma(0);
		SyncMem(true);
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
			CComma(CLITERAL);
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
		if (isNew)
		{
			DICT_T_NEW *dp = (DICT_T_NEW *)(&the_memory[LAST]);
			dp->flags |= IS_INLINE;
		}
		else
		{
			DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
			dp->flags |= IS_INLINE;
		}
		return line;
	}

	if (strcmp(word, ".IMMEDIATE.") == 0)
	{
		if (isNew)
		{
			DICT_T_NEW *dp = (DICT_T_NEW *)(&the_memory[LAST]);
			dp->flags |= IS_IMMEDIATE;
		}
		else
		{
			DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
			dp->flags |= IS_IMMEDIATE;
		}
		return line;
	}

	// "Assembler" words
	for (int i = 0; ; i++)
	{
		OPCODE_T *op = &(theOpcodes[i]);
		if (op->asm_instr == NULL)
		{
			break;
		}

		// printf("[%s] == [%s]?\n", word, op->asm_instr);
		if (strcmp(word, op->asm_instr) == 0)
		{
			CComma(op->opcode);
			return line;
		}

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

	CELL wordAddr = FindWord(word);
	if (wordAddr != 0)
	{
		CELL xt = GetXT(wordAddr);
		CELL flags = GetFlags(wordAddr);
		// debug("FORTH word [%s]. STATE=%ld ... ", dp->name, STATE);
		if (STATE == 1)
		{
			debug("compiling into current word\n");
			if (flags & IS_IMMEDIATE)
			{
				// printf("executing 0x%04lx ...", xt);
				ExecuteXT(xt);
			}
			else if (flags & IS_INLINE)
			{
				// Skip the DICTP instruction
				CELL addr = xt; // + 1 + CELL_SZ;
				// printf("inlining 0x%04lx ...", xt);

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
				Comma(xt);
			}
		}
		else
		{
			debug("executing it ...\n");
			ExecuteXT(xt);
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

	HERE = 0x0040;
	LAST = MEM_SZ - CELL_SZ;
	if (isNew)
	{
		LAST = 0;
		// Comma(0);
	}
	STATE = 0;

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

	CStore(0, JMP);
	Store(1, GetXT(addr));

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
        printf("      default inputFile is block-0000.fs\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth.bin\n");
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

	if (_ALL_OK)
	{
		PC = 0;
		SyncMem(true);
		PC = 0;
		isBYE = false;
		isEmbedded = false;
		CELL ret = cpu_loop();
		SyncMem(false);
	}


    return 0;
}
