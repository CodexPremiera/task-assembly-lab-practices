; Filename: EXER19.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: Create a program that asks the user to input 3 characters. 
; Then display each character on its own line.


.MODEL small
.STACK 200h
.DATA
    input1 db ? ; variable to store the input character
    input2 db ? 
    input3 db ? 
    prompt1 db 'Enter first character: $'
    prompt2 db 'Enter second character: $'
    prompt3 db 'Enter third character: $'
    output1 db 0ah, 'The first character is $'
    output2 db 0ah, 'The second character is $'
    output3 db 0ah, 'The third character is $'

.CODE
Main:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; input 1
        ; display prompt1
        mov dx, OFFSET prompt1
        mov ah, 09h
        int 21h

        ; read, store to input1
        mov ah, 01h             ; function to read a character
        int 21h                 ; call DOS to interrupt
        mov input1, al          ; store the character in input1

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

    ; input 2
        ; display prompt2
        mov dx, OFFSET prompt2
        mov ah, 09h
        int 21h

        ; read, store to input2
        mov ah, 01h
        int 21h          
        mov input2, al   

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl
        int 21h

    ; input 3
        ; display prompt3
        mov dx, OFFSET prompt3
        mov ah, 09h
        int 21h

        ; read, store to input3
        mov ah, 01h
        int 21h          
        mov input3, al

    ; output 1
        ; display output 1
        mov dx, OFFSET output1
        mov ah, 09h
        int 21h

        ; display input 1
        mov dl, input1          ; load the character to DL
        mov ah, 02h             ; function to display a character
        int 21h                 ; call DOS interrupt

    ; output 2
        ; display output 2
        mov dx, OFFSET output2
        mov ah, 09h
        int 21h

        ; display input 2
        mov dl, input2          
        mov ah, 02h             
        int 21h

    ; output 3
        ; display output 3
        mov dx, OFFSET output3
        mov ah, 09h
        int 21h

        ; display input 3
        mov dl, input3      
        mov ah, 02h             
        int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; exit program
    mov ax,4C00h ; function to exit program
    int 21h
    
END Main