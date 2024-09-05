; Filename: Exer2.asm
; Display My Details
; ASHLEY KEN COMANDAO
; Date: August 29, 2023

.model small
.code
.stack

start:

; DISPLAY MY FULLNAME
    ; display A
    mov ah, 02h
    mov cl, 41h
    mov dl, cl
    int 21h
    
    ; display s
    mov ah, 02h
    mov cl, 73h
    mov dl, cl
    int 21h
    
    ; display h
    mov ah, 02h
    mov cl, 68h
    mov dl, cl
    int 21h

    ; display l
    mov ah, 02h
    mov cl, 6Ch
    mov dl, cl
    int 21h
    
    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display y
    mov ah, 02h
    mov cl, 79h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h


    ; display K
    mov ah, 02h
    mov cl, 4Bh
    mov dl, cl
    int 21h
    
    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display C
    mov ah, 02h
    mov cl, 43h
    mov dl, cl
    int 21h
    
    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display m
    mov ah, 02h
    mov cl, 6Dh
    mov dl, cl
    int 21h

    ; display a
    mov ah, 02h
    mov cl, 61h
    mov dl, cl
    int 21h
    
    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display d
    mov ah, 02h
    mov cl, 64h
    mov dl, cl
    int 21h
    
    ; display a
    mov ah, 02h
    mov cl, 61h
    mov dl, cl
    int 21h

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h


; DISPLAY MY COURSE AND YEAR
    ; display B
    mov ah, 02h
    mov cl, 42h
    mov dl, cl
    int 21h

    ; display a
    mov ah, 02h
    mov cl, 61h
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h

    ; display h
    mov ah, 02h
    mov cl, 68h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display l
    mov ah, 02h
    mov cl, 6Ch
    mov dl, cl
    int 21h

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 72h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display f
    mov ah, 02h
    mov cl, 66h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display S
    mov ah, 02h
    mov cl, 53h
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display C
    mov ah, 02h
    mov cl, 43h
    mov dl, cl
    int 21h

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display m
    mov ah, 02h
    mov cl, 6Dh
    mov dl, cl
    int 21h

    ; display p
    mov ah, 02h
    mov cl, 70h
    mov dl, cl
    int 21h

    ; display u
    mov ah, 02h
    mov cl, 75h
    mov dl, cl
    int 21h

    ; display t
    mov ah, 02h
    mov cl, 74h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 72h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    

    ; display S
    mov ah, 02h
    mov cl, 53h
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h


    ; display 3
    mov ah, 02h
    mov cl, 33h
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 72h
    mov dl, cl
    int 21h

    ; display d
    mov ah, 02h
    mov cl, 64h
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

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display a
    mov ah, 02h
    mov cl, 61h
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 72h
    mov dl, cl
    int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h


; DISPLAY MY COLLEGE
    ; display C
    mov ah, 02h
    mov cl, 43h
    mov dl, cl
    int 21h

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display l
    mov ah, 02h
    mov cl, 6Ch
    mov dl, cl
    int 21h

    ; display l
    mov ah, 02h
    mov cl, 6Ch
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display g
    mov ah, 02h
    mov cl, 67h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h


    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display f
    mov ah, 02h
    mov cl, 66h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h


    ; display C
    mov ah, 02h
    mov cl, 43h
    mov dl, cl
    int 21h

    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display m
    mov ah, 02h
    mov cl, 6Dh
    mov dl, cl
    int 21h

    ; display p
    mov ah, 02h
    mov cl, 70h
    mov dl, cl
    int 21h

    ; display u
    mov ah, 02h
    mov cl, 75h
    mov dl, cl
    int 21h

    ; display t
    mov ah, 02h
    mov cl, 74h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 72h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    
    ; display S
    mov ah, 02h
    mov cl, 53h
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

    ; display d
    mov ah, 02h
    mov cl, 64h
    mov dl, cl
    int 21h

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h
    
    ; display s
    mov ah, 02h
    mov cl, 73h
    mov dl, cl
    int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h


; DISPLAY MY UNIVERSITY

    ; display C
    mov ah, 02h
    mov cl, 43h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display b
    mov ah, 02h
    mov cl, 62h
    mov dl, cl
    int 21h
    
    ; display u
    mov ah, 02h
    mov cl, 75h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h

    ; display I
    mov ah, 02h
    mov cl, 49h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
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

    ; display i
    mov ah, 02h
    mov cl, 69h
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

    ; display t
    mov ah, 02h
    mov cl, 74h
    mov dl, cl
    int 21h
    
    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h
    
    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display f
    mov ah, 02h
    mov cl, 66h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h

    ; display T
    mov ah, 02h
    mov cl, 54h
    mov dl, cl
    int 21h
    
    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display c
    mov ah, 02h
    mov cl, 63h
    mov dl, cl
    int 21h
    
    ; display h
    mov ah, 02h
    mov cl, 68h
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

    ; display l
    mov ah, 02h
    mov cl, 6Ch
    mov dl, cl
    int 21h
    
    ; display o
    mov ah, 02h
    mov cl, 6Fh
    mov dl, cl
    int 21h

    ; display g
    mov ah, 02h
    mov cl, 67h
    mov dl, cl
    int 21h

    ; display y
    mov ah, 02h
    mov cl, 79h
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h

    ; display -
    mov ah, 02h
    mov cl, 2Dh
    mov dl, cl
    int 21h

    ; display SPACE
    mov ah, 02h
    mov cl, 20h
    mov dl, cl
    int 21h

    ; display U
    mov ah, 02h
    mov cl, 55h
    mov dl, cl
    int 21h

    ; display n
    mov ah, 02h
    mov cl, 6Eh
    mov dl, cl
    int 21h

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display v
    mov ah, 02h
    mov cl, 76h
    mov dl, cl
    int 21h

    ; display e
    mov ah, 02h
    mov cl, 65h
    mov dl, cl
    int 21h

    ; display r
    mov ah, 02h
    mov cl, 76h
    mov dl, cl
    int 21h

    ; display s
    mov ah, 02h
    mov cl, 73h
    mov dl, cl
    int 21h

    ; display i
    mov ah, 02h
    mov cl, 69h
    mov dl, cl
    int 21h

    ; display t
    mov ah, 02h
    mov cl, 74h
    mov dl, cl
    int 21h

    ; display y
    mov ah, 02h
    mov cl, 79h
    mov dl, cl
    int 21h

    ; display ENTER
    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    
int 27h
end start