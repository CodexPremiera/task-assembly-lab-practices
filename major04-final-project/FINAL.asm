; Filename: FINAL.asm
; CS243 Lab Hands-on Final Exam  
; First Semester SY 2024-2025 
; Student Name: Ashley Ken Comandao
; Date Finished: December 12, 2024
 
.model small
.stack 100h
.data  
    header  db 0ah, "Cebu Institute of Technology - University", 0ah
            db "College of Computer Studies", 0ah
            db "FAVORITE CLASSMATE VOTING SYSTEM", 0ah
            db "Programmer: Ashley Ken Comandao", "$"
 
    menuPrompt db 0ah,0ah,'MAIN MENU'
               db 0ah,'1. Vote'
               db 0ah,'2. View'
               db 0ah,'3. Update'
               db 0ah,'4. Delete'
               db 0ah,'5. Exit'
               db 0ah,'Enter choice: $'
 
    choice     db ?
 
    vote    db 0ah, 0ah, 'Vote', '$'
    view    db 0ah, 0ah, 'View', '$'
    update  db 0ah, 0ah, 'Update', 0ah, '$'
    delete  db 0ah, 0ah, 'Delete', 0ah, '$'
 
    updatePrompt db 'Enter the index of the item to modify:','$'
    index        db ?
 
    candidateNamePrompt db 0ah,'Enter candidate name: $'
    voteRatingPrompt db 0ah,'Enter vote rating (0-100): $'
 
    candidateCtr db 1
 
    input1 db 50, ?, 50 dup(' ')
    input2 db 50, ?, 50 dup(' ')
    input3 db 50, ?, 50 dup(' ')
    input4 db 50, ?, 50 dup(' ')
    input5 db 50, ?, 50 dup(' ')
 
    rating1 db 50, ?, 50 dup(' ')
    rating2 db 50, ?, 50 dup(' ')
    rating3 db 50, ?, 50 dup(' ')
    rating4 db 50, ?, 50 dup(' ')
    rating5 db 50, ?, 50 dup(' ')
 
    dash db ' - $'
 
    output1 db 0ah,'1. $'
    output2 db 0ah,'2. $'
    output3 db 0ah,'3. $'
    output4 db 0ah,'4. $'
    output5 db 0ah,'5. $'
 
    deleteprompt db 0ah, 'Record deleted.$'
    keyprompt db 0ah, 0ah, 'Press any key to go back to Main Menu...$'
 
    footer db 0ah,0ah,'Exiting...'
           db 0ah,'Thank you for using Favorite Classmate Voting'
           db 0ah,'System.',0ah,'$'
 
.code
start:
    mov ax, @data
    mov ds, ax
 
    mov ax, 3
    int 10h
 
    ; CODE TO CHANGE VIEW/FONT
    ; mov ax, 1112h
    ; xor bl, bl
    ; int 10h
 
mainMenu:
    call CLEAR_SCREEN
 
    ; vote
    mov ah, 06h
    mov ch, 7 ; row start
    mov cl, 3 ; col start
    mov dh, 7  ; row end
    mov dl, 6  ; col end
    mov bh, 60h ; yellow, black
    int 10h
 
    ; view
    mov ah, 06h
    mov ch, 8 ; row start
    mov cl, 3 ; col start
    mov dh, 8  ; row end
    mov dl, 6  ; col end
    mov bh, 47h ; red, white
    int 10h
 
    ; update
    mov ah, 06h
    mov ch, 9 ; row start
    mov cl, 3 ; col start
    mov dh, 9  ; row end
    mov dl, 8  ; col end
    mov bh, 20h ; green, black
    int 10h
 
    ; delete
    mov ah, 06h
    mov ch, 10 ; row start
    mov cl, 3 ; col start
    mov dh, 10  ; row end
    mov dl, 8  ; col end
    mov bh, 17h ; blue, white
    int 10h
 
    lea dx, header
    mov ah, 9
    int 21h
 
    lea dx, menuPrompt
    mov ah, 9
    int 21h
 
    mov ah, 1              
    int 21h                    
    mov choice, al
 
    cmp choice, '1'
    je VcreateItem
    cmp choice, '2'
    je VviewItems
    cmp choice, '3'
    je VupdateItem
    cmp choice, '4'
    je VdeleteItem
    cmp choice, '5'
    je VexitProgram
    jmp mainMenu
 
VcreateItem:
    call CLEAR_SCREEN
    call create1
    call createItem
    jmp mainMenu
 
VviewItems:
    call CLEAR_SCREEN
    call view1
    call viewItems
    jmp mainMenu
 
VupdateItem:
    call CLEAR_SCREEN
 
    call update1
    call updateItem
    jmp mainMenu
 
VdeleteItem:
    call CLEAR_SCREEN
    call delete1
 
    call deleteItem
    jmp mainMenu
 
VexitProgram:
    call exitProgram
 
 
;----------------get inputs--------------------
createItem:
   
    cmp candidateCtr, 1
    je enter1
    cmp candidateCtr, 2
    je enter2
    cmp candidateCtr, 3
    je enter3
    cmp candidateCtr, 4
    je enter4
    cmp candidateCtr, 5
    je enter5
   
    jmp mainMenu
 
    ret
;-------------------storing items---------------
enter1:
    call enter1func    
    call waitForKey
    ret
enter2:
    call enter2func
    call waitForKey
    ret
enter3:
    call enter3func  
    call waitForKey
    ret
enter4:
    call enter4func  
    call waitForKey
    ret
enter5:
    call enter5func  
    call waitForKey
    ret
 
;-------------------update items---------------
updateItem:
    lea dx, updatePrompt
    mov ah, 9
    int 21h
 
    mov ah, 1              
    int 21h                    
    mov index, al
 
    cmp index, '1'
    je enter1
    cmp index, '2'
    je enter2
    cmp index, '3'
    je enter3
    cmp index, '4'
    je enter4
    cmp index, '5'
    je enter5
   
    jmp mainMenu
    ret
 
;---------------summary output-------------
viewItems:
    lea dx, output1
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input1[1]
    mov input1[bx+2], '$'
    lea dx, input1 + 2
    mov ah, 09h
    int 21h
 
    lea dx, dash
    mov ah, 09h
    int 21h
 
    xor bx, bx
    mov bl, rating1[1]
    mov rating1[bx+2], '$'
    lea dx, rating1 + 2
    mov ah, 09h
    int 21h
 
    lea dx, output2
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input2[1]
    mov input2[bx+2], '$'
    lea dx, input2 + 2
    mov ah, 09h
    int 21h
   
    lea dx, dash
    mov ah, 09h
    int 21h
   
    xor bx, bx
    mov bl, rating2[1]
    mov rating2[bx+2], '$'
    lea dx, rating2 + 2
    mov ah, 09h
    int 21h
 
    lea dx, output3
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input3[1]
    mov input3[bx+2], '$'
    lea dx, input3 + 2
    mov ah, 09h
    int 21h
 
    lea dx, dash
    mov ah, 09h
    int 21h
   
    xor bx, bx
    mov bl, rating3[1]
    mov rating3[bx+2], '$'
    lea dx, rating3 + 2
    mov ah, 09h
    int 21h
 
    lea dx, output4
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input4[1]
    mov input4[bx+2], '$'
    lea dx, input4 + 2
    mov ah, 09h
    int 21h
 
    lea dx, dash
    mov ah, 09h
    int 21h
   
    xor bx, bx
    mov bl, rating4[1]
    mov rating4[bx+2], '$'
    lea dx, rating4 + 2
    mov ah, 09h
    int 21h
 
    lea dx, output5
    mov ah, 9
    int 21h
 
    xor bx, bx
    mov bl, input5[1]
    mov input5[bx+2], '$'
    lea dx, input5 + 2
    mov ah, 09h
    int 21h
 
    lea dx, dash
    mov ah, 09h
    int 21h
   
    xor bx, bx
    mov bl, rating5[1]
    mov rating5[bx+2], '$'
    lea dx, rating5 + 2
    mov ah, 09h
    int 21h
 
    call waitForKey
    ret
 
;-------------------delete items----------------
deleteItem:
    lea dx, updatePrompt
    mov ah, 9
    int 21h
 
    ; Get item index to delete
    mov ah, 1
    int 21h
    mov index, al
 
    ; Based on index, clear the corresponding input
    cmp index, '1'
    je clearItem1
    cmp index, '2'
    je clearItem2
    cmp index, '3'
    je clearItem3
    cmp index, '4'
    je clearItem4
    cmp index, '5'
    je clearItem5
 
    ret
 
clearItem1:
    call clear1func
    lea dx, deleteprompt
    mov ah, 9
    int 21h
    call waitForKey
    ret
 
clearItem2:
    call clear2func
    lea dx, deleteprompt
    mov ah, 9
    int 21h
    call waitForKey
    ret
 
clearItem3:
    call clear3func
    lea dx, deleteprompt
    mov ah, 9
    int 21h
    call waitForKey
    ret
 
clearItem4:
    call clear4func
    lea dx, deleteprompt
    mov ah, 9
    int 21h
    call waitForKey
    ret
 
clearItem5:
    lea dx, input5
    mov ah, 0Ah
    lea dx, input5
    mov byte ptr [input5], 50
    mov byte ptr [input5 + 1], 0
 
    lea dx, rating5
    mov ah, 0Ah
    lea dx, rating5
    mov byte ptr [rating5], 50
    mov byte ptr [rating5 + 1], 0
    call waitForKey
    ret
 
;----------------------end prog-----------------
exitProgram:
    lea dx, footer
    mov ah, 09h
    int 21h
 
    mov ah, 4Ch
    int 21h
 
CLEAR_SCREEN PROC
    MOV AX, 0600H
    MOV BH, 07H
    MOV CX, 0000H
    MOV DX, 184FH
    INT 10H
   
    MOV AH, 02H
    MOV BH, 0
    MOV DX, 0000H
    INT 10H
    RET
CLEAR_SCREEN ENDP
 
enter1func:
    lea dx, candidateNamePrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input1
    int 21h
 
    lea dx, voteRatingPrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating1
    int 21h
 
    inc byte ptr [candidateCtr]
 
    ret
enter2func:
    lea dx, candidateNamePrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input2
    int 21h
 
 
    lea dx, voteRatingPrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating2
    int 21h
 
    inc byte ptr [candidateCtr]
 
    ret
enter3func:
lea dx, candidateNamePrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input3
    int 21h
 
    lea dx, voteRatingPrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating3
    int 21h
 
    inc byte ptr [candidateCtr]
    ret
enter4func:
lea dx, candidateNamePrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input4
    int 21h
 
    lea dx, voteRatingPrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating4
    int 21h
    inc byte ptr [candidateCtr]
    ret
 
enter5func:
    lea dx, candidateNamePrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, input5
    int 21h
 
    lea dx, voteRatingPrompt
    mov ah, 9
    int 21h            
 
    mov ah, 0Ah
    lea dx, rating5
    int 21h
 
    inc byte ptr [candidateCtr]
    ret
 
 
clear1func:
; Clear input1 buffer
    lea di, input1 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input2 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating1 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating2 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
 
    lea di, input2 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input3 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating2 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating3 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
   
    lea di, input3 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating3+ 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
 
    lea di, input4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
 
ret
clear2func:
    lea di, input2 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input3 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating2 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating3 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
   
    lea di, input3 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating3+ 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
 
    lea di, input4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
ret
clear3func:
    lea di, input3 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating3+ 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating4 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
 
    lea di, input4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
ret
clear4func:
    lea di, input4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, input5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
    lea di, rating4 + 2          ; DI points to the beginning of input1 data (skip size and unused byte)
    lea si, rating5 + 2          ; SI points to the beginning of input2 data (skip size and unused byte)
    mov cx, 50                  ; We know the buffer size is 50
    call COPY
ret
 
COPY:
    copy_loop:
        mov al, [si-1]                ; Load byte from input2
        mov [di-1], al                ; Store byte to input1
        inc si                      ; Move to next byte in input2
        inc di                      ; Move to next byte in input1
    loop copy_loop              ; Repeat until all 50 bytes are copied
ret
 
waitForKey:
    ; Function to wait for a key press
    lea dx, keyprompt
    mov ah, 9
    int 21h
 
    mov ah, 1            ; DOS function 0: Wait for a key press
    int 21h              ; Call DOS interrupt
    ret                  ; Return from the function
 
 
 
create1:
    lea dx, header
    mov ah, 9
    int 21h
 
    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 3  ; col end
    mov bh, 60h ; yellow, black
    int 10h
 
    lea dx, vote
    mov ah, 9
    int 21h
ret
view1:
        lea dx, header
    mov ah, 9
    int 21h
 
    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 3  ; col end
    mov bh, 47h ; yellow, black
    int 10h
 
    lea dx, view
    mov ah, 9
    int 21h
 
ret
update1:
        lea dx, header
    mov ah, 9
    int 21h
 
    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 5  ; col end
    mov bh, 20h ; yellow, black
    int 10h
 
    lea dx, update
    mov ah, 9
    int 21h
 
ret
delete1:
    lea dx, header
    mov ah, 9
    int 21h
 
    ; vote
    mov ah, 06h
    mov ch, 6 ; row start
    mov cl, 0 ; col start
    mov dh, 6  ; row end
    mov dl, 5  ; col end
    mov bh, 17h ; yellow, black
    int 10h
 
    lea dx, delete
    mov ah, 9
    int 21h
ret
 
end start