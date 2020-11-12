#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

#include "forth-vm-new.h"

CELL ADDR_MEM_SZ   = 0x24;

char input_fn[256];
FILE *input_fp = NULL;

// *********************************************************************
int load_vm()
{
	printf("loading VM from %s ...", input_fn);
	input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("cannot open file %s", input_fn);
		return false;
	}

    fseek(input_fp, 0L, SEEK_END);
    long file_sz = ftell(input_fp);
    printf("file_sz: %ld bytes, ", file_sz);
    fseek(input_fp, 0L, SEEK_SET);

    memory_size = file_sz;
    create_vm(file_sz);

	int num_read = fread(the_memory, 1, memory_size, input_fp);
    printf("%ld bytes read\n", num_read);
	fclose(input_fp);
	input_fp = NULL;
	printf(" done.\n");
	return 1;
}

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == 'i') 
    {
        arg = arg+2;
        strcpy(input_fn, arg);
    }
    else if (*arg == '?') 
    {
        printf("usage forth [args]\n");
        printf("  -i:imagefile - Forth VM image\n");
        printf("     default imagefile is 'forth.bin'\n");
        printf("  -? - Prints this message\n");
        exit(0);
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
    }
}

char rxBuf[256];
char *rxBufP = rxBuf;
void rxFromForth(char c)
{
    *(rxBufP++) = c;
    *(rxBufP) = 0;
}

void rxFromCon(char);
void txToForth(char *str)
{
    while (*str) {
        rxFromCon(*(str++));
    }
}

// ---------------------------------------------------------------------
#define BUF_SZ 256
char input_buf[BUF_SZ];
int read()
{
	if (input_fp)
	{
		if (fgets(input_buf, BUF_SZ, input_fp) == input_buf)  return false;
		fclose(input_fp);
		input_fp = NULL;
		strcpy(input_buf, "");
		return 0;
	}
	gets(input_buf);
	printf("[%s]", input_buf);
	return 0;
}

void repl()
{
    // TODO - WHAT SHOULD THIS BE?
    CELL addr = 0;
	while (true)
	{
		if (!input_fp)
            printf(" ok\n");

		read();

		if (strcmpi(input_buf, "bye") == 0)
            return;

		txToForth(input_buf);
        // cpu_loop(addr);
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

	if (load_vm())
    {
		repl();
	}

    return 0;
}
