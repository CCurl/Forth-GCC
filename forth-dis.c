#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

CELL ORG = 0x0040;

char input_fn[64];
char output_fn[64];
FILE *input_fp = NULL;
FILE *output_fp = NULL;

// ------------------------------------------------------------------------------------------
void dis_range(CELL start, CELL end, char *bytes)
{
	char x[8];
	while (start <= end)
	{
		BYTE val = the_memory[start++];
		sprintf(x, " %02x", (int)val);
		strcat(bytes, x);
	}
}

// ------------------------------------------------------------------------------------------
void dis_start(CELL start, int num, char *bytes)
{
    dis_range(start, start + num - 1, bytes);
}

// ------------------------------------------------------------------------------------------
void dis_rangeCell(CELL start, CELL end, char *bytes)
{
	char x[8];
	while (start <= end)
	{
		CELL val = GETAT(start);
		start += 4;
		sprintf(x, " %08lx", (CELL)val);
		strcat(bytes, x);
	}
}

// ------------------------------------------------------------------------------------------
void dis_PC2(int num, char *bytes)
{
	char x[8];
	for (int i = 0; i < num; i++)
	{
		BYTE val = the_memory[PC++];
		sprintf(x, " %02x", (int)val);
		strcat(bytes, x);
	}
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------
CELL dis_one(char *bytes, char *desc)
{
	IR = the_memory[PC];
	sprintf(bytes, "%04lx: %02x", PC, (int)IR);
	++PC;

	switch (IR)
	{
	case LITERAL:
		arg1 = GETAT(PC);
		// PC += CELL_SZ;
		// push(arg1);
		dis_PC2(CELL_SZ, bytes);
		sprintf(desc, "LITERAL %ld (%0lx)", arg1, arg1);
		return CELL_SZ;

	case CLITERAL:
		arg1 = the_memory[PC];
		// PC++;
		// push(arg1);
		dis_PC2(1, bytes);
		sprintf(desc, "CLITERAL %ld", arg1);
		return 1;

	case FETCH:
		// arg1 = GETTOS();
		// arg2 = GETAT(arg1);
		// SETTOS(arg2);
		sprintf(desc, "FETCH");
		return 0;

	case STORE:
		// arg1 = pop();
		// arg2 = pop();
		// SETAT(arg1, arg2);
		sprintf(desc, "STORE");
		return 0;

	case SWAP:
		// arg1 = GET2ND();
		// arg2 = GETTOS();
		// SET2ND(arg2);
		// SETTOS(arg1);
		sprintf(desc, "SWAP");
		return 0;

	case DROP:
		// arg1 = pop();
		sprintf(desc, "DROP");
		return 0;

	case DUP:
		// arg1 = GETTOS();
		// push(arg1);
		sprintf(desc, "DUP");
		return 0;

	case OVER:
		// arg1 = GET2ND();
		// push(arg1);
		sprintf(desc, "OVER");
		return 0;

	case PICK:
		// arg1 = pop();
		// arg2 = *(DSP - arg1);
		// push(arg2);
		sprintf(desc, "PICK");
		return 0;

	case LOGLEVEL:
		// arg1 = pop();
		// arg2 = *(DSP - arg1);
		// push(arg2);
		sprintf(desc, "LOGLEVEL");
		return 0;

	case JMP:
		// PC = GETAT(PC);
		arg1 = GETAT(PC);
		sprintf(desc, "JMP %04lx", arg1);
		if (the_memory[arg1] == DICTP)
		{
			arg2 = GETAT(arg1+1);
			DICT_T *dp = (DICT_T *)&(the_memory[arg2]);
			sprintf(desc, "JMP %s (%04lx)\n;", dp->name, arg1);
		}
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case JMPZ:
		// if (pop() == 0)
		// {
		// 	PC = GETAT(PC);
		// }
		// else
		// {
		// 	PC += CELL_SZ;
		// }
		sprintf(desc, "JMPZ %04lx", GETAT(PC));
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case JMPNZ:
		sprintf(desc, "JMPNZ %04lx", GETAT(PC));
		dis_PC2(CELL_SZ, bytes);
		// arg1 = pop();
		// if (arg1 != 0)
		// {
		// 	PC = GETAT(PC);
		// }
		// else
		// {
		// 	PC += CELL_SZ;
		// }
		return CELL_SZ;

	case CALL:
		arg1 = GETAT(PC);
		// PC += CELL_SZ;
		// rpush(PC);
		// PC = arg1;
		arg2 = GETAT(arg1+1);
		DICT_T *dp = (DICT_T *)&(the_memory[arg2]);
		sprintf(desc, "CALL %s (%04lx)", dp->name, arg1);
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case RET:
		// if (RSP == rsp_init)
		// {
		// 	if (isEmbedded)
		// 	{
		// 		isBYE = true;
		// 	}
		// 	else
		// 	{
		// 		PC = 0;
		// 	}
		// }
		// else
		// {
		// 	PC = rpop();
		// }
		sprintf(desc, "RET");
		if (the_memory[PC] == DICTP)
		{
			strcat(desc, "\n;");
		}
		return 0;

	case COMPARE:
		// arg2 = pop();
		// arg1 = pop();
		// {
		// 	char *cp1 = (char *)&the_memory[arg1];
		// 	char *cp2 = (char *)&the_memory[arg2];
		// 	arg3 = strcmp(cp1, cp2) ? 0 : 1;
		// 	push(arg3);
		// }
		// isBYE = true;
		sprintf(desc, "COMPARE");
		return 0;

	case COMPAREI:
		// arg2 = pop();
		// arg1 = pop();
		// {
		// 	char *cp1 = (char *)&the_memory[arg1];
		// 	char *cp2 = (char *)&the_memory[arg2];
		// 	arg3 = _strcmpi(cp1, cp2) ? 0 : 1;
		// 	push(arg3);
		// }
		// isBYE = true;
		sprintf(desc, "COMPAREI");
		return 0;

	case SLITERAL:
		// count, bytes, NULL - NULL delimited counted string
		// 0100 0101 0102 0103 0104 0105
		//   07   03   65   66   67   00
		// SLIT   03    A    B    C   00
		// PC starts at 0101, should be set to 0106

		arg1 = the_memory[PC]; // count-byte (and the beginning of the counted string)
		arg2 = arg1 + 2;  // count-byte + count + NULL
		// PC += arg2;
		// push(arg1);
		sprintf(desc, "SLITERAL (%04lx) [%s]", PC, (char *)&the_memory[PC+1]);
		dis_PC2(arg2, bytes);
		return PC-arg1;

	case CFETCH:
		// arg1 = GETTOS();
		// SETTOS(the_memory[arg1]);
		sprintf(desc, "CFETCH");
		return 0;

	case CSTORE:
		// arg1 = pop();
		// arg2 = pop();
		// the_memory[arg1] = (BYTE)arg2;
		sprintf(desc, "CSTORE");
		return 0;

	case ADD:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 + arg1);
		sprintf(desc, "ADD");
		return 0;

	case SUB:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 - arg1);
		sprintf(desc, "SUB");
		return 0;

	case MUL:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 * arg1);
		sprintf(desc, "MUL");
		return 0;

	case DIV:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 / arg1);
		sprintf(desc, "DIV");
		return 0;

	case LT:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 < arg1 ? 1 : 0);
		sprintf(desc, "LT");
		return 0;

	case EQ:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 == arg1 ? 1 : 0);
		sprintf(desc, "EQ");
		return 0;

	case GT:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 > arg1 ? 1 : 0);
		sprintf(desc, "GT");
		return 0;

	case DICTP:
		arg1 = GETAT(PC);
		// PC += CELL_SZ;
		sprintf(desc, "DICTP %s (%04lx)", &(the_memory[arg1+10]), arg1);
		dis_PC2(CELL_SZ, bytes);
		return CELL_SZ;

	case EMIT:
		// arg1 = pop();
		// putchar(arg1);
		sprintf(desc, "EMIT");
		return 0;

	case FOPEN:
		// ( name mode -- fp status ) - mode: 0 = read, 1 = write
		// arg2 = pop();
		// arg1 = pop();
		// {
		// 	char *fileName = (char *)&the_memory[arg1 + 1];
		// 	char mode[4];
		// 	sprintf(mode, "%cb", arg2 == 0 ? 'r' : 'w');
		// 	FILE *fp = fopen(fileName, mode);
		// 	push((int)fp);
		// 	push(fp != NULL ? 0 : 1);
		// }
		sprintf(desc, "FOPEN");
		return 0;

	case FREAD:			// ( addr num fp -- count ) - fp == 0 means STDIN
		// arg3 = pop(); -- FP
		// arg2 = pop(); -- NUM
		// arg1 = pop(); -- ADDR
		// {
		// 	BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
		// 	int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
		// 	push(num);
		// }
		sprintf(desc, "FREAD");
		return 0;

	case FREADLINE:
		// Puts a counted string at addr
		// ( addr num fp -- count )
		// arg3 = pop(); -- FP (0 means STDIN)
		// arg2 = pop(); -- NUM
		// arg1 = pop(); -- ADDR
		// {
		// 	char *pBuf = (char *)&the_memory[arg1 + 1];
		// 	FILE *fp = arg3 ? (FILE *)arg3 : stdin;
		// 	if (fgets(pBuf, arg2, fp) != pBuf)
		// 	{
		// 		*pBuf = (char)NULL;
		// 	}
		// 	arg2 = (CELL)strlen(pBuf);
		// 	// Strip off any trailing newline
		// 	if ((arg2 > 0) && (pBuf[arg2 - 1] == '\n'))
		// 	{
		// 		pBuf[--arg2] = (char)NULL;
		// 	}
		// 	*(--pBuf) = (char)arg2;
		// 	push(arg2);
		// }
		sprintf(desc, "FREADLINE");
		return 0;

	case FWRITE:
		// ( addr num fp -- count ) - fp == 0 means STDOUT
		// arg3 = pop();
		// arg2 = pop();
		// arg1 = pop();
		// {
		// 	BYTE *pBuf = (BYTE *)&the_memory[arg1];
		// 	int num = fwrite(pBuf, sizeof(BYTE), arg2, arg3 == 0 ? stdin : (FILE *)arg3);
		// 	push(num);
		// }
		sprintf(desc, "FWRITE");
		return 0;

	case FCLOSE:
		// arg1 = pop();
		// if (arg1 != 0)
		// {
		// 	fclose((FILE *)arg1);
		// }
		sprintf(desc, "FCLOSE");
		return 0;

	case GETCH:
		// arg1 = getchar();
		// push(arg1);
		sprintf(desc, "GETCH");
		return 0;

	case DTOR:
		// arg1 = pop();
		// rpush(arg1);
		sprintf(desc, "DTOR");
		return 0;

	case RTOD:
		// arg1 = rpop();
		// push(arg1);
		sprintf(desc, "RTOD");
		return 0;

	case DEPTH:
		// arg1 = DSP - dsp_init;
		// push(arg1);
		sprintf(desc, "DEPTH");
		return 0;

	case AND:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 & arg1);
		sprintf(desc, "AND");
		return 0;

	case OR:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 | arg1);
		sprintf(desc, "OR");
		return 0;

	case BREAK:
	// {
	// 	arg1 = the_memory[ADDR_HERE];
	// 	arg2 = the_memory[ADDR_LAST];
	// 	arg3 = arg2 - arg1;
	// }
		sprintf(desc, "BREAK");
		return 0;

	case BYE:
		// isBYE = true;
		sprintf(desc, "BYE");
		return 0;

	case RESET:
	default:
		// DSP = dsp_init;
		// RSP = rsp_init;
		// PC = 0;
		// isBYE = isEmbedded;
		sprintf(desc, "RESET");
		return 0;
	}
	return 0;
}

// ------------------------------------------------------------------------------------------
void dis_dict(FILE *write_to, CELL dict_addr)
{
	char bytes[128], desc[128];
	DICT_T *dp = (DICT_T *)&the_memory[dict_addr];
	DICT_T *next_dp = (DICT_T *)&the_memory[dp->next];
	CELL addr = dict_addr;

	if (dp->next == 0)
	{
		sprintf(bytes, "%04lx:", addr);
		dis_start(addr, CELL_SZ, bytes);
		fprintf(write_to, "%-32s ; End.\n", bytes);
		return;
	}

	// Next
	sprintf(bytes, "%04lx:", addr);
	dis_start(addr, CELL_SZ, bytes);
	sprintf(desc, "%s - (next: %04lx %s)", dp->name, dp->next, (next_dp->next > 0) ? next_dp->name : "<end>");
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	addr += CELL_SZ;

	// XT, Flags
	sprintf(bytes, "%04lx:", addr);
	dis_start(addr, CELL_SZ+1, bytes);
	sprintf(desc, "XT=%04lx, flags=%02x", dp->XT, dp->flags);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);
	addr += CELL_SZ+1;

	// Name
	sprintf(bytes, "%04lx: %02x", addr++, dp->len);
	dis_start(addr, dp->len+1, bytes);
	sprintf(desc, "%d, %s", (int)dp->len, dp->name);
	fprintf(write_to, "%-32s ; %s\n;\n", bytes, desc);
}

// ------------------------------------------------------------------------------------------
void dis_vm(FILE *write_to)
{
	int here = GETAT(ADDR_HERE);
	char bytes[128], desc[128];

	// Initial JMP
	PC = 0;
	dis_one(bytes, desc);
	fprintf(write_to, "%-32s ; %s\n", bytes, desc);

	sprintf(bytes, "0005:");
	dis_range(5, 7, bytes);
	fprintf(write_to, "%s\n", bytes);

	sprintf(bytes, "0008:");
	dis_rangeCell(0x08, 0x0f, bytes);
	fprintf(write_to, "%s\n", bytes);

	PC = 0x10;
	while (PC < ORG)
	{
		sprintf(bytes, "%04lx:", PC);
		dis_rangeCell(PC, PC+0x0f, bytes);
		fprintf(write_to, "%s\n", bytes);
		PC += 0x10;
	}

	fprintf(write_to, ";\n", bytes);
	fflush(write_to);

	// Code
	PC = ORG;
	while (PC < here)
	{
		dis_one(bytes, desc);
		fprintf(write_to, "%-32s ; %s\n", bytes, desc);
		fflush(write_to);
	}

	fprintf(write_to, ";\n; End of code, Dictionary:\n;\n");

	// Dictionary
	PC = GETAT(ADDR_LAST);
	while (PC > 0)
	{
		dis_dict(write_to, PC);
		fflush(write_to);
		PC = GETAT(PC);
	}
}

// *********************************************************************
void load_vm()
{
	printf("loading VM from %s ...", input_fn);
	input_fp = fopen(input_fn, "rb");
	if (!input_fp)
	{
		printf("\ncannot open file %s!", input_fn);
        exit(1);
	}

    fseek(input_fp, 0L, SEEK_END);
    long file_sz = ftell(input_fp);
    debug("file_sz: %ld bytes, ", file_sz);
    fseek(input_fp, 0L, SEEK_SET);

    memory_size = file_sz;
    init_vm(file_sz);

	int num_read = fread(the_memory, 1, memory_size, input_fp);
    debug("%ld bytes read\n", num_read);
	fclose(input_fp);
	input_fp = NULL;
	printf(" done.\n");
}

// *********************************************************************
void do_dis()
{
    output_fp = fopen(output_fn, "wt");
    if (!output_fp)
    {
        printf("ERROR: Can't open assembly file.\n");
        return;
    }

    printf("disassembling to file %s... ", output_fn);
    fprintf(output_fp, "; memory-size: %ld bytes, (%04lx hex)\n", memory_size, memory_size);
    fprintf(output_fp, "; data-stack: %04lx, grows up\n", memory_size - STACKS_SZ);
    fprintf(output_fp, "; return-stack: %04lx, grows down\n;\n", memory_size - CELL_SZ);
	dis_vm(output_fp);

    fclose(output_fp);
    output_fp = NULL;

    dis_vm(output_fp);

    printf(" done.\n");
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
    else if (*arg == 't') 
    {
		trace_on();
		printf("log level set to trace.\n");
    }
    else if (*arg == 'd') 
    {
		debug_on();
		printf("log level set to debug.\n");
    }
    else if (*arg == '?') 
    {
        printf("usage: forth-compiler [args]\n");
        printf("  -i:inputFile (full or relative path)\n");
        printf("      default inputFile is forth.bin\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth.lst\n");
        printf("  -t (set log level to trace)\n");
        printf("  -d (set log level to debug)\n");
        printf("  -? (prints this message)\n");
		exit(0);
    }
    else
    {
        printf("unknown arg '-%s'\n", arg);
    }
}

int main (int argc, char **argv)
{
    strcpy(input_fn, "forth.bin");
	strcpy(output_fn, "forth.lst");
	debug_off();

    for (int i = 1; i < argc; i++)
    {
        char *cp = argv[i];
        if (*cp == '-')
        {
            process_arg(++cp);
        }
    }

    load_vm();
	do_dis();

	printf("all done.");
    return 0;
}
