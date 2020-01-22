#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "Shared.h"
#include "functions.h"
#include "string.h"
#include "logger.h"

#define MEM_SZ2 32
BYTE the_memory[MEM_SZ2];

char input_fn[256];
FILE *input_fp = NULL;

// *********************************************************************
bool bin_dump()
{
	input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("cannot open file %s", input_fn);
		return false;
	}

    long start = 0;
   	size_t num = 1;
    while (num > 0)
    {
    	num = fread(the_memory, 1, MEM_SZ2, input_fp);
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
            start += MEM_SZ2;
        }
    }
	fclose(input_fp);
	input_fp = NULL;
	debug(" done.\n");
	return true;
}

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == 'i') 
    {
        arg = arg+2;
        strcpy(input_fn, arg);
    }
    else if (*arg == 'l') 
    {
        char x[24];
        strcpy(x, arg);
        if (string_equals_nocase(x, "1"))
        {
            debug_on();
        }
        else if (string_equals_nocase(x, "2"))
        {
            trace_on();
        }
        else
        {
            debug_off();
        }
        
    }
    else if (*arg == '?') 
    {
        printf("args:\n");
        printf("-i:inputFile (full or relative path)\n");
        printf("  default inputFile is forth.bin");
        printf("-l:loglevel (0=off, 1=debug, 2=trace)\n");
        printf("-? (prints this message)\n");
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
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
    }

	bin_dump();
    return 0;
}
