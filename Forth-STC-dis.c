// Disassemble a fortn VM into an indirect-threaded implementation
// The options are C (for GCC) or Assembler (for FASM)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#include "Shared.h"
#include "logger.h"
#include "forth-vm.h"

CELL ORG = 0x0040;

char input_fn[64];
char output_fn[64];
FILE *input_fp = NULL;

int fwd_ref[1000];
int fwd_ref_num = 0;

LINE_T *lines[10240];
int num_lines = 0;
int LAST_PC = 0;

#define TGT_GCC   1
#define TGT_FASM  2

int tgt_lang = TGT_FASM;

void gen_opcodes();
void dis_opcode(CELL);

// ------------------------------------------------------------------------------------------
LINE_T *new_line(int addr)
{
	if (addr == 0)
	{
		addr = LAST_PC;
		LAST_PC = 0;
	}
	LINE_T *line = (LINE_T *)malloc(sizeof(LINE_T));
	memset(line, 0, sizeof(LINE_T));
	line->addr = addr;
	lines[num_lines++] = line;
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *find_line(int addr)
{
	for (int i = 0; i < num_lines; i++)
	{
		LINE_T *line = lines[i];
		if (line->addr == addr)
		{
			return line;
		}
	}
	return NULL;
}

// ------------------------------------------------------------------------------------------
LINE_T *make_tag(LINE_T *line)
{
	if (line == NULL)
	{
		line = new_line(0);
	}
	sprintf(line->tag, "L%08lX:", line->addr);
	return line;
}

// ------------------------------------------------------------------------------------------
void make_tagf(LINE_T *line, char *fmt, ...)
{
	char buf[32]; // **Make sure the buffer is large enough**
	va_list args;
	va_start(args, fmt);
	vsnprintf(buf, sizeof(buf), fmt, args);
	va_end(args);
	strcat(buf, ":");

	strcpy(line->tag, buf);
}

// ------------------------------------------------------------------------------------------
LINE_T *make_code(LINE_T *line, char *fmt, ...)
{
	char buf[1024]; // **Make sure the buffer is large enough**
	if (line == NULL)
	{
		line = new_line(0);
	}

	va_list args;
	va_start(args, fmt);
	vsnprintf(buf, sizeof(line->code), fmt, args);
	va_end(args);

    if (strlen(line->code) > 0)
    {
        strcat(line->code, ", ");
    }
    else
    {
        strcat(line->code, "call ");
    }
    strncat(line->code, buf, sizeof(line->code));
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *make_codeU(LINE_T *line, char *fmt, ...)
{
	char buf[1024]; // **Make sure the buffer is large enough**
	if (line == NULL)
	{
		line = new_line(0);
	}

	va_list args;
	va_start(args, fmt);
	vsnprintf(buf, sizeof(line->code), fmt, args);
	va_end(args);

    strncat(line->code, buf, sizeof(line->code));
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *make_comment(LINE_T *line, char *fmt, ...)
{
	char buf[1024]; // **Make sure the buffer is large enough**
	if (line == NULL)
	{
		line = new_line(0);
	}

	va_list args;
	va_start(args, fmt);
	vsnprintf(buf, sizeof(buf), fmt, args);
	va_end(args);

	if (strlen(line->comment) > 0)
	{
		strcat(line->comment, ", ");
	}
	strcat(line->comment, buf);
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *make_line(int addr, char *code, char *comment)
{
	LINE_T *line = new_line(addr);
	if (code != NULL)
		make_code(line, "%s", code);
	if (comment != NULL)
		make_comment(line, "%s", comment);
	return line;
}

// ------------------------------------------------------------------------------------------
void set_tag(CELL addr, int error_notfound)
{
	LINE_T *line = find_line(addr);
	if (line)
	{
		make_tag(line);
		return;
	}

	if (error_notfound == 1)
	{
		printf("WARNING: fwd_ref (0x%08lX) not found! Making empty tag L%08lX ...\n", addr, addr);
		line = new_line(addr);
		make_comment(line, "Label for ");
		make_codeU(line, "dd 0,0,0,0");
		make_tag(line);
	}
	else
	{
		fwd_ref[fwd_ref_num++] = addr;
	}
}

// ------------------------------------------------------------------------------------------
LINE_T *set_line(LINE_T *line, char *code, char *comment)
{
	if (code != NULL)
		make_code(line, "%s", code);
	if (comment != NULL)
		make_comment(line, "%s", comment);
	return line;
}

// ------------------------------------------------------------------------------------------
void resolve_fwd_refs()
{
	for (int i = 0; i < fwd_ref_num; i++)
	{
		int addr = fwd_ref[i];
		set_tag(addr, 1);
	}
}

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
LINE_T *dis_getTOS(char *val)
{
	// In this implementation, EBX s the top value on the stack and EBP in the DSP (Data Stack Pointer)
	// So nothing needs to be done here!
	// LINE_T *line = new_line(0);
	// make_code(line, "movl (%%ebp), %s", val);
	// make_comment(line, "get TOS to %s", val);
	return NULL;
}

// ------------------------------------------------------------------------------------------
LINE_T *dis_setTOS(char *val)
{
	// In this implementation, EBX s the top value on the stack and EBP in the DSP (Data Stack Pointer)
	LINE_T *line = new_line(0);
	make_code(line, "movl %s, (%%ebp)", val);
	// make_comment(line, "set TOS to %s", val);
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *dis_PUSH(char *val)
{
	// In this implementation, EBX s the top value on the stack and EBP in the DSP (Data Stack Pointer)
	LINE_T *line = new_line(0);
	// make_code(line, "push %s", val);
	make_code(line, "addl $4, %s", "%ebp");
	make_comment(line, "PUSH %s", val);
	dis_setTOS(val);
	return line;
}

// ------------------------------------------------------------------------------------------
LINE_T *dis_POP(char *tgt)
{
	// In this implementation, EBX s the top value on the stack and EBP in the DSP (Data Stack Pointer)
	LINE_T *line = NULL; // new_line(0);
	// make_code(line, "pop %s", tgt);
	line = dis_getTOS(tgt);
	make_comment(line, "POP to %s", tgt);
	make_code(NULL, "sub $4, %s", "%ebp");
	return line;
}

// ------------------------------------------------------------------------------------------
// Where all the work is done
// ------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------
void dis_one_FASM()
{
	LAST_PC = PC;
	IR = the_memory[PC++];

	dis_opcode(IR);
	return;

	char tmp[256];
	LINE_T *line = NULL; // new_line(PC);

	switch (IR)
	{
	case LITERAL:
		arg1 = GETAT(PC);
		PC += CELL_SZ;
		// push(arg1);
		// line = make_code(NULL, "prim_LITERAL");
		make_codeU(NULL, "m_push %ld", arg1);
		return;

	case CLITERAL:
		arg1 = the_memory[PC];
		PC++;
		// push(arg1);
		// line = make_code(NULL, "prim_LITERAL");
		make_codeU(NULL, "m_push %ld", arg1);
		return;

	case FETCH:
		// arg1 = GETTOS();
		// arg2 = GETAT(arg1);
		// SETTOS(arg2);
		// make_code(NULL, "prim_FETCH");
		line = make_codeU(NULL, "mov ebx, [ebx]");
		line = make_comment(line, "FETCH,NB ebx is the TOS");
		line = make_comment(line, "FETCH");
		return;

	case STORE:
		// arg1 = pop();
		// arg2 = pop();
		// SETAT(arg1, arg2);
		line = make_code(line, "prim_STORE");
		return;

	case SWAP:
		// arg1 = GET2ND();
		// arg2 = GETTOS();
		// SET2ND(arg2);
		// SETTOS(arg1);

		line = make_code(line, "prim_SWAP");
		return;

	case DROP:
		// arg1 = pop();
		line = make_code(NULL, "prim_DROP");
		return;

	case DUP:
		// arg1 = GETTOS();
		// push(arg1);
		make_code(NULL, "prim_DUP");
		return;

	case OVER:
		// arg1 = GET2ND();
		// push(arg1);
		line = make_code(NULL, "prim_OVER");
		return;

	case PICK:
		// arg1 = pop();
		// arg2 = *(DSP - arg1);
		// push(arg2);
		make_code(NULL, "prim_PICK");
		return;

	case LOGLEVEL:
		// arg1 = pop();
		// arg2 = *(DSP - arg1);
		// push(arg2);
		make_code(NULL, "prim_LOGLEVEL");
		return;

	case JMP:
		// PC = GETAT(PC);
		arg1 = GETAT(PC);
		PC += CELL_SZ;
		set_tag(arg1, 0);
		line = make_code(NULL, "prim_JMP", arg1);
		make_code(line, "L%08lX", arg1);
		return;

	case JMPZ:
		// if (pop() == 0)
		// {
		// 	PC = GETAT(PC);
		// }
		// else
		// {
		// 	PC += CELL_SZ;
		// }
		arg1 = GETAT(PC);
		PC += CELL_SZ;
		set_tag(arg1, 0);
		line = make_code(NULL, "prim_JMPZ", arg1);
		make_code(line, "L%08lX", arg1);
		return;

	case JMPNZ:
		// arg1 = pop();
		// if (arg1 != 0)
		// {
		// 	PC = GETAT(PC);
		// }
		// else
		// {
		// 	PC += CELL_SZ;
		// }
		arg1 = GETAT(PC);
		PC += CELL_SZ;
		set_tag(arg1, 0);
		line = make_code(NULL, "prim_JMPNZ", arg1);
		make_code(line, "L%08lX", arg1);
		return;

	case CALL:
		// PC += CELL_SZ;
		// rpush(PC);
		// PC = arg1;
		arg1 = GETAT(PC);
		PC += CELL_SZ;
        if (the_memory[arg1] == DICTP)
        {
            arg2 = GETAT(arg1+1);
            DICT_T *dp = (DICT_T *)&the_memory[arg2];
    		make_code(line, "L%08lX", dp->XT);
        }
        else
        {
            set_tag(arg1, 0);
    		make_code(line, "L%08lX", arg1);
        }
		return;

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
		line = make_codeU(NULL, "ret");
		return;

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
		line = make_codeU(NULL, "m_push 0");
        make_comment(line, "COMPARE");
		line = make_codeU(NULL, "call prim_COMPARE");
		return;

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
		line = make_codeU(NULL, "m_push 1");
        make_comment(line, "COMPAREI");
		line = make_codeU(NULL, "call prim_COMPARE");
		return;

	case SLITERAL:
		// count, bytes, NULL - NULL delimited counted string
		// 0100 0101 0102 0103 0104 0105
		//   07   03   65   66   67   00
		// SLIT   03    A    B    C   00
		// PC starts at 0101, should be set to 0106

		arg1 = the_memory[PC]; // count-byte (and the beginning of the counted string)
		arg2 = arg1 + 2;  // count-byte + string + NULL
		// push(arg1);
        make_code(NULL, "prim_SLITERAL");
		line = make_codeU(NULL, "db %d, '%s', 0", arg1, &the_memory[PC+1]);
		PC += arg2;
		return;

	case CFETCH:
		// arg1 = GETTOS();
		// SETTOS(the_memory[arg1]);
		make_code(NULL, "prim_CFETCH");
		return;

	case CSTORE:
		// arg1 = pop();
		// arg2 = pop();
		// the_memory[arg1] = (BYTE)arg2;
		make_code(NULL, "prim_CSTORE");
		return;

	case ADD:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 + arg1);
		make_code(NULL, "prim_ADD");
		return;

	case SUB:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 - arg1);
		make_code(NULL, "prim_SUB");
		return;

	case MUL:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 * arg1);
		make_code(NULL, "prim_MUL");
		return;

	case DIV:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 / arg1);
		make_code(NULL, "prim_DIV");
		return;

	case LT:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 < arg1 ? 1 : 0);
		line = make_code(NULL, "prim_LT");
		make_comment(line, "LT");
		return;

	case EQ:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 == arg1 ? 1 : 0);
		line = make_code(NULL, "prim_EQ");
		make_comment(line, "EQ");
		return;

	case GT:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 > arg1 ? 1 : 0);
		line = make_code(NULL, "prim_GT");
		make_comment(line, "GT");
		return;

	case DICTP:
		// arg1 = GETAT(PC);
		// // PC += CELL_SZ;
		// sprintf(line1, "# DICTP %s (%04lx)", &(the_memory[arg1+10]), arg1);
		// dis_PC2(CELL_SZ, bytes);
		{
			arg1 = GETAT(PC);
			PC += CELL_SZ;
            arg2 = LAST_PC;
            LAST_PC = 0;
			DICT_T *dict = (DICT_T *)&the_memory[arg1];
			DICT_T *next = (dict->next > 0) ? (DICT_T *)&the_memory[dict->next] : NULL;
            new_line(0);
            line = new_line(arg1);
            line = make_codeU(line, "dd L%08lX", next ? dict->next : 0);
            line = make_comment(line, "NEXT");
            line = make_tag(line);
            line = make_codeU(NULL, "db %d", dict->flags);
            line = make_comment(line, "FLAGS");
            line = make_codeU(NULL, "db %d, '%s', 0", dict->len, dict->name);
            line = make_comment(line, "WORD: %s", dict->name);

            new_line(arg2);
            set_tag(dict->next, 0);
            set_tag(dict->XT, 0);
		}
		return;

	case EMIT:
		// arg1 = pop();
		// putchar(arg1);
		line = make_code(NULL, "prim_EMIT");
		make_comment(line, "EMIT");
		return;

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
		make_code(NULL, "prim_FOPEN");
		return;

	case FREAD:			// ( addr num fp -- count ) - fp == 0 means STDIN
		// arg3 = pop(); -- FP
		// arg2 = pop(); -- NUM
		// arg1 = pop(); -- ADDR
		// {
		// 	BYTE *pBuf = (BYTE *)&the_memory[arg1 + 1];
		// 	int num = fread(pBuf, sizeof(BYTE), arg2, (arg3 == 0) ? stdin : (FILE *)arg3);
		// 	push(num);
		// }
		make_code(NULL, "prim_FREAD");
		return;

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
		make_code(NULL, "prim_FREADLINE");
		return;

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
		make_code(NULL, "prim_FWRITE");
		return;

	case FCLOSE:
		// arg1 = pop();
		// if (arg1 != 0)
		// {
		// 	fclose((FILE *)arg1);
		// }
		make_code(NULL, "prim_FCLOSE");
		return;

	case GETCH:
		// arg1 = getchar();
		// push(arg1);
		make_code(NULL, "prim_GETCH");
		return;

	case DTOR:
		// arg1 = pop();
		// rpush(arg1);
		line = make_code(NULL, "prim_DTOR");
		return;

	case RTOD:
		// arg1 = rpop();
		// push(arg1);
		line = make_code(NULL, "prim_RTOD");
		return;

	case DEPTH:
		// arg1 = DSP - dsp_init;
		// push(arg1);
		make_code(NULL, "prim_DEPTH");
		return;

	case AND:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 & arg1);
		make_code(NULL, "prim_AND");
		return;

	case OR:
		// arg1 = pop();
		// arg2 = pop();
		// push(arg2 | arg1);
		make_code(NULL, "prim_OR");
		return;

	case USINIT:
		make_comment(NULL, "USINIT (TODO)");
		return;

	case USPUSH:
		make_comment(NULL, "USPUSH (TODO)");
		return;

	case USPOP:
		make_comment(NULL, "USPOP (TODO)");
		return;

	case BREAK:
	// {
	// 	arg1 = the_memory[ADDR_HERE];
	// 	arg2 = the_memory[ADDR_LAST];
	// 	arg3 = arg2 - arg1;
	// }
		make_comment(NULL, "BREAK (TODO)");
		return;

	case BYE:
		// isBYE = true;
		make_comment(NULL, "prim_BYE");
		return;

	case RESET:
		make_comment(NULL, "prim_RESET");
		return;

	default:
		// DSP = dsp_init;
		// RSP = rsp_init;
		// PC = 0;
		// isBYE = isEmbedded;
		make_comment(NULL, ".byte 0x%02x, '%c'", IR, (IR > 31) ? IR : '~');
		return;
	}
	return;
}

// ------------------------------------------------------------------------------------------
void dis_one_GCC()
{
}

void dis_one()
{
        switch (tgt_lang)
    {
        case TGT_FASM:
            dis_one_FASM();
            break;

        case TGT_GCC:
            dis_one_GCC();
            break;
    }
}


// ------------------------------------------------------------------------------------------
LINE_T *gen_funcHeader(char *name)
{
	LINE_T *line = NULL;
	new_line(0);
	line = new_line(0);
	make_tagf(line, "prim_%s", name);
	make_comment(line, "Implementation of %s", name);
	return line;
}

// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
void gen_cmpFunction(char *name, char *operator)
{
	gen_funcHeader(name);
	LINE_T *line = NULL;

	make_codeU(NULL, "m_pop ebx");
	make_codeU(NULL, "m_getTOS eax");

	make_codeU(NULL, "cmp eax, ebx");
	make_codeU(NULL, "%s %s_true", operator, name);

	// FALSE case
	make_codeU(NULL, "m_setTOS 0");
	make_codeU(NULL, "ret");

	// TRUE case
	line = make_codeU(NULL, "m_setTOS 1");
	make_tagf(line, "%s_true", name);
	make_codeU(NULL, "ret");
}

// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------

// ------------------------------------------------------------------------------------------
void dis_dict(CELL dict_addr)
{
	char code[128], comment[128];
	DICT_T *dp = (DICT_T *)&the_memory[dict_addr];
	DICT_T *next_dp = (DICT_T *)&the_memory[dp->next];
	CELL addr = dict_addr;
	LINE_T *line = NULL;

	if (dp->next == 0)
	{
		line = new_line(addr);
		make_tag(line);
		make_comment(line, "End.");
		return;
	}

	// Next
	line = new_line(addr);
	make_tag(line);
	make_code(line, "; Next: %08lx", dp->next);
	make_comment(line, "; WORD: %s", dp->name);

	// XT, flags
	addr += CELL_SZ;
	line = new_line(addr);
	make_code(line, "; XT: %08lx", dp->XT);
	make_comment(line, "Flags: %d", dp->flags);
	addr += 1;

	// Name
	addr += CELL_SZ;
	line = new_line(addr);
	make_code(line, "; Len: %d", dp->len);
	dis_start(addr, dp->len+1, line->comment);
}

// ------------------------------------------------------------------------------------------
void dis_vm()
{
	int here = GETAT(ADDR_HERE);
	char line[1024];
    int tagLen = 12;
    int codeLen = 24;

/*
	// Initial JMP
	PC = 0;
	dis_one(line);

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

	fprintf(write_to, "\n", bytes);
	fflush(write_to);
*/
	// Code
	PC = ORG;
    make_comment(NULL, "-------------------------------------------------------------------------");
    make_comment(NULL, "-------------------------------------------------------------------------");
    make_comment(NULL, "-------------------------------------------------------------------------");
	while (PC < here)
	{
		dis_one();
	}

	// make_comment(NULL, "\n; End of code, Dictionary:\n;\n");

	// // Dictionary
	// PC = GETAT(ADDR_LAST);
	// while (PC > 0)
	// {
	// 	dis_dict(PC);
	// 	PC = GETAT(PC);
	// }
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
char *make_len(char *buf, int len)
{
	while (strlen(buf) < len)
	{
		strcat(buf, " ");
	}
	return buf;
}

// *********************************************************************
void p_include(char *filename, FILE *output_fp)
{
    printf("including '%s' ... ", filename);
	int n = 0;
    FILE *fp = fopen(filename, "rt");
    if (!fp)
    {
        printf("ERROR: Can't open file '%s'.\n", filename);
        return;
    }

	char buf[256];
	while (fgets(buf, sizeof(buf), fp) == buf)
	{
		++n;
		fputs(buf, output_fp);
	}
	fclose(fp);
    printf("done, %d lines\n", n);
	return;
}

// *********************************************************************
void write_output()
{
    FILE *output_fp = fopen(output_fn, "wt");
    if (!output_fp)
    {
        printf("ERROR: Can't open output file.\n");
        return;
    }

    fprintf(output_fp, "; memory-size: %ld bytes, (%04lx hex)\n", memory_size, memory_size);
    fprintf(output_fp, "; data-stack: %04lx, grows up\n", memory_size - STACKS_SZ);
    fprintf(output_fp, "; return-stack: %04lx, grows down\n", memory_size - CELL_SZ);

	// p_include("forth_inc.s", output_fp);

	char buf[512];
	for (int i = 0; i < num_lines; i++)
	{
		LINE_T *line = lines[i];
		strcpy(buf, line->tag);
		make_len(buf, 15);
		strcat(buf, " ");
		strcat(buf, line->code);
		if (strlen(line->comment) > 0)
		{
			make_len(buf, 47);
			strcat(buf, " ; ");
			strcat(buf, line->comment);
		}
		fputs(buf, output_fp);
		fputs("\n", output_fp);
	}
	fclose(output_fp);
}

// *********************************************************************
void do_dis()
{
    printf("disassembling to file %s... ", output_fn);

	// gen_cmpFunction("EQ", "jz");
	// gen_cmpFunction("LT", "jl");
	// gen_cmpFunction("GT", "jg");

	gen_opcodes();

	dis_vm();

	resolve_fwd_refs();
	write_output();

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
	strcpy(output_fn, "Forth-STC-Words.inc");
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
    return 0;
}
