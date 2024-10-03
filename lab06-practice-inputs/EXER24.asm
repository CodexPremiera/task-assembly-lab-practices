; Filename: EXER22.ASM
; Programmer Name: ASHLEY KEN COMANDAO
; Date: September 20, 2024

.model small
.stack 100h
.data
    
header db 'Cebu Institute of Technology - University', 0Dh, 0Ah
            db 'VEHICLE STICKER APPLICATION FORM', 0Dh, 0Ah
            db 'Please enter the needed information:', 0Dh, 0Ah, 0Dh, 0Ah, '$'

menu    db '                                                                         ', 13, 10
        db '                   Cebu Institute of Technology - University               ', 13, 10
        db '                       VEHICLE STICKER APPLICATION FORM                   ', 13, 10
        db '                        Please fill out the form below.                    ', 13, 10, 10
        db '   Personnel Type:                      V    Vehicle Sticker Type:          V ', 13, 10, 10
        db '   Name of Applicant/Driver:                ID Number:                      ', 13, 10, 10
        db '   Mobile Number:                           Address:                        ', 13, 10, 10
        db '   Vehicle Make(s)/Brand:                   Plate Number:                   ', 13, 10, 10
        db '   Vehicle Color:                       V    Vehicle Type:                  V ', 13, 10, 10, 10
        db '                                    SUBMIT                      ', 13, 10, 10
        db '                      Copyright 2024 ASHLEY KEN A. COMANDAO                 ', 13, 10, 10, 10
        db '                                  Thank You!            ', 13, 10, '$'
 
    summary db 'SUMMARY$'

    prompt1 db 'Personnel Type: $'
    prompt2 db 13, 10,'Name of Applicant/Driver: $'
    prompt3 db 13, 10,'Mobile Number: $'
    prompt4 db 13, 10,'Vehicle Make(s)/Brand: $'
    prompt5 db 13,10,'Vehicle Color: $'
    prompt6 db 13,10,'Vehicle Sticker Type: $'
    prompt7 db 13,10,'ID Number: $'
    prompt8 db 13,10,'Address: $'
    prompt9 db 13,10,'Plate Number: $'
    prompt10 db 13,10,'Vehicle Type: $'

    personnelType db 20 dup('$')     
    applicantName db 20 dup('$')   
    mobileNumber db 20 dup('$')
    carMake db 20 dup('$')
    carColor db 20 dup('$')
    stickerType db 20 dup('$')
    idNum db 20 dup('$')
    address db 20 dup('$')
    plateNumber db 20 dup('$')
    carType db 20 dup('$')

.code
 
printForm proc
 
    xor al, al
    
    ; Grey BG
    mov ah, 06h
    mov ch, 1 ; row start
    mov cl, 2 ; col start
    mov dh, 19  ; row end
    mov dl, 78  ; col end
    mov bh, 70h ; grey bg with black text
    int 10h
    
    ; header red bg
    mov ah, 06h
    mov ch, 1
    mov cl, 3
    mov dh, 3   
    mov dl, 77  
    mov bh, 4fh ; red bg with white text
    int 10h
    ; header yellow blink line
    mov ah, 06h
    mov ch, 3
    mov cl, 3
    mov dh, 3   
    mov dl, 77  
    mov bh, 0ceh ; red bg with yellow blinking text
    int 10h
    
    ; black bg left
    mov ah, 06h
    mov ch, 5
    mov cl, 29
    mov dh, 5
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg right
    mov ah, 06h
    mov ch, 5
    mov cl, 66
    mov dh, 5
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg left
    mov ah, 06h
    mov ch, 7
    mov cl, 29
    mov dh, 7
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg right
    mov ah, 06h
    mov ch, 7
    mov cl, 66
    mov dh, 7
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h
   
   ; black bg left
    mov ah, 06h
    mov ch, 9
    mov cl, 29
    mov dh, 9
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h
    ; black bg right
    mov ah, 06h
    mov ch, 9
    mov cl, 66
    mov dh, 9
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg left
    mov ah, 06h
    mov ch, 9
    mov cl, 29
    mov dh, 9
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h
    ; black bg right
    mov ah, 06h
    mov ch, 9
    mov cl, 66
    mov dh, 9
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg left
    mov ah, 06h
    mov ch, 11
    mov cl, 29
    mov dh, 11
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h
    ; black bg right
    mov ah, 06h
    mov ch, 11
    mov cl, 66
    mov dh, 11
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h

    ; black bg left
    mov ah, 06h
    mov ch, 13
    mov cl, 29
    mov dh, 13
    mov dl, 41
    mov bh, 0fh ; black bg with white text
    int 10h
    ; black bg right
    mov ah, 06h
    mov ch, 13
    mov cl, 66
    mov dh, 13
    mov dl, 77
    mov bh, 0fh ; black bg with white text
    int 10h

    ; Upper Left V
    mov ah, 06h
    mov ch, 5
    mov cl, 39
    mov dh, 5
    mov dl, 41
    mov bh, 4fh ; red bg with white text
    int 10h
    ; Upper Right V
    mov ah, 06h
    mov ch, 5
    mov cl, 75
    mov dh, 5
    mov dl, 77
    mov bh, 4fh ; red bg with white text
    int 10h
    ; Lower Left V
    mov ah, 06h
    mov ch, 13
    mov cl, 39
    mov dh, 13
    mov dl, 41
    mov bh, 4fh ; red bg with white text
    int 10h
    ; Lower Right V
    mov ah, 06h
    mov ch, 13
    mov cl, 75
    mov dh, 13
    mov dl, 77
    mov bh, 4fh ; red bg with white text
    int 10h
 
    
    ; Red BG Submit Button
    mov ah, 06h
    mov ch, 16
    mov cl, 35
    mov dh, 16
    mov dl, 42
    mov bh, 4eh ; red bg with yellow text
    int 10h
    
    ; Blinking Yellow thankyou
    mov ah, 06h
    mov ch, 21
    mov cl, 0
    mov dh, 21
    mov dl, 78
    mov bh, 8eh
    int 10h
    
    ; print
    mov ah, 09h
    mov dx, offset menu
    int 21h
 
    ret
 
printForm endp
 
main proc
    
    mov ax, @data 
    mov ds, ax
   
    mov ax, 3
    int 10h

    lea dx, header
    mov ah, 09h
    int 21h

    ; left column

    lea dx, prompt1
    call print
    lea dx, personnelType
    call scan

    lea dx, prompt2
    call print
    lea dx, applicantName
    call scan

    lea dx, prompt3
    call print
    lea dx, mobileNumber
    call scan

    lea dx, prompt4
    call print
    lea dx, carMake
    call scan

    lea dx, prompt5
    call print
    lea dx, carColor
    call scan

    ; right column

    lea dx, prompt6
    call print
    lea dx, stickerType
    call scan

    lea dx, prompt7
    call print
    lea dx, idNum
    call scan

    lea dx, prompt8
    call print
    lea dx, address
    call scan

    lea dx, prompt9
    call print
    lea dx, plateNumber
    call scan

    lea dx, prompt10
    call print
    lea dx, carType
    call scan

    mov ah, 00h
    mov al, 03h   ; display setup
    int 10h

    call printForm
 
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 00            ; Row (0-based)
    mov dl, 00          ; Column (0-based)
    int 10h              ; Call BIOS interrupt

    lea dx, summary
    mov ah, 09h
    int 21h 

    ; personnelType
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 5            ; Row (0-based)
    mov dl, 029          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, personnelType+2
    mov ah, 09h
    int 21h
 
    ; applicantName
    mov ah, 02h          
    mov bh, 00h          
    mov dh, 7         
    mov dl, 029         
    int 10h             
 
    lea dx, applicantName+2
    mov ah, 09h
    int 21h
 
    ; mobileNumber
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 9            ; Row (0-based)
    mov dl, 029          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, mobileNumber+2
    mov ah, 09h
    int 21h
 
    ; carMake
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 11           ; Row (0-based)
    mov dl, 029          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, carMake+2
    mov ah, 09h
    int 21h
 
    ; carColor
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 13           ; Row (0-based)
    mov dl, 029          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, carColor+2
    mov ah, 09h
    int 21h
 
    ; stickerType
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 5            ; Row (0-based)
    mov dl, 066          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, stickerType+2
    mov ah, 09h
    int 21h
 
    ; idNum
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 7            ; Row (0-based)
    mov dl, 066          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, idNum+2
    mov ah, 09h
    int 21h
 
    ; address
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 9            ; Row (0-based)
    mov dl, 066          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, address+2
    mov ah, 09h
    int 21h
 
    ; plateNumber
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 11           ; Row (0-based)
    mov dl, 066          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, plateNumber+2
    mov ah, 09h
    int 21h
 
    ; carType
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 13           ; Row (0-based)
    mov dl, 066          ; Column (0-based)
    int 10h              ; Call BIOS interrupt
 
    lea dx, carType+2
    mov ah, 09h
    int 21h
 
    mov ah, 02h          ; Function to set cursor position
    mov bh, 00h          ; Page number (0 for standard screen)
    mov dh, 20           ; Row (0-based)
    mov dl, 80           ; Column (0-based)
    int 10h              ; Call BIOS interrupt
    
    mov ax, 4C00h ; return 0
    int 21h  
    
    print PROC
    mov ah, 09h
    int 21h
    ret
    print ENDP
    
    scan PROC
    mov ah, 0Ah
    int 21h
    ret
    scan ENDP

    main endp
end main