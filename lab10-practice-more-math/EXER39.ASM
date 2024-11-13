; Filename: EXER39.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: OCTOBER, 17 2024
; Description: Create a program that inputs a number. Display the
; following messages depending on the value of the number entered:
 
 
.model small
.stack 100h
.data
    menu    db 'MATH OPERATIONS',13,10
            db '1. Addition',13,10
            db '2. Subtraction',13,10
            db '3. Multiplication',13,10
            db '4. Division',13,10,13,10
            db 'Enter your choice: ', '$'
 
    choice  db ?
    newline1 db '', 0ah, '$'
 
    addition       db 13,10,10,'Addition', 13,10, '$'
    subtraction    db 13,10,10,'Subtraction', 13,10, '$'
    multiplication db 13,10,10,'Multiplication', 13,10, '$'
    division       db 13,10,10,'Division', 13,10, '$'
    exit           db 13,10,10,'Exit Program', 13,10,10,'$'
 
    input1 db ?
    input2 db ?
    result db ?
 
    ;addition
    additionPrompt1 db 'Enter first addend: $'
    additionPrompt2 db 'Enter second addend: $'
    additionOutput1 db 'Sum: $'
 
    ;subtraction
    subtractionPrompt1 db 'Enter first minuend: $'
    subtractionPrompt2 db 'Enter second subtrahend: $'
    subtractionOutput1 db 'Difference: $'
 
    ;multiplication
    multiplicationPrompt1 db 'Enter multiplicand: $'
    multiplicationPrompt2 db 'Enter multiplier: $'
    multiplicationOutput1 db 'Product: $'
 
    ;division
    divisionPrompt1 db 'Enter dividend: $'
    divisionPrompt2 db 'Enter divisor: $'
    divisionOutput1 db 'Quotient: $'
 
    invalidChoice db '', 13,10,10,'INVALID CHOICE!', 13, 10, 10, '$'
 
    endMessage  db 'Thank you.', '$'
.code
 
main:                
    mov ax, @data
    mov ds, ax
 
    mov ax, 3
    int 10h
 
    xor al, al
 
    mov ah, 09h
    lea dx, menu
    int 21h
 
; Ask for choice
    mov ah, 1              
    int 21h                    
    mov choice, al              
 
; switch case (?) for choice
    cmp choice, '1'
    je  displayAddition
    cmp choice, '2'
    je  displaySubtraction
    cmp choice, '3'
    je  displayMultiplication
    cmp choice, '4'
    je  displayDivision
 
; If invalid choice
    mov dx, offset invalidChoice
    mov ah, 09h
    int 21h
    jmp exitProgram
 
displayAddition:
    call showAddition
    jmp exitProgram
 
displaySubtraction:    
   
    call showSubtraction
    jmp exitProgram
 
displayMultiplication:      
    call showMultiplication
    jmp exitProgram
 
displayDivision:      
    call showDivision
    jmp exitProgram
 
displayExit:          
    lea dx, exit
    jmp exitProgram
 
exitProgram:          
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
   
    mov ah, 09h
    lea dx, endMessage
    int 21h
 
    mov ah, 4Ch
    int 21h
 
showAddition:
    lea dx, addition
    mov ah, 09h
    int 21h
 
    ; Input first number
    lea dx, additionPrompt1
    mov ah, 9
    int 21h
 
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input1, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    ; Input second number
    lea dx, additionPrompt2
    mov ah, 9
    int 21h
   
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input2, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    ; Calculate sum
    MOV AL, input1
    ADD AL, input2
    MOV result, AL
 
    lea dx, additionOutput1
    mov ah, 9
    int 21h
 
    ADD result, '0'
    MOV DL, result
    MOV AH, 02H
    INT 21H
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    ret
 
showSubtraction:
   
   
    lea dx, subtraction
    mov ah, 09h
    int 21h
 
    lea dx, subtractionPrompt1
    mov ah, 9
    int 21h
 
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input1, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    lea dx, subtractionPrompt2
    mov ah, 9
    int 21h
 
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input2, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    mov al, input1
    sub al, input2
    mov result, al
 
    lea dx, subtractionOutput1
    mov ah, 9
    int 21h
 
    ADD result, '0'
    MOV DL, result
    MOV AH, 02H
    INT 21H
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
ret
 
showMultiplication:
    lea dx, multiplication
    mov ah, 09h
    int 21h
 
    lea dx, multiplicationPrompt1
    mov ah, 9
    int 21h
 
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input1, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    lea dx, multiplicationPrompt2
    mov ah, 9
    int 21h
 
    ; Read character input
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input2, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    ; Multiply the two numbers
    mov al, input1
    mov bl, input2
    mul bl ; AL = AL * BL, result in AX
    mov result, al ; Store the lower byte of the result
 
    lea dx, multiplicationOutput1
    mov ah, 9
    int 21h
 
    add result, '0' ; Convert result to ASCII
    mov ah, 0Eh ; BIOS teletype output function
    mov al, result
    int 10h
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
ret
 
showDivision:
lea dx, division
    mov ah, 09h
    int 21h
 
    lea dx, divisionPrompt1
    mov ah, 9
    int 21h
 
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input1, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    lea dx, divisionPrompt2
    mov ah, 9
    int 21h
 
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV input2, AL
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
    ; Divide the two numbers
    mov al, input1
    xor ah, ah ; Clear AH for the division
    mov bl, input2
    div bl ; AL = AL / BL, quotient in AL, remainder in AH
    mov result, al ; Store the quotient
 
    lea dx, divisionOutput1
    mov ah, 9
    int 21h
 
    add result, '0' ; Convert result to ASCII
    mov ah, 0Eh ; BIOS teletype output function
    mov al, result
    int 10h
 
    mov dx, OFFSET newline1
    mov ah, 09h
    int 21h
 
ret
 
end main