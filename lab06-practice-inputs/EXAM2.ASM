; Filename: EXAM2.ASM
; CS243 Lab Hands-on Exam No. 2 
; First Semester SY 2024-2025
; Student Name: ASHLEY KEN COMANDAO
; Date Finished: September 26, 2024


.MODEL SMALL 
.STACK 100h 
.DATA 
    ; header
    header db 'THE CALCULATOR', 0Ah, 'Created by: YOUR FULL NAME', 0Ah, 'Date Today: September 26, 2024', 0Ah, 0Ah, '$' 
    menu db 'Main Menu', 0Ah, 'a - Addition', 0Ah, 's - Subtraction',  0Ah, 'm - Multiplication', 0Ah, 'd - Division', 0Ah, 'e - Exit', 0Ah,  '$'
    menu_prompt db 'Enter your choice: $'
    thank_you db 0Ah, 'Thank you. $'

    max_len EQU 1000 

    ; addition
    addition_title db 'ADDITION $'
    addend1_prompt db 0Ah, 'Enter first addend: $'
    addend2_prompt db 'Enter second addend: $'
    addend1_output db 'First addend is: $'
    addend2_output db 'Second addend is: $'
    addend1_value db max_len dup(?) 
    addend2_value db max_len dup(?) 

    ; subtraction
    subtraction_title db 'SUBTRACTION $'
    minuend_prompt db 0Ah, 'Enter minuend: $'
    subtrahend_prompt db 'Enter subtrahend: $'
    minuend_output db 'Minuend is: $'
    subtrahend_output db 'Subtrahend is: $'
    minuend_value db max_len dup(?)
    subtrahend_value db max_len dup(?)

    ; multiplication
    multiplication_title db 'MULTIPLICATION $'
    multiplicand_prompt db 0Ah, 'Enter multiplicand: $'
    multiplier_prompt db 'Enter multiplier: $'
    multiplicand_output db 'Multiplicand is: $'
    multiplier_output db 'Multiplier is: $'
    multiplicand_value db max_len dup(?)
    multiplier_value db max_len dup(?)

    ; division
    division_title db 'DIVISION $'
    dividend_prompt db 0Ah, 'Enter dividend: $'
    divisor_prompt db 'Enter divisor: $'
    dividend_output db 'Dividend is: $'
    divisor_output db 'Divisor is: $'
    dividend_value db max_len dup(?)
    divisor_value db max_len dup(?)

    menu_choice db max_len dup(?)
    line3 db 'Enter Middle Name: $' 
    line4 db 'Enter Last Name: $' 
    exclam db '!$' 
 

    middle db max_len dup (?) 
    last db max_len dup (?) 
 
    msg db 'Hello, $' 
 
.CODE  
ProgramStart: 
    ; MENU
        ; init 
        mov ax, @data 
        mov ds, ax   
        
        ; print header
        lea dx, header
        call printString 
    
        ; print menu
        lea dx, menu 
        call printString 

        ; print menu_prompt
        lea dx, menu_prompt 
        call printString 
    
        ; read menu_choice
        lea dx, menu_choice 
        mov cx, max_len      
        call getString 

        push ax

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

    ; SWITCH
        ; if Addition, jump to Addition
        cmp menu_choice, 'a'
        jz SwitchAddition
        
        ; if Subtraction, jump to Subtraction
        cmp menu_choice, 's'
        jz SwitchSubtraction
        
        ; if Multiplication, jump to Multiplication
        cmp menu_choice, 'a'
        jz SwitchMultiplication
        
        ; if Division, jump to Division
        cmp menu_choice, 's'
        jz SwitchDivision
        
        ; if Exit, jump to Exit
        cmp menu_choice, 's'
        jz ExitProgram


    SwitchAddition:
        call Do_Addition
        jmp ExitProgram

    SwitchSubtraction:
        call Do_Subtraction
        jmp ExitProgram
        
    SwitchMultiplication:
        call Do_Multiplication
        jmp ExitProgram
        
    SwitchDivision:
        call Do_Division
        jmp ExitProgram

    ExitProgram:
        ; print thanks
        lea dx, thank_you
        call printString 

        int 27

        ; exit program
        mov ax,4C00h ; function to exit program
        int 21h



; OPERATIONAL FUNCTIONS
Do_Addition:
    lea dx, addition_title 
    call printString 

    ; prompt
        ; print and read addend1_prompt
        lea dx, addend1_prompt 
        call printString 

        lea dx, addend1_value
        mov cx, max_len      
        call getString 

        push ax  

        ; print and read addend2_prompt
        lea dx, addend2_prompt 
        call printString 

        lea dx, addend2_value
        mov cx, max_len      
        call getString 

        pop dx  
        push ax 
        push dx 

    ; output
        mov dx, OFFSET addend1_output 
        call printString 

        mov dx, OFFSET addend1_value 
        pop cx  
        call printNumString 

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov dx, OFFSET addend2_output 
        call printString 

        mov dx, OFFSET addend2_value 
        pop cx  
        call printNumString 

        call endline 
    
    ret

Do_Subtraction:
    lea dx, subtraction_title
    call printString

    ; prompt
        lea dx, minuend_prompt
        call printString

        lea dx, minuend_value
        mov cx, max_len
        call getString

        push ax

        lea dx, subtrahend_prompt
        call printString

        lea dx, subtrahend_value
        mov cx, max_len
        call getString

        pop dx
        push ax
        push dx

    ; output
        mov dx, OFFSET minuend_output
        call printString

        mov dx, OFFSET minuend_value
        pop cx
        call printNumString

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov dx, OFFSET subtrahend_output
        call printString

        mov dx, OFFSET subtrahend_value
        pop cx
        call printNumString

        call endline

    ret

Do_Multiplication:
    lea dx, multiplication_title
    call printString

    ; prompt
        lea dx, multiplicand_prompt
        call printString

        lea dx, multiplicand_value
        mov cx, max_len
        call getString

        push ax

        lea dx, multiplier_prompt
        call printString

        lea dx, multiplier_value
        mov cx, max_len
        call getString

        pop dx
        push ax
        push dx

    ; output
        mov dx, OFFSET multiplicand_output
        call printString

        mov dx, OFFSET multiplicand_value
        pop cx
        call printNumString

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov dx, OFFSET multiplier_output
        call printString

        mov dx, OFFSET multiplier_value
        pop cx
        call printNumString

        call endline

    ret
   
Do_Division:
    lea dx, division_title
    call printString

    ; prompt
        lea dx, dividend_prompt
        call printString

        lea dx, dividend_value
        mov cx, max_len
        call getString

        push ax

        lea dx, divisor_prompt
        call printString

        lea dx, divisor_value
        mov cx, max_len
        call getString

        pop dx
        push ax
        push dx

    ; output
        mov dx, OFFSET dividend_output
        call printString

        mov dx, OFFSET dividend_value
        pop cx
        call printNumString

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

        mov dx, OFFSET divisor_output
        call printString

        mov dx, OFFSET divisor_value
        pop cx
        call printNumString

        call endline

    ret

 
; BASIC FUNCTIONS
getString: 
    push bx 
    mov ah, 3Fh 
    mov bx, 0 
    mov cx, max_len 
    int 21h 
 
    pop bx 
    ret 
 
printNumString: 
    push ax  
    push bx  
    mov ah, 40h 
    add cx, -2 
    mov bx, 1 
    int 21h 
 
    mov ah, 02h 
    mov dl, ' ' 
    int 21h 
 
    pop bx 
    pop ax 
    ret  
 
printString: 
    push ax  
    mov ah, 09h 
    int 21h 
    pop ax  
    ret  
 
endline: 
    push ax 
    push bx  
    mov ah, 02h 
    mov dl, 0Ah 
    int 21h 
    pop bx  
    pop ax  
    ret 


 
END ProgramStart 
 