INCLUDE EMU8086.INC
.STACK 100H

.DATA
    ARR1    DW 1,2,3,4,5
    ARR2    DW 6,7,8,9,1
    COUNT   DW 5
    MSG1    DB 'ARR1 replacements: $'
    MSG2    DB 'ARR2 replacements: $'

.CODE




REPLACEVAL PROC
    PUSH BP
    MOV  BP, SP
    SUB  SP, 2          
    MOV  [BP-2], 0  

    MOV  CX, [BP+6]     
    MOV  SI, [BP+8]     
    MOV  DX, [BP+4]     

SCANLOOP:
    MOV  AX, [SI]       
    CMP  AX, DX         
    JNE  SKIP           

    MOV   [SI], 0       
    INC   [BP-2]        

SKIP:
    ADD  SI, 2
    LOOP SCANLOOP

    MOV  AX, [BP-2]     

    MOV  SP, BP         
    POP  BP
    RET  6              
REPLACEVAL ENDP

MAIN:
MOV AX,@DATA
MOV DS,AX
    
    PUSH ARR1
    PUSH COUNT
    PUSH 3              ;
    CALL REPLACEVAL

    MOV AH, 09H
    MOV DX, OFFSET MSG1
    INT 21H
    ADD AL, '0'         
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    PRINTN ""

    PUSH OFFSET ARR2
    PUSH COUNT
    PUSH 9             
    CALL REPLACEVAL

    MOV AH, 09H
    MOV DX, OFFSET MSG2
    INT 21H
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    PRINTN ""

    MOV SI, OFFSET ARR1
    MOV CX, 5
    
PRINT_R1:
    MOV AX, [SI]
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    MOV DL, ' '
    MOV AH, 02H
    INT 21H
    ADD SI, 2
    LOOP PRINT_R1
    PRINTN ""

    MOV SI, OFFSET ARR2
    MOV CX, 5
    
PRINT_R2:
    MOV AX, [SI]
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    MOV DL, ' '
    MOV AH, 02H
    INT 21H
    ADD SI, 2
    LOOP PRINT_R2

MOV AX, 4CH
INT 21H

END MAIN
