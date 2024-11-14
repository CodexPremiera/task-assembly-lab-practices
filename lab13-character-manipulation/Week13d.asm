;Filename: Week13d.asm
;Programmer Name: Ashley Ken Comandao
;Program Description: Repeatedly ask user to input a single digit whole number
;until the number entered is a zero. Display “Thank you.” When
;the number entered is zero.
;Date Created: November 10, 2024

.MODEL SMALL
.STACK 100H
.DATA
prompt_msg DB 0ah,'Enter a single digit number: $'
thank_you_msg DB 'Thank you.$'
newline DB 0Dh, 0Ah, '$'

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
        SUB AL, '0' ; Convert ASCII to integer by subtracting ASCII
        '0'
        ; Check if input is zero
        CMP AL, 0 ; Compare input with 0
        JE display_thank_you ; If input is zero, jump to thank you message
        ; Add newline after each input
        MOV DL, 10 ; Line Feed
        MOV AH, 02H
        INT 21H
        MOV DL, 13 ; Carriage Return
        MOV AH, 02H
        INT 21H
        JMP input_loop ; Repeat input loop

display_thank_you:
        ; Add a newline before displaying "Thank you."
        MOV DL, 10 ; Line Feed
        MOV AH, 02H
        INT 21H
        MOV DL, 13 ; Carriage Return
        MOV AH, 02H
        INT 21H
        ; Display thank you message
        MOV DX, OFFSET thank_you_msg
        MOV AH, 09H ; Function to display string
        INT 21H
        ; Exit program
        MOV AH, 4CH ; Function to terminate program
        INT 21H
        
MAIN ENDP
END MAIN