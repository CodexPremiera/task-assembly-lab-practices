; Filename: EXER18.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will get string input and display the reverse of the string

.model small
.stack 100h
.data

MaxStrLength EQU 1000
StringToReverse db MaxStrLength DUP (?)
ReverseString db MaxStrLength DUP (?)

.code
ProgramStart:
    mov ax, @data
    mov ds, ax
    
    mov ah, 3fh
    mov bx, 0
    mov cx, MaxStrLength

    mov dx, OFFSET StringToReverse
    int 21h
    and ax, ax
    jz Done
    mov cx, ax

    push cx
    mov bx, OFFSET StringToReverse
    mov si, OFFSET ReverseString
    add si, cx
    dec si


ReverseLoop:
    mov al, [bx]
    mov [si], al
    inc bx
    dec si

    loop ReverseLoop
    pop cx
    mov ah,40h
    mov bx, 1
    mov dx, OFFSET ReverseString
    int 21h

Done:
    mov ah, 4ch
    int 21h
end ProgramStart