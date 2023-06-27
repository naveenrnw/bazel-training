@echo off

set FILENAME=%~n0
set TOOLCHAIN_BINDIR=external/intel_compiler/compiler/2023.1.0/windows/bin

 
call "%TOOLCHAIN_BINDIR%/%FILENAME%" %*