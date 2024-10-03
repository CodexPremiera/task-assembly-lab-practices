; Filename: Exer5.asm
; Displaying single chraracters, numbers, & symbols
; ASHLEY KEN COMANDAO
; Date: August 29, 2024

.model small
.code
.stack 100

start:
	; First Row
    
    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 8 ;(no of characters that will change color)
	int 10h;
    
    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	
	mov dl, cl
	int 21h

    ; 2nd Row

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 3 ;(no of characters that will change color)
	int 10h;
    
    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 4Eh ;( 3 - aqua, E - light yellow)
	mov cx, 2 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 3 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	
	mov dl, cl
	int 21h

    ;3rd Row

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 1 ;(no of characters that will change color)
	int 10h;
    
    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 4Eh ;( 3 - aqua, E - light yellow)
	mov cx, 6 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 1 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	
	mov dl, cl
	int 21h

    ; 4th row

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 3 ;(no of characters that will change color)
	int 10h;
    
    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 4Eh ;( 3 - aqua, E - light yellow)
	mov cx, 2 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 3 ;(no of characters that will change color)
	int 10h;

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	
	mov dl, cl
	int 21h

    ;  Last Row
    
    mov ah, 09h
	mov bl, 1Eh ;( 3 - aqua, E - light yellow)
	mov cx, 8 ;(no of characters that will change color)
	int 10h;
    
    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 32d	
	mov dl, cl
	int 21h

    mov ah, 02h
	mov cl, 0Ah	
	mov dl, cl
	int 21h

int 27h ; terminate
end start ; end program
