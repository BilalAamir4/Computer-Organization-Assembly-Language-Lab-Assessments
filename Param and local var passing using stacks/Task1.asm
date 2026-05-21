INCLUDE EMU8086.INC
ORG 100H

.STACK 100H

.DATA
    ARR1    DW 1,2,3,4,5
    ARR2    DW 6,7,8,9,1
    COUNT   DW 5
    RESULT1 DW 5 DUP(?)
    RESULT2 DW 5 DUP(?)

.CODE

COPYARRAY PROC
    PUSH BP
    MOV  BP, SP

    MOV  CX, [BP+4]     
    MOV  DI, [BP+6]     
    MOV  SI, [BP+8]     

STORELOOP:
    MOV  AX, [SI]      
    MOV  [DI], AX       
    ADD  SI, 2           
    ADD  DI, 2          
    LOOP STORELOOP      

    POP  BP
    RET  6             
COPYARRAY ENDP

MAIN:
 
    PUSH OFFSET ARR1       
    PUSH OFFSET RESULT1     
    PUSH COUNT              
    CALL COPYARRAY

    PUSH OFFSET ARR2
    PUSH OFFSET RESULT2
    PUSH COUNT
    CALL COPYARRAY

    MOV  AX, 4C00H          
    INT  21H
