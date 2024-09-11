; Filename: Exer1.asm
; Display Alphabet
; ASHLEY KEN COMANDAO
; Date: August 29, 2023

.model small
.code
.stack 100

start:

; LOWERCASE ALPHABET

	; display a
	mov ah, 02h
	mov cl, 61h
	mov dl, cl
	int 21h

	; display b
	mov ah, 02h
	mov cl, 62h
	mov dl, cl
	int 21h

	; display c
	mov ah, 02h
	mov cl, 63h
	mov dl, cl
	int 21h

	; display d
	mov ah, 02h
	mov cl, 64h
	mov dl, cl
	int 21h

	; display e
	mov ah, 02h
	mov cl, 65h
	mov dl, cl
	int 21h

	; display f
	mov ah, 02h
	mov cl, 66h
	mov dl, cl
	int 21h

	; display g
	mov ah, 02h
	mov cl, 67h
	mov dl, cl
	int 21h 

	; display h
	mov ah, 02h
	mov cl, 68h
	mov dl, cl
	int 21h 

	; display i
	mov ah, 02h
	mov cl, 69h
	mov dl, cl
	int 21h 

	; display j
	mov ah, 02h
	mov cl, 6Ah
	mov dl, cl
	int 21h 

	; display k
	mov ah, 02h
	mov cl, 6Bh
	mov dl, cl
	int 21h 

	; display l
	mov ah, 02h
	mov cl, 6Ch
	mov dl, cl
	int 21h 

	; display m
	mov ah, 02h
	mov cl, 6Dh
	mov dl, cl
	int 21h 

	; display n
	mov ah, 02h
	mov cl, 6Eh
	mov dl, cl
	int 21h 

	; display o
	mov ah, 02h
	mov cl, 6Fh
	mov dl, cl
	int 21h 

	; display p
	mov ah, 02h
	mov cl, 70h
	mov dl, cl
	int 21h

	; display q
	mov ah, 02h
	mov cl, 71h
	mov dl, cl
	int 21h

	; display r
	mov ah, 02h
	mov cl, 72h
	mov dl, cl
	int 21h

	; display s
	mov ah, 02h
	mov cl, 73h
	mov dl, cl
	int 21h

	; display t
	mov ah, 02h
	mov cl, 74h
	mov dl, cl
	int 21h

	; display u
	mov ah, 02h
	mov cl, 75h
	mov dl, cl
	int 21h

	; display v
	mov ah, 02h
	mov cl, 76h
	mov dl, cl
	int 21h

	; display w
	mov ah, 02h
	mov cl, 77h
	mov dl, cl
	int 21h

	; display x
	mov ah, 02h
	mov cl, 78h
	mov dl, cl
	int 21h

	; display y
	mov ah, 02h
	mov cl, 79h
	mov dl, cl
	int 21h

	; display z
	mov ah, 02h
	mov cl, 7Ah
	mov dl, cl
	int 21h

	; display NL
	mov ah, 02h
	mov cl, 0Ah
	mov dl, cl
	int 21h



; UPPERCASE ALPHABET

	; display A
	mov ah, 02h
	mov cl, 41H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display B
	mov ah, 02h
	mov cl, 42H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display C
	mov ah, 02h
	mov cl, 43H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display D
	mov ah, 02h
	mov cl, 44H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display E
	mov ah, 02h
	mov cl, 45H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display F
	mov ah, 02h
	mov cl, 46H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display G
	mov ah, 02h
	mov cl, 47H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display H
	mov ah, 02h
	mov cl, 48H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display I
	mov ah, 02h
	mov cl, 49H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display J
	mov ah, 02h
	mov cl, 4AH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display K
	mov ah, 02h
	mov cl, 4BH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display L
	mov ah, 02h
	mov cl, 4CH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display M
	mov ah, 02h
	mov cl, 4DH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display N
	mov ah, 02h
	mov cl, 4EH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display O
	mov ah, 02h
	mov cl, 4FH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display P
	mov ah, 02h
	mov cl, 50H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display Q
	mov ah, 02h
	mov cl, 51H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display R
	mov ah, 02h
	mov cl, 52H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display S
	mov ah, 02h
	mov cl, 53H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display T
	mov ah, 02h
	mov cl, 54H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display U
	mov ah, 02h
	mov cl, 55H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display V
	mov ah, 02h
	mov cl, 56H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display W
	mov ah, 02h
	mov cl, 57H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display X
	mov ah, 02h
	mov cl, 58H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display Y
	mov ah, 02h
	mov cl, 59H
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

	; display Z
	mov ah, 02h
	mov cl, 5AH
	mov dl, cl
	int 21h

	mov ah, 02h
	mov cl, 20h
	mov dl, cl
	int 21h

int 27h
end start