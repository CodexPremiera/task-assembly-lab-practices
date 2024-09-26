; Filename: EXER20.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: Create a program that asks user to input a character. Determine if
; character is letter A and display message “Yes, you have entered
; letter A.” If not, display “No, you have not entered letter A. You
; entered character _.”

.MODEL small
.STACK 100h
.DATA
    Prompt DB 'Enter a character? $'
    Input db ? 
    HasEnteredAMessage LABEL BYTE 
        DB 13,10,'Yes, you have entered letter A.',13,10,'$'
    HasNotEnteredAMessage LABEL BYTE 
        DB 13,10,'No, you have not entered letter A. You entered character $'

.CODE
ProgramStart:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; display the input prompt message
    mov dx, OFFSET Prompt
    mov ah, 09h
    int 21h

    ; get the character input
    mov ah, 1 
    int 21h   
    mov Input, al   

    ; if input (stored in Input) == 'A', jump to HasEnteredA
    cmp Input, 'A'
    jz HasEnteredA

    ; else, jump to Display
    jnz HasNotEnteredA


HasEnteredA:
    ; set for print (stored in dx) HasEnteredAMessage
    mov dx, OFFSET HasEnteredAMessage
    mov ah, 9
    int 21h
    jmp End

HasNotEnteredA:
    ; set for print (stored in dx) HasNotEnteredAMessage
    mov dx, OFFSET HasNotEnteredAMessage
    mov ah, 9
    int 21h

    ; display input
    mov dl, Input    
    mov ah, 02h             
    int 21h

    ; display dot
    mov ah, 02h
    mov cl, '.'
    mov dl, cl
    int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

End:
    ; terminate program
        mov ah, 4ch
        int 21h

END ProgramStart