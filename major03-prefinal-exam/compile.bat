@echo off
TASM %1.asm
TLINK %1.obj io.obj
%1.exe