; Filename: MIDTERM.ASM
; CS243 Lab Hands-on Midterm Exam 
; First Semester SY 2024-2025
; Student Name: ASHLEY KEN A. COMANDAO
; Date Finished: October 10, 2024
.model small
.stack 100h
.data

    p1 db "Online Grocery Order Form", 13,10, '$'
    p2 db 'Programmer: ASHLEY KEN COMANDAO', 13, 10, '$'
    p3 db 'Date: 10/03/2024', 13, 10, '$'
    
    addressPrompt db 13,10,'Please enter your 5 grocery items:$'

    housePrompt db 13,10,'Item No. 1: $'
    streetPrompt db 13,10,'Item No. 2: $'
    barangayPrompt db 13,10,'Item No. 3: $'
    cityPrompt db 13,10,'Item No. 4: $'
    provincePrompt db 13,10,'Item No. 5: $'

    houseInput db 50 dup('$')
    streetInput db 50 dup('$')
    barangayInput db 50 dup('$')
    cityInput db 50 dup('$')
    provinceInput db 50 dup('$')

    houseOutput db 'Item No. 1: $'
    streetOutput db 'Item No. 2: $'
    barangayOutput db 'Item No. 3: $'
    cityOutput db 'Item No. 4: $'
    provinceOutput db 'Item No. 5: $'

 
    prompt2 db '             ORDER SUMMARY             ', 13, 10, '$'

    newline db 13, 10, 10, '$'
    newline2 db 13, 10, '$'
    space db ' $'
    prompt3 db 'Thank you for shopping!', 13, 10, '$'
    prompt4 db 'Order again soon.', 13, 10, '$'
    
.code
    
main:     
    mov ax, @data
    mov ds, ax

    ; HEADER -------------------------

    lea dx, p1
    call print

    lea dx, p2
    call print

    lea dx, p3
    call print
    
    

    ; ITEM ORDER INPUT -------------------------

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

    ; ORDER SUMMARY ----------------------
    
    lea dx, newline
    call print

    lea dx, space
    call print
    mov ah, 09h
	mov bl, 46h 
	mov cx, 40
	int 10h

    lea dx, prompt2
    call print


    ; PRINTING ORDER ----------------------

    lea dx, space
    call print

    mov ah, 09h
	mov bl, 77h 
	mov cx, 1
	int 10h
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 70h 
	mov cx, 39
	int 10h

    lea dx, houseOutput
    call print
    lea dx, houseInput+2
    call print
    lea dx, newline2
    call print

    ; -----
    
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 77h 
	mov cx, 1
	int 10h
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 30h 
	mov cx, 39
	int 10h

    lea dx, streetOutput
    call print
    lea dx, streetInput+2
    call print
    lea dx, newline2
    call print

    ; -----
    
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 77h 
	mov cx, 1
	int 10h
    lea dx, space
    call print
    
    mov ah, 09h
	mov bl, 70h 
	mov cx, 39
	int 10h

    lea dx, barangayOutput
    call print
    lea dx, barangayInput+2
    call print
    lea dx, newline2
    call print

    ; -----
    
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 77h 
	mov cx, 1
	int 10h
    lea dx, space
    call print
    
    mov ah, 09h
	mov bl, 30h 
	mov cx, 39
	int 10h

    lea dx, cityOutput
    call print
    lea dx, cityInput+2
    call print
    lea dx, newline2
    call print

    ; -----
    
    lea dx, space
    call print

    mov ah, 09h
	mov bl, 77h 
	mov cx, 1
	int 10h
    lea dx, space
    call print
    
    mov ah, 09h
	mov bl, 70h 
	mov cx, 39
	int 10h

    lea dx, provinceOutput
    call print
    lea dx, provinceInput+2
    call print
    lea dx, newline2
    call print

    ;-------------------------------------

    lea dx, newline
    call print

    lea dx, prompt3
    call print

    ; order again soon
    mov ah, 09h
	mov bl, 0ceh   
	mov cx, 17
	int 10h

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