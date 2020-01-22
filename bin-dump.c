// bin-dump
// To build: execute:
// gcc -g -o bin-dump bin-dump.c

#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#define MEM_SZ 32
unsigned char the_memory[MEM_SZ];

char input_fn[256];
FILE *input_fp = NULL;

void process_arg(char *);

// *********************************************************************
int bin_dump()
{
	input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("cannot open file %s\n", input_fn);
        process_arg("?");
		return 0;
	}

    long start = 0;
   	size_t num = 1;
    while (num > 0)
    {
    	num = fread(the_memory, 1, MEM_SZ, input_fp);
        if (num)
        {
            printf("%04lx:", start);
            for (int i = 0; i < num; i++)
            {
                if (i % 8 == 0)
                    printf(" ");
                printf(" %02x", the_memory[i]);
            }
            printf("\n");
            start += MEM_SZ;
        }
    }
	fclose(input_fp);
	input_fp = NULL;
	return 1;
}

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == '?') 
    {
        printf("usage bin-dump [-?] file:\n");
        printf("       if no file specified, default file is forth.bin\n");
        printf("   -? (prints this message)\n");
    }
    else
    {

        strcpy(input_fn, arg);
    }
}

// *********************************************************************
int main(int argc, char **argv)
{
    strcpy(input_fn, "forth.bin");

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
        else
        {
            process_arg(cp);
        }
    }

	bin_dump();
    return 0;
}
