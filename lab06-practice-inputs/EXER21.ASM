; Filename: EXER21.ASM 
; Programmer Name: NATHANAEL JEDD N. DEL CASTILLO 
; Date: SEPTEMBER 20, 2024 
; Description: This assembly language program will ask for your first name, middle name, and 
; family name. Then display "Hello, FIRST NAME MIDDLE NAME FAMILY NAME!" 
  
.MODEL SMALL 
.STACK 100h 
.DATA 
 
    line1 db 'REGISTRATION FORM', 0Ah, '$' 
    line2 db 'Enter First Name: $' 
    line3 db 'Enter Middle Name: $' 
    line4 db 'Enter Last Name: $' 
    exclam db '!$' 
 
    max_len EQU 1000 
 
    first db max_len dup(?) 
    middle db max_len dup (?) 
    last db max_len dup (?) 
 
    msg db 'Hello, $' 
 
.CODE  
ProgramStart: 
    ; init 
    mov ax, @data 
    mov ds, ax   
    
    ; print line1
    lea dx, line1  
    call printString 
 
    ; print line2
    lea dx, line2 
    call printString 
 
    ; read input line2
    lea dx, first 
    mov cx, max_len      
    call getString 
 
    push ax  
 
    lea dx, line3 
    call printString 
 
    ; read input line2
    lea dx, middle 
    mov cx, max_len 
    call getString 
 
    pop dx  
    push ax 
    push dx 
 
    lea dx, line4  
    call printString 
 
    lea dx, last 
    mov cx, max_len 
    call getString 
 
    pop dx 
    pop cx 
    push ax 
    push cx 
    push dx  
 
    mov dx, OFFSET msg 
    call printString 
 
    mov dx, OFFSET first 
    pop cx  
    call printNumString 
 
    mov dx, OFFSET middle 
    pop cx  
    call printNumString 
 
    mov dx, OFFSET last  
    pop cx 
    call printNumString 
 
    mov dx, OFFSET exclam  
    pop cx  
    call printString 
 
    call endline 
    int 27h 
 
 
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
 