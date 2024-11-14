; Filename: Prog36.ASM
; Student Name: Ashley Ken Comandao
; Date Finished: 10/27/2024
; Description: This assembly language program will print the hex equivalent of
; ASCII character code.

.MODEL SMALL
.STACK 100H
.DATA
char_prompt    DB  'Please input a character: ',0
out_msg1       DB  'The ASCII code of ''',0
out_msg2       DB  ''' in hex is ',0
query_msg      DB  'Do you want to quit (Y/N): ',0
; translation table: 4-bit binary to hex
hex_table      DB  '0123456789ABCDEF'    

.CODE
.486
INCLUDE io.mac
main    PROC
        .STARTUP
read_char:
        PutStr  char_prompt  ; request a char. input
        GetCh   AL           ; read input character
        nwln
        PutStr  out_msg1
        PutCh   AL
        PutStr  out_msg2
        mov     AH,AL        ; save input character in AH
        mov     BX,OFFSET hex_table  ; BX := translation table
        shr     AL,4         ; move upper 4 bits to lower half
        xlatb                ; replace AL with hex digit
        PutCh   AL           ; write the first hex digit
        mov     AL,AH        ; restore input character to AL
        and     AL,0FH       ; mask off upper 4 bits
        xlatb
        PutCh   AL           ; write the second hex digit
        nwln
        PutStr  query_msg    ; query user whether to terminate
        GetCh   AL           ; read response
        nwln
        cmp     AL,'Y'       ; if response is not 'Y'
        jne     read_char    ; read another character
done:                        ; otherwise, terminate program
main    ENDP
        END   main
