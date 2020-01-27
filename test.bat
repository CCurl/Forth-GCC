@echo off

call make fc 1
call make forth
forth -e:tests.4th
