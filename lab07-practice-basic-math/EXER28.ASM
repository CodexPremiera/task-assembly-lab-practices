; Filename: EXER28.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 28, 2024
; Description: Make a program to input two integers, multiply the two integers,
; and display the product of the two integers.

.MODEL SMALL
.STACK 100h

.DATA
    prompt_multiplicand DB 'Enter multiplicand: $'
    prompt_multiplier DB 'Enter multiplier: $'

    output_multiplicand db 'multiplicand is: $'
    output_multiplier DB 'multiplier is: $'

    multiplicand DW 0
    multiplier DW 0

    resultMsg DB 'Product: $'
    result DW 0

    newline DB 0Dh, 0Ah, '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; PROMPT
        ; multiplicand = input(Enter first number)
        LEA DX, prompt_multiplicand
        MOV AH, 09h
        INT 21h
        CALL ReadNumber
        MOV multiplicand, AX  ; Store first number in multiplicand

        ; multiplier = input(Enter second number)
        LEA DX, prompt_multiplier
        MOV AH, 09h
        INT 21h
        CALL ReadNumber
        MOV multiplier, AX 

    ; OUTPUT FACTORS
        ;multiplicand
        LEA DX, output_multiplicand
        MOV AH, 09h
        INT 21h
    
        MOV AX, multiplicand
        call PrintNumber

        LEA DX, newline
        MOV AH, 09h
        INT 21h

        ;multiplier
        LEA DX, output_multiplier
        MOV AH, 09h
        INT 21h
    
        MOV AX, multiplier
        call PrintNumber

        LEA DX, newline
        MOV AH, 09h
        INT 21h

    ; PERFORM MULTIPLICATION
        MOV AX, multiplicand
        MOV DX, multiplier
        MUL DX
        MOV result, AX

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