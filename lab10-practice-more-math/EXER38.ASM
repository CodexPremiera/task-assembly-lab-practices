; Filename: EXER38.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: OCTOBER, 17 2024
; Description: Create a program that inputs a number. Display the
; following messages depending on the value of the number entered:
 
 
.model small
.stack 100h
.data
    inputChar db ?
    dot db '.$'
    inputMsg db 'Enter a number: $'
    equalMessage LABEL BYTE
        db 13, 10, 'The number is equal to 5.', 13, 10, '$'
    lesserMessage LABEL BYTE
        db 13, 10, 'The number is less than 5.$'
    greaterMessage LABEL BYTE
        db 13, 10, 'The number is greater than 5.$'

.code
ProgramStart:
    mov ax, @data
    mov ds, ax
 
    mov dx, OFFSET inputMsg
    mov ah, 9
    int 21h
 
    mov ah, 1
    int 21h
    sub al, '0'
    mov inputChar, al
 
    cmp al, 5
    je equal
    jg greater
    jl lesser
 
    jmp Done
 
equal:
    mov dx, OFFSET equalMessage
    mov ah, 9
    int 21h
    jmp Done
 
greater:
    mov dx, OFFSET greaterMessage
    mov ah, 9
    int 21h
    jmp Done
 
lesser:
    mov dx, OFFSET lesserMessage
    mov ah, 9
    int 21h
    jmp Done
Done:
    mov ax, 4C00h
    int 21h;
 
end ProgramStart