# Forth-GCC

This is a simple token-threaded (byte-code) implementation of Forth, written in C for GCC.

Yes, I know ... ANOTHER Forth implementation. This one creates a "bare metal" Forth virtual machine. The goal of this project is to create a basic, easy to understand, and easily extendable implementation of a Forth virtual machine. To that end, the virtual CPU has less than 50 instructions, which make up the VM's opcodes. They are also the Forth system's primitives. See "Shared.h" for that list.

Any collaboration on this project would be warmly welcomed. :)

The cpu_loop() function in "forth-vm.c" is the implementation of the virtual CPU loop. This is where all the fun is.

To create the initial image for the VM, I created a simple, Forth-like compiler/assembler. It generates an in-memory image of the VM's desired initial state from the -i: file (forth.src). Another program, forth-dis, creates a listing file in the file named by -o:. A casual inspection of the disassembly will show that the entire system is just a Forth dictionary.

The compiler creates a VM with the dictionary and code separated. That way, it would be possible to distribute just the code without the dictionary, if desired.

When the VM boots, its start up code loads the -i: file (forth.bin) to create the initial image of the VM, and then starts executing at address 0, which is just a JUMP to the "main" word. If there is no "main", then it jumps to the last word defined.

There are 3 programs here, and a make.bat to facilitate building them:

forth-compiler.exe - compiles the image for a basic forth vm ...

	usage: forth-compiler [args]
		-i:inputFile (full or relative path)
			default inputFile is forth.src
		-o:outputFile (full or relative path)
			default outputFile is forth.bin
		-a:(0|1) - include assembler words
			default value is 1
		-m:<KB> - Memory size in KB
			default value is 64
		-t (set log level to trace)
		-d (set log level to debug)
		-? (prints this message)


forth-dis.exe - dis-assembles a given forth vm ...

    usage: forth-compiler [args]
            -i:inputFile (full or relative path)
                default inputFile is forth.bin
            -o:outputFile (full or relative path)
                default outputFile is forth.lst
            -t (set log level to trace)
            -d (set log level to debug)

forth.exe - runs a given forth vm ...

    usage: forth [args]
            -i:imagefile (default imageFile is 'forth.bin')
            -l:loglevel (0=off, 1=debug, 2=trace - default is 0)
            -? (prints this message)


To build them, execute:

    make fc
    make fd
    make forth
