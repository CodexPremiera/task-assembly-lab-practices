; Filename: EXER17.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will get string input and display back string.

.MODEL small
.STACK 100h
.DATA
    MAXIMUM_STRING_LENGTH EQU 1000
    StringInput DB MAXIMUM_STRING_LENGTH DUP (?)
    InputPrompt DB 'Enter text: $'

.CODE
ProgramStart:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; print input prompt
    mov dx, OFFSET InputPrompt
    mov ah, 9
    int 21h

    ; read input string
    mov ah, 3fh                     ; DOS read from handle function
    mov bx, 0                       ; standard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters

    ; store input string in StringInput
    mov dx, OFFSET StringInput
    int 21h

    ; check if any input was read
    and ax, ax
    jz Done
    mov cx, cs                      ; count string length 

    push cx ; save the string length
    mov bx, OFFSET StringInput
    pop cx                          ; get back the string length

    ; print the string
    mov ah,40h                      ; DOS write form handle function
    mov bx,1                        ; standard output handle
    mov dx, OFFSET StringInput
    int 21h 

Done:
    ; terminate the program
    mov ah,4ch
    int 21h 

END ProgramStart
