#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "forth-vm.h"

char base_fn[32];

#define COMMA(val)  (*(CELL *)HERE = (CELL)val); HERE += 4
#define CCOMMA(val) (*(BYTE *)HERE = (BYTE)val); HERE += 1

OPCODE_T opcodes[] = {
	{ "nop", NOP, "nop", 0 },
	{ "emit", EMIT, "emit", 0 },
	{ "drop", DROP, "drop", 0 },
	{ "comma", COMMA, ",", 0 },
	{ "ccomma", CCOMMA, "c,", 0 },
	{ 0, 0, 0, 0 },
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
	printf("\ndefining word [%s] at %08lx", word, HERE);
	DICT_T *e = (&the_words[++num_words]);
	e->flags = 0;
	e->XT = HERE;
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
	if ((word[0] == '\\') && (StrLen(word) == 1))
	{
		while (*stream > (char)31)
			++stream;
		return stream;
	}

	if ((word[0] == '(') && (StrLen(word) == 1))
	{
		while (*stream != ')')
			++stream;
		return ++stream;
	}

	if ((word[0] == ':') && (StrLen(word) == 1))
	{
		stream = get_word(stream, word);
		define_word(word);
		STATE = 1;
		return stream;
	}

	if ((word[0] == ';') && (StrLen(word) == 1))
	{
		CCOMMA(RET);
		STATE = 0;
		return stream;
	}

	DICT_T *ep = find_word(word);
	if (ep)
	{
		if ((STATE == 1) && (ep->flags != IS_IMMEDIATE))
		{
			CCOMMA(CALL);
			COMMA(ep->XT);
		}
		else
		{
			run_program(ep->XT);
		}
		
		return stream;
	}

	OPCODE_T *op = find_opcode(word);
	if (op)
	{
		// printf("op:%s,%d", op->forth_prim, op->opcode);
		if ((STATE == 1) && (op->flags != IS_IMMEDIATE))
		{
			CCOMMA(op->opcode);
		}
		else
		{
			BYTE_AT(HERE + 0x0100) = op->opcode;
			BYTE_AT(HERE + 0x0101) = RET;
			run_program(HERE + 0x0100);
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
			CCOMMA(LITERAL);
			COMMA(pop());
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
	printf("\ncontents: %08lx", stream);
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

// ---------------------------------------------------------------------
void write_output() 
{
	char fn[64];
	FILE *fp;

	StrCpy(fn, base_fn);
	StrCat(fn, ".out");
	fp = fopen(fn, "wb");
	if (!fp)
	{
		printf("\nUnable to open '%s'", fn);
		return;
	}

	fwrite(the_memory, 1, MEM_SZ, fp);
	fclose(fp);

	printf("\n%d words", num_words);
}

// ---------------------------------------------------------------------
void parse_arg(char *arg) 
{
	if (*arg == '')
	{

	}
}

// ---------------------------------------------------------------------
int main (int argc, char **argv)
{
	char fn[64];
	FILE *fp;

	StrCpy(base_fn, "newfc");
	HERE = (CELL)the_memory;

	printf("&HERE: %08lx, memory: %08lx-%08lx", &HERE, &the_memory[0], &the_memory[MEM_SZ-1]);

	the_memory[MEM_SZ-1] = 'x';

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            parse_arg(++cp);
        }
    }

	StrCpy(fn, base_fn);
	StrCat(fn, ".src");
	fp = fopen(fn, "rt");
	if (!fp)
	{
		printf("\nUnable to open '%s'", fn);
		return 1;
	}

	fseek(fp, 0, SEEK_END);
	long sz = ftell(fp);
	char *contents = (char *)malloc(sz);
	fseek(fp, 0, SEEK_SET);
	fread(contents, sz, 1, fp);
	fclose(fp);

	HERE = (CELL)the_memory;
	CCOMMA(BYE);
	COMMA(0);
	printf(" HERE now: %08lx", HERE);

	BASE = 10;

	do_compile(contents);
	write_output();
	run_program(0);

    return 0;
}
