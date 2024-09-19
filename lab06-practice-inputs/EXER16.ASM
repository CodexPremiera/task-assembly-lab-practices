; Filename: EXER16.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will get character input and determine 
; if input is 'y' or 'Y' to display good morning message else display good afternoon message.

.MODEL small
.STACK 100h
.DATA
    TimePrompt DB 'Is it after 12 noon (Y/N)?$'
    GoodMorningMessage LABEL BYTE 
        DB 13,10,'Good morning, world!',13,10,'$'
    GoodAfternoonMessage LABEL BYTE 
        DB 13,10,'Good afternoon, world!',13,10,'$'

.CODE
ProgramStart:
    ; initialize the data segment
    mov ax, @data
    mov ds, ax

    ; display the input prompt message
    mov dx, OFFSET TimePrompt
    mov ah, 09h
    int 21h

    ; get the character input
    mov ah, 1 
    int 21h

    ; if input (stored in al) == 'N', jump to IsAfternoon
    cmp al, 'N'
    jz IsAfternoon

    ; else if input (stored in al) == 'Y', jump to IsMorning
    cmp al, 'Y'
    jnz IsMorning


IsAfternoon:
    ; set for print (stored in dx) GoodAfternoonMessage
    mov dx, OFFSET GoodAfternoonMessage
    jmp DisplayGreeting

IsMorning:
    ; set for print (stored in dx) GoodMorningMessage
    mov dx, OFFSET GoodMorningMessage


DisplayGreeting:
    ; print greeting stored in dx
    mov ah, 9
    int 21h

    ; terminate program
        mov ah, 4ch
        int 21h

END ProgramStart