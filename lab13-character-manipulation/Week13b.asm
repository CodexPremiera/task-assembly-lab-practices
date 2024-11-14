;Filename: Week13b.asm
;Programmer Name: Ashley Ken Comandao
;Program Description: Using a loop, horizontally display the numbers 1 to 20,
; with space between each number.
;Date Created: November 10, 2024

.MODEL SMALL
.STACK 100H
.DATA
        ; Define any data if needed
.CODE
MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        ; Initialize counter in BL (using BL instead of CL to avoid issues with
        division)
        MOV BL, 1
        
        PRINT_LOOP:
                ; Convert number to ASCII and print
                MOV AL, BL ; Move number to AL for division
                MOV AH, 0 ; Clear AH for division
                MOV BH, 10 ; Divide by 10 to check if two digits
                DIV BH ; AH = remainder (ones), AL = quotient (tens)
                ; If there's a tens digit
                CMP AL, 0
                JE SINGLE_DIGIT

                ; Print tens digit
                PUSH AX ; Save AX (contains both digits)
                ADD AL, 30H ; Convert tens to ASCII
                MOV DL, AL
                MOV AH, 2 ; DOS print function
                INT 21H
                POP AX ; Restore AX to get remainder

                ; Print ones digit
                MOV DL, AH ; Move remainder to DL
                ADD DL, 30H ; Convert to ASCII
                MOV AH, 2
                INT 21H
                JMP PRINT_SPACE

        SINGLE_DIGIT:
                ; Print single digit
                MOV DL, AH ; Move remainder to DL
                ADD DL, 30H ; Convert to ASCII
                MOV AH, 2
                INT 21H
        
        PRINT_SPACE:
                ; Print space
                MOV DL, 20H ; Space character
                MOV AH, 2
                INT 21H
                ; Increment counter
                INC BL
                ; Compare if we reached 21
                CMP BL, 21
                JNE PRINT_LOOP
                
        ; Return to DOS
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN