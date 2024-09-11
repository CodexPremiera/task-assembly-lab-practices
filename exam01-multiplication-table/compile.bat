@echo off
TASM %1.asm
TLINK %1.obj
%1.exe