INCLUDE EMU8086.INC
ORG 100H
DEFINE_SCAN_NUM

JMP MAINN
NUM1 DW ?
NUM2 DW ?
TEMP DW ?


SWAP PROC
    PRINT "NUMBERS BEFORE SWAPPING: "
    PRINTN ""
    
    ; Print NUM1
    PRINT "NUM1 = "
    MOV AX, NUM1
    CALL PRINT_NUM        
    PRINTN ""
    
    ; Print NUM2
    PRINT "NUM2 = "
    MOV AX, NUM2
    CALL PRINT_NUM
    PRINTN ""

    ;  Swap using TEMP 
    MOV AX, NUM1
    MOV TEMP, AX          ; TEMP = NUM1
    MOV AX, NUM2
    MOV NUM1, AX          ; NUM1 = NUM2
    MOV AX, TEMP
    MOV NUM2, AX          ; NUM2 = TEMP

    PRINTN ""
    PRINT "NUMBERS AFTER SWAPPING: "
    PRINTN ""

    PRINT "NUM1 = "
    MOV AX, NUM1
    CALL PRINT_NUM
    PRINTN ""

    PRINT "NUM2 = "
    MOV AX, NUM2
    CALL PRINT_NUM
    PRINTN ""

    RET
SWAP ENDP

PRINT_NUM PROC    
    
    CMP AX, 10          ; is it less than 10?
    JL  SINGLE_DIGIT    ; yes ? skip tens logic
    
    MOV BL, 10
    DIV BL              ; AL = tens, AH = units
    MOV CL, AH          ; save units in CL

    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; print tens digit

    MOV AL, CL          ; move units into AL

SINGLE_DIGIT:           
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H             

    RET       
PRINT_NUM ENDP

MAINN:
MAIN PROC  

PRINT "ENTER THE FIRST NUMBER: "
CALL SCAN_NUM
MOV NUM1,CX 

PRINTN ""  

PRINT "ENTER THE SECOND NUMBER: "
CALL SCAN_NUM
MOV NUM2,CX
 
PRINTN ""

CALL SWAP

MAIN ENDP 

END MAIN