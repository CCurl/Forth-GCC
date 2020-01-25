@echo off

if "--%1%--" == "--fc--" goto make-fc
if "--%1%--" == "--forth--" goto make-forth
if "--%1%--" == "--bd--" goto make-bin-dump
goto unknown

:make-fc
set output=forth-compiler
set c-files=forth-compiler.c 
set c-files=%c-files% forth-vm.c
set c-files=%c-files% logger.c
set c-files=%c-files% ForthVM-Dis.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o %output% %c-files%
if "--%2%--" == "--1--" forth-compiler
goto done

:make-forth
set output=forth
set c-files=forth.c
set c-files=%c-files% forth-vm.c
set c-files=%c-files% logger.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o %output% %c-files%
if "--%2%--" == "--1--" forth
goto done

:make-bin-dump
set output=bin-dump
set c-files=bin-dump.c
set c-files=%c-files% bin-dump-main.c
echo making %output% ...
echo gcc -g -o %output% %c-files%
gcc -g -o %output% %c-files%
goto done

:unknown
echo Unknown make. I know how to make these:
echo.
echo    fc - makes forth-compiler.exe
echo    forth - makes forth.exe (if arg2=1 it then runs forth.exe)
echo    bd - makes bin-dump.exe

:done