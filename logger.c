// logger.c

#include <stdio.h>
#include <stdarg.h>

int __DEBUG__ = 1;

// *********************************************************************
void trace_on()
{
    __DEBUG__ = 2;
}

// *********************************************************************
void debug_on()
{
    __DEBUG__ = 1;
}

// *********************************************************************
void debug_off()
{
    __DEBUG__ = 0;
}

// *********************************************************************
void trace(char *fmt, ...)
{
	if (__DEBUG__ == 2)
	{
		char msg[1024]; // **Make sure the buffer is large enough**
		va_list args;
		va_start(args, fmt);
		vsnprintf(msg, sizeof(msg), fmt, args);
		va_end(args);
		printf("%s", msg);
		fflush(stdout);
	}
}

// *********************************************************************
void debug(char *fmt, ...)
{
	if (__DEBUG__ >= 1)
	{
		char msg[1024]; // **Make sure the buffer is large enough**
		va_list args;
		va_start(args, fmt);
		vsnprintf(msg, sizeof(msg), fmt, args);
		va_end(args);
		printf("%s", msg);
		fflush(stdout);
	}
}

