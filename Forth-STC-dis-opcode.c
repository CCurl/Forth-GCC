#include <stdio.h>

#include "Shared.h"

void gen_funcHeader(char *);
LINE_T *new_line(CELL);
LINE_T *make_tag(LINE_T *);
LINE_T *make_tagF(LINE_T *, char *, ...);
LINE_T *make_code(LINE_T *, char *, ...);
LINE_T *make_codeU(LINE_T *, char *, ...);
LINE_T *make_comment(LINE_T *, char *, ...);

void set_tag(CELL, int);
extern BYTE *the_memory;
extern CELL PC, LAST_PC;

void dis_opcode(int opcode)
{
    CELL arg1, arg2, arg3;
    LINE_T *line = NULL;
    // printf("-%04lX,%X-", LAST_PC, opcode);

    switch (opcode)
    {
        case LITERAL:
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            line = make_codeU(NULL, "m_push %ld", arg1);
            // make_comment(line, "LITERAL");
            return;

        case FETCH:
            line = make_codeU(NULL, "mov ebx, [ebx]", arg1);
            make_comment(line, "FETCH");
            return;

        case STORE:
            line = make_codeU(NULL, "call prim_STORE");
            return;

        case SWAP:
            line = make_codeU(NULL, "call prim_SWAP");
            return;

        case DROP:
            line = make_codeU(NULL, "m_pop eax");
            make_comment(line, "DROP");
            return;

        case DUP:
            line = make_codeU(NULL, "m_push ebx");
            make_comment(line, "DUP");
            return;

        case SLITERAL:
            arg1 = the_memory[PC];
            line = make_codeU(NULL, "call prim_SLITERAL");
            line = make_comment(line, "(%d), '%s', (0)", arg1, &the_memory[PC+1]);
            PC += arg1+2;
            return;

        case JMP:
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            line = make_codeU(NULL, "jmp L%08lX", arg1);
            make_comment(line, "JMP");
            set_tag(arg1, 0);
            return;

        case JMPZ:
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            line = make_codeU(NULL, "m_pop eax");
            line = make_codeU(NULL, "cmp eax, 0");
            line = make_codeU(NULL, "je L%08lX", arg1);
            make_comment(line, "JMPZ");
            set_tag(arg1, 0);
            return;

        case JMPNZ:
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            line = make_codeU(NULL, "m_pop eax");
            line = make_codeU(NULL, "cmp eax, 0");
            line = make_codeU(NULL, "jne L%08lX", arg1);
            make_comment(line, "JMPNZ");
            set_tag(arg1, 0);
            return;

        case CALL:
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            line = make_codeU(NULL, "call L%08lX", arg1);
            make_comment(line, "CALL %04lX", arg1);
            if (the_memory[arg1] == DICTP)
            {
                arg2 = CELL_AT(arg1+1);
                DICT_T *dict = (DICT_T *)&the_memory[arg2];
                make_comment(line, "%s", dict->name);
            }
            set_tag(arg1, 0);
            return;

        case RET:
            line = make_codeU(NULL, "ret");
            return;

        case OR:
            line = make_codeU(NULL, "call prim_OR");
            return;

        case CLITERAL:
            arg1 = the_memory[PC];
            // printf("-CL-%04lX,%X-", PC, arg1);
            PC += 1;
            line = make_codeU(NULL, "m_push %ld", arg1);
            make_comment(line, "CLITERAL (%04lX)", arg1);
            return;

        case CFETCH:
            line = make_codeU(NULL, "call prim_CFETCH");
            return;

        case CSTORE:
            line = make_codeU(NULL, "call prim_CSTORE");
            return;

        case ADD:
            line = make_codeU(NULL, "call prim_ADD");
            return;

        case SUB:
            line = make_codeU(NULL, "call prim_SUB");
            return;

        case MUL:
            line = make_codeU(NULL, "call prim_MUL");
            return;

        case DIV:
            line = make_codeU(NULL, "call prim_DIV");
            return;

        case LT:
            line = make_codeU(NULL, "call prim_LT");
            return;

        case EQ:
            line = make_codeU(NULL, "call prim_EQ");
            return;

        case GT:
            line = make_codeU(NULL, "call prim_GT");
            return;

        case DICTP:
            arg2 = LAST_PC;
            arg1 = CELL_AT(PC);
            PC += CELL_SZ;
            LAST_PC = 0;
            // return;
            {
                char buf[256];
                DICT_T *dict = (DICT_T *)&the_memory[arg1];
                DICT_T *next = (dict->next > 0) ? (DICT_T *)&the_memory[dict->next] : NULL;
                arg3 = (next && (next->next > 0)) ? next->XT : 0;
                
                new_line(0);
                sprintf(buf, "dict_ENTRY L%04lX, L%04lX, %d, %d, \"%s\"", dict->XT, arg3, dict->flags, dict->len, dict->name);
                line = make_codeU(NULL, "%s", buf);
                // set_tag(dict->next, 0);
                // set_tag(arg2, 0);
                line = new_line(dict->XT);
                make_tag(line);
                // set_tag(dict->XT, 0);
            }
            return;

        case EMIT:
            line = make_codeU(NULL, "call prim_EMIT");
            return;

        case OVER:
            line = make_codeU(NULL, "call prim_OVER");
            return;

        case COMPARE:
            line = make_codeU(NULL, "call prim_COMPARE");
            return;

        case FOPEN:
            line = make_codeU(NULL, "call prim_FOPEN");
            return;

        case FREAD:
            line = make_codeU(NULL, "call prim_FREAD");
            return;

        case FREADLINE:
            line = make_codeU(NULL, "call prim_FREADLINE");
            return;

        case FWRITE:
            line = make_codeU(NULL, "call prim_FWRITE");
            return;

        case FCLOSE:
            line = make_codeU(NULL, "call prim_FCLOSE");
            return;

        case DTOR:
            line = make_codeU(NULL, "m_pop eax");
            make_comment(line, "DTOR (>R)");
            line = make_codeU(NULL, "m_rpush eax");
            return;

        case RTOD:
            line = make_codeU(NULL, "m_rpop eax");
            make_comment(line, "RTOD (R>)");
            line = make_codeU(NULL, "m_push eax");
            return;

        case LOGLEVEL:
            line = make_codeU(NULL, "call prim_LOGLEVEL");
            return;

        case AND:
            line = make_codeU(NULL, "call prim_AND");
            return;

        case PICK:
            line = make_codeU(NULL, "call prim_PICK");
            return;

        case DEPTH:
            line = make_codeU(NULL, "call prim_DEPTH");
            return;

        case GETCH:
            line = make_codeU(NULL, "call prim_GETCH");
            return;

        case COMPAREI:
            line = make_codeU(NULL, "call prim_COMPAREI");
            return;

        case USPUSH:
            line = make_codeU(NULL, "call prim_USPUSH");
            return;

        case USPOP:
            line = make_codeU(NULL, "call prim_USPOP");
            return;

        case INC:
            line = make_codeU(NULL, "m_onePlus");
            return;

        case TIMER:
            line = make_codeU(NULL, "call prim_GETTICK");
            return;

        case DEC:
            line = make_codeU(NULL, "m_oneMinus");
            return;

        case BREAK:
            line = make_codeU(NULL, "call prim_BREAK");
            return;

        case RESET:
            line = make_codeU(NULL, "call prim_RESET");
            return;

        case BYE:
            line = make_codeU(NULL, "call prim_BYE");
            return;

    }
    return;
}