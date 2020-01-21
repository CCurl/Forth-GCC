rem batchfile to build the forth exe
gcc -g -o forth-compiler forth-compiler.c
forth-compiler
gcc -g -o forth-dis      forth-dis.c
forth-dis
gcc -g -o forth          forth.c
