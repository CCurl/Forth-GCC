# Forth-GCC
My personal version of Forth, written in C using VS Code and GCC

There are 2 programs here:

forth-compiler.exe - compiles the image for a basic forth vm
forth.exe - runs a given forth vm

To build them, execute:
    gcc -g -o forth-compiler forth-compiler.c
    gcc -g -o forth forth.c

To create a forth vm image file, execute
    forth-compiler [args]
        -i:inputFile (full or relative path)
            default inputFile is forth.src
        -a:assemblyFile (full or relative path)
            default assemblyFile is forth.asm
        -o:outputFile (full or relative path)
            default outputFile is forth.bin
        -t (set log level to trace)
        -d (set log level to debug)
        -? (prints this message)

To run a forth vm, execute:
    forth [args]
        -i:imagefile (NB default sourcefile is 'forth.bin')
        -l:loglevel (0=off, 1=debug, 2=trace - default is 0)
        -? (prints usage info)



