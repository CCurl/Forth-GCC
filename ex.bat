@echo off

REM This is an example of how to build a stand-alone program

@echo on
call forth-compiler.exe -i:ex.src -o:ex.bin -a:0 -m:3
call forth-dis -i:ex.bin -o:ex.lst
call forth -i:ex.bin
