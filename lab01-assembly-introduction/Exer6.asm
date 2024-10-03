; Filename: Exer6.asm
; display emojis and blinking characters (blinking red heart)
; ASHLEY KEN COMANDAO
; Date: August 29,2024

.model small
.code
.stack 100
start:

	mov ah,09h
	mov bl,06h
	mov cx,1
	int 10h

	mov ah, 02h
	mov cl, 49h
	mov dl, cl
	int 21h

	mov ah,09h
	mov bl,84h
	mov cx,1
	int 10h

	mov ah,2
	mov dl, 03h
	int 21h

	mov ah,09h
	mov bl,05h
	mov cx,1
	int 10h

	mov ah, 02h
	mov cl, 55h
	mov dl, cl
	int 21h

int 27h
end start