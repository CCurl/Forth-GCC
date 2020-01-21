#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "functions.h"
#include "string.h"
#include "logger.h"

long memory_size;
// BYTE the_memory[MEM_SZ];
BYTE *the_memory = NULL;

// #include "ForthVM.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;

// *********************************************************************
CELL get_addr(char *line)
{
	CELL addr = -1;
	sscanf(line, "%lx", &addr);
	return addr;
}

// *********************************************************************
int get_val(char *line)
{
	int val = -1;
	sscanf(line, "%x", &val);
	return val;
}

// *********************************************************************
CELL load_memory_size(char *line)
{
	// The format of the line has to be exactly this:
	// ;memory-size: 8000 ; the value is in hex
	char *cp = string_ltrim(line);
	CELL mem_sz = 0;

	if (*cp == ';')
	{
		char *cp2 = strchr(cp, ' ');
		if (cp2)
		{
			*cp2 = 0;
			if (string_equals_nocase(cp, ";memory-size:"))
			{
				mem_sz = get_addr(cp2+1);
			}
		}
	}

	debug("memory_size: %04lx (hex)\n", mem_sz);
	return mem_sz;
}

// *********************************************************************
bool load_line(char *line)
{
	// trace("%s\n", line);
	CELL addr = -1;

	char *cp = strchr(line, ';');
	if (cp)
	{
		*cp = NULL;
	}

	cp = string_ltrim(line);
	addr = get_addr(cp);
	if (addr < 0)
	{
		return false;
	}

	trace("%04lx -", addr);
	cp = strchr(cp, ':');
	if (cp)
	{
		*(cp++) = NULL;
	}
	else
	{
		return false;
	}
	

	while (true)
	{
		cp = string_ltrim(cp);
		int val = get_val(cp);
		if (val < 0)
		{
			trace("\n");
			return true;
		}

		trace(" %02x", val);
		the_memory[addr++] = (BYTE)val;
		cp = strchr(cp, ' ');
		if (cp)
		{
			*(cp++) = NULL;
			// trace("%s", cp);
		}
	}
}

// *********************************************************************
void dump_mem()
{
	for (int i = 0; i < memory_size; i++)
	{
		BYTE val = the_memory[i];
		trace("%04lx: %02x\n", (long)i, the_memory[i]);
	}
}

// *********************************************************************
void check_mem()
{
	for (int i = 0; i < memory_size; i++)
	{
		BYTE val = the_memory[i];
		if (val)
		{
			printf("ERROR: memory location %d <> 0!\n", i);
		}
	}
}

// *********************************************************************
bool load_vm()
{
	debug("loading VM from %s ...", input_fn);
	input_fp = fopen(input_fn, "rt");
	if (!input_fp)
	{
		printf("cannot open file %s", input_fn);
		return 0;
	}

	char buf[256];

	// Look for [; memory-size: num]
	trace_on();
	while (fgets(buf, sizeof(buf), input_fp) == buf)
	{
		memory_size = load_memory_size(buf);
		if (memory_size > 0)
			break;
	}

	trace_on();

	the_memory = (BYTE *)malloc(memory_size);
	memset(the_memory, 0, memory_size);

	debug("memory: %08lx\n", the_memory);
	debug("memory[0]: %02x\n", the_memory[0]);
	check_mem();
	// dump_mem();

	while (fgets(buf, sizeof(buf), input_fp) == buf)
	{
		// trace("??? %s", buf);
		string_rtrim(buf);
		load_line(buf);
	}
	fclose(input_fp);
	input_fp = NULL;
	debug(" done.");
	return true;
}

// *********************************************************************
void write_output()
{
	debug("\nwriting output to %s ...", output_fn);
	output_fp = fopen(output_fn, "wb");
	if (output_fp)
	{
		fwrite(the_memory, 1, memory_size, output_fp);
		fclose(output_fp);
		output_fp = NULL;
		debug(" done.");
	}
	else
	{
		printf("cannot open %s!", output_fn);
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
    else if (*arg == '?') 
    {
        printf("args:\n");
        printf("-i:inputFile (full or relative path)\n");
        printf("  default inputFile is forth.hex");
        printf("-o:outputFile (full or relative path)\n");
        printf("  default outputFile is forth.bin");
        printf("-? (prints this message)\n");
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
    }
}

// *********************************************************************
int main (int argc, char **argv)
{
    strcpy(input_fn, "forth.hex");
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

	if (load_vm())
		write_output();

    return 0;
}
