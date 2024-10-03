; Filename: EXER30.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 28, 2024
; Description: Make a program to input two integers. Compare the two integers. 
; Display which one is smaller and bigger of the two integers.


.model small
.stack 500h
.data
    max_len equ 10
    input db 6 dup('$')
    input2 db 6 dup('$')
    result dw 0               ; To store the resulting integer
    result2 dw 0
    remainder dw 0
    Ten DW 10 
    buffer DB 6 DUP(?)

    prompt db 13,10,'Input first integer: $'
    prompt2 db 'Input second integer: $'
    output_larger db 13,10,'The LARGER number is: $'
    output_smaller db 13,10,'The SMALLER number is: $'
    both_equal db 13,10,'BOTH INPUTS ARE EQUAL$'

.code
main:
    mov ax, @data       ; Initialize data segment
    mov ds, ax

    lea dx, prompt
    call printString

    lea dx, input
    call inputString
    
    lea dx, prompt2
    call printString

    lea dx, input2
    call inputString

    lea si, input  ; Load the address of input into SI
    mov bx, 0            ; Clear BX, this will hold the final result
    call convertLoop
    mov result, bx

    lea si, input2  ; Load the address of input into SI
    mov bx, 0            ; Clear BX, this will hold the final result
    call convertLoop
    mov result2, bx

    mov ax, result
    mov bx, result2
    cmp ax, result2
    je bothEqual
    jg skipswap

    mov result, bx
    mov result2, ax
skipswap:
    lea dx, output_larger
    call printString

    mov ax, result
    call ConvertToDec

    lea dx, buffer
    call printString

    lea dx, output_smaller
    call printString

    mov ax, result2
    call ConvertToDec

    lea dx, buffer
    call printString
    
    call ENDPROGRAM

bothEqual:
    lea dx, both_equal
    call printString
    
    call ENDPROGRAM
convertLoop:
    mov al, [si]         ; Get the next character from the string

    sub al, '0'          ; Convert ASCII character to a number (e.g., '3' -> 3)
    mov ah, 0            ; Clear the high byte of AX (AL contains the number)

    add bx, ax           ; Add the result to BX (BX holds the total number)

    inc si               ; Move to the next character in the string
    mov al, [si]

    cmp al, 0            ; Check if we've reached the null terminator
    je endConvert
    cmp al, '$'            ; Check if we've reached the null terminator
    je endConvert
    
    mov ax, 10
    mul bx
    mov bx,ax

    jmp convertLoop      ; Repeat the process for the next character

endConvert:
    ;mov result, bx       ; Store the final result in the result variable
    ret
    
ConvertToDec:
    MOV CX, 0           ; CX will hold the digit count

    ; Convert each digit
ConvertLoopT:
    MOV DX, 0           ; Clear DX
    DIV WORD PTR [Ten]  ; AX / 10, quotient in AX, remainder in DX
    ADD DL, '0'         ; Convert the remainder (digit) to ASCII
    PUSH DX             ; Save the digit on the stack
    INC CX              ; Increment digit count
    TEST AX, AX         ; Check if quotient is zero
    JNZ ConvertLoopT     ; Repeat if not zero

    ; Pop the digits off the stack into the buffer
    LEA DI, buffer      ; Load buffer address into DI

StoreDigitsInString:
    POP DX              ; Get the next digit
    MOV [DI], DL        ; Store the digit in the buffer
    INC DI              ; Move to the next position
    LOOP StoreDigitsInString   ; Repeat for all digits

    MOV BYTE PTR [DI], '$'
    ret

inputString:
    mov ah, 3Fh
    mov bx, 0
    mov cx, max_len
    int 21h

    mov si, dx
    add si, ax
    mov [si-2],'$'
    ret
printString:
    mov ah, 09h
    int 21h
    ret


ENDPROGRAM:

    ; Exit program
    mov ah, 4Ch
    int 21h

end main