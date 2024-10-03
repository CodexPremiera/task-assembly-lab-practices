; Filename: EXER29.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 28, 2024
; Description: Make a program to input two integers, divide the two integers,
; and display the quotient of the two integers.

.MODEL SMALL
.STACK 100h

.DATA
    prompt_dividend DB 'Enter dividend: $'
    prompt_divisor DB 'Enter divisor: $'

    output_dividend db 'dividend is: $'
    output_divisor DB 'divisor is: $'

    dividend DW 0
    divisor DW 0

    divisionError DB 'Error: Division by zero! $'
    resultMsg DB 'Quotient: $'
    result DW 0
    remainder DW 0 

    newline DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; PROMPT
        ; dividend = input(Enter first number)
        LEA DX, prompt_dividend
        MOV AH, 09h
        INT 21h
        CALL ReadNumber
        MOV dividend, AX  ; Store first number in dividend

        ; divisor = input(Enter second number)
        LEA DX, prompt_divisor
        MOV AH, 09h
        INT 21h
        CALL ReadNumber
        MOV divisor, AX 

    ; OUTPUT DIVIDEND AND DIVISOR
        ;dividend
        LEA DX, output_dividend
        MOV AH, 09h
        INT 21h
    
        MOV AX, dividend
        call PrintNumber

        LEA DX, newline
        MOV AH, 09h
        INT 21h

        ;divisor
        LEA DX, output_divisor
        MOV AH, 09h
        INT 21h
    
        MOV AX, divisor
        call PrintNumber

        LEA DX, newline
        MOV AH, 09h
        INT 21h

    ; IF DIVISOR == 0
        MOV AX, divisor
        CMP AX, 0
        JE DivisionByZero

    ; PERFORM DIVISION
        MOV AX, dividend
        MOV BX, divisor
        XOR DX, DX
        DIV BX
        MOV result, AX
        MOV remainder, DX

    ; PRINT RESULT
        LEA DX, resultMsg
        MOV AH, 09h
        INT 21h

        ; Convert result to ASCII and print
        MOV AX, result
        CALL PrintNumber

        LEA DX, newline
        MOV AH, 09h
        INT 21h

    ; EXIT PROGRAM
    MOV AX, 4C00h
    INT 21h
MAIN ENDP

; FUNCTIONS
    ; Handle undefined
        DivisionByZero:
        ; Print division by zero message
        LEA DX, divisionError
        MOV AH, 09h
        INT 21h

        LEA DX, newline
        MOV AH, 09h
        INT 21h

        ; Exit program
        MOV AX, 4C00h
        INT 21h

    ; Subroutine to read number
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

    ; subroutine to print a number
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

END MAIN