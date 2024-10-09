; Hands-on Week 4
; Make a multiplication Table

.model small
.stack 100h
.data
    header db 'MULTIPLICATION TABLE$'
    creator db 'Created by: ASHLEY KEN COMANDAO$'
    date db 'Date: September 05, 2024$'

    line db '--------------------------------------------------------$'
    row1 db '|   X|   1|   2|   3|   4|   5|   6|   7|   8|   9|  10|$'
    row2 db '|   1|   1|   2|   3|   4|   5|   6|   7|   8|   9|  10|$'
    row3 db '|   2|   2|   4|   6|   8|  10|  12|  14|  16|  18|  20|$'
    row4 db '|   3|   3|   6|   9|  12|  15|  18|  21|  24|  27|  30|$'
    row5 db '|   4|   4|   8|  12|  16|  20|  24|  28|  32|  36|  40|$'
    row6 db '|   5|   5|  10|  15|  20|  25|  30|  35|  40|  45|  50|$'
    row7 db '|   6|   6|  12|  18|  24|  30|  36|  42|  48|  54|  60|$'
    row8 db '|   7|   7|  14|  21|  28|  35|  42|  49|  56|  63|  70|$'
    row9 db '|   8|   8|  16|  24|  32|  40|  48|  56|  64|  72|  80|$'
    row10 db '|   9|   9|  18|  27|  36|  45|  54|  63|  72|  81|  90|$'
    row11 db '|  10|  10|  20|  30|  40|  50|  60|  70|  80|  90| 100|$'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; print header info
        ; MULTIPLICATION TABLE
        mov ah, 09h
        lea dx, header
        int 21h

        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        
        ; CREATOR
        mov ah, 09h
        lea dx, creator
        int 21h

        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        
        ; DATE
        mov ah, 09h
        lea dx, date
        int 21h

        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; line
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row1
        mov ah, 09h
        mov bl, 67h 	; 6 = yellow bg, E = white fg
        mov cx, 56	; changes 45 block
        int 10h		; instruction to apply color	

        mov ah, 09h
        lea dx, row1
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h


    ; line 2
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row2
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row2
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 3
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row3
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6
        int 10h		

        mov ah, 09h
        lea dx, row3
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 4
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row4
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6
        int 10h		

        mov ah, 09h
        lea dx, row4
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 5
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row5
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row5
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line6
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row6
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row6
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line7
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row7
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row7
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line8
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row8
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6
        int 10h		

        mov ah, 09h
        lea dx, row8
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 9
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row9
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row9
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 10
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row10
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6	
        int 10h		

        mov ah, 09h
        lea dx, row10
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h
        

    ; line 11
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; print row11
        mov ah, 09h
        mov bl, 67h 	
        mov cx, 6
        int 10h		

        mov ah, 09h
        lea dx, row11
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h

    ; line
        mov ah, 09h
        lea dx, line
        int 21h

        ; display ENTER
        mov ah, 02h
        mov cl, 0Ah
        mov dl, cl	
        int 21h


; Exit program
mov ah, 4Ch
int 21h

main endp
end main