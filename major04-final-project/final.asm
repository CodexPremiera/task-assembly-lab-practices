; The Marketplace Inventory System
; 
; Description:
; The Marketplace Inventory System is a simple, easy-to-use program designed to help manage 
; the stock of 20 items. It allows the user to add, update, delete, and view items in the 
; inventory. Each item is tracked by its name, quantity, and price per unit, with the system 
; able to alert the user when stock levels are low. Additionally, the system can generate 
; basic reports for restocking purposes. Ideal for small grocery stores, this system aims to 
; streamline inventory management with an intuitive interface and essential features.
;
; Made by: Ashley Ken Comandao
; Date made: November 21, 2024


.MODEL SMALL
.STACK 100H
.DATA

header_msg  DB '  _______ _            __  __            _        _         _                 ', 0Dh, 0Ah
            DB ' |__   __| |          |  \/  |          | |      | |       | |                ', 0Dh, 0Ah
            DB '    | |  | |__   ___  | \  / | __ _ _ __| | _____| |_ _ __ | | __ _  ___ ___  ', 0Dh, 0Ah
            DB '    | |  | ''_ \ / _ \ | |\/| |/ _` | ''__| |/ / _ \ __| ''_ \| |/ _` |/ __/ _ \ ', 0Dh, 0Ah
            DB '    | |  | | | |  __/ | |  | | (_| | |  |   <  __/ |_| |_) | | (_| | (_|  __/ ', 0Dh, 0Ah
            DB '    |_|  |_| |_|\___| |_|  |_|\__,_|_|  |_|\_\___|\__| .__/|_|\__,_|\___\___| ', 0Dh, 0Ah
            DB '                                                     |_|                      ', 0Dh, 0Ah
            DB '                                                                              ', 0Dh, 0Ah
            DB ' ========================= GROCERY INVENTORY SYSTEM ==========================', 0Dh, 0Ah
            DB '                                                                             ', 0Dh, 0Ah
            DB '      Made by: Ashley Ken Comandao      Copyright 2024 All Rights Reserve     $', 0Dh, 0Ah, 0Dh, 0Ah, 0Dh, 0Ah



menu_msg   DB 0Ah, 0Ah, '-----', 0Dh, 0Ah
           DB 'MAIN MENU', 0Dh, 0Ah
           DB '1. View Full Inventory', 0Dh, 0Ah
           DB '2. Add items', 0Dh, 0Ah
           DB '3. Get items', 0Dh, 0Ah
           DB '4. Exit', 0Dh, 0Ah, 'Enter your choice: $'

balance_msg DB 0Ah, 0Ah, 'Balance Inquiry', 0Dh, 0Ah
            DB 'Your current balance: P', '$'

deposit_msg DB 0Ah, 0Ah, 'Deposit', 0Dh, 0Ah
            DB 'Enter deposit amount: P', '$'

withdraw_msg DB 0Ah, 0Ah, 'Withdrawal', 0Dh, 0Ah
             DB 'Enter withdrawal amount: P', '$'

exit_msg    DB 0Ah, 0Ah, 'Exiting ATM.', 0Dh, 0Ah 
            DB 'Thank you!', 0Dh, 0Ah, 0Dh, 0Ah, '$'

newline     DB 0Dh, 0Ah, '$'
balance     DW 0  ; Initialize balance to zero
input_value DB ?  ; Temporary storage for input

.CODE
MAIN PROC
    MOV AX, @DATA ; Load the address of data segment
    MOV DS, AX    ; Initialize data segment

    ; Display heading message
    MOV DX, OFFSET header_msg
    MOV AH, 09H
    INT 21H

menu_loop:
    ; Display menu message
    MOV DX, OFFSET menu_msg
    MOV AH, 09H
    INT 21H
    ; Get user choice
    MOV AH, 01H
    INT 21H
    MOV CH, AL ; Store user input in CH for comparison

    ; Check choice and display corresponding message
    CMP CH, '1'
    JE balance_option
    CMP CH, '2'
    JE deposit_option
    CMP CH, '3'
    JE withdrawal_option
    CMP CH, '4'
    JE exit_program
    ; Invalid input handling (ignoring for simplicity)
    JMP menu_loop ; Redisplay menu if invalid choice

balance_option:
    ; Display current balance
    MOV DX, OFFSET balance_msg
    MOV AH, 09H
    INT 21H

    ; Convert balance to ASCII and display
    MOV AX, balance
    CALL DisplayValue
    JMP menu_loop

deposit_option:
    ; Display deposit prompt
    MOV DX, OFFSET deposit_msg
    MOV AH, 09H
    INT 21H

    ; Get deposit amount
    CALL GetInput
    ADD balance, AX ; Add deposit to balance
    JMP menu_loop

withdrawal_option:
    ; Display withdrawal prompt
    MOV DX, OFFSET withdraw_msg
    MOV AH, 09H
    INT 21H

    ; Get withdrawal amount
    CALL GetInput
    CMP AX, balance
    JA insufficient_funds ; Check if balance is sufficient
    SUB balance, AX ; Deduct amount from balance if sufficient
    JMP menu_loop

insufficient_funds:
    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H
    ; MOV DX, OFFSET 'Insufficient funds.$'
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
    
; Procedure to get numerical input from user (single digit for simplicity)
GetInput PROC
    MOV AH, 01H
    INT 21H
    SUB AL, '0' ; Convert ASCII to numeric
    MOV input_value, AL
    MOV AX, 0
    MOV AL, input_value
    RET
GetInput ENDP

; Procedure to display a numeric value in AX
DisplayValue PROC
    ; Convert number in AX to ASCII for display
    MOV CX, 10
    MOV BX, 0

    RepeatDivide:
        XOR DX, DX
        DIV CX
        ADD DL, '0'
        PUSH DX
        INC BX
        CMP AX, 0
        JNE RepeatDivide

    PrintDigits:
        POP DX
        MOV AH, 02H
        MOV DL, AL
        INT 21H
        DEC BX
        JNZ PrintDigits
    RET
DisplayValue ENDP

MAIN ENDP
END MAIN
