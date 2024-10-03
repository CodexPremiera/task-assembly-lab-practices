; Filename: Exer3.asm
; ASHLEY KEN COMANDAO
; Date: August 


.model small
.stack 100 

.data

	numbers db '1 2 3 4 5 6 7 8 9 $'
	churva db '! * # $'
	sumpay db ' % ^ & * ( )$'
	churva2 db '- _ + = { } [ ] < ?$'

.code
main proc
    mov ax, @data
    mov ds, ax

	mov dx, offset numbers
  	mov ah, 09h
  	int 21h
	
	mov ah,02h
	mov cl,	0Ah
	mov dl,cl
	int 21h

	mov dx, offset churva
   	mov ah, 09h
   	int 21h

	mov ah, 02h
	mov cl, 24h
	mov dl,cl
	int 21h

	mov dx, offset sumpay
   	mov ah, 09h
   	int 21h

	
	mov ah,02h
	mov cl,	0Ah
	mov dl,cl
	int 21h

	mov dx, offset churva2
    	mov ah, 09h
   	int 21h


    mov ah, 4Ch
    int 21h
main endp
end main
