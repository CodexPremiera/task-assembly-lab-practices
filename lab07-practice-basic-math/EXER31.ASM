; Filename: EXER31.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 28, 2024
; Description: Make a program to input one integer. Display numbers from 1 
; up until that number, one per line


.MODEL SMALL
.STACK 100h
.DATA
    num DB ?            ; Variable to store the input number
    msg DB 'Enter a number: $'  ; Prompt message
    newline DB 0Dh, 0Ah, '$'     ; Newline characters

.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    LEA DX, msg
    MOV AH, 09h
    INT 21h

    ; Read input number
    MOV AH, 01h        ; Function to read a character
    INT 21h
    SUB AL, '0'        ; Convert ASCII to integer
    MOV num, AL        ; Store input number

    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Print numbers from 1 to num
    MOV CL, num        ; Load the count in CL
    MOV BL, 1          ; Start from 1

PRINT_LOOP:
    ; Convert BL to ASCII
    ADD BL, '0'        ; Convert to ASCII
    MOV DL, BL         ; Move character to DL
    MOV AH, 02h        ; Function to print a character
    INT 21h            ; Call DOS interrupt

    ; Print newline
    LEA DX, newline
    MOV AH, 09h
    INT 21h

    ; Increment BL and check if less than or equal to num
    SUB BL, '0'        ; Convert back to integer
    INC BL             ; Increment
    CMP BL, num       ; Compare with input number
    JBE PRINT_LOOP     ; If BL <= num, loop again

    ; Exit program
    MOV AX, 4C00h      ; DOS terminate program
    INT 21h

MAIN ENDP
END MAIN