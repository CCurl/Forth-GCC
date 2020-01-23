// bin-dump
// To build: execute:
// make bd

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

char input_fn[256];

int bin_dumpFile(char *, int);
void process_arg(char *);

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == '?') 
    {
        printf("usage bin-dump [-?] file:\n");
        printf("       if no file specified, default file is forth.bin\n");
        printf("   -? (prints this message)\n");
        exit(0);
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

	bin_dumpFile(input_fn, 32);
    return 0;
}
