; Filename: EXER25.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: SEPTEMBER 27, 2024 
; Description: This assembly language program will get 3 string inputs and
; display back the 3 strings on separate lines.

.MODEL SMALL
.STACK 100h
.DATA
    input1 DB 50 DUP('$') ; Reserve 50 bytes for input string
    input2 DB 50 DUP('$')
    input3 DB 50 DUP('$')

    prompt1 DB 'Enter first string: $'
    prompt2 DB 'Enter second string: $'
    prompt3 DB 'Enter third string: $'

    output1 DB 'You entered first string: $'
    output2 DB 'You entered second string: $'
    output3 DB 'You entered third string: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; PROMPTS
        ; first string = input(prompt1)
        LEA DX, prompt1
        MOV AH, 09h ; DOS function to display a string
        INT 21h

        LEA DX, input1
        MOV AH, 0Ah ; DOS function to read a string
        INT 21h

        mov ah,02h
        mov cl,0Ah ; 0Ah is new line
        mov dl,cl
        int 21h

        ; second string = input(prompt2)
        LEA DX, prompt2
        MOV AH, 09h
        INT 21h

        LEA DX, input2
        MOV AH, 0Ah 
        INT 21h

        mov ah,02h
        mov cl,0Ah 
        mov dl,cl
        int 21h

        ; third string = input(prompt3)
        LEA DX, prompt3
        MOV AH, 09h
        INT 21h

        LEA DX, input3
        MOV AH, 0Ah 
        INT 21h

        mov ah,02h
        mov cl,0Ah 
        mov dl,cl
        int 21h

    ; OUTPUT
        ; print(first_string)
        LEA DX, output1
        MOV AH, 09h ; DOS function to display a string
        INT 21h

        LEA DX, input1 + 2 ; Skip the first two bytes (length and max length)
        MOV AH, 09h 
        INT 21h

        mov ah,02h
        mov cl,0Ah ; 0Ah is new line
        mov dl,cl
        int 21h

        ; print(second_string)
        LEA DX, output2
        MOV AH, 09h 
        INT 21h

        LEA DX, input2 + 2 
        MOV AH, 09h 
        INT 21h

        mov ah,02h
        mov cl,0Ah 
        mov dl,cl
        int 21h

        ; print(third_string)
        LEA DX, output3
        MOV AH, 09h 
        INT 21h

        LEA DX, input3 + 2 
        MOV AH, 09h 
        INT 21h

        mov ah,02h
        mov cl,0Ah 
        mov dl,cl
        int 21h

    ; EXIT PROGRAM
        mov ax, 4C00h ; function to exit program
        int 21h

MAIN ENDP
END MAIN