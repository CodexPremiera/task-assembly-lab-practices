; Filename: EXAM3.ASM
; CS243 Lab Hands-on Exam No. 3
; First Semester SY 2024-2025
; Student Name: ASHLEY KEN COMANDAO
; Date Finished: OCTOBER 3, 2024

.model small
.stack 100h
.data
    heading db "VOTER'S REGISTRATION FORM", 13,10
            db 'Created by: ASHLEY KEN COMANDAO', 13, 10, 10
            db 'Date: OCTOBER 3, 2024:', 13, 10, '$'
            db  13, 10, '$'
            db 'Please enter the following data: $'
            db  13, 10, '$'
    
    firstName_prompt db 13, 10,'First Name: $'
    middleName_prompt db 13, 10,'Middle Name: $'
    lastName_prompt db 13, 10,'Last Name: $'
    gender_prompt db 13, 10,'Gender: $'

    bday_prompt         db 13,10,'Birthday$'
    bdayMonth_prompt    db 13,10,'  Month: $'
    bdayDay_prompt      db 13,10,'  Day: $'
    bdayYear_prompt     db 13,10,'  Year: $'

    address_prompt      db 13,10,'Address $'
    address_house_num   db 13,10,'  House Number: $'
    address_street      db 13,10,'  Street: $'
    address_barangay    db 13,10,'  Barangay: $'
    address_city        db 13,10,'  City: $'
    address_province    db 13,10,'  Province: $'

    education_prompt            db 13,10,'Educational Background $'
    education_elem_prompt       db 13,10,'  Elementary $'
    education_jhs_prompt        db 13,10,'  Junior High School $'
    education_shs_prompt        db 13,10,'  Senior High School $'
    education_college_prompt     db 13,10,'  College $'

    education_school_prompt     db 13,10,'    Name of School $'
    education_year_prompt       db 13,10,'    Year Graduated:  $'
    education_course_prompt     db 13,10,'    Course:  $'

    summary db 13,10,10, "SUMMARY OF INFORMATION", 13,10
            db 'Please verify if all entries are correct.', 13, 10, 10
            db  13, 10, '$'
    
    firstName_input db 50, 50 dup(?)
    middleName_input db 50, 50 dup(?)
    lastName_input db 50, 50 dup(?)
    gender_input db 20, 20 dup(?)

    bdayMonth_input db 20, 20 dup(?)
    bdayDay_input db 10, 10 dup(?)
    bdayYear_input db 20, 20 dup(?)

    address_house_num_input db 50, 50 dup(?)
    address_street_input db 50, 50 dup(?)
    address_barangay_input db 50, 50 dup(?)
    address_city_input db 50, 50 dup(?)
    address_province_input db 50, 50 dup(?)
    
    elem_school_input db 150, 150 dup(?)
    jhs_school_input db 150, 150 dup(?)
    shs_school_input db 150, 150 dup(?)
    college_school_input db 150, 150 dup(?)
    
    elem_year_input db 20, 20 dup(?)
    jhs_year_input db 20, 20 dup(?)
    shs_year_input db 20, 20 dup(?)
    college_year_input db 20, 20 dup(?)
    
    college_course_input db 50, 50 dup(?)

    thanks_msg  db 13,10,10, 'Vote Wisely',13,10
                db 'Thank you for registering. ',13,10, '$'
    
.code
main: 
    mov ax, @data
    mov ds, ax
    
    ; PRINT HEADER
        lea dx, heading
        call print
    
    ; PRINT AND READ PROMPT
        ; input name
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

        ; input gender
            lea dx, gender_prompt
            call print
            lea dx, gender_input
            call scan
        
        ; input address
            lea dx, address_prompt
            call print

            lea dx, address_house_num
            call print
            lea dx, address_house_num_input
            call scan

            lea dx, address_street
            call print
            lea dx, address_street_input
            call scan

            lea dx, address_barangay
            call print
            lea dx, address_barangay_input
            call scan

            lea dx, address_city
            call print
            lea dx, address_city_input
            call scan

            lea dx, address_province
            call print
            lea dx, address_province_input
            call scan

        ; input educational background
        lea dx, education_prompt
        call print

            ; elementary
                lea dx, education_elem_prompt
                call print

                lea dx, education_school_prompt
                call print
                lea dx, elem_school_input
                call scan

                lea dx, education_year_prompt
                call print
                lea dx, elem_year_input
                call scan

            ; junior high school
                lea dx, education_jhs_prompt
                call print

                lea dx, education_school_prompt
                call print
                lea dx, jhs_school_input
                call scan

                lea dx, education_year_prompt
                call print
                lea dx, jhs_year_input
                call scan

            ; senior high school
                lea dx, education_shs_prompt
                call print

                lea dx, education_school_prompt
                call print
                lea dx, shs_school_input
                call scan

                lea dx, education_year_prompt
                call print
                lea dx, shs_year_input
                call scan

            ; college
                lea dx, education_college_prompt
                call print

                lea dx, education_school_prompt
                call print
                lea dx, college_school_input
                call scan

                lea dx, education_course_prompt
                call print
                lea dx, college_course_input
                call scan

                lea dx, education_year_prompt
                call print
                lea dx, college_year_input
                call scan
    
    ; SUMMARY PROMPT
        lea dx, summary
        call print
    
    ; PRINT OUTPUT
        ; output name
            lea dx, firstName_prompt
            call print
            lea si, firstName_input + 2
            mov cl, [firstName_input+1]
            DisplayFirstName:
            call displaychar
            loop DisplayFirstName

            lea dx, middleName_prompt
            call print
            lea si, middleName_input + 2
            mov cl, [middleName_input+1]
            DisplayMiddleName:
            call displaychar
            loop DisplayMiddleName
            
            lea dx, lastName_prompt
            call print
            lea si, lastName_input + 2
            mov cl, [lastName_input+1]
            DisplayLastName:
            call displaychar
            loop DisplayLastName
        
        ; output gender
            lea dx, gender_prompt
            call print
            lea si, gender_input + 2
            mov cl, [gender_input+1]
            DisplayGender:
            call displaychar
            loop DisplayGender

        





    
    ; PRINT THANKS
        call endline
        lea dx, thanks_msg
        call print

    ; EXIT PROGRAM
        mov ax, 4C00h ; function to exit program
        int 21h
    
; FUNCTIONS
    endline: 
    push ax 
    push bx  
    mov ah, 02h 
    mov dl, 0Ah 
    int 21h 
    pop bx  
    pop ax  
    ret 

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