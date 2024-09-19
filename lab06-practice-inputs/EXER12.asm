; Filename: EXER12.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will display multiple string variables on a single line.

.MODEL small
.STACK 200h
.data
    String1 DB 'Line1','$' ; DB = Define Byte String1 variable and assign ‘Line1’ value.
    String2 DB 'Line2','$'
    String3 DB 'Line3','$'

.CODE
ProgramStart:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax
    mov ah, 9                   ; DOS print string function

    mov dx, OFFSET String1      ; 1st string to print
    int 21h                     ; invoke DOS to print string
    mov dx, OFFSET String2
    int 21h
    mov dx, OFFSET String3
    int 21h

    mov ah, 4ch
    int 21h
END ProgramStart
