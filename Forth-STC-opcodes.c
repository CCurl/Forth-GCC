#include "Shared.h"

void gen_funcHeader(char *);
LINE_T *make_tag(LINE_T *, char *, ...);
LINE_T *make_code(LINE_T *, char *, ...);
LINE_T *make_codeU(LINE_T *, char *, ...);
LINE_T *make_comment(LINE_T *, char *, ...);
LINE_T *oLine = NULL;

// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------
// ------------------------------------------------------------------------------

void gen_LITERAL()
{
    gen_funcHeader("LITERAL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FETCH()
{
    gen_funcHeader("FETCH");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_STORE()
{
    gen_funcHeader("STORE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    oLine = make_codeU(NULL, "m_pop eax");
    oLine = make_codeU(NULL, "m_pop ecx");
    oLine = make_codeU(NULL, "mov [eax], ecx");
    make_codeU(NULL, "ret");
}
void gen_SWAP()
{
    gen_funcHeader("SWAP");
    oLine = make_codeU(NULL, "m_pop eax");
    oLine = make_comment(oLine, "NB ebx is the TOS");
    oLine = make_comment(oLine, "SWAP");
    oLine = make_codeU(NULL, "m_getTOS ecx");
    oLine = make_codeU(NULL, "m_setTOS eax");
    oLine = make_codeU(NULL, "m_push ecx");
    make_codeU(NULL, "ret");
}
void gen_DROP()
{
    gen_funcHeader("DROP");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_DUP()
{
    gen_funcHeader("DUP");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_SLITERAL()
{
    gen_funcHeader("SLITERAL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_JMP()
{
    gen_funcHeader("JMP");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_JMPZ()
{
    gen_funcHeader("JMPZ");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_JMPNZ()
{
    gen_funcHeader("JMPNZ");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_CALL()
{
    gen_funcHeader("CALL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_RET()
{
    gen_funcHeader("RET");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_OR()
{
    gen_funcHeader("OR");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_CLITERAL()
{
    gen_funcHeader("CLITERAL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_CFETCH()
{
    gen_funcHeader("CFETCH");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_CSTORE()
{
    gen_funcHeader("CSTORE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_ADD()
{
    gen_funcHeader("ADD");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_SUB()
{
    gen_funcHeader("SUB");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_MUL()
{
    gen_funcHeader("MUL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_DIV()
{
    gen_funcHeader("DIV");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_LT()
{
    gen_funcHeader("LT");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_EQ()
{
    gen_funcHeader("EQ");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_GT()
{
    gen_funcHeader("GT");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_DICTP()
{
    gen_funcHeader("DICTP");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_EMIT()
{
    gen_funcHeader("EMIT");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_OVER()
{
    gen_funcHeader("OVER");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_COMPARE()
{
    gen_funcHeader("COMPARE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FOPEN()
{
    gen_funcHeader("FOPEN");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FREAD()
{
    gen_funcHeader("FREAD");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FREADLINE()
{
    gen_funcHeader("FREADLINE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FWRITE()
{
    gen_funcHeader("FWRITE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_FCLOSE()
{
    gen_funcHeader("FCLOSE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_DTOR()
{
    gen_funcHeader("DTOR");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_RTOD()
{
    gen_funcHeader("RTOD");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_LOGLEVEL()
{
    gen_funcHeader("LOGLEVEL");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_AND()
{
    gen_funcHeader("AND");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_PICK()
{
    gen_funcHeader("PICK");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_DEPTH()
{
    gen_funcHeader("DEPTH");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_GETCH()
{
    gen_funcHeader("GETCH");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_COMPAREI()
{
    gen_funcHeader("COMPAREI");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_USINIT()
{
    gen_funcHeader("USINIT");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_USPUSH()
{
    gen_funcHeader("USPUSH");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_USPOP()
{
    gen_funcHeader("USPOP");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_BREAK()
{
    gen_funcHeader("BREAK");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_RESET()
{
    gen_funcHeader("RESET");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}
void gen_BYE()
{
    gen_funcHeader("BYE");
    // TODO: do something here. NB: EBX is TOS, ebp is DSP
    make_codeU(NULL, "; TODO");
    make_codeU(NULL, "m_push [HERE_ADDR]");
    make_codeU(NULL, "m_pop [ecx]");
    make_codeU(NULL, "m_getTOS edx");
    make_codeU(NULL, "m_setTOS eax"),
    make_codeU(NULL, "ret");
}

void gen_opcodes()
{
    return;
    
    gen_LITERAL();
    gen_FETCH();
    gen_STORE();
    gen_SWAP();
    gen_DROP();
    gen_DUP();
    gen_SLITERAL();
    gen_JMP();
    gen_JMPZ();
    gen_JMPNZ();
    gen_CALL();
    gen_RET();
    gen_OR();
    gen_CLITERAL();
    gen_CFETCH();
    gen_CSTORE();
    gen_ADD();
    gen_SUB();
    gen_MUL();
    gen_DIV();
    gen_LT();
    gen_EQ();
    gen_GT();
    gen_DICTP();
    gen_EMIT();
    gen_OVER();
    gen_COMPARE();
    gen_FOPEN();
    gen_FREAD();
    gen_FREADLINE();
    gen_FWRITE();
    gen_FCLOSE();
    gen_DTOR();
    gen_RTOD();
    gen_LOGLEVEL();
    gen_AND();
    gen_PICK();
    gen_DEPTH();
    gen_GETCH();
    gen_COMPAREI();
    gen_USINIT();
    gen_USPUSH();
    gen_USPOP();
    gen_BREAK();
    gen_RESET();
    gen_BYE();
}

