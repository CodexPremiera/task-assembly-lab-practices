; Filename: Exer4.asm
; ASHLEY KEN COMANDAO
; Date: August 29, 2023

.model small
.stack 100 

.data

	L1 db 'College $'
	L2 db 'of$'
	L3 db 'Computer$'
	L4 db 'Studies $'

.code
main proc
    mov ax, @data
    mov ds, ax

	mov ah,09h
	mov bl,3eh
	mov cx,7
	int 10h

	mov dx, offset L1
  	mov ah, 09h
  	int 21h
	
	mov ah,02h
	mov cl,	0Ah
	mov dl,cl
	int 21h
	
	mov ah,09h
	mov bl,4eh
	mov cx,2
	int 10h

	mov dx, offset L2
   	mov ah, 09h
   	int 21h

	mov ah,02h
	mov cl,	0Ah
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,6eh
	mov cx,8
	int 10h

	mov dx, offset L3
   	mov ah, 09h
   	int 21h

	
	mov ah,02h
	mov cl,	0Ah
	mov dl,cl
	int 21h

	mov ah,09h
	mov bl,2fh
	mov cx,7
	int 10h

	mov dx, offset L4
    	mov ah, 09h
   	int 21h


    mov ah, 4Ch
    int 21h
main endp
end main

