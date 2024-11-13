; Filename: Prog35.ASM
; Student Name: John Jacob M. Muli
; Date Finished: 10/27/2024
; Description: This assembly language program will print the hex equivalent
; of ASCII character code

.MODEL SMALL
.STACK 100H
.DATA
char_prompt    DB  'Please input a character: ',0
out_msg1       DB  'The ASCII code of ''',0
out_msg2       DB  ''' in hex is ',0
query_msg      DB  'Do you want to quit (Y/N): ',0

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
        shr     AL,4         ; move upper 4 bits to lower half
        mov     CX,2         ; loop count - 2 hex digits to print
print_digit:
        cmp     AL,9         ; if greater than 9
        jg      A_to_F       ; convert to A through F digits
        add     AL,'0'       ; otherwise, convert to 0 through 9
        jmp     skip
A_to_F:
        add     AL,'A'-10    ; subtract 10 and add 'A'
                             ;  to convert to A through F
skip:
        PutCh   AL           ; write the first hex digit
        mov     AL,AH        ; restore input character in AL
        and     AL,0FH       ; mask off the upper half byte
        loop    print_digit
        nwln
        PutStr  query_msg    ; query user whether to terminate
        GetCh   AL           ; read response
        nwln
        cmp     AL,'Y'       ; if response is not 'Y'
        jne     read_char    ; read another character
done:                        ; otherwise, terminate program
main    ENDP
        END   main