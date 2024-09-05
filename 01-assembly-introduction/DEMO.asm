; Filename: Demo.asm
; Displaying single characters, numbers, and symbols
; ASHLEY KEN COMANDAO
; Date: August 29, 2023

.model small
.code 			; code segment
.stack 100		; define stack size

start: 			; source code

	; display E
	mov ah, 02h
	mov cl, 45h
	mov dl, cl	
	int 21h

	; display L
	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl	
	int 21h

	; display L
	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl	
	int 21h

	; display 0
	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl	
	int 21h

	; display SPACE
	mov ah, 02h
	mov cl, 20h
	mov dl, cl	
	int 21h

	; display W
	mov ah, 02h
	mov cl, 57h
	mov dl, cl	
	int 21h

	; display 0
	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl	
	int 21h

	; display R
	mov ah, 02h
	mov cl, 52h
	mov dl, cl	
	int 21h

	; display L
	mov ah, 02h
	mov cl, 4Ch
	mov dl, cl	
	int 21h

	; display D
	mov ah, 02h
	mov cl, 44h
	mov dl, cl	
	int 21h

	; display !
	mov ah, 02h
	mov cl, 21h
	mov dl, cl	
	int 21h



	; display NEW LINE
	mov ah, 02h
	mov cl, 0Ah
	mov dl, cl	
	int 21h



	; display T
	mov ah, 02h
	mov cl, 54h
	mov dl, cl	
	int 21h

	; display H
	mov ah, 02h
	mov cl, 48h
	mov dl, cl	
	int 21h

	; display A
	mov ah, 02h
	mov cl, 41h
	mov dl, cl	
	int 21h

	; display N
	mov ah, 02h
	mov cl, 4Eh
	mov dl, cl	
	int 21h

	; display K
	mov ah, 02h
	mov cl, 4Bh
	mov dl, cl	
	int 21h

	; display SPACE
	mov ah, 02h
	mov cl, 20h
	mov dl, cl	
	int 21h

	; display Y
	mov ah, 02h
	mov cl, 59h
	mov dl, cl	
	int 21h

	; display O
	mov ah, 02h
	mov cl, 4Fh
	mov dl, cl	
	int 21h

	; display U
	mov ah, 02h
	mov cl, 55h
	mov dl, cl	
	int 21h

	; display !
	mov ah, 02h
	mov cl, 21h
	mov dl, cl	
	int 21h



	; change bg and fg colors
	mov ah, 09h
	mov bl, 3Eh 	; 3 = aqua bg, E = light yellow fg
	mov cx, 1	; changes 1 block
	int 10h		; instruction to apply color	

	; display H
	mov ah, 02h	; ready the hardware for display
	mov cl, 48h  	; ready the data in the count register (48h is capital H in hex)
	mov dl, cl	; transfer data in counter to data register
	int 21h		; read character in std input



	; blink block/s
	mov ah, 09h
	mov bl, 84h 	; 8 = blink, 4 = red fg
	mov cx, 1	; changes 1 block
	int 10h		; instruction to apply color	

	; display H
	mov ah, 2	; 
	mov dl, 03h  	; 03 = heart
	int 21h

	
int 27h 		; terminate
end start 		; end program

; ah = read character from std input
; 02h = write character to std input
; cl = cursor bottom line
; dl = character to write/print/display
