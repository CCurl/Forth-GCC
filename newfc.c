#include <stdio.h>
#include <stdlib.h>
#include "Shared.h"
#include "forth-vm.h"

char base_fn[32];

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
char *parse_word(char *word, char *stream)
{
	if ((word[0] == '\\') && (StrLen(word) == 1))
		return stream;
	printf("-%s-", word);
	return stream;
}

// ---------------------------------------------------------------------
void do_compile(char *stream)
{
	char word[64];
	printf("\ncontents: %08lx, sz: %ld", stream);
	while (true)
	{
		stream = get_word(stream, word);
		if (stream == NULL)
		{
			return;
		}
		stream = parse_word(word, stream);
	}
}

// ---------------------------------------------------------------------
void write_output() {}

// ---------------------------------------------------------------------
void parse_arg(char *arg) {}

// ---------------------------------------------------------------------
int main (int argc, char **argv)
{
	char fn[64];
	FILE *fp;

	StrCpy(base_fn, "forth");
	HERE = (CELL)the_memory;

	printf("HERE: %08lx, memory: %08lx", &HERE, the_memory);

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

	do_compile(contents);
	write_output();
	run_program(0);

    return 0;
}
