; Filename: EXAM2.ASM
; CS243 Lab Hands-on Exam No. 2 
; First Semester SY 2024-2025
; Student Name: ASHLEY KEN COMANDAO
; Date Finished: September 26, 2024
.MODEL SMALL
.STACK 100h

.DATA
    header  DB  'THE CALCULATOR', 13, 10 
            DB  'Created by: ASHLEY KEN COMANDAO', 13, 10
            DB  'Date: 09/29/2024', 13, 10, 10, '$'

    mainMenu db 'Main Menu', 13, 10, '$'
    addp db 'a - Addition', 13, 10, '$'
    subp db 's - Subtraction', 13, 10, '$'
    mulp db 'm - Multiplication', 13, 10, '$'
    divp db 'd - Division', 13, 10, '$'
    exitp db 'e - Exit', 13, 10, '$'

    addHead db 'Addition', 13, 10, '$'
    subHead db 'Subtraction', 13, 10, '$'
    mulHead db 'Multiplication', 13, 10, '$'
    divHead db 'Division', 13, 10, '$'

    enterChoice db 'Enter your choice: $'
    choice db ?

    addPrompt1 DB 'Enter first addend: $'
    addPrompt2 DB 'Enter second addend: $'
    additionOutput1 db 'First addend is: $'
    additionOutput2 DB 'Second addend is: $'

    subPrompt1 DB 'Enter minuend: $'
    subPrompt2 DB 'Enter subtrahend: $'
    subOutput1 db 'Minuend is: $'
    subOutput2 DB 'Subtrahend is: $'

    mulPrompt1 DB 'Enter multiplicand: $'
    mulPrompt2 DB 'Enter multiplier: $'
    mulOutput1 db 'Multiplicand is: $'
    mulOutput2 DB 'Multiplier is: $'

    divPrompt1 DB 'Enter dividend: $'
    divPrompt2 DB 'Enter divisor: $'
    divOutput1 DB 'Dividend is: $'
    divOutput2 DB 'Divisor is: $'

    addMsg DB 'Sum: $'
    subMsg DB 'Difference: $'
    mulMsg DB 'Product: $'
    divMsg DB 'Quotient: $'

    pressEnter DB '', 13, 10,'Press Enter to continue...', 13, 10, '$'
    exitProgram db 'Exit Program', 13, 10, '$'

    num1 DW 0
    num2 DW 0
    result DW 0
    quotient DW 0               ; To store the quotient
    remainder DW 0              ; To store the remainder
    newline DB 0Dh, 0Ah, '$'    ; Newline for printing

.CODE

MAIN:
    ; Initialize DS register
    MOV AX, @DATA
    MOV DS, AX

while_loop: 
    mov al, choice
    cmp al, 'e'
    jz end_loop
    
    mov ax, 3
    int 10h

    call MENU

    lea dx, enterChoice
    call printString

    MOV AH, 01h        ; Function to read a character
    INT 21h
    MOV choice, AL        ; Store input

    lea dx, newline
    call printString
    lea dx, newline
    call printString

    cmp choice, 'a'
    je  displayAdd
    cmp choice, 's'
    je  displaySub
    cmp choice, 'm'
    je  displayMul
    cmp choice, 'd'
    je  displayDiv
    cmp choice, 'e'
    je  end_loop

    jmp while_loop;

end_loop:
    
    mov ah, 09h
    mov bl, 70h 
    mov cx, 12
    int 10h

    lea dx, exitProgram
    call printString

    call waitForEnterAndClear
    ; Exit program
    MOV AX, 4C00h
    INT 21h

displayAdd:
    mov ah, 09h
    mov bl, 60h 
    mov cx, 8
    int 10h
    
    lea dx, addHead
    call printString

    call showAdd
    call waitForEnterAndClear
    call while_loop
    ret
displaySub:
    mov ah, 09h
    mov bl, 20h 
    mov cx, 11
    int 10h
    
    lea dx, subHead
    call printString

    call showSub
    call waitForEnterAndClear
    call while_loop
    ret
displayMul:
    mov ah, 09h
    mov bl, 10h 
    mov cx, 14
    int 10h
    
    lea dx, mulHead
    call printString
    
    call showMul
    call waitForEnterAndClear
    call while_loop
    ret
displayDiv:
    mov ah, 09h
    mov bl, 50h 
    mov cx, 8
    int 10h
    
    lea dx, divHead
    call printString

    call showDiv
    call waitForEnterAndClear
    call while_loop
    ret

MENU:
    lea dx, header
    call printString

    lea dx, mainMenu
    call printString

    mov ah, 09h
    mov bl, 6Fh 
    mov cx, 12
    int 10h

    lea dx, addp
    call printString

    mov ah, 09h
    mov bl, 2Fh 
    mov cx, 15
    int 10h

    lea dx, subp
    call printString

    mov ah, 09h
    mov bl, 1Fh 
    mov cx, 18
    int 10h

    lea dx, mulp
    call printString

    mov ah, 09h
    mov bl, 5Fh 
    mov cx, 12
    int 10h

    lea dx, divp
    call printString

    mov ah, 09h
    mov bl, 7Fh 
    mov cx, 8
    int 10h

    lea dx, exitp
    call printString

    ret

printString proc 
    MOV AH, 09h
    INT 21h
    ret
printString endp

; Subroutine to read a number from input
ReadNumber PROC
    XOR AX, AX          ; Clear AX (to store result)
    XOR BX, BX          ; BX will hold the result
ReadLoop:
    MOV AH, 01h         ; Function to read a character from input
    INT 21h             ; Read character
    CMP AL, 0Dh         ; Check if Enter (0Dh is Enter)
    JE DoneReading      ; If Enter is pressed, finish reading
    SUB AL, '0'         ; Convert ASCII to digit
    MOV CL, AL          ; Store the digit in CL
    MOV AX, BX          ; Move current result into AX
    MOV DX, 10          ; Prepare for multiplication by 10
    MUL DX              ; AX = AX * 10 (shift left by one decimal place)
    ADD AX, CX          ; Add the new digit to AX
    MOV BX, AX          ; Store the result back in BX
    JMP ReadLoop        ; Continue reading next digit
DoneReading:
    MOV AX, BX          ; Return the result in AX
    RET
ReadNumber ENDP

; Subroutine to print a number
PrintNumber PROC
    XOR CX, CX          ; Clear CX (to store digit count)
    MOV BX, 10          ; Divider for base 10
    MOV DX, 0           ; Clear DX
PrintLoop:
    XOR DX, DX          ; Clear DX before DIV
    DIV BX              ; Divide AX by 10
    PUSH DX             ; Push remainder (digit) to stack
    INC CX              ; Increment digit count
    TEST AX, AX         ; Check if AX is 0
    JNZ PrintLoop       ; If not, continue loop

PrintDigits:
    POP DX              ; Get digit from stack
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02h         ; Function to print character
    INT 21h             ; Print the digit
    LOOP PrintDigits    ; Repeat for all digits

    RET
PrintNumber ENDP
 
showAdd:
    ; Print prompt1 (Enter first number)
    LEA DX, addPrompt1
    MOV AH, 09h
    INT 21h

    ; Read first number from input
    CALL ReadNumber
    MOV num1, AX  ; Store first number in num1

    ; Print prompt2 (Enter second number)
    LEA DX, addPrompt2
    MOV AH, 09h
    INT 21h

    ; Read second number from input
    CALL ReadNumber
    MOV num2, AX  ; Store second number in num2

    LEA DX, additionOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, additionOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ret

showSub:

; Print prompt1 (Enter first number)
    LEA DX, subPrompt1
    MOV AH, 09h
    INT 21h

    ; Read first number from input
    CALL ReadNumber
    MOV num1, AX  ; Store first number in num1

    ; Print prompt2 (Enter second number)
    LEA DX, subPrompt2
    MOV AH, 09h
    INT 21h

    ; Read second number from input
    CALL ReadNumber
    MOV num2, AX  ; Store second number in num2

    LEA DX, subOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, subOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ret

showMul:
    LEA DX, mulPrompt1
    MOV AH, 09h
    INT 21h

    ; Read first number from input
    CALL ReadNumber
    MOV num1, AX  ; Store first number in num1

    ; Print prompt2 (Enter second number)
    LEA DX, mulPrompt2
    MOV AH, 09h
    INT 21h

    ; Read second number from input
    CALL ReadNumber
    MOV num2, AX  ; Store second number in num2

    LEA DX, mulOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    LEA DX, mulOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    call PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ret

showDiv:

; Print prompt1 (Enter dividend)
    LEA DX, divPrompt1
    MOV AH, 09h
    INT 21h

    ; Read first number (dividend)
    CALL ReadNumber
    MOV num1, AX  ; Store dividend in num1

    ; Print prompt2 (Enter divisor)
    LEA DX, divPrompt2
    MOV AH, 09h
    INT 21h

    ; Read second number (divisor)
    CALL ReadNumber
    MOV num2, AX  ; Store divisor in num2

    ; Output dividend
    LEA DX, divOutput1
    MOV AH, 09h
    INT 21h

    MOV AX, num1
    CALL PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Output divisor
    LEA DX, divOutput2
    MOV AH, 09h
    INT 21h

    MOV AX, num2
    CALL PrintNumber

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ret

waitForEnterAndClear:
    ; Display "Press Enter to continue..."
    LEA DX, pressEnter
    MOV AH, 09h
    INT 21h

    ; Wait for Enter key
    MOV AH, 00h
    INT 16h

    mov ah, 06h
    mov al, 0 
    mov cx,0
    mov dh,15
    int 10h
    ret

END MAIN
 