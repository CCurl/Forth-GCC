#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "forth-vm.h"
#include "functions.h"
#include "string.h"
#include "logger.h"

char input_fn[256];
FILE *input_fp = NULL;

// *********************************************************************
bool load_vm()
{
	debug("loading VM from %s ...", input_fn);
	input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("cannot open file %s", input_fn);
		return false;
	}

	fread(the_memory, 1, MEM_SZ, input_fp);
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
        printf("usage forth [args]\n");
        printf("  -i:imagefile (full or relative path)\n");
        printf("     default imagefile is forth.bin\n");
        printf("  -l:loglevel (0=off, 1=debug, 2=trace)\n");
        printf("     default loglevel is 0\n");
        printf("  -? (prints this message)\n");
        exit(0);
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

	init_vm();
	if (load_vm())
	{
		PC = 0;
		cpu_loop();
	}

    return 0;
}
