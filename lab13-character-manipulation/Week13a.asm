;Filename: Week13a.asm
;Programmer Name: Ashley Ken Comandao
;Program Description: Using a loop, vertically display the numbers 1 to 10.
;Date Created: November 10, 2024

.MODEL SMALL
.STACK 100H
.DATA
        ; Define any data if needed
.CODE
        MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        ; Initialize counter in BL
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
                JMP PRINT_NEWLINE

        SINGLE_DIGIT:
                ; Print single digit
                MOV DL, AH ; Move remainder to DL
                ADD DL, 30H ; Convert to ASCII
                MOV AH, 2
                INT 21H

        PRINT_NEWLINE:
                ; Print carriage return and line feed
                MOV DL, 0DH ; Carriage return
                MOV AH, 2
                INT 21H
                MOV DL, 0AH ; Line feed
                MOV AH, 2
                INT 21H
                ; Increment counter
                INC BL
                ; Compare if we reached 11
                CMP BL, 11
                JNE PRINT_LOOP

        ; Return to DOS
        MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN