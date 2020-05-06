@echo off

if "--%1%--" == "--fc--" goto make-fc
if "--%1%--" == "--fd--" goto make-fd
if "--%1%--" == "--fa--" goto make-fa
if "--%1%--" == "--fi--" goto make-fi
if "--%1%--" == "--fb--" goto make-fb
if "--%1%--" == "--ex--" goto make-ex
if "--%1%--" == "--forth--" goto make-forth
if "--%1%--" == "--nc--" goto make-nc
if "--%1%--" == "--nd--" goto make-nd
if "--%1%--" == "--aa--" goto make-aa
if "--%1%--" == "--ai--" goto make-ai
goto unknown

:make-fc
set output=forth-compiler
set c-files=forth-compiler.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
rem gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "--1--" forth-compiler
goto done

:make-nc
set output=newfc
set c-files=newfc.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
rem gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "--1--" newfc -d
goto done

:make-forth
set output=forth
set c-files=forth.c
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "--1--" forth
goto done

:make-fd
set output=forth-dis
set c-files=forth-dis.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "--1--" forth-dis
goto done

:make-fb
call forth-compiler
call forth-dis
if "--%2%--" NEQ "----" forth
goto done

:make-ex
forth-compiler.exe -i:ex.src -o:ex.bin -m:4
forth-dis -i:ex.bin -o:ex.lst
if "--%2%--" == "----" goto done
forth -i:ex.bin
goto done

:make-aa
set output=NewForth
echo making %output% ...
set inp-files=%output%.asm
rem set options=-Xassembler -a=%output%.lst
echo fasm %inp-files%
fasm %inp-files%
if "--%2%--" NEQ "----" NewForth
goto done

:make-ai
set output=NewForth
echo making %output% ...
set inp-files=%output%.asm
rem set options=-Xassembler -a=%output%.lst
echo fasm %inp-files%
fasm %inp-files%
if "--%2%--" NEQ "----" NewForth
goto done

:make-fa
set output=forth-dis2
set c-files=forth-dis2.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "----" goto done
forth-dis2
rem gcc -c forth.s
rem ld -e main forth.o -lkernel32
goto done

:make-fi
set output=forth-disIT
set c-files=forth-disIT.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "----" goto done
forth-disIT
rem gcc -c forth.s
rem ld -e main forth.o -lkernel32
goto done

:make-nd
set output=newfd
set c-files=newfd.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% vm-prims.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o tmp %c-files%
strip -o %output%.exe -g -S -d -X tmp.exe
del tmp.exe
if "--%2%--" == "--1--" newfd
goto done

:unknown
echo Unknown make. I know how to make these:
echo.
echo    fc - makes forth-compiler.exe
echo    fd - makes forth-dis.exe
echo    forth - makes forth.exe
echo    fb - builds the forth VM image from forth.src
echo    ex - makes ex.exe (the stand-alone example)
echo    nc - makes new-forth-compiler.exe
echo    nd - makes new-forth-dis.exe
echo.
echo    NOTE: if arg2 is given it then runs the program

:done