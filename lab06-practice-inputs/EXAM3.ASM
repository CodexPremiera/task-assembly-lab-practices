; Filename: EXAM3.ASM
; CS243 Lab Hands-on Exam No. 3
; First Semester SY 2024-2025
; Student Name: ASHLEY KEN COMANDAO
; Date Finished: 10/03/2024

.model small
.stack 100h
.data

    p1 db "VOTER'S REGISTRATION FORM", 13,10, '$'
    p2 db 'Created by: ASHLEY KEN COMANDAO', 13, 10, '$'
    p3 db 'Date: 10/03/2024', 13, 10, '$'

    firstNamePrompt db 13, 10,'First Name: $'
    middleNamePrompt db 13, 10,'Middle Name: $'
    lastNamePrompt db 13, 10,'Family Name: $'
    genderPrompt db 13, 10,'Gender: $'

    bdayPrompt db 13,10,'Birthday$'
    bdayMonthPrompt db 13,10,' Month: $'
    bdayDayPrompt db 13,10,' Day: $'
    bdayYearPrompt db 13,10,' Year: $'
    
    addressPrompt db 13,10,'Address$'

    housePrompt db 13,10,' House Number: $'
    streetPrompt db 13,10,' Street: $'
    barangayPrompt db 13,10,' Barangay: $'
    cityPrompt db 13,10,' City: $'
    provincePrompt db 13,10,' Province: $'

    schoolNamePrompt db 13,10,'  Name of School: $'
    schoolYearPrompt db 13,10,'  Year Graduated: $'

    educationPrompt db 13,10,'Educational Background$'
    elemPrompt db 13,10,' Elementary$'
    juniorPrompt db 13,10,' Junior High School$'
    seniorPrompt db 13,10,' Senior High School$'
    collegePrompt db 13,10,' College$'

    firstNameInput db 50 dup('$')
    middleNameInput db 50 dup('$')
    lastNameInput db 50 dup('$')
    genderInput db 50 dup('$')

    bdayMonthInput db 50 dup('$')
    bdayDayInput db 50 dup('$')
    bdayYearInput db 50 dup('$')

    houseInput db 50 dup('$')
    streetInput db 50 dup('$')
    barangayInput db 50 dup('$')
    cityInput db 50 dup('$')
    provinceInput db 50 dup('$')

    elemName db 100 dup('$')
    elemYear db 50 dup('$')
    juniorName db 100 dup('$')
    juniorYear db 50 dup('$')
    seniorName db 100 dup('$')
    seniorYear db 50 dup('$')
    collegeName db 100 dup('$')
    collegeYear db 50 dup('$')
 
    prompt2 db 13,10,10,'SUMMARY OF INFORMATION', 13, 10
            db 'Please verify if all entries are correct.', 13, 10, '$'

    newline db 13, 10, 10, '$'
    prompt3 db 'Vote wisely!$'
    prompt4 db 13,10, 'Thank you for registering. $'
    
.code
    
main: 
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
	mov bl, 60h 
	mov cx, 25
	int 10h

    lea dx, p1
    call print

    mov ah, 09h
	mov bl, 20h 
	mov cx, 31
	int 10h

    lea dx, p2
    call print

    mov ah, 09h
	mov bl, 10h 
	mov cx, 16
	int 10h

    lea dx, p3
    call print
    

    ; NAME AND GENDER------------------------------------------

    lea dx, firstNamePrompt
    call print
    lea dx, firstNameInput
    call scan
    
    lea dx, middleNamePrompt
    call print
    lea dx, middleNameInput
    call scan
    
    lea dx, lastNamePrompt
    call print
    lea dx, lastNameInput
    call scan
    
    lea dx, genderPrompt
    call print
    lea dx, genderInput
    call scan

    ; BIRTHDAY---------------------------------------------

    lea dx, bdayPrompt
    call print
    
    lea dx, bdayMonthPrompt
    call print
    lea dx, bdayMonthInput
    call scan
    
    lea dx, bdayDayPrompt
    call print
    lea dx, bdayDayInput
    call scan
    
    lea dx, bdayYearPrompt
    call print
    lea dx, bdayYearInput
    call scan
    

    ; ADDRESS-------------------------

    lea dx, addressPrompt
    call print

    lea dx, housePrompt
    call print
    lea dx, houseInput
    call scan
    
    lea dx, streetPrompt
    call print
    lea dx, streetInput
    call scan

    lea dx, barangayPrompt
    call print
    lea dx, barangayInput
    call scan

    lea dx, cityPrompt
    call print
    lea dx, cityInput
    call scan

    lea dx, provincePrompt
    call print
    lea dx, provinceInput
    call scan


    ; EDUCATION -----------------------------------


    lea dx, educationPrompt
    call print

    ;------

    lea dx, elemPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, elemName
    call scan

    lea dx, schoolYearPrompt
    call print
    lea dx, elemYear
    call scan

    ;------
    
    lea dx, juniorPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, juniorName
    call scan

    lea dx, schoolYearPrompt
    call print
    lea dx, juniorYear
    call scan
    
    ;---------

    lea dx, seniorPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, seniorName
    call scan

    lea dx, schoolYearPrompt
    call print
    lea dx, seniorYear
    call scan
    
    ;---------

    lea dx, collegePrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, collegeName
    call scan

    lea dx, schoolYearPrompt
    call print
    lea dx, collegeYear
    call scan
    
    ;---------
    
    lea dx, prompt2
    call print

    ; PRINTING
    
    lea dx, firstNamePrompt
    call print
    lea dx, firstNameInput+2
    call print
    
    lea dx, middleNamePrompt
    call print
    lea dx, middleNameInput+2
    call print

    lea dx, lastNamePrompt
    call print
    lea dx, lastNameInput+2
    call print

    lea dx, genderPrompt
    call print
    lea dx, genderInput+2
    call print

    ;------------------

    lea dx, bdayPrompt
    call print
    
    lea dx, bdayMonthPrompt
    call print
    lea dx, bdayMonthInput+2
    call print
    
    lea dx, bdayDayPrompt
    call print
    lea dx, bdayDayInput+2
    call print
    
    lea dx, bdayYearPrompt
    call print
    lea dx, bdayYearInput+2
    call print
    
    ;----------------------

    lea dx, addressPrompt
    call print

    lea dx, housePrompt
    call print
    lea dx, houseInput+2
    call print
    
    lea dx, streetPrompt
    call print
    lea dx, streetInput+2
    call print

    lea dx, barangayPrompt
    call print
    lea dx, barangayInput+2
    call print

    lea dx, cityPrompt
    call print
    lea dx, cityInput+2
    call print

    lea dx, provincePrompt
    call print
    lea dx, provinceInput+2
    call print

    ; EDUCATION -----------------------------------

    lea dx, educationPrompt
    call print

    ;------

    lea dx, elemPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, elemName+2
    call print

    lea dx, schoolYearPrompt
    call print
    lea dx, elemYear+2
    call print

    ;------
    
    lea dx, juniorPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, juniorName+2
    call print

    lea dx, schoolYearPrompt
    call print
    lea dx, juniorYear+2
    call print
    
    ;---------

    lea dx, seniorPrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, seniorName+2
    call print

    lea dx, schoolYearPrompt
    call print
    lea dx, seniorYear+2
    call print
    
    ;---------

    lea dx, collegePrompt
    call print

    lea dx, schoolNamePrompt
    call print
    lea dx, collegeName+2
    call print

    lea dx, schoolYearPrompt
    call print
    lea dx, collegeYear+2
    call print

    ;---------

    lea dx, newline
    call print

    mov ah, 09h
	mov bl, 0ceh 
	mov cx, 12
	int 10h

    lea dx, prompt3
    call print

    lea dx, prompt4
    call print

    mov ax, 4C00h
    int 21h


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


end main