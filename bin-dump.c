#include <stdio.h>
#include <stdlib.h>

void process_arg(char *);

// *********************************************************************
void bin_dumpMem(char *mem, int num, int bytes_per_line, long start)
{
    unsigned char *cp = mem;
    printf("%04lx:", start);
    for (int i = 0; i < num; i++)
    {
        if (i % 8 == 0)
            printf(" ");
        printf(" %02x", *(cp++));
    }
    printf("\n");
}

// *********************************************************************
int bin_dumpFile(char *input_fn, int bytes_per_line)
{
    bytes_per_line = (bytes_per_line < 1) ? 1 : bytes_per_line;

	FILE *input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("cannot open file %s\n", input_fn);
        process_arg("?");
		return 0;
	}

    char *buf = malloc(bytes_per_line);
    long start = 0;
   	size_t num = 1;
    while (num > 0)
    {
        char *cp = buf;
    	num = fread(buf, 1, bytes_per_line, input_fp);
        if (num)
        {
            bin_dumpMem(buf, num, bytes_per_line, start);
            start += bytes_per_line;
        }
    }
    free(buf);
	fclose(input_fp);
	input_fp = NULL;
	return 1;
}
