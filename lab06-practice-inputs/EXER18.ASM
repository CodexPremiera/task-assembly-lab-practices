; Filename: EXER18.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will get string input and display the reverse of the string

.MODEL small
.STACK 100h
.DATA
    MAXIMUM_STRING_LENGTH EQU 1000
    StringToReverse DB MAXIMUM_STRING_LENGTH DUP (?)
    ReverseString DB MAXIMUM_STRING_LENGTH DUP (?)

.CODE
ProgramStart:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; read input string
    mov ah, 3fh                     ; DOS read from handle function
    mov bx, 0                       ; standard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters

    ; store input string in StringToReverse
    mov dx, OFFSET StringToReverse
    int 21h
    and ax, ax                      ; check if any input was read
    jz Done
    mov cx, ax

    push cx                         ; save the string length
    mov bx, OFFSET StringToReverse
    mov si, OFFSET ReverseString
    add si, cx
    dec si                          ; point to the end 

    ReverseLoop:
        mov al, [bx]                    ; get the next character
        mov [si], al                    ; store the characters in reverse
        inc bx                          ; point to the next character
        dec si                          ; pont to previous location

        loop ReverseLoop                ; move next character, if any
        pop cx                          ; get back the string length
        
        ; print the string
        mov ah,40h                      ; DOS write form handle function
        mov bx,1                        ; standard output handle
        mov dx, OFFSET StringToReverse
        int 21h 

Done: 
    mov ah, 4ch 
    int 21h

END ProgramStart