; Filename: EXER37.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: October 17, 2024

.MODEL small
.STACK 100h
.DATA
    Prompt DB 'Enter a character? $'
    Input db ? 
    HasEnteredAMessage LABEL BYTE 
        DB 13,10,'You entered A.',13,10,'$'
    HasNotEnteredAMessage LABEL BYTE 
        DB 13,10,'You entered not A. $'

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
    jmp Ending

HasNotEnteredA:
    ; set for print (stored in dx) HasNotEnteredAMessage
    mov dx, OFFSET HasNotEnteredAMessage
    mov ah, 9
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

Ending:
    ; terminate program
        mov ah, 4ch
        int 21h

END ProgramStart