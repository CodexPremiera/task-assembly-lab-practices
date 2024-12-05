; Name of System: Wildcakes Cakeshop Cafe Inventory System
; Description: The program allows users to create accounts and order specific items in a list for their minbenbo switch.
; Programmer: ASHLEY KEN COMANDAO
; Date : December 5, 2024

.MODEL SMALL
.STACK 100H
.DATA
    space       DB ' $',0
    newline     DB ' $',13,10
    dash        DB ' - P$'
    barrier     DB ' | $'
    period      DB '.$',13,10,'$'
    exit_point  DB '!$',13,10
    header          DB '        CIT UNIVERSITY       ASHLEY KEN A. COMANDAO        COPYRIGHT 2024      ',13,10
                    DB ' ------------------------------------------------------------------------------',13,10
                    DB '                                                                               ',13,10
                    DB '      Yb        dP 88 88     8888b.   dP""b8    db    88  dP 888888 .dP"Y8     ',13,10 
                    DB '       Yb  db  dP  88 88      8I  Yb dP   `"   dPYb   88odP  88__   `Ybo."     ',13,10 
                    DB '        YbdPYbdP   88 88  .o  8I  dY Yb       dP__Yb  88"Yb  88""   o.`Y8b     ',13,10 
                    DB '         YP  YP    88 88ood8 8888Y"   YboodP dP""""Yb 88  Yb 888888 8bodP`    $',13,10

    branding2       DB '                                                                               ',13, 10
                    DB '                                     n2MX#MMMMM@1.                             ',13, 10
                    DB '                               .X#MMMMMMMMMMMMMMMMMMMV                         ',13, 10
                    DB '                           cEMMMMMMMMMMMMMMMMMMMMMMMMM@                        ',13, 10
                    DB '                     .n@MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                       ',13, 10
                    DB '    -----------     MMMMMMMM@@#SBWWB#@@#SWWWQQQWWWWB#@MM.     ------------     ',13, 10
                    DB '    ONCE TASTED     MM                                ;M.     NEVER WANTED     ',13, 10
                    DB '    -----------   .MMM                                OM      ------------     ',13, 10
                    DB '                    6MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM                       ',13, 10
                    DB '                    BM                                VM                       ',13, 10
                    DB '                    @M .............................. WM                       ',13, 10
                    DB '                    .A8QQWWWWWWWWWWWWWWWWWWWWWWWWWWW0AZ2                       ',13, 10
                    DB '   $',13, 10    


    setup           DB 13,10
                    DB ' >>> Hello wild-caker! Welcome to the Wildcakes Cakeshop. (^-^)$',13,10

    register_header  DB 13,10,13,10,' ---REGISTER---$',13,10
    login_header     DB 13,10,13,10,' ---LOGIN---$',13,10

    enter_username  DB 13,10,' Enter Username: $'
    enter_password  DB 13,10,' Enter Password: $'

    register_succ   DB 13,10,' ---User Register was Successful!---$',13,10
    login_succ      DB 13,10,' ---User Login was Successful!---$',13,10

    max_register      DB 13,10,' We have reached the max number of registered users! We apologize for the inconvenience.$',13,10
    username_exists   DB 13,10,' The username is already in use, please choose another one.$',13,10

    landing_header   DB ' Welcome to the Wildcakes Cakeshop!                                  $',13,10
    landing_login    DB ' 1. Login to existing Account                                                 $',13,10
    landing_register DB ' 2. Register new Account                                                      $',13,10
    landing_exit     DB ' 3. Exit                                                                      ',13,10
                     DB ' Enter your choice: $',13,10

    menu_title     DB ' Welcome to the Main Menu!                                                    $'
    menue_makeedit DB ' 1. Make/Edit order                                                           $'
    menu_review    DB ' 2. Review existing order                                                     $'
    menu_delete    DB ' 3. Delete existing order                                                     $'
    menu_exit      DB ' 4. Exit                                                                      ',13,10
                   DB '  Enter your choice: $',13,10

    menu_error  DB ' ERROR! Invalid choice!                                                        $',13,10
    login_error DB ' ERROR! Account is not recognized!                                             $',13,10

    order_accessories  DB '---- SELECT YOUR CAKE ---- ', 13,10
                    DB ' Chocolate    -  P400.00', 13,10
                    DB ' Ube          -  P425.00', 13,10
                    DB ' Mango        -  P450.00', 13,10
                    DB ' Red Velvet   -  P475.00', 13,10
                    DB ' Oreo Cream   -  P500.00$', 13,10, 13,10

    case_price          dw 400
    glass_price         dw 425
    grip_case_price     dw 450 
    capture_price       dw 475
    powerbank_price     dw 500

    item_amount  DB 13,10,13,10,'  Input number of an item: $'

    curr_order           DB '----YOUR CURRENT ORDER----$'
    curr_case            DB 13,10,' Chocolate    - $'
    curr_glass           DB 13,10,' Ube          - $'
    curr_grip_case       DB 13,10,' Mango        - $'
    curr_capture         DB 13,10,' Red Velvet   - $'
    curr_powerbank       DB 13,10,' Oreo Cream   - $'

    order_case           DB 13,10,'  Chocolate  : $'
    order_glass          DB '  Ube        : $'
    order_grip_case      DB '  Mango      : $'
    order_capture        DB '  Red Velvet : $'
    order_powerbank      DB '  Oreo Cream : $'
    order_total          DB 13,10,'  Your total is: P$'

    delete_order_prompt DB ' Are you sure you want to delete your order?',13,10
                        DB ' [YES (Y) / NO (N)]: $',13,10

    deleted_order_msg          DB 13,10,' ---Deleted Order---$',13,10
    cancel_delete_order_msg    DB 13,10,' ---Delete Cancelled---$',13,10

    exit_msg    DB 'Thank you for ordering! We hope you enjoy your cakes!$'
    landing_exit_prompt DB ' Thank you for using the app!',13,10,' Order again soon!$'

    usercounter dw 1

    def_empty_string DB 50 DUP('$')   ; debug purposes

    ;inputted values will be compared to the appropriate username and password variables to determine which account is in use
    login_username_input DB 50 DUP('$')
    login_password_input DB 50 DUP('$')

    ; variables for different users
    username1 DB 50 DUP('$')
    password1 DB 50 DUP('$')

    username2 DB 50 DUP('$')
    password2 DB 50 DUP('$')

    username3 DB 50 DUP('$')
    password3 DB 50 DUP('$')

    ; food variables for different users
    num_case1   dw 0
    num_glass1   dw 0
    num_grip1   dw 0
    num_capture1   dw 0
    num_powerbank1   dw 0

    num_case2   dw 0
    num_glass2   dw 0
    num_grip2   dw 0
    num_capture2   dw 0
    num_powerbank2   dw 0

    num_case3   dw 0
    num_glass3   dw 0
    num_grip3   dw 0
    num_capture3   dw 0
    num_powerbank3   dw 0

    total_case1  dw ?
    total_glass1  dw ? 
    total_grip1  dw ? 
    total_capture1  dw ? 
    total_powerbank1  dw ?

    total_case2  dw ?
    total_glass2  dw ? 
    total_grip2  dw ? 
    total_capture2  dw ? 
    total_powerbank2  dw ? 

    total_case3  dw ?
    total_glass3  dw ? 
    total_grip3  dw ? 
    total_capture3  dw ? 
    total_powerbank3  dw ? 

    sum1         dw 0
    sum2         dw 0
    sum3         dw 0

    edit_order_temp dw 0

    curr_bal    DW 0    ; Current balance
    TEMP        DW ?    ; Temp num
    BUFFER      DB 6    ; Buffer for number input
                DB ?
                DB 6 DUP(?)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    CALL CLEAR_SCREEN

    ; ; text blue
    ; mov ah, 06h
    ; mov ch, 1 ; row start
    ; mov cl, 1 ; col start
    ; mov dh, 1  ; row end
    ; mov dl, 24  ; col end
    ; mov bh, 01h ; black, blue
    ; int 10h

    ; ; text red
    ; mov ah, 06h
    ; mov ch, 1 ; row start
    ; mov cl, 25 ; col start
    ; mov dh, 1  ; row end
    ; mov dl, 31  ; col end
    ; mov bh, 04h ; black, red
    ; int 10h

    CALL DISPLAY_HEADER
 
    ;CALL BRANDING_COLORS

    LEA DX, branding2
    MOV AH, 09H
    INT 21H

    LEA DX, setup
    MOV AH, 09H
    INT 21H

    CALL REGISTER_ACC1

    CALL CLEAR_SCREEN

ACC_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display account menu
    CALL print_acc
    
    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_LOGIN
    CMP AL, '2'
    JZ TYPED_REGISTER
    CMP AL, '3'
    JZ typed_landing_exit
    
    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP ACC_LOOP

TYPED_LOGIN:
    JMP ACC1_LOGGING

TYPED_REGISTER:
    JMP landing_registerTER

typed_landing_exit:
    JMP landing_exitING

ACC1_LOGGING:
    CALL LOGIN_ACC

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0                   
    je ACC2_LOGGING

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password1+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

ACC2_LOGGING:
    
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je ACC3_LOGGING

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password2+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

ACC3_LOGGING:
    
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER          ; compares registered username and username inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    mov si, OFFSET login_password_input+2
    mov di, OFFSET password3+2
    CALL STRING_CHECKER          ; compares registered password and password inputted during login, pushes 1 to AL if same and 0 if not
    cmp AL, 0
    je INVALID_LOGIN

    LEA DX, login_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP MENU_LOOP               ; if both checks are successful, jumps to main menu screen

INVALID_LOGIN:                  ; results if compared strings are not equal
    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, login_error
    MOV AH, 09H
    INT 21H

    MOV SI, OFFSET login_username_input+2      ; initializes username back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    MOV SI, OFFSET login_password_input+2      ; initializes password back to null in case old account exists
    MOV CX, [SI]
    ADD SI, CX
    CALL STRING_CLEAR

    JMP ACC_LOOP                ; loops back to account menu after displaying error

landing_registerTER:
    cmp usercounter, 1            
    jne ACC3_REGISTER_1         ; jumps if greater than 1

    CALL REGISTER_ACC2

    mov si, OFFSET username1+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to REGISTER_SUCCESSFUL if username is unique
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, username_exists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP

ACC3_REGISTER_1:
    cmp usercounter, 3             ; jumps if max user count has been reached
    je ACC_FULL

    CALL REGISTER_ACC3

    mov si, OFFSET username1+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to ACC3_REGISTER_2 if username is unique
    cmp AL, 0                   
    je ACC3_REGISTER_2

    LEA DX, username_exists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP

ACC3_REGISTER_2:
    mov si, OFFSET username2+2
    mov di, OFFSET username3+2
    CALL STRING_CHECKER          ; checks if newly registered username already exists, jumps to REGISTER_SUCCESSFUL if username is unique
    cmp AL, 0                   
    je REGISTER_SUCCESSFUL

    LEA DX, username_exists
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    
    JMP ACC_LOOP
    
ACC_FULL:
    LEA DX, max_register
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    JMP ACC_LOOP

REGISTER_SUCCESSFUL:
    LEA DX, register_succ
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    INC usercounter
    
    JMP ACC_LOOP

landing_exitING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, landing_exit_prompt
    MOV AH, 09H
    INT 21H

    MOV AH, 4CH             ; fully exits the program
    INT 21H


MENU_LOOP:
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    ; Display main menu
    CALL print_menu
    
    ; Await user input
    MOV AH, 01H
    INT 21H
    
    ; Jumps to option
    CMP AL, '1'
    JZ TYPED_CREATE
    CMP AL, '2'
    JZ TYPED_REVIEW
    CMP AL, '3'
    JZ TYPED_DELETE
    CMP AL, '4'
    JZ typed_EXIT
    
    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP

TYPED_CREATE:
    JMP CREATE_ORDER

TYPED_REVIEW:
    JMP REVIEW_ORDER

TYPED_DELETE:
    JMP DELETE_ORDER

typed_EXIT:
    JMP EXITING

CREATE_ORDER:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, creates order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je CREATE_ORDER2

    CALL INPUT_order_1

    JMP MENU_LOOP

CREATE_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, creates order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je CREATE_ORDER3

    CALL INPUT_order_2

    JMP MENU_LOOP

CREATE_ORDER3:
    CALL INPUT_order_3

    JMP MENU_LOOP

REVIEW_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, reviews order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je REVIEW_ORDER2

    CALL REVIEW_order_1

    JMP MENU_LOOP

REVIEW_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, reviews order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je REVIEW_ORDER3

    CALL REVIEW_order_2

    JMP MENU_LOOP

REVIEW_ORDER3:
    CALL REVIEW_order_3

    JMP MENU_LOOP

DELETE_ORDER:
    
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, delete_order_prompt
    MOV AH, 09H
    INT 21H

    ; Await user input
    MOV AH, 01H
    INT 21H

    ; Jumps to option
    CMP AL, 'Y'
    JZ typed_YES_DELETE
    CMP AL, 'y'
    JZ typed_YES_DELETE
    CMP AL, 'N'
    JZ typed_CANCEL_DELETE
    CMP AL, 'n'
    JZ typed_CANCEL_DELETE

    ; Invalid choice
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    mov ah, 09h
    mov bh, 0
    mov bl, 0CEh   ; blinking red yellow
    mov cx, 78 
    int 10h

    LEA DX, menu_error
    MOV AH, 09H
    INT 21H
    JMP MENU_LOOP       ; loops back to menu screen if Y, y, N, or n were not inputted

typed_YES_DELETE:
    JMP DELETING_ORDER

typed_CANCEL_DELETE:
    JMP CANCELING_DELETE

DELETING_ORDER:
    LEA DX, deleted_order_msg
    MOV AH, 09H
    INT 21H

    mov si, OFFSET login_username_input+2
    mov di, OFFSET username1+2
    CALL STRING_CHECKER          ; checks if current user is account 1, deletes order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je DELETING_ORDER2

    CALL reset_all_zero_acc1

    JMP MENU_LOOP

DELETING_ORDER2:
    mov si, OFFSET login_username_input+2
    mov di, OFFSET username2+2
    CALL STRING_CHECKER          ; checks if current user is account 1, deletes order for acc 1 if yes, jumps to 2 if no
    cmp AL, 0                   
    je DELETING_ORDER3

    CALL reset_all_zero_acc2

    JMP MENU_LOOP

DELETING_ORDER3:
    CALL reset_all_zero_acc3

    JMP MENU_LOOP

CANCELING_DELETE:
    LEA DX, cancel_delete_order_msg    
    MOV AH, 09H
    INT 21H

    JMP MENU_LOOP       ; returns back to menu screen without deleting orders

EXITING:

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, exit_msg
    MOV AH, 09H
    INT 21H
    
    JMP ACC_LOOP        ; returns back to account screen

MAIN ENDP

DISPLAY_STRING PROC
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 
    RET
DISPLAY_STRING ENDP

READ_STRING PROC
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h
    RET
READ_STRING ENDP

; account register functions
; this one is called when the program starts
REGISTER_ACC1 PROC          
    LEA DX, register_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username1
    CALL READ_STRING

    LEA DX, newline
    CALL DISPLAY_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password1
    CALL READ_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
REGISTER_ACC1 ENDP

REGISTER_ACC2 PROC
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username2
    CALL READ_STRING

    LEA DX, newline
    CALL DISPLAY_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password2
    CALL READ_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
REGISTER_ACC2 ENDP

REGISTER_ACC3 PROC
    LEA DX, register_header
    CALL DISPLAY_STRING

    LEA DX, enter_username
    CALL DISPLAY_STRING

    LEA DX, username3
    CALL READ_STRING

    LEA DX, newline
    CALL DISPLAY_STRING

    LEA DX, enter_password
    CALL DISPLAY_STRING

    LEA DX, password3
    CALL READ_STRING

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
REGISTER_ACC3 ENDP

LOGIN_ACC PROC
    LEA DX, login_header
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, enter_username
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, login_username_input
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    LEA DX, newline
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, enter_password
    MOV AH, 09h               ; DOS function to display a string 
    INT 21h 

    LEA DX, login_password_input
    MOV AH, 0Ah               ; DOS function to read a string 
    INT 21h 

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    RET
LOGIN_ACC ENDP

CLEAR_SCREEN PROC
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
    
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0000H
    INT 10H
    RET
CLEAR_SCREEN ENDP

DISPLAY_HEADER PROC
    
    LEA DX, header
    MOV AH, 09H
    INT 21H

    RET
DISPLAY_HEADER ENDP

INPUT_NUM PROC
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR BX, BX  ; Clear BX for result
    XOR CX, CX  ; Clear counter
    
INPUT_LOOP:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13  ; Check for Enter key
    JE INPUT_DONE
    
    CMP AL, '0'
    JB INPUT_LOOP
    CMP AL, '9'
    JA INPUT_LOOP
    
    SUB AL, '0'  ; Convert ASCII to number
    MOV CL, AL
    
    MOV AX, BX
    MOV BX, 10
    MUL BX      ; Multiply current result by 10
    ADD AX, CX  ; Add new digit
    MOV BX, AX
    
    JMP INPUT_LOOP
    
INPUT_DONE:
    MOV AX, BX
    MOV TEMP, AX  ; Store input in TEMP
    
    POP DX
    POP CX
    POP BX
    RET
INPUT_NUM ENDP

DISPLAY_NUM PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP
    
print_num_1:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_1
    
    LEA DX, period
    MOV AH, 09H
    INT 21H
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM ENDP

DISPLAY_NUM2 PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10   ; Divisor
    XOR CX, CX   ; Counter for digits
    
DIVIDE_LOOP2:
    XOR DX, DX
    DIV BX
    PUSH DX      ; Push remainder (digit)
    INC CX
    TEST AX, AX
    JNZ DIVIDE_LOOP2
    
print_num_2:
    POP DX
    ADD DL, '0'  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP print_num_2
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DISPLAY_NUM2 ENDP

INPUT_order_1 PROC
    CALL reset_all_zero_acc1     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_accessories
    MOV AH, 09H
    INT 21H

    LEA DX, item_amount
    MOV AH, 09H
    INT 21H

    LEA DX, order_case
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_case1, AX       ; adds inputted number to originally 0

    mov ax, num_case1
    mov bx, case_price      
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_case1, ax

    ADD sum1, ax             ; adds price of order to overall total price
    
    LEA DX, order_glass 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_glass1, AX

    mov ax, num_glass1
    mov bx, glass_price
    mul bx
        mov total_glass1, ax

    ADD sum1, ax
    
    LEA DX, order_grip_case 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_grip1, AX

    mov ax, num_grip1
    mov bx, grip_case_price
    mul bx
        mov total_grip1, ax

    ADD sum1, ax
    
    LEA DX, order_capture 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_capture1, AX

    mov ax, num_capture1
    mov bx, capture_price
    mul bx
        mov total_capture1, ax

    ADD sum1, ax
    
    LEA DX, order_powerbank 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_powerbank1, AX

    mov ax, num_powerbank1
    mov bx, powerbank_price
    mul bx
        mov total_powerbank1, ax

    ADD sum1, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum1                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_order_1 ENDP

INPUT_order_2 PROC
    CALL reset_all_zero_acc2     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_accessories
    MOV AH, 09H
    INT 21H

    LEA DX, item_amount
    MOV AH, 09H
    INT 21H

    LEA DX, order_case
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_case2, AX       ; adds inputted number to originally 0

    mov ax, num_case2
    mov bx, case_price      
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_case2, ax

    ADD sum2, ax             ; adds price of order to overall total price
    
    LEA DX, order_glass 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_glass2, AX

    mov ax, num_glass2
    mov bx, glass_price
    mul bx
        mov total_glass2, ax

    ADD sum2, ax
    
    LEA DX, order_grip_case 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_grip2, AX

    mov ax, num_grip2
    mov bx, grip_case_price
    mul bx
        mov total_grip2, ax

    ADD sum2, ax
    
    LEA DX, order_capture 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_capture2, AX

    mov ax, num_capture2
    mov bx, capture_price
    mul bx
        mov total_capture2, ax

    ADD sum2, ax
    
    LEA DX, order_powerbank 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_powerbank2, AX

    mov ax, num_powerbank2
    mov bx, powerbank_price
    mul bx
        mov total_powerbank2, ax

    ADD sum2, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum2                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_order_2 ENDP

INPUT_order_3 PROC
    CALL reset_all_zero_acc3     ; resets all orders to 0 first to ensure orders dont add up

    LEA DX, order_accessories
    MOV AH, 09H
    INT 21H

    LEA DX, item_amount
    MOV AH, 09H
    INT 21H

    LEA DX, order_case
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM          ; function to input number
    ADD num_case3, AX       ; adds inputted number to originally 0

    mov ax, num_case3
    mov bx, case_price      
    mul bx                  ; multiplies number of orders to individual price of item
        mov total_case3, ax

    ADD sum3, ax             ; adds price of order to overall total price
    
    LEA DX, order_glass 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_glass3, AX

    mov ax, num_glass3
    mov bx, glass_price
    mul bx
        mov total_glass3, ax

    ADD sum3, ax
    
    LEA DX, order_grip_case 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_grip3, AX

    mov ax, num_grip3
    mov bx, grip_case_price
    mul bx
        mov total_grip3, ax

    ADD sum3, ax
    
    LEA DX, order_capture 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_capture3, AX

    mov ax, num_capture3
    mov bx, capture_price
    mul bx
        mov total_capture3, ax

    ADD sum3, ax
    
    LEA DX, order_powerbank 
    MOV AH, 09H
    INT 21H

    CALL INPUT_NUM
    ADD num_powerbank3, AX

    mov ax, num_powerbank3
    mov bx, powerbank_price
    mul bx
        mov total_powerbank3, ax

    ADD sum3, ax
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum3                 ; prints overall total price
    CALL DISPLAY_NUM2
    
    RET
INPUT_order_3 ENDP

reset_all_zero_acc1 PROC
    MOV AX, sum1          ; resets to 0
    MOV BX, AX
    SUB sum1, BX

    MOV AX, num_case1          ; resets to 0
    MOV BX, AX
    SUB num_case1, BX

    MOV AX, total_case1          ; resets to 0
    MOV BX, AX
    SUB total_case1, BX

    MOV AX, num_glass1          ; resets to 0
    MOV BX, AX
    SUB num_glass1, BX

    MOV AX, total_glass1          ; resets to 0
    MOV BX, AX
    SUB total_glass1, BX

    MOV AX, num_grip1          ; resets to 0
    MOV BX, AX
    SUB num_grip1, BX

    MOV AX, total_grip1          ; resets to 0
    MOV BX, AX
    SUB total_grip1, BX

    MOV AX, num_capture1          ; resets to 0
    MOV BX, AX
    SUB num_capture1, BX

    MOV AX, total_capture1          ; resets to 0
    MOV BX, AX
    SUB total_capture1, BX

    MOV AX, num_powerbank1          ; resets to 0
    MOV BX, AX
    SUB num_powerbank1, BX

    MOV AX, total_powerbank1          ; resets to 0
    MOV BX, AX
    SUB total_powerbank1, BX
    RET
reset_all_zero_acc1 ENDP

reset_all_zero_acc2 PROC
    MOV AX, sum2          ; resets to 0
    MOV BX, AX
    SUB sum2, BX

    MOV AX, num_case2          ; resets to 0
    MOV BX, AX
    SUB num_case2, BX

    MOV AX, total_case2          ; resets to 0
    MOV BX, AX
    SUB total_case2, BX

    MOV AX, num_glass2          ; resets to 0
    MOV BX, AX
    SUB num_glass2, BX

    MOV AX, total_glass2          ; resets to 0
    MOV BX, AX
    SUB total_glass2, BX

    MOV AX, num_grip2          ; resets to 0
    MOV BX, AX
    SUB num_grip2, BX

    MOV AX, total_grip2          ; resets to 0
    MOV BX, AX
    SUB total_grip2, BX

    MOV AX, num_capture2          ; resets to 0
    MOV BX, AX
    SUB num_capture2, BX

    MOV AX, total_capture2          ; resets to 0
    MOV BX, AX
    SUB total_capture2, BX

    MOV AX, num_powerbank2          ; resets to 0
    MOV BX, AX
    SUB num_powerbank2, BX

    MOV AX, total_powerbank2          ; resets to 0
    MOV BX, AX
    SUB total_powerbank2, BX
    RET
reset_all_zero_acc2 ENDP

reset_all_zero_acc3 PROC
    MOV AX, sum3          ; resets to 0
    MOV BX, AX
    SUB sum3, BX

    MOV AX, num_case3          ; resets to 0
    MOV BX, AX
    SUB num_case3, BX

    MOV AX, total_case3          ; resets to 0
    MOV BX, AX
    SUB total_case3, BX

    MOV AX, num_glass3          ; resets to 0
    MOV BX, AX
    SUB num_glass3, BX

    MOV AX, total_glass3          ; resets to 0
    MOV BX, AX
    SUB total_glass3, BX

    MOV AX, num_grip3          ; resets to 0
    MOV BX, AX
    SUB num_grip3, BX

    MOV AX, total_grip3          ; resets to 0
    MOV BX, AX
    SUB total_grip3, BX

    MOV AX, num_capture3          ; resets to 0
    MOV BX, AX
    SUB num_capture3, BX

    MOV AX, total_capture3          ; resets to 0
    MOV BX, AX
    SUB total_capture3, BX

    MOV AX, num_powerbank3          ; resets to 0
    MOV BX, AX
    SUB num_powerbank3, BX

    MOV AX, total_powerbank3          ; resets to 0
    MOV BX, AX
    SUB total_powerbank3, BX
    RET
reset_all_zero_acc3 ENDP

REVIEW_order_1 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_case1           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_case1          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_glass
    MOV AH, 09H
    INT 21H

    MOV AX, num_glass1
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_glass1
    CALL DISPLAY_NUM2

    LEA DX, curr_grip_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_grip1
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_grip1
    CALL DISPLAY_NUM2

    LEA DX, curr_capture
    MOV AH, 09H
    INT 21H

    MOV AX, num_capture1
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_capture1
    CALL DISPLAY_NUM2

    LEA DX, curr_powerbank
    MOV AH, 09H
    INT 21H

    MOV AX, num_powerbank1
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_powerbank1
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum1
    CALL DISPLAY_NUM2
    
    RET
REVIEW_order_1 ENDP

REVIEW_order_2 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_case2           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_case2          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_glass
    MOV AH, 09H
    INT 21H

    MOV AX, num_glass2
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_glass2
    CALL DISPLAY_NUM2

    LEA DX, curr_grip_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_grip2
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_grip2
    CALL DISPLAY_NUM2

    LEA DX, curr_capture
    MOV AH, 09H
    INT 21H

    MOV AX, num_capture2
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_capture2
    CALL DISPLAY_NUM2

    LEA DX, curr_powerbank
    MOV AH, 09H
    INT 21H

    MOV AX, num_powerbank2
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_powerbank2
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum2
    CALL DISPLAY_NUM2
    
    RET
REVIEW_order_2 ENDP

REVIEW_order_3 PROC
    LEA DX, curr_order
    MOV AH, 09H
    INT 21H

    LEA DX, curr_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_case3           ; prints number of orders of the item
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_case3          ; prints total price of item
    CALL DISPLAY_NUM2

    LEA DX, curr_glass
    MOV AH, 09H
    INT 21H

    MOV AX, num_glass3
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_glass3
    CALL DISPLAY_NUM2

    LEA DX, curr_grip_case
    MOV AH, 09H
    INT 21H

    MOV AX, num_grip3
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_grip3
    CALL DISPLAY_NUM2

    LEA DX, curr_capture
    MOV AH, 09H
    INT 21H

    MOV AX, num_capture3
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_capture3
    CALL DISPLAY_NUM2

    LEA DX, curr_powerbank
    MOV AH, 09H
    INT 21H

    MOV AX, num_powerbank3
    CALL DISPLAY_NUM2

    LEA DX, dash
    MOV AH, 09H
    INT 21H

    MOV AX, total_powerbank3
    CALL DISPLAY_NUM2
    
    LEA DX, order_total 
    MOV AH, 09H
    INT 21H
    
    MOV AX, sum3
    CALL DISPLAY_NUM2
    
    RET
REVIEW_order_3 ENDP

print_acc PROC
    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, landing_header
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H


    LEA DX, landing_login
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H


    LEA DX, landing_register
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, landing_exit
    MOV AH, 09H
    INT 21H

    RET
print_acc ENDP

print_menu PROC

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, menu_title
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, menue_makeedit
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, menu_review
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, menu_delete
    MOV AH, 09H
    INT 21H

    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    INT 21H

    LEA DX, space
    MOV AH, 09H
    INT 21H

    LEA DX, menu_exit
    MOV AH, 09H
    INT 21H

    RET
print_menu ENDP

BRANDING_COLORS PROC
    ; branding colors


    ; switch screen
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 15 ; col start
    mov dh, 16  ; row end
    mov dl, 52  ; col end
    mov bh, 70h ; blue
    int 10h

    ; switch screen
    mov ah, 06h
    mov ch, 7 ; row start
    mov cl, 17 ; col start
    mov dh, 15  ; row end
    mov dl, 49  ; col end
    mov bh, 07h ; blue
    int 10h


    ; left joycon
    mov ah, 06h
    mov ch, 5 ; row start
    mov cl, 2 ; col start
    mov dh, 16  ; row end
    mov dl, 14  ; col end
    mov bh, 01h ; blue
    int 10h   

    ; right joycon
    mov ah, 06h
    mov ch, 5 ; row start
    mov cl, 52 ; col start
    mov dh, 16  ; row end
    mov dl, 70  ; col end
    mov bh, 04h ; blue
    int 10h   



BRANDING_COLORS ENDP

STRING_CHECKER proc              ; function to compare two strings
    CMP BYTE PTR [SI], '$'
    JE EQUAL 
    LOOP_COMPARE:
        mov al, BYTE PTR [SI]
        mov bl, BYTE PTR [DI]
        cmp al, bl
        JNE NOT_EQUAL 
        INC SI
        INC DI
        CMP BYTE PTR [SI], '$'
        JNE LOOP_COMPARE
    EQUAL:
        MOV AL, 1               ; moves 1 to AL if both strings are the same
        ret
    NOT_EQUAL:
        MOV AL, 0               ; moves 0 to AL if both strings are different
        ret
STRING_CHECKER endp

STRING_CLEAR PROC
    CLEAR_LOOP:
        mov al, BYTE PTR [SI]

        cmp al, '$'
        JNE NULL_COMPLETE

        lea dx, barrier
        mov ah, 09h
        int 21h
        
        lea dx, BYTE PTR [SI]
        mov ah, 09h
        int 21h

        lea dx, barrier
        mov ah, 09h
        int 21h

        MOV BYTE PTR [SI], '$'
        DEC SI
        LOOP CLEAR_LOOP

    NULL_COMPLETE:
        RET
STRING_CLEAR ENDP

END MAIN