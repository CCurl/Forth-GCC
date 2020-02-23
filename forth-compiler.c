#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include "forth-vm.h"
#include "Shared.h"
#include "functions.h"
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
CELL ORG = 0;

extern int _QUIT_HIT;

// ------------------------------------------------------------------------------------------
OPCODE_T opcodes[] = {
	{ _T("RESET"), RESET, _T("RESET") }
	, { _T("PUSH"), LITERAL, _T("") }
	, { _T("CPUSH"), CLITERAL, _T("") }
	, { _T("FETCH"), FETCH, _T("@") }
	, { _T("STORE"), STORE, _T("!") }
	, { _T("CFETCH"), CFETCH, _T("C@") }
	, { _T("CSTORE"), CSTORE, _T("C!") }
	, { _T("SWAP"), SWAP, _T("SWAP") }
	, { _T("DROP"), DROP, _T("DROP") }
	, { _T("DUP"), DUP, _T("DUP") }
	, { _T("OVER"), OVER, _T("OVER") }
	, { _T("JMP"), JMP, _T("JMP") }
	, { _T("JMPZ"), JMPZ, _T("JMPZ") }
	, { _T("JMPNZ"), JMPNZ, _T("JMPNZ") }
	, { _T("CALL"), CALL, _T("") }
	, { _T("RET"), RET, _T("LEAVE") }
	, { _T("COMPARE"), COMPARE, _T("COMPARE") }
	, { _T("COMPAREI"), COMPAREI, _T("COMPAREI") }
	, { _T("ADD"), ADD, _T("+") }
	, { _T("SUB"), SUB, _T("-") }
	, { _T("MUL"), MUL, _T("*") }
	, { _T("DIV"), DIV, _T("/") }
	, { _T("LT"), LT, _T("<") }
	, { _T("EQ"), EQ, _T("=") }
	, { _T("GT"), GT, _T(">") }
	, { _T("DICTP"), DICTP, _T("DICTP") }
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
	, { _T("LOGLEVEL"), LOGLEVEL, _T("LOGLEVEL") }
	, { _T("DEPTH"), DEPTH, _T("DEPTH") }
	, { _T("AND"), AND, _T("AND") }
	, { _T("OR"), OR, _T("OR") }
	, { _T("GETCH"), GETCH, _T("GETCH") }
	, { _T("BREAK"), BREAK, _T("BREAK") }
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

void SyncMem(bool isSet)
{
	if (isSet)
	{
		Store(ADDR_LAST, LAST);
		Store(ADDR_HERE, HERE);
		CStore(ADDR_BASE, BASE);
	}
	else
	{
		LAST = Fetch(ADDR_LAST);
		HERE = Fetch(ADDR_HERE);
		BASE = CFetch(ADDR_BASE);
	}
}

void Compile(FILE *fp_in)
{
	HERE = 0;
	LAST = MEM_SZ - STACKS_SZ - CELL_SZ;
	STATE = 0;
	int line_no = 0;

	Store(LAST, 0);
	the_memory[ADDR_CELL] = CELL_SZ;
	CStore(ADDR_BASE, BASE);

	// CW2A source(m_source);
	// CW2A output(m_output);
	// CW2A binary(m_binary);

	char buf[128];
	char line[128];
    while (fgets(buf, sizeof(buf), fp_in) == buf)
    {
		string_rtrim(buf);
        ++line_no;
        strcpy(line, buf);
        Parse(buf);
		if (_QUIT_HIT == 1)
			break;
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

bool ExecuteOpcode(BYTE opcode)
{
	PC = HERE + 10;
	the_memory[PC] = opcode;

	SyncMem(true);
	cpu_step();
	SyncMem(false);

	return (PC > 0);
}

CELL ExecuteXT(CELL XT)
{
	SyncMem(true);
	PC = XT;
	isBYE = false;
	CELL ret = cpu_loop();
	SyncMem(false);

	return ret;
}

BYTE FindAsm(LPCTSTR word)
{
	for (int i = 0; opcodes[i].opcode != 0; i++)
	{
		if (string_equals(opcodes[i].asm_instr, word))
		{
			return opcodes[i].opcode;
		}
	}
	return 0;
}

BYTE FindForthPrim(LPCTSTR word)
{
	for (int i = 0; opcodes[i].opcode != 0; i++)
	{
		if (string_equals(opcodes[i].forth_prim, word))
		{
			return opcodes[i].opcode;
		}
	}
	return 0;
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

OPCODE_T *FindOpcode(BYTE opcode)
{
	for (int i = 0; opcodes[i].opcode != 0; i++)
	{
		if (opcodes[i].opcode == opcode)
		{
			return &opcodes[i];
		}
	}
	return NULL;
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
	CELL tmp = LAST;
	LAST -= ((CELL_SZ*2) + 3 + string_len(word));
	debug("Defining word [%s] at %04lx, HERE=%04lx\n", word, LAST, HERE);

	DICT_T *dp = (DICT_T *)(&the_memory[LAST]);
	dp->next = tmp;
	dp->XT = HERE;
	dp->flags = flags;
	dp->len = string_len(word);

	tmp = 0;
	char *cp = word;
	while (*cp)
	{
		dp->name[tmp++] = *(cp++);
	}
	dp->name[tmp++] = NULL;
	SyncMem(true);
}

void Comma(CELL num)
{
	// if ((HERE >= 0x03b5) && (HERE <= 0x03c4))
	// {
	// 	debug("\n%04lx:Comma(%04x)", HERE, num);
	// }
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
	// if ((HERE >= 0x03b5) && (HERE <= 0x03c4))
	// {
	// 	debug("\n%04lx:CComma(%02x)", HERE, (int)num);
	// }
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

	// if ((HERE >= 0x03b5) && (HERE <= 0x03c4))
	// {
	// 	debug("\nHERE:%04lx: GetWord([%s], [%s])", HERE, word, line);
	// }

    return line;
}

void Parse(char *line)
{
	char *source = line;
	char parsed[128];
	char word[128];

	trace("Parse(): line=[%s]\n", line);

	// // for debugging
	// if (0x05c8 < HERE)
	// {
	// 	trace_on();
	// }

	// // for debugging
	// if (0x0680 < HERE)
	// {
	// 	debug_off();
	// }

	while (string_len(line) > 0)
	{
		line = GetWord(line, word);
		if (string_len(parsed) > 0)
		{
			string_cat(parsed, " ");
		}
		string_cat(parsed, word);

		if (string_equals(word, "\\"))
		{
			return;
		}

		if (string_len(word) == 0)
		{
			return;
		}

		trace("Parse(): word=[%s], HERE=%04lx, LAST=%04lx, STATE=%ld\n", word, HERE, LAST, STATE);

		if (string_equals(word, ".QUIT"))
		{
			_QUIT_HIT = 1;
			return;
		}

		if (string_equals(word, ".DEBUG-ON"))
		{
			debug_on();
			continue;
		}

		if (string_equals(word, ".DEBUG-OFF"))
		{
			debug_off();
			continue;
		}

		if (string_equals(word, ".TRACE-ON"))
		{
			trace_on();
			continue;
		}

		if (string_equals(word, ".TRACE-OFF"))
		{
			debug_off();
			continue;
		}

		if (string_equals(word, ".ORG"))
		{
			GetWord(line, word);
			CELL addr = 0;
			if (MakeNumber(word, &addr))
			{
				ORG = addr;
				HERE = addr;
			}
			continue;
		}

		if (string_equals(word, ".HEX"))
		{
			BASE = 16;
			CStore(ADDR_BASE, BASE);
			continue;
		}

		if (string_equals(word, ".DECIMAL"))
		{
			BASE = 10;
			CStore(ADDR_BASE, BASE);
			continue;
		}

		if ((STATE < 0) || (STATE > 2))
		{
			printf("STATE (%ld) is messed up!\n", STATE);
			STATE = 0;
		}

		if (string_equals(word, ":"))
		{
			STATE = 1;
			line = GetWord(line, word);
			strcat(parsed, word);
			trace("\n");
			DefineWord(word, 0);
			CComma(DICTP);
			Comma(LAST);
			continue;
		}

		if (string_equals(word, "IMMEDIATE"))
		{
			DICT_T *dp = (DICT_T *)&the_memory[LAST];
			dp->flags |= IS_IMMEDIATE;
			continue;
		}

		if (string_equals(word, "INLINE"))
		{
			DICT_T *dp = (DICT_T *)&the_memory[LAST];
			dp->flags |= IS_INLINE;
			continue;
		}

		if (string_equals(word, "<asm>"))
		{
			STATE = 2;
			continue;
		}

		if (string_equals(word, "</asm>"))
		{
			STATE = 1;
			continue;
		}

		if (string_equals(word, ".HERE"))
		{
			push(HERE);
			if (STATE == 1)
			{
				CComma(LITERAL);
				Comma(pop());
			}
			continue;
		}

		if (string_equals(word, ".CELL"))
		{
			push(CELL_SZ);
			continue;
		}

		if (string_equals(word, ".LITERAL"))
		{
			CComma(LITERAL);
			Comma(pop());
			continue;
		}

		if (string_equals(word, ".CLITERAL"))
		{
			CComma(CLITERAL);
			CComma((BYTE)pop());
			continue;
		}

		if (string_equals(word, ".COMMA"))
		{
			Comma(pop());
			continue;
		}

		// These words are only for : definitions
		if (STATE == 1)
		{
			if (string_equals(word, ";"))
			{
				CComma(RET);
				STATE = 0;
				continue;
			}

			if (strcmp(word, "IF") == 0)
			{
				CComma(JMPZ);
				push(HERE);
				Comma(0);
				continue;
			}

			if (strcmp(word, "ELSE") == 0)
			{
				CELL tmp = pop();
				CComma(JMP);
				push(HERE);
				Comma(0);
				Store(tmp, HERE);
				continue;
			}

			if (strcmp(word, "THEN") == 0)
			{
				CELL tmp = pop();
				Store(tmp, HERE);
				continue;
			}

			if (strcmp(word, "BEGIN") == 0)
			{
				push(HERE);
				continue;
			}

			if (strcmp(word, "AGAIN") == 0)
			{
				CComma(JMP);
				Comma(pop());
				continue;
			}

			if (strcmp(word, "WHILE") == 0)
			{
				CComma(JMPNZ);
				Comma(pop());
				continue;
			}

			if (strcmp(word, "UNTIL") == 0)
			{
				CComma(JMPZ);
				Comma(pop());
				continue;
			}

			if (string_equals(word, "("))
			{
				while (true)
				{
					BYTE ch = *(line++);
					if ((ch == ')') || (ch == NULL))
						break;
				}
				continue;
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
				continue;
			}
		}

		BYTE opcode = FindAsm(word);
		//if ((STATE == 0) || (STATE == 2))
		if (0 < opcode)
		{
			trace("[%s] Is an ASM keyword: opcode=%d\n", word, opcode);
			if (STATE == 0)
			{
				if (! ExecuteOpcode(opcode))
				{
					printf("\n%s: unsupported opcode %d", (LPCTSTR)source, opcode);
				}
			}
			else 
			{
				CComma(opcode);
			}
			continue;
		}

		opcode = FindForthPrim(word);
		if (0 < opcode)
		{
			trace("[%s] Is a FORTH primitive: opcode=%d\n", word, opcode);
			if (STATE == 1)
			{
				CComma(opcode);
			}
			else
			{
				if (!ExecuteOpcode(opcode))
				{
					printf("\n%s: unsupported opcode %d", (LPCTSTR)source, opcode);
				}
			}
			continue;
		}

		DICT_T *dp = FindWord(word);
		if (dp != NULL)
		{
			debug("FORTH word [%s]. STATE=%ld ... ", dp->name, STATE);
			if (STATE == 1)
			{
				debug("compiling into current word\n", dp->name, dp->XT, STATE);
				if (dp->flags & IS_INLINE)
				{
					// Skip the DICTP instruction
					CELL addr = dp->XT + CELL_SZ + 1;

					// Copy bytes until the first RET
					while (true)
					{
						BYTE b = the_memory[addr++];
						if (b != RET)
						{
							CComma(b);
						}
						else
						{
							break;
						}
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
				//wprintf(_T("%s: cannot execute '%s'!\n"), (LPCTSTR)source, (LPCTSTR)word);
			}
			continue;
		}

		CELL num = 0;
		if (MakeNumber(word, &num))
		{
			trace("IsNumber: %ld (%04lx), STATE=%ld\n", num, num, STATE);
			if (STATE == 0) // Interactive
			{
				push(num);
				continue;
			}
			else if (STATE == 1) // Compiling
			{
				if ((0 <= num) && (num <= 255))
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
			else  if (STATE == 2) // <ASM>
			{
				push(num);
				continue;
			}
			continue;
		}

		printf("ERROR: %s: '%s'??\n", source, word);
	}
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
    printf("done.\n");
}

void CompilerInit()
{
	init_vm(MEM_SZ);
	the_memory[0] = RET;
	isEmbedded = true;
}

void do_compile()
{
    printf("compiling from %s... ", input_fn);
	CompilerInit();

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("can't open input file!");
        exit(1);
    }

	Compile(input_fp);
    fclose(input_fp);
    input_fp = NULL;

    printf(" done.\n");
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
