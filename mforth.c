#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "forth-vm.h"

char base_fn[32];
bool run_saved = false;

OPCODE_T opcodes[] = {
          { ".NOP.",              NOP,              "nop",              IS_INLINE }
        , { ".LITERAL.",          LITERAL,          "LITERAL",          0 }
        , { ".CLITERAL.",         CLITERAL,         "CLITERAL",         IS_INLINE }
        , { ".FETCH.",            FETCH,            "@",            IS_INLINE }
        , { ".STORE.",            STORE,            "!",            IS_INLINE }
        , { ".CFETCH.",           CFETCH,           "c@",           IS_INLINE }
        , { ".CSTORE.",           CSTORE,           "c!",           IS_INLINE }
        , { ".SWAP.",             SWAP,             "SWAP",             IS_INLINE }
        , { ".DROP.",             DROP,             "DROP",             IS_INLINE }
        , { ".DUP.",              DUP,              "DUP",              IS_INLINE }
        , { ".SLITERAL.",         SLITERAL,         "SLITERAL",         IS_INLINE }
        , { ".EMIT.",             EMIT,             "emit",             IS_INLINE }
        , { ".JMP.",              JMP,              "JMP",              0 }
        , { ".JMPZ.",             JMPZ,             "JMPZ",             0 }
        , { ".JMPNZ.",            JMPNZ,            "JMPNZ",            0 }
        , { ".CALL.",             CALL,             "CALL",             0 }
        , { ".RET.",              RET,              "RET",              0 }
        , { ".OR.",               OR,               "OR",               IS_INLINE }
        , { ".XOR.",              XOR,              "XOR",               IS_INLINE }
        , { ".COM.",              COM,              "COM",               IS_INLINE }
        , { ".ADD.",              ADD,              "+",              IS_INLINE }
        , { ".SUB.",              SUB,              "-",              IS_INLINE }
        , { ".MUL.",              MUL,              "*",              IS_INLINE }
        , { ".DIV.",              DIV,              "/",              IS_INLINE }
        , { ".LT.",               LT,               "<",               IS_INLINE }
        , { ".EQ.",               EQ,               "=",               IS_INLINE }
        , { ".GT.",               GT,               ">",               IS_INLINE }
        , { ".OVER.",             OVER,             "over",             IS_INLINE }
        , { ".COMPARE.",          COMPARE,          "COMPARE",          IS_INLINE }
        , { ".DTOR.",             DTOR,             ">r",             IS_INLINE }
        , { ".RTOD.",             RTOD,             "r>",             IS_INLINE }
        , { ".AND.",              AND,              "AND",              IS_INLINE }
        , { ".GETCH.",            GETCH,            "GETCH",            IS_INLINE }
        , { ".COMPAREI.",         COMPAREI,         "COMPAREI",         IS_INLINE }
        , { ".SLASHMOD.",         SLASHMOD,         "SLASHMOD",         IS_INLINE }
        , { ".NOT.",              NOT,              "NOT",              IS_INLINE }
        , { ".RFETCH.",           RFETCH,           "RFETCH",           IS_INLINE }
        , { ".INC.",              INC,              "1+",              IS_INLINE }
        , { ".DEC.",              DEC,              "1-",              IS_INLINE }
        , { ".GETTICK.",          GETTICK,          "GETTICK",          IS_INLINE }
        , { ".SHIFTLEFT.",        SHIFTLEFT,        "2*",        IS_INLINE }
        , { ".SHIFTRIGHT.",       SHIFTRIGHT,       "2/",       IS_INLINE }
        , { ".PLUSSTORE.",        PLUSSTORE,        "+!",        IS_INLINE }
        , { ".OPENBLOCK.",        OPENBLOCK,        "open-block",        IS_INLINE }
        , { ".CLOSEBLOCK.",       CLOSEBLOCK,       "close-block",        IS_INLINE }
        , { ".DBGDOT.",           DOT,              "(.)",           IS_INLINE }
        , { ".HA.",               HA,               "(h)",            IS_INLINE }
        , { ".BA.",               BA,               "base",            IS_INLINE }
        , { ".SA.",               SA,               "state",            IS_INLINE }
        , { ".LA.",               LA,               "last",            IS_INLINE }
        , { ".COMMA.",            COMMA,            ",",            IS_INLINE }
        , { ".CCOMMA.",           CCOMMA,           "c,",            IS_INLINE }
        , { ".IMMEDIATE.",        IMMEDIATE,        "immediate",            0 }
        , { ".INLINE.",           INLINE,           "inline",            0 }
        , { ".OVER.",             TOSRC,            ">src",             IS_INLINE }
        , { ".OVER.",             SRC,             	"src",             IS_INLINE }
        , { ".OVER.",             TODST,            ">dst",             IS_INLINE }
        , { ".OVER.",             DST,              "dst",             IS_INLINE }
        , { ".BYE.",              BYE,              "BYE",              IS_INLINE }
		, { 0,0,0,0 }
};

// ---------------------------------------------------------------------
void StrCpy(char *dst, char *src) 
{
	while (*src)
	{
		*(dst++) = *(src++);
	}
	*dst = (char)0;
}

// ---------------------------------------------------------------------
void StrCat(char *dst, char *src) 
{
	while (*dst)
		dst++;
	StrCpy(dst, src);
}

// ---------------------------------------------------------------------
int StrLen(char *src) 
{
	int i = 0;
	while (*src)
	{
		src++;
		i++;
	}
	return i;
}

// ---------------------------------------------------------------------
char *get_word(char *stream, char *word)
{
	*word = (char)0;

	// skip any leading WS
	while (*stream < (char)33)
	{
		// NULL means end of stream
		if (*stream == (char)0)
			return (char *)0;
		++stream;
	}

	while (*stream > (char)32)
	{
		*(word++) = *(stream++);
	}
	*word = (char)0;

	return stream;
}

// ---------------------------------------------------------------------
DICT_T *define_word(char *word)
{
	// printf("\ndefining word [%s] at %08lx", word, HERE);
	DICT_T *e = (&the_words[++num_words]);
	e->flags = 0;
	e->XT = HERE;
	e->len = StrLen(word);
	StrCpy(e->name, word);
	return e;
}

// ---------------------------------------------------------------------
DICT_T *rfind_word(CELL xt)
{
	for (int i = num_words; i > 0; i--)
	{
		DICT_T *e = (&the_words[i]);
		if (e->XT == xt)
			return e;
	}
	return NULL;
}

// ---------------------------------------------------------------------
DICT_T *find_word(char *name)
{
	for (int i = num_words; i > 0; i--)
	{
		DICT_T *e = (&the_words[i]);
		if (strcmpi(e->name, name) == 0)
			return e;
	}
	return NULL;
}

// ---------------------------------------------------------------------
OPCODE_T *find_opcode(char *name)
{
	// printf("-opcode:%s?-", name);
	for (int i = 0;; i++)
	{
		OPCODE_T *e = (&opcodes[i]);
		if (e->forth_prim == NULL)
			return NULL;
		// printf("-%d,%s=%s,%d-", i, e->forth_prim, name, e->opcode);
		if (strcmpi(e->forth_prim, name) == 0)
			return e;
	}
	return NULL;
}

// ---------------------------------------------------------------------
bool is_number(char *word, CELL *num)
{
	//printf("-number?[%s]-", word);
	int base = BASE;
	*num = 0;

	if ((word[0] == '\'')&& (word[2] == '\'')&& (word[3] == (char)0))
	{
		*num = word[1];
		return true;
	}

	if (*word == '%') { base =  2; word++; }
	if (*word == '#') { base = 10; word++; }
	if (*word == '$') { base = 16; word++; }

	while (*word)
	{
		char c = (*word++);
		int i = c - '0';
		//printf("(c=%c,i=%d,base=%d)", c, i, base);
		if ((i >= 0) && (i < base))
		{
			*num = ((*num) * base) + i;
			// printf("(num=%d)", *num);
			continue;
		}
		if (base > 10)
		{
			c = ((c >= 'a') && (c <= 'z')) ? c - 32 : c;
			i = c - 'A';
			if ((i >= 0) && (i < (base-10)))
			{
				*num = ((*num) * base) + (i + 10);
				continue;
			}
		}
		return false;
	}

	return true;
}

// ---------------------------------------------------------------------
char *parse_word(char *word, char *stream)
{
	// printf("-%s-", word);
	if ((*word == '\\') && (*(word+1) == 0))
	{
		while (*stream > (char)31)
			++stream;
		return stream;
	}

	if ((*word == '(') && (*(word+1) == 0))
	{
		while (*stream != ')')
			++stream;
		return ++stream;
	}

	if ((*word == ':') && (*(word+1) == 0))
	{
		stream = get_word(stream, word);
		define_word(word);
		STATE = 1;
		return stream;
	}

	if ((*word == ';') && (*(word+1) == 0))
	{
		ccomma(RET);
		STATE = 0;
		return stream;
	}

	if (strcmpi(word, "dw") == 0)
	{
		stream = get_word(stream, word);
		define_word(word);
		return stream;
	}

	DICT_T *ep = find_word(word);
	if (ep)
	{
		if ((STATE == 0) || (ep->flags & IS_IMMEDIATE))
		{
			run_program(ep->XT);
		}
		else
		{
			ccomma(CALL);
			comma(ep->XT);
		}
		
		return stream;
	}

	OPCODE_T *op = find_opcode(word);
	if (op)
	{
		// printf("op:%s,%d", op->forth_prim, op->opcode);
		if ((STATE == 0) || (op->flags & IS_IMMEDIATE))
		{
			BYTE_AT(HERE + 0x0100) = op->opcode;
			BYTE_AT(HERE + 0x0101) = RET;
			run_program(HERE + 0x0100);
		}
		else
		{
			ccomma(op->opcode);
		}
		
		return stream;
	}

	CELL the_num;
	if (is_number(word, &the_num))
	{
		// printf("-word=%s,num=%d-", word, the_num);
		push(the_num);
		if (STATE == 1)
		{
			if ((0 <= the_num) && (the_num < 0x0100))
			{
				ccomma(CLITERAL);
				ccomma(pop());
			}
			else
			{
				ccomma(LITERAL);
				comma(pop());
			}
		}
		return stream;
	}

	printf(" %s ??", word);
	*stream = (char)0;
	return stream;
}

// ---------------------------------------------------------------------
void do_compile(char *stream)
{
	char word[64];
	// printf("\ncontents: %08lx", stream);
	while (true)
	{
		stream = get_word(stream, word);
		if (stream == NULL)
		{
			break;
		}
		stream = parse_word(word, stream);
	}

	the_memory[0] = JMP;
	SETAT(1, the_words[num_words].XT);
}

bool open_file(char *fn, char *mode, FILE **pfp)
{
	*pfp = NULL;
	FILE *fp = fopen(fn, mode);
	if (!fp)
	{
		printf("\nUnable to open '%s'", fn);
		return false;
	}
	*pfp = fp;
	return true;
}

// ---------------------------------------------------------------------
bool read_binaries() 
{
	char fn[64];
	StrCpy(fn, base_fn);
	StrCat(fn, ".bin");
	FILE *fp = NULL;
	if (!open_file(fn, "rb", &fp))
		return false;
	fread(the_memory, MEM_SZ, 1, fp);
	fclose(fp);

	StrCpy(fn, base_fn);
	StrCat(fn, ".inf");
	if (!open_file(fn, "rb", &fp))
		return false;
	fread(&HERE, sizeof(CELL), 1, fp);
	fread(&num_words, sizeof(num_words), 1, fp);
	int num = fread(the_words, sizeof(DICT_T), MAX_WORDS, fp);
	fclose(fp);

	return true;
}

// ---------------------------------------------------------------------
void write_output() 
{
	char fn[64];
	FILE *fp;

	StrCpy(fn, base_fn);
	StrCat(fn, ".bin");
	if (!open_file(fn, "wb", &fp))
		return;

	fwrite(the_memory, 1, MEM_SZ, fp);
	fclose(fp);

	// printf("\n%d words", num_words);

	StrCpy(fn, base_fn);
	StrCat(fn, ".txt");
	if (!open_file(fn, "wt", &fp))
		return;

	fprintf(fp, "Words:\n-------------------------------\n");
	for (int i = num_words; i > 0; i--)
	{
		DICT_T *e = &the_words[i];
		fprintf(fp, "%4d: %02x %08lx %d %s\n", i, e->flags, e->XT, e->len, e->name);
	}

	fprintf(fp, "\nOpcodes:\n------------------------\n");
	for (int i = 0; ; i++)
	{
		OPCODE_T *op = &opcodes[i];
		if (op->forth_prim == NULL)
			break;
		fprintf(fp, "#%02d ($%02x): %s\n", op->opcode, op->opcode, op->forth_prim);
	}

	fclose(fp);
	StrCpy(fn, base_fn);
	StrCat(fn, ".inf");
	if (!open_file(fn, "wb", &fp))
		return;
	fwrite(&HERE, sizeof(CELL), 1, fp);
	fwrite(&num_words, sizeof(num_words), 1, fp);
	fwrite(the_words, sizeof(DICT_T), num_words+4, fp);
	fclose(fp);
}
// ---------------------------------------------------------------------
void parse_arg(char *arg) 
{
	// -b:baseFn
	if (*arg == 'b')
	{
		StrCpy(base_fn, arg+2);
	}
	// -r:binFile
	if (*arg == 'r')
		run_saved = true;
}

// ---------------------------------------------------------------------
int main (int argc, char **argv)
{
	char fn[64];
	FILE *fp;

	StrCpy(base_fn, "");
	StrCpy(base_fn, "mforth");
	HERE = (CELL)the_memory;

	// printf("&HERE: %08lx, memory: %08lx-%08lx", &HERE, &the_memory[0], &the_memory[MEM_SZ-1]);

	the_memory[MEM_SZ-1] = 'x';

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            parse_arg(++cp);
        }
    }

	// run existing bin file?
	if (run_saved)
	{
		if (read_binaries())
		{
			run_program((CELL)the_memory);
			return 0;
		}
		else
			return 1;
	}

	StrCpy(fn, base_fn);
	StrCat(fn, ".src");
	if (!open_file(fn, "rt", &fp))
		return 1;

	fseek(fp, 0, SEEK_END);
	long sz = ftell(fp);
	char *contents = (char *)malloc(sz+4);
	memset(contents, 0, sz+4);
	fseek(fp, 0, SEEK_SET);
	fread(contents, sz, 1, fp);
	fclose(fp);

	HERE = (CELL)the_memory;
	ccomma(BYE);
	comma(0);
	// printf(" HERE now: %08lx", HERE);

	BASE = 10;

	do_compile(contents);
	write_output();
	run_program(0);

    return 0;
}
