#ifndef __FUNCTIONS_H__
#define __FUNCTIONS_H__

#include "Shared.h"

void Parse(char *);
DICT_T *FindWord(char *word);
CELL DisOpcode(CELL PC, FILE *fp);
CELL DisDict(CELL PC, FILE *fp);

#endif
