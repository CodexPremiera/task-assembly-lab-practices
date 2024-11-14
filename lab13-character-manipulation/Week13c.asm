;Filename: Week13c.ASM
;Programmer Name: Ashley Ken Comandao
;Program Description: Ask user to input a number from 1 to 8. Display error
;message if number entered is less than 1 or greater than 8. If
;input is correct, horizontally display the numbers, with space
;between each number, from 1 to the number entered by user.
;Date Created: November 10, 2024

.MODEL SMALL
.STACK 100H
.DATA
prompt_msg DB 0ah, 'Enter a number from 1 to 8: $',0dh,0ah
error_msg DB 0Ah,0Ah, 'Error: Number out of range!$'
newline DB 13,10,'$'
space DB ' $'

.CODE
MAIN PROC
        MOV AX, @DATA ; Load the address of data segment
        MOV DS, AX ; Initialize data segment

input_loop:
        ; Display prompt message
        MOV DX, OFFSET prompt_msg
        MOV AH, 09H ; Function to display string
        INT 21H
        ; Get user input
        MOV AH, 01H ; Function to get input character
        INT 21H
        SUB AL, '0' ; Convert ASCII to integer by subtracting ASCII '0' ; Check if input is within range 1-8
        CMP AL, 1 ; Check if less than 1
        JB show_error ; If so, jump to error message

        CMP AL, 8 ; Check if greater than 8
        JA show_error ; If so, jump to error message
        MOV BL, 1 ; Start counter at 1
        MOV CH, AL ; Store user input number in CL for loop count
        MOV DX, OFFSET newline
        MOV AH, 09H
        INT 21H

display_numbers:
        ; Display numbers from 1 to user input
        MOV DL, BL
        ADD DL, '0'
        MOV AH, 02H
        INT 21H
        ; Display space after each number except the last one
        DEC CH ; Decrement CH instead of CL
        JZ end_display
        MOV DL, ' '
        MOV AH, 02H
        INT 21H
        INC BL
        JMP display_numbers

end_display:
        ; Display newline
        MOV DX, OFFSET newline
        MOV AH, 09H
        INT 21H
        JMP input_loop ; Ask for input again after displaying numbers

show_error:
        ; Display error message and newline
        MOV DX, OFFSET error_msg
        MOV AH, 09H
        INT 21H
        MOV DX, OFFSET newline
        MOV AH, 09H
        INT 21H
        JMP input_loop ; Go back to prompt for input

MAIN ENDP
END MAIN
