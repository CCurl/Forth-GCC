#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdlib.h>
#include <ctype.h>
#include "forth-vm.h"
#include "Shared.h"
#include "string.h"

char input_fn[256];
char output_fn[256];
FILE *input_fp = NULL;
FILE *output_fp = NULL;
int mem_size_KB = 64;

#define CELL_ADDR    8
#define HERE_ADDR   16
#define LAST_ADDR   20
#define BASE_ADDR   24
#define VHERE_ADDR  28
#define STATE_ADDR  32
#define MEMSZ_ADDR  36

#define HERE  the_cells[HERE_ADDR/CELL_SZ]
#define VHERE the_cells[VHERE_ADDR/CELL_SZ]
#define LAST  the_cells[LAST_ADDR/CELL_SZ]
#define BASE  the_cells[BASE_ADDR/CELL_SZ]
#define STATE the_cells[STATE_ADDR/CELL_SZ]

void  Store(CELL loc, CELL val) { CELL_AT(loc) = val; }
void CStore(CELL loc, CELL val) { BYTE_AT(loc) = (BYTE)val; }

CELL  Fetch(CELL loc) { return CELL_AT(loc); }
BYTE CFetch(CELL loc) { return BYTE_AT(loc); }

void  Comma(CELL val) { CELL_AT(HERE) = val; HERE += CELL_SZ; }
void CComma(CELL val) { BYTE_AT(HERE) = (BYTE)val; HERE += 1; }

extern int _QUIT_HIT;

OPCODE_T theOpcodes[] = {
          { "LITERAL",          LITERAL,          "LITERAL",        0 }
        , { "FETCH",            FETCH,            "FETCH",          IS_INLINE }
        , { "STORE",            STORE,            "STORE",          IS_INLINE }
        , { "SWAP",             SWAP,             "SWAP",           IS_INLINE }
        , { "DROP",             DROP,             "DROP",           IS_INLINE }
        , { "DUP",              DUP,              "DUP",            IS_INLINE }
        , { "SLITERAL",         SLITERAL,         "SLITERAL",       IS_INLINE }
        , { "JMP",              JMP,              "JMP",            0 }
        , { "JMPZ",             JMPZ,             "JMPZ",           0 }
        , { "JMPNZ",            JMPNZ,            "JMPNZ",          0 }
        , { "CALL",             CALL,             "CALL",           0 }
        , { "RET",              RET,              "RET",            0 }
        , { "OR",               OR,               "OR",             IS_INLINE }
        , { "CLITERAL",         CLITERAL,         "CLITERAL",       IS_INLINE }
        , { "CFETCH",           CFETCH,           "CFETCH",         IS_INLINE }
        , { "CSTORE",           CSTORE,           "CSTORE",         IS_INLINE }
        , { "ADD",              ADD,              "ADD",            IS_INLINE }
        , { "SUB",              SUB,              "SUB",            IS_INLINE }
        , { "MUL",              MUL,              "MUL",            IS_INLINE }
        , { "DIV",              DIV,              "DIV",            IS_INLINE }
        , { "LT",               LT,               "LT",             IS_INLINE }
        , { "EQ",               EQ,               "EQ",             IS_INLINE }
        , { "GT",               GT,               "GT",             IS_INLINE }
        , { "DICTP",            DICTP,            "DICTP",          IS_INLINE }
        , { "EMIT",             EMIT,             "EMIT",           IS_INLINE }
        , { "OVER",             OVER,             "OVER",           IS_INLINE }
        , { "COMPARE",          COMPARE,          "COMPARE",        IS_INLINE }
        , { "FOPEN",            FOPEN,            "FOPEN",          IS_INLINE }
        , { "FREAD",            FREAD,            "FREAD",          IS_INLINE }
        , { "FREADLINE",        FREADLINE,        "FREADLINE",      IS_INLINE }
        , { "FWRITE",           FWRITE,           "FWRITE",         IS_INLINE }
        , { "FCLOSE",           FCLOSE,           "FCLOSE",         IS_INLINE }
        , { "DTOR",             DTOR,             "DTOR",           IS_INLINE }
        , { "RTOD",             RTOD,             "RTOD",           IS_INLINE }
        , { "COM",              COM,              "COM",            IS_INLINE }
        , { "AND",              AND,              "AND",            IS_INLINE }
        , { "XOR",              XOR,              "XOR",            IS_INLINE }
        , { "PICK",             PICK,             "PICK",           IS_INLINE }
        , { "DEPTH",            DEPTH,            "DEPTH",          IS_INLINE }
        , { "GETCH",            GETCH,            "GETCH",          IS_INLINE }
        , { "COMPAREI",         COMPAREI,         "COMPAREI",       IS_INLINE }
        , { "SLASHMOD",         SLASHMOD,         "SLASHMOD",       IS_INLINE }
        , { "NOT",              NOT,              "NOT",            IS_INLINE }
        , { "RFETCH",           RFETCH,           "RFETCH",         IS_INLINE }
        , { "INC",              INC,              "INC",            IS_INLINE }
        , { "RDEPTH",           RDEPTH,           "RDEPTH",         IS_INLINE }
        , { "DEC",              DEC,              "DEC",            IS_INLINE }
        , { "TIMER",          TIMER,          "TIMER",        IS_INLINE }
        , { "SHIFTLEFT",        SHIFTLEFT,        "LSHIFT",         IS_INLINE }
        , { "SHIFTRIGHT",       SHIFTRIGHT,       "RSHIFT",         IS_INLINE }
        , { "PLUSSTORE",        PLUSSTORE,        "PLUSSTORE",      IS_INLINE }
        , { "OPENBLOCK",        OPENBLOCK,        "OPENBLOCK",      IS_INLINE }
        , { "GOTOXY",           GOTOXY,           "GOTOXY",         IS_INLINE }
        , { "TOSRC",            TOSRC,            ">SRC",           IS_INLINE }
        , { "SRCQ",             SRCQ,             "SRC?",           IS_INLINE }
        , { "SRCP4",            SRCP4,            "SRC+",           IS_INLINE }
        , { "SRCP1",            SRCP1,            "SRC+1",          IS_INLINE }
        , { "TODST",            TODST,            ">DST",           IS_INLINE }
        , { "DSTQ",             DSTQ,             "DST?",           IS_INLINE }
        , { "DSTP4",            DSTP4,            "DST+",           IS_INLINE }
        , { "DSTP1",            DSTP1,            "DST+1",          IS_INLINE }
        , { "DBGDOT",           DBGDOT,           "DBGDOT",         IS_INLINE }
        , { "DBGDOTS",          DBGDOTS,          "DBGDOTS",        IS_INLINE }
        , { "NOP",              NOP,              "NOP",            IS_INLINE }
        , { "BREAK",            BREAK,            "BREAK",          IS_INLINE }
        , { "RESET",            RESET,            "RESET",          IS_INLINE }
        , { "BYE",              BYE,              "BYE",            IS_INLINE }
        , { NULL,               0,                 "",              IS_INLINE }
 };


// ------------------------------------------------------------------------------------------
void ExecuteXT(CELL XT)
{
    cpu_loop(XT);
}

DICT_T *FindWord(LPCTSTR word)
{
    DICT_T *dp = (DICT_T *)(&the_bytes[LAST]);
    while (dp->next > 0)
    {
        if (string_equals(word, dp->name)) {
            return dp;
        }
        dp = (DICT_T *)(&the_bytes[dp->next]);
    }

    return 0;
}

int MakeNumber(LPCTSTR word, CELL *the_num)
{
    CELL base = BASE;
    int is_neg = false;
    char *w = word;
    CELL my_num = 0;
    char *possible_chars = "0123456789abcdef";
    char valid_chars[24];

    if (*w == '%') {
        base = 2;
        ++w;
    }

    if (*w == '#') {
        base = 10;
        ++w;
    }

    if (*w == '$') {
        base = 16;
        ++w;
    }

    strncpy(valid_chars, possible_chars, BASE);

    // One leading minus sign is OK in decimal
    if ((base == 10) && (*w == '-'))
    {
        is_neg = true;
        w++;
    }

    while (*w)
    {
        char ch = *(w++);
        ch = tolower(ch);
        char *pos = strchr(valid_chars, ch);
        if (pos == 0)
        {
            return false;
        }
        CELL digit = (CELL)(pos - valid_chars);
        my_num = (my_num * base) + digit;
    }

    if (is_neg)
    {
        my_num = -my_num;
    }
    *the_num = my_num;
    return true;
}

void DefineWord(LPCTSTR word, BYTE flags)
{
    CELL curLAST = LAST;
    LAST -= ((CELL_SZ*2) + 3 + string_len(word));

    DICT_T *dp = (DICT_T *)(&the_bytes[LAST]);
    dp->next = curLAST;
    dp->XT = HERE;
    dp->flags = flags;
    dp->len = string_len(word);
    strcpy(dp->name, word);
}

// Returns a pointer to the first char after the first word in the line
// NB: this is NOT a counted string
char *GetWord(char *line, char *word)
{
    char *cp = word;

    // Skip beginning WS
    while ((*line) && (*line <= ' ')) {
        line++;
    }

    // Copy chars up to ' ' or EOL or 1st non-printable char
    while ((*line) && (*line > ' ')) {
        *(cp++) = *(line++);
    }
    *cp = NULL;

    return line;
}

char *ParseWord(char *word, char *line)
{
    CELL val;

    if (string_equals(word, ".QUIT")) {
        _QUIT_HIT = 1;
        return line;
    }

    if ((STATE < 0) || (STATE > 2)) {
        printf("STATE (%ld) is messed up!\n", STATE);
        STATE = 0;
    }

    if (string_equals(word, ":")) {
        line = GetWord(line, word);
        DefineWord(word, 0);
        // CComma(DICTP);
        // Comma(LAST);
        STATE = 1;

        return line;
    }

    if (string_equals(word, ".VARIABLE.")) {
        line = GetWord(line, word);
        DefineWord(word, 0);
        // CComma(DICTP);
        // Comma(LAST);
        CComma(LITERAL);
        Comma(HERE + 5);
        CComma(RET);
        Comma(0);
        return line;
    }

    // Character literal? e.g. - 'X'
    if ((strlen(word) == 3) && (word[0] == '\'') && (word[2] == '\''))
    {
        val = word[1];
        if (STATE == 0) {
            push(val);
        }
        else {
            CComma(CLITERAL);
            CComma((BYTE)val);
        }
        return line;
    }

    if (strcmp(word, ".INLINE.") == 0) {
        DICT_T *dp = (DICT_T *)(&the_bytes[LAST]);
        dp->flags |= IS_INLINE;
        return line;
    }

    if (strcmp(word, ".IMMEDIATE.") == 0) {
        DICT_T *dp = (DICT_T *)(&the_bytes[LAST]);
        dp->flags |= IS_IMMEDIATE;
        return line;
    }

    if (strcmp(word, ".EndOfVariables.") == 0) {
        CComma(NOP);
        return line;
    }

    if (string_equals(word, ";")) {
        CComma(RET);
        STATE = 0;
        return line;
    }

    if (strcmp(word, ".IF") == 0) {
        CComma(JMPZ);
        push(HERE);
        Comma(0);
        return line;
    }

    if (strcmp(word, ".THEN") == 0) {
        CELL tmp = pop();
        Store(tmp, HERE);
        return line;
    }

    if (string_equals(word, "S\"")) {
        CComma(SLITERAL);
        int count = 0, done = false;
        line += 1;
        CELL cur_here = HERE++;
        BYTE ch;
        while ((!done) && (!string_isEmpty(line)))
        {
            ch = *(line++);
            if (ch == '\"') {
                done = true;
            } else {
                CComma(ch);
                count++;
            }
        }
        CComma(0);
        CStore(cur_here, count);
        return line;
    }

    DICT_T *dp = FindWord(word);
    if (dp != NULL) {
        if (STATE == 1) {
            if (dp->flags & IS_IMMEDIATE) {
                cpu_loop(dp->XT);
            } else if (dp->flags & IS_INLINE) {
                // Skip the DICTP instruction
                // CELL addr = dp->XT + 1 + CELL_SZ;
                CELL addr = dp->XT;

                // Copy bytes until the first RET
                while (true)
                {
                    BYTE b = CFetch(addr++);
                    if (b == RET) {
                        break;
                    }
                    CComma(b);
                }
            } else {
                CComma(CALL);
                Comma(dp->XT);
            }
        } else {
            cpu_loop(dp->XT);
        }
        return line;
    }

    // "Assembler" words
    for (int i = 0; ; i++)
    {
        OPCODE_T *op = &(theOpcodes[i]);
        if (op->asm_instr == NULL) {
            break;
        }

        if (strcmp(word, op->asm_instr) == 0) {
            if (STATE == 1) { // Compiling
                CComma(op->opcode);
            } else {
                CELL xt = HERE + 0x0100;
                CStore(xt, op->opcode);
                CStore(xt+1, RET);
                cpu_loop(xt);
            }
            return line;
        }
    }

    CELL num = 0;
    if (MakeNumber(word, &num)) {
        if (STATE == 1) { // Compiling
            if ((0 <= num) && (num <= 0xFF)) {
                CComma(CLITERAL);
                CComma((BYTE)num);
            } else {
                CComma(LITERAL);
                Comma(num);
            }
        } else {
            push(num);
            return line;
        }
        return line;
    }

    _QUIT_HIT = 1;
    printf("ERROR: '%s'??\n", word);
    return line;
}

void ParseLine(char *line)
{
    char *source = line;
    char word[128];

    while (string_len(line) > 0)
    {
        line = GetWord(line, word);
        if (string_equals(word, "\\")) {
            return;
        }

        if (string_len(word) == 0) {
            return;
        }

        line = ParseWord(word, line);
    }
}


void CompilerInit()
{
    init_vm(MEM_SZ);
    the_bytes[0] = RET;
    isEmbedded = true;

    HERE = 0x0040;
    LAST = MEM_SZ - CELL_SZ;
    BASE = 10;
    STATE = 0;
    VHERE = 0x1000;

    Store(LAST, 0);
    the_cells[MEMSZ_ADDR/CELL_SZ] = MEM_SZ;
    the_cells[CELL_ADDR/CELL_SZ] = CELL_SZ;
}

char the_line[128];
void Compile(FILE *fp_in)
{
    int line_no = 0;
    char buf[128];

    while (fgets(buf, sizeof(buf), fp_in) == buf)
    {
        string_rtrim(buf);
        ++line_no;
        strcpy(the_line, buf);
        ParseLine(buf);
        if (_QUIT_HIT == 1) {
            printf("QUIT hit on line %d: %s\n", line_no, the_line);
            break;
        }
    }
    fclose(fp_in);

    DICT_T *dp = FindWord("main");
    if (dp == NULL)	{
        dp = FindWord("MAIN");
        if (dp == NULL) {
            dp = (DICT_T *)&the_bytes[LAST];
        }
    }

    CStore(0, JMP);
    Store(1, dp->XT);
}

void do_compile()
{
    printf("compiling from %s...\n", input_fn);
    CompilerInit();
    // return;

    input_fp = fopen(input_fn, "rt");
    if (!input_fp) {
        printf("can't open input file!");
        exit(1);
    }

    Compile(input_fp);
    BASE = 10;
    fclose(input_fp);
    input_fp = NULL;
}

// *********************************************************************
void write_output_file()
{
    printf("writing output file %s ... ", output_fn);

    output_fp = fopen(output_fn, "wb");
    if (!output_fp) {
        printf("ERROR: Can't open output file!");
        exit(1);
    }

    int num = fwrite(the_bytes, 1, MEM_SZ, output_fp);
    fclose(output_fp);
    output_fp = NULL;
    printf("%d bytes written.\n", num);
}

// *********************************************************************
void process_arg(char *arg)
{
    if (*arg == 'i') {
        arg = arg+2;
        strcpy(input_fn, arg);
    } else if (*arg == 'o') {
        arg = arg+2;
        strcpy(output_fn, arg);
    } else if (*arg == 'm') {
        arg = arg+2;
        mem_size_KB = atoi(arg);
    } else if (*arg == '?') {
        printf("usage: forth-compiler [args]\n");
        printf("  -i:inputFile (full or relative path)\n");
        printf("      default inputFile is forth.src\n");
        printf("  -o:outputFile (full or relative path)\n");
        printf("      default outputFile is forth.bin\n");
        printf("  -m:<KB> - Memory size in KB\n");
        printf("      default value is 64\n");
        printf("  -? (prints this message)\n");
        exit(0);
    } else {
        printf("unknown arg '-%s'\n", arg);
    }
}

int main (int argc, char **argv)
{
    strcpy(input_fn, "forth.src");
    strcpy(output_fn, "forth.bin");

    for (int i = 1; i < argc; i++) {
        char *cp = argv[i];
        if (*cp == '-') {
            process_arg(++cp);
        }
    }

    MEM_SZ = mem_size_KB * 1024;
    do_compile();
    write_output_file();

    return 0;
}
