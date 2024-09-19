; Filename: EXER13.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will display multiple string variables on separate lines.

.MODEL small
.STACK 200h
.DATA
    String1 DB 'Line1',0dh,0ah,'$'
    String2 DB 'Line2',0dh,0ah,'$'
    String3 DB 'Line3',0dh,0ah,'$'
    ; carriage return (ASCII code 0Dh) positions the cursor to the left side of the current line of characters
    ; line feed (ASCII code 0Ah) moves the cursor down one line on the output device.

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax
    mov ah, 9                   ; DOS print string function

    mov dx, OFFSET String1      ; 1st string to print
    int 21h                     ; command to print
    mov dx, OFFSET String2
    int 21h
    mov dx, OFFSET String3
    int 21h

    mov ah, 4ch
    int 21h

END ProgramStart