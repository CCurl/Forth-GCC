#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include "Shared.h"
#include "functions.h"
#include "logger.h"
#include "string.h"

BYTE the_memory[MEM_SZ];

#include "ForthVM.h"
#include "ForthVM-Dis.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;


// Values for the flags bit field
#define IS_IMMEDIATE 0x01
#define IS_INLINE    0x02

bool isTailJmpSafe;
// extern BYTE *the_memory;
// extern void init_vm();
// extern CELL cpu_loop();
// extern void cpu_step();
// extern CELL PC;
// extern CELL *DSP, *RSP;
// extern bool isEmbedded;
// extern bool isBYE;

CELL HERE, LAST, STATE;
CELL BASE = 10;

void Store(CELL loc, CELL num)
{
	*(CELL *)(&the_memory[loc]) = num;
}

void CStore(CELL loc, BYTE num)
{
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
		Store(ADDR_BASE, BASE);
	}
	else
	{
		LAST = Fetch(ADDR_LAST);
		HERE = Fetch(ADDR_HERE);
		BASE = Fetch(ADDR_BASE);
	}
}

void Compile(FILE *fp_in)
{
	HERE = 0;
	LAST = (DSP_BASE) - (CELL_SZ);
	STATE = 0;
	int line_no = 0;

	Store(LAST, 0);
	the_memory[ADDR_CELL] = CELL_SZ;
	Store(ADDR_BASE, BASE);

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
	debug(" looking for word [%s]\n", word);
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

	// One leading minus sign is OK
	if (*w == '-')
	{
		is_neg = true;
		w++;
	}

	while (*w)
	{
		char ch = *(w++);
		CELL digit = -1;
		if (('0' <= ch) && (ch <= '9'))
		{
			digit = ch - '0';
		}

		if (BASE == 16)
		{
			if (('A' <= ch) && (ch <= 'F'))
			{
				digit = (ch - 'A') + 10;
			}
			if (('a' <= ch) && (ch <= 'f'))
			{
				digit = (ch - 'a') + 10;
			}
		}
		if (digit < 0)
		{
			return false;
		}
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
}

void Comma(CELL num)
{
	// if ((HERE >= 0x03b5) && (HERE <= 0x03c4))
	// {
	// 	debug("\n%04lx:Comma(%04x)", HERE, num);
	// }
	if ((0 <= HERE) && (HERE < LAST))
	{
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

bool IsTailJmpSafe()
{
	return isTailJmpSafe;
}

void MakeTailJmpSafe()
{
	isTailJmpSafe = true;
}

void MakeTailJmpUnSafe()
{
	isTailJmpSafe = false;
}

void Parse(char *line)
{
	char *source = line;
	char parsed[128];
	char word[128];

	trace("Parse(): line=[%s]\n", line);

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
		if (string_equals(word, ".ORG"))
		{
			GetWord(line, word);
			CELL addr = 0;
			if (MakeNumber(word, &addr))
			{
				HERE = addr;
			}
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
			debug("Defining word [%s]...\n", word);
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
			if (IsTailJmpSafe() && (the_memory[HERE - CELL_SZ - 1] == JMP))
			{
				the_memory[HERE - CELL_SZ - 1] = CALL;
				CComma(RET);
			}
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
				if (IsTailJmpSafe() && (the_memory[HERE - CELL_SZ - 1] == CALL))
				{
					the_memory[HERE - CELL_SZ - 1] = JMP;
				}
				else
				{
					CComma(RET);
				}
				STATE = 0;
				continue;
			}

			if (strcmp(word, "IF") == 0)
			{
				CComma(BRANCHZ);
				push(HERE);
				Comma(0);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "ELSE") == 0)
			{
				CELL tmp = pop();
				CComma(BRANCH);
				push(HERE);
				Comma(0);
				//Store(tmp, HERE);
				CELL offset = HERE - tmp;
				Store(tmp, offset);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "THEN") == 0)
			{
				CELL tmp = pop();
				//Store(tmp, HERE);
				CELL offset = HERE - tmp;
				Store(tmp, offset);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "BEGIN") == 0)
			{
				push(HERE);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "AGAIN") == 0)
			{
				//CComma(JMP);
				//Comma(Pop());
				CComma(BRANCH);
				CELL tgt = pop();
				CELL offset = tgt - HERE;
				Comma(offset);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "WHILE") == 0)
			{
				//CComma(JMPNZ);
				//Comma(Pop());
				CComma(BRANCHNZ);
				CELL tgt = pop();
				CELL offset = tgt - HERE;
				Comma(offset);
				MakeTailJmpUnSafe();
				continue;
			}

			if (strcmp(word, "UNTIL") == 0)
			{
				//CComma(JMPZ);
				//Comma(Pop());
				CComma(BRANCHZ);
				CELL tgt = pop();
				CELL offset = tgt - HERE;
				Comma(offset);
				MakeTailJmpUnSafe();
				continue;
			}

			if (string_equals(word, "S\""))
			{
				trace("SLITERAL");
				CComma(SLITERAL);
				int count = 0;
				bool done = false;
				line += 1;
				CELL cur_here = HERE++;
				BYTE ch;
				while ((!done) && (!string_isEmpty(line)))
				{
					ch = *(line++);
					trace("(1-%04lx)", cur_here);
					// string_ccat(parsed, ch);
					if (ch == 0)
						ch = (BYTE)32;
					
					trace(" (%d, %04lx", ch, HERE);
					if (ch == '\"')
					{
						done = true;
						trace("(3-%04lx)", cur_here);
					}
					else
					{
						trace(", %ld, %04lx)", count, cur_here);
						CComma(ch);
						trace("(2-%04lx)", cur_here);
						count++;
					}
				}
				trace(") done. HERE=%04lx, cur_here=%04lx\n", HERE, cur_here);
				CComma(0);
				trace(") done. HERE=%04lx, cur_here=%04lx\n", HERE, cur_here);
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

		MakeTailJmpUnSafe();

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
					MakeTailJmpSafe();
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

		printf("%s: '%s'??\n", source, word);
	}
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
        printf("args:\n");
        printf("-i:inputFile (full or relative path)\n");
        printf("  default inputFile is forth.src\n");
        printf("-o:outputFile (full or relative path)\n");
        printf("  default outputFile is forth.hex\n");
        printf("-t set log level to trace\n");
        printf("-d set log level to debug\n");
        printf("-? (prints this message)\n");
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
    }
}

int write_output()
{
    printf("\nwriting output file %s... ", output_fn);

    output_fp = fopen(output_fn, "wt");
    if (!output_fp)
    {
        printf("ERROR: Can't open output file.");
        return 0;
    }

    fprintf(output_fp, ";memory-size: %04lx (hex)\n;\n", (long)MEM_SZ);
	dis_vm(output_fp);

    fclose(output_fp);
    output_fp = NULL;

    printf("done.");
    return 1;
}

void CompilerInit()
{
	init_vm();
	the_memory[0] = RET;
	isEmbedded = true;
}

int do_compile()
{
    printf("compiling from %s... ", input_fn);
	CompilerInit();

    input_fp = fopen(input_fn, "rt");
    if (!input_fp)
    {
        printf("Can't open input file.");
        return 0;
    }

	Compile(input_fp);

    fclose(input_fp);
    input_fp = NULL;
    printf("done.");
    return 1;
}

int main (int argc, char **argv)
{
    strcpy(input_fn, "forth.src");
    strcpy(output_fn, "forth.hex");
	debug_off();

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

    if (do_compile())
        write_output();

    if (input_fp)
        fclose(input_fp);

    if (output_fp)
        fclose(output_fp);

    return 0;
}
