@echo off

if "--%1%--" == "--fc--" goto make-fc
if "--%1%--" == "--forth--" goto make-forth
if "--%1%--" == "--fd--" goto make-fd
if "--%1%--" == "--all--" goto make-all
if "--%1%--" == "--fb--" goto make-fb
if "--%1%--" == "--ex--" goto make-ex
if "--%1%--" == "--f2--" goto make-f2
goto unknown

:make-fc
set output=forth-compiler
set c-files=forth-compiler.c 
set c-files=%c-files% forth-vm.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
del forth-compiler.exe
gcc -g -o %output% %c-files%
if "--%2%--" == "--1--" forth-compiler
goto done

:make-all
call make fc
call make fd
call make forth
call make f2

if "--%2%--" == "----" goto done
forth-compiler
forth-dis
forth
goto done

:make-forth
set output=forth
set c-files=forth.c
set c-files=%c-files% forth-vm.c
echo making %output% ...
echo gcc -Ofast -o %output% %c-files%
gcc -Ofast -o %output% %c-files%
if "--%2%--" == "--1--" forth
goto done

:make-fd
set output=forth-dis
set c-files=forth-dis.c 
set c-files=%c-files% forth-vm.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o %output% %c-files%
if "--%2%--" == "--1--" forth-dis
goto done

:make-fb
call forth-compiler
call forth-dis
if "--%2%--" NEQ "----" forth
goto done

:make-ex
forth-compiler.exe -i:ex.src -o:ex.bin -m:3
forth-dis -i:ex.bin -o:ex.lst
if "--%2%--" == "----" goto done
forth -i:ex.bin
goto done

:make-f2
echo fasm forth2.as
fasm forth2.as
if "--%2%--" == "----" goto done
forth2 forth.bin
goto done

:unknown
echo Unknown make. I know how to make these:
echo.
echo    fc - makes forth-compiler.exe
echo    fd - makes forth-dis.exe
echo    forth - makes forth.exe
echo    br - builds and runs the above 3 programs
echo    fb - builds the forth VM image from forth.src
echo    ex - makes ex.exe (the stand-alone example)
echo    f2 - makes forth2.exe
echo.
echo    NOTE: if arg2 is given it then runs the program

:done
