; Filename: EXER15.ASM
; Programmer: ASHLEY KEN COMANDAO
; Date: September 19, 2024
; Description: This assembly language program will continuously get character input and display back input until Enter key is pressed.

.MODEL small
.STACK 200h
.DATA

.CODE
ProgramStart:
    EchoLoop:
        ; get the character input
        mov ah, 1 
        int 21h

        ; if key == enter, go to EchoDone
        cmp al , 13
        jz EchoDone

        ; else print the key
        mov dl, al
        mov ah, 2
        int 21h

        ; loop again
        jmp EchoLoop

    EchoDone:
        ; terminate program
        mov ah, 4ch
        int 21h

END ProgramStart