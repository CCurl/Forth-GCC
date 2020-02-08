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
char load_fn[256];
FILE *input_fp = NULL;
FILE *load_fp = NULL;

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

	fread(the_memory, 1, memory_size, input_fp);
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
    else if (*arg == 'd') 
    {
        debug_on();
    }
    else if (*arg == 't') 
    {
        trace_on();
    }
    else if (*arg == 'l') 
    {
        arg = arg+2;
        strcpy(load_fn, arg);
    }
    else if (*arg == '?') 
    {
        printf("usage forth [args]\n");
        printf("  -i:imagefile - Forth VM image\n");
        printf("     default imagefile is 'forth.bin'\n");
        printf("  -l:file - Load/execute a file\n");
        printf("  -d - Turn on debug logging\n");
        printf("  -t - Turn on trace logging\n");
        printf("  -? - Prints this message\n");
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
    strcpy(load_fn, "");

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

	init_vm(0);
	if (load_vm())
	{
        if (strlen(load_fn) > 0)
        {
            printf("  LoadFile (%s) is not implemented yet.\n", load_fn);
        }
		PC = 0;
		cpu_loop();
	}

    return 0;
}
