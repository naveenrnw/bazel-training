@echo off

set FILENAME=%~n0
set TOOLCHAIN_BINDIR=external/mingw/bin

 
call "%TOOLCHAIN_BINDIR%/%FILENAME%" %*