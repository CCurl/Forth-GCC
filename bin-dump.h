#ifndef __BIN_DUMP_H__
#define __BIN_DUMP_H__

void bin_dumpMem(char *mem, int num, int bytes_per_line, long start);
int bin_dumpFile(char *input_fn, int bytes_per_line);

#endif
