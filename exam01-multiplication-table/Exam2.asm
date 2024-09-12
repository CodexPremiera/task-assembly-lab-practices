; PRELIM.ASM
; CS243 Lab Prelim Exam First Semester SY 2024-2025
; Student Name: Ashley Ken Comandao
; Date Finished: September 12, 2024

.model small
.stack 100h
.data
    head_univerisity    db '                 Cebu Institute of Technology - University                 $'
    head_document_name  db '                     VEHICLE STICKER APPLICATION FORM                      $'
    head_inst_padding_r db '                      $'
    head_inst_padding_l db '                       $'
    head_instruction    db 'Please fill out the form below$'

    form_blank          db '                                                                              $'
    form_text_field     db '_____________$'
    form_drop_field     db '__________$'
    form_drop_v         db ' V $'

    form_personnel_type db ' Personnel Type:          $'
    form_sticker_type   db '  Vehicle Sticker Type: $'

    form_applicant_name db ' Name of Applicant/Driver:$'
    form_id_number      db '  ID Number:            $'

    form_mobile_number  db ' Mobile Number:           $'
    form_address        db '  Address:              $'

    form_vehicle_make   db ' Vehicle Make(s)/Brand:   $'
    form_plate_number   db '  Plate Number:         $'

    form_vehicle_color  db ' Vehicle Color:           $'
    form_vehicle_type   db '  Vehicle Type:         $'

    form_submit         db ' SUBMIT $'
    form_submit_padding db '                                  $'

    form_copyright      db '                      Copyright 2024 ASHLEY KEN COMANDAO                     $'
    form_thank_you      db '                                  Thank you!                                   $'
    
    hello db 'Hello, World!$', 0

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Set video mode to 03h (text mode)
    mov ah, 0
    mov al, 03h
    int 10h
        

    ; PRINT HEADER
        ; white line block
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            mov ah, 09h
            lea dx, form_blank
            int 21h
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; Cebu Institute of Technology - University
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; F = white bg, F = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; head_univerisity
            mov ah, 09h
            mov bl, 4Fh 	; 4 = red bg, 7 = white fg
            mov cx, 76	    ; changes 76 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, head_univerisity
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 7Fh 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h
        
        ; VEHICLE STICKER APPLICATION FORM
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; head_document_name
            mov ah, 09h
            mov bl, 4Fh 	; 4 = red bg, 7 = white fg
            mov cx, 76	    ; changes 76 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, head_document_name
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h
        
        ; Please fill out the form below
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; red padding
            mov ah, 09h
            mov bl, 4Eh 	; 4 = red bg, E = yellow fg
            mov cx, 23	    ; changes 24 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, head_inst_padding_l
            int 21h

            ; head_instruction red blink
            mov ah, 09h
            mov bl, 11001110b 	; blinking bit (1) reb bg (100) yellow text 1110
            mov cx, 30	        ; changes 24 block
            int 10h		        ; instruction to apply color
            mov ah, 09h
            lea dx, head_instruction
            int 21h

            ; red padding
            mov ah, 09h
            mov bl, 4Eh 	; 4 = red bg, E = yellow fg
            mov cx, 23	    ; changes 24 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, head_inst_padding_r
            int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h



    ; PRINT FORM BODY
        ; white line block
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; white blank
            mov ah, 09h
            mov bl, 7Eh 	; 7 = white bg, E = yellow fg
            mov cx, 77	    ; changes 77 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, form_blank
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; FORM LINE #1: PERSONNEL TYPE AND STICKER TYPE
            ; white padding
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_personnel_type
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_personnel_type
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_field
                int 21h

                ; red V
                mov ah, 09h
                mov bl, 47h 	; 4 = red bg, 7 = white fg
                mov cx, 3	    ; changes 76 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_v
                int 21h
            

            ; form_sticker_type
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_sticker_type
                int 21h
                
                ; input
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 10	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_field
                int 21h

                ; red V
                mov ah, 09h
                mov bl, 47h 	; 4 = red bg, 7 = white fg
                mov cx, 3	    ; changes 76 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_v
                int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; FORM LINE #2: APPLICANT NAME AND ID NUMBER
            ; white padding
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_applicant_name
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_applicant_name
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h
            
            ; form_id_number
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_id_number
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; FORM LINE #3: MOBILE NUMBER AND ADDRESS
            ; white padding
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_mobile_number
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_mobile_number
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h
            
            ; form_address
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_address
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; FORM LINE #4: VEHICLE MAKE AND PLATE NUMBER
            ; white padding
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_vehicle_make
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_vehicle_make
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h
            
            ; form_plate_number
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_plate_number
                int 21h
            
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_text_field
                int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h

        ; FORM LINE #5: VEHICLE COLOR AND STICKER TYPE
            ; white padding
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_vehicle_color
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_vehicle_color
                int 21h
                
                ; field
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 13	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_field
                int 21h

                ; drop v
                mov ah, 09h
                mov bl, 47h 	; 4 = red bg, 7 = white fg
                mov cx, 3	    ; changes 76 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_v
                int 21h
            
            ; form_sticker_type
                ; label
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 26	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_sticker_type
                int 21h
                
                ; field 
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 10	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_field
                int 21h

                ; drop v
                mov ah, 09h
                mov bl, 47h 	; 4 = red bg, 7 = white fg
                mov cx, 3	    ; changes 76 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_drop_v
                int 21h

            ; white padding
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; white line block
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; color white
            mov ah, 09h
            mov bl, 7Eh 	; 7 = white bg, E = yellow fg
            mov cx, 77	    ; changes 77 block
            int 10h		    ; instruction to apply color

            mov ah, 09h
            lea dx, form_blank
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h

        ; FORM SUBMIT
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form submit
                ; left padding
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 34	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_submit_padding
                int 21h

                ; form_submit
                mov ah, 09h
                mov bl, 4Eh 	; 4 = red bg, E = white fg
                mov cx, 8	    ; changes 8 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_submit 
                int 21h

                ; right padding
                mov ah, 09h
                mov bl, 70h 	; 7 = white bg, 0 = black fg
                mov cx, 34	    ; changes 24 block
                int 10h		    ; instruction to apply color
                mov ah, 09h
                lea dx, form_submit_padding
                int 21h
            
            ; last space
            mov ah, 09h
            mov bl, 77h 	; 7 = white bg, 7 = white fg
            mov cx, 1	    ; changes 1 block
            int 10h		    ; instruction to apply color
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h

        ; white line block
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; color white
            mov ah, 09h
            mov bl, 7Eh 	; 7 = white bg, E = yellow fg
            mov cx, 77	    ; changes 77 block
            int 10h		    ; instruction to apply color

            mov ah, 09h
            lea dx, form_blank
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


        ; FORM COPYRIGHT
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_copyright
            mov ah, 09h
            mov bl, 70h 	; 7 = white bg, 0 = black fg
            mov cx, 77	    ; changes 76 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, form_copyright
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h

        ; white line block
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; color white
            mov ah, 09h
            mov bl, 7Eh 	; 7 = white bg, E = yellow fg
            mov cx, 77	    ; changes 77 block
            int 10h		    ; instruction to apply color

            mov ah, 09h
            lea dx, form_blank
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h
            
        ; black space
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            mov ah, 09h
            lea dx, form_blank
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h

        ; FORM THANK YOU
            ; display SPACE
            mov ah, 02h
            mov cl, 20h
            mov dl, cl
            int 21h

            ; form_copyright
            mov ah, 09h
            mov bl, 8Eh 	; blink yellow
            mov cx, 77	    ; changes 76 block
            int 10h		    ; instruction to apply color
            mov ah, 09h
            lea dx, form_thank_you
            int 21h
            
            mov ah, 02h
            mov cl, 0Ah
            mov dl, cl	
            int 21h


; Wait for any key to be pressed
mov ah, 1
int 21h

; Exit program
mov ah, 4Ch
int 21h

main endp
end main