; Filename: EXER22.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 20, 2024
; Description: Create a College Enrollment Form. Get user input. Display a summary of the inputs. Include the necessary documentation as comments in your code.
 
.model small
.stack 100h
.data
    heading db 'Cebu Institute of Technology - University', 13,10
            db 'STUDENT ENROLLMENT FORM', 13, 10, 10
            db 'Please enter the following information:', 13, 10, '$'
    
    firstName_prompt db 13, 10,'First Name: $'
    lastName_prompt db 13, 10,'Last Name: $'
    
    firstName_input db 50, 50 dup(?)
    lastName_input db 20, 20 dup(?)

    summary_check db 13,10,10,'SUMMARY', 13, 10
            db 'Please check if all information are correct.', 13, 10, 10, '$'
    
    fullName_output db 13,10,'Full Name: $'
    
    thanks_msg db 13,10,10,'Thank you for enrolling at CIT-U.',13,10
            db 'Copyright 2024',13,10
            db 'Programmer: ASHLEY KEN COMANDAO' ,13,10, '$'
    
.code
    
main: 
    mov ax, @data
    mov ds, ax
    
    ; PRINT HEADER
        lea dx, heading
        call print
    
    ; PRINT AND READ PROMPT
        lea dx, firstName_prompt
        call print
        lea dx, firstName_input
        call scan
    
        lea dx, lastName_prompt
        call print
        lea dx, lastName_input
        call scan
        
    
    ; SUMMARY PROMPT
        lea dx, summary_check
        call print
    
    ; PRINT OUTPUT
    
        ; output fullname
            lea dx, fullName_output
            call print

            lea si, lastName_input + 2
            mov cl, [lastName_input+1]
            DisplayLastName: 
            call displaychar
            loop DisplayLastName
            mov dl, ','
            mov ah, 02h
            int 21h
            mov dl, ' '
            mov ah, 02h
            int 21h
        
            lea si, firstName_input + 2
            mov cl, [firstName_input+1]
            DisplayFirstName:
            call displaychar
            loop DisplayFirstName
    
    ; PRINT THANKS
        lea dx, thanks_msg
        call print

    ; EXIT PROGRAM
        mov ax,4C00h ; function to exit program
        int 21h
    
; FUNCTIONS
    print PROC
    mov ah, 09h
    int 21h
    ret
    print ENDP
    
    scan PROC
    mov ah, 0AH
    int 21h
    ret
    scan ENDP
    
    displaychar PROC
    mov dl, [si]
    mov ah, 02h
    int 21h
    inc si
    ret
    displaychar ENDP

    mov ax, 4C00h
    int 21h
end main