;Filename: Week13e.asm
;Programmer Name: Ashley Ken Comandao
;Program Description: Repeatedly display an ATM main menu until the user presses “e” for Exit.
;Date Created: November 10, 2024

.MODEL SMALL
.STACK 100H
.DATA
menu_msg DB 0Ah, 0Ah,'CIT-U ATM', 0Dh, 0Ah
DB 'a. Balance Inquiry', 0Dh, 0Ah
DB 'b. Deposit', 0Dh, 0Ah
DB 'c. Withdrawal', 0Dh, 0Ah
DB 'd. Bills Payment', 0Dh, 0Ah
DB 'e. Exit', 0Dh, 0Ah, 0Dh, 0Ah, 'Enter choice: $'
balance_msg DB 0Ah, 0Ah, 'Balance Inquiry', 0Dh, 0Ah, '$'
deposit_msg DB 0Ah, 0Ah, 'Deposit', 0Dh, 0Ah, '$'
withdraw_msg DB 0Ah, 0Ah, 'Withdrawal', 0Dh, 0Ah, '$'
bills_msg DB 0Ah, 0Ah, 'Bills Payment', 0Dh, 0Ah, '$'
exit_msg DB 0Ah, 0Ah, 'Exit. Thank you!$', 0Dh, 0Ah

.CODE
MAIN PROC
        MOV AX, @DATA ; Load the address of data segment
        MOV DS, AX ; Initialize data segment

menu_loop:
        ; Display menu message
        MOV DX, OFFSET menu_msg
        MOV AH, 09H ; Function to display string
        INT 21H
        ; Get user choice
        MOV AH, 01H ; Function to get input character
        INT 21H
        MOV CH, AL ; Store user input in CH for comparison
        ; Check choice and display corresponding message
        CMP CH, 'a'
        JE balance_option
        CMP CH, 'b'
        JE deposit_option
        CMP CH, 'c'
        JE withdrawal_option
        CMP CH, 'd'
        JE bills_payment_option
        CMP CH, 'e'
        JE exit_program
        ; Invalid input handling (ignoring for simplicity)
        JMP menu_loop ; Redisplay menu if invalid choice

balance_option:
        MOV DX, OFFSET balance_msg
        MOV AH, 09H
        INT 21H
        JMP menu_loop

deposit_option:
        MOV DX, OFFSET deposit_msg
        MOV AH, 09H
        INT 21H
        JMP menu_loop

withdrawal_option:
        MOV DX, OFFSET withdraw_msg
        MOV AH, 09H
        INT 21H
        JMP menu_loop

bills_payment_option:
        MOV DX, OFFSET bills_msg
        MOV AH, 09H
        INT 21H
        JMP menu_loop

exit_program:
        ; Display exit message and terminate program
        MOV DX, OFFSET exit_msg
        MOV AH, 09H
        INT 21H
        MOV AH, 4CH ; Function to terminate program
        INT 21H
        
MAIN ENDP
END MAIN
