; Filename: Exer8.asm
; Create your own multicolored character with blinking parts
; ASHLEY KEN COMANDAO
; Date: September 5, 2024

.model small
.data
    blank_text db '--------------$', 0

.code
.stack 100

start:

; row 1
    ; paint white
	mov ah, 09h
	mov bl, 71h 	; 7 = white bg, 0 = black fg
	mov cx, 14	; changes 14 blocks
	int 10h		; instruction to apply color

    ; display blank_text
    mov ah, 09h
    lea dx, blank_text
    int 21h
    
    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

; row 2
    ; paint white
	mov ah, 09h
	mov bl, 71h 	; 7 = white bg, 0 = black fg
	mov cx, 14	; changes 14 blocks
	int 10h		; instruction to apply color

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    
    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

int 27h
end start
