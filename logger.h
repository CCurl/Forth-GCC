#ifndef __LOGGER_H__
#define __LOGGER_H__

extern void trace_on();
extern void debug_on();
extern void debug_off();
extern void trace_off();
extern void trace(char *fmt, ...);
extern void debug(char *fmt, ...);

#endif
