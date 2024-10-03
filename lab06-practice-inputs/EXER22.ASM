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
    
    id_prompt db 'Student ID Number: $'
    firstName_prompt db 13, 10,'First Name: $'
    middleName_prompt db 13, 10,'Middle Name: $'
    lastName_prompt db 13, 10,'Last Name: $'
    address_prompt db 13,10,'Address: $'
    course_prompt db 13,10,'Course: $'
    year_prompt db 13,10,'Year: $'
    bdayMonth_prompt db 13,10,'Birthday Month: $'
    bdayDay_prompt db 13,10,'Birthday Day: $'
    bdayYear_prompt db 13,10,'Birthday Year: $'
    email_prompt db 13,10,'Email Address: $'
    
    id_input db 30, 30 dup(?)
    firstName_input db 50, 50 dup(?)
    middleName_input db 20, 20 dup(?)
    lastName_input db 20, 20 dup(?)
    address_input db 150, 150 dup(?)
    course_input db 20, 20 dup(?)
    year_input db 10, 10 dup(?)
    bdayMonth_input db 20, 20 dup(?)
    bdayDay_input db 10, 10 dup(?)
    bdayYear_input db 20, 20 dup(?)
    email_input db 50, 50 dup(?)
 
    summary_check db 13,10,10,'SUMMARY', 13, 10
            db 'Please check if all information are correct.', 13, 10, 10, '$'
    
    id_output db 'ID Number: $'
    fullName_output db 13,10,'Full Name: $'
    address_output db 13,10,'Address: $'
    courseYear_output db 13,10,'Course & Year: $'
    bday_output db 13,10,'Birthday: $'
    email_output db 13,10,'Email Address: $'
    
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
        lea dx, id_prompt
        call print
        lea dx, id_input
        call scan
        
        lea dx, firstName_prompt
        call print
        lea dx, firstName_input
        call scan
        
        lea dx, middleName_prompt
        call print
        lea dx, middleName_input
        call scan
        
        lea dx, lastName_prompt
        call print
        lea dx, lastName_input
        call scan
        
        lea dx, address_prompt
        call print
        lea dx, address_input
        call scan
        
        lea dx, course_prompt
        call print
        lea dx, course_input
        call scan
        
        lea dx, year_prompt
        call print
        lea dx, year_input
        call scan
        
        lea dx, bdayMonth_prompt
        call print
        lea dx, bdayMonth_input
        call scan
        
        lea dx, bdayDay_prompt
        call print
        lea dx, bdayDay_input
        call scan
        
        lea dx, bdayYear_prompt
        call print
        lea dx, bdayYear_input
        call scan
        
        lea dx, email_prompt
        call print
        lea dx, email_input
        call scan
    
    ; SUMMARY PROMPT
        lea dx, summary_check
        call print
    
    ; PRINT OUTPUT
        ; output id
            lea dx, id_output
            call print
            lea si, id_input + 2
            mov cl, [id_input + 1]
            DisplayId: 
            call displaychar
            loop DisplayId
    
    
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
            mov dl, ' '
            mov ah, 02h
            int 21h

            lea si, middleName_input + 2
            mov cl, [middleName_input+1]
            DisplayMiddleName:
            call displaychar
            loop DisplayMiddleName
    
        ; output address
            lea dx, address_output
            call print
            lea si, address_input + 2
            mov cl, [address_input+1]
            DisplayAddress: 
            call displaychar
            loop DisplayAddress

        ; output course and year
            lea dx, courseYear_output
            call print

            lea si, course_input + 2
            mov cl, [course_input +1]
            DisplayCourse: 
            call displaychar
            loop DisplayCourse
            mov dl, ' '
            mov ah, 02h
            int 21h
            
            lea si, year_input + 2
            mov cl, [year_input + 1]
            DisplayYear: 
            call displaychar
            loop DisplayYear

        ; output birthdate
            lea dx, bday_output
            call print
            lea si, bdayMonth_input+2
            mov cl, [bdayMonth_input+1]
            DisplayBdayMonth:
            call displaychar
            loop DisplayBdayMonth
            mov dl, ' '
            mov ah, 02h
            int 21h
            
            lea si, bdayDay_input+2
            mov cl, [bdayDay_input+1]
            DisplayBdayDay: 
            call displaychar
            loop DisplayBdayDay
            mov dl, ','
            mov ah, 02h
            int 21h
            mov dl, ' '
            mov ah, 02h
            int 21h
            
            lea si, bdayYear_input +2
            mov cl, [bdayYear_input+1]
            DisplayBdayYear: 
            call displaychar
            loop DisplayBdayYear

        ; output email
            lea dx, email_output
            call print
            lea si, email_input+2
            mov cl, [email_input+1]
            DisplayEmail: 
            call displaychar
            loop DisplayEmail
    
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