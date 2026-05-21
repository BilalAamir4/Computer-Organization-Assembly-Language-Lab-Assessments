INCLUDE EMU8086.INC   
DEFINE_SCAN_NUM 


JMP START
n       DW 0         
isPrime DB 1         

START:

READ_NUM PROC

    CALL SCAN_NUM

    MOV n, CX
    PRINTN ""          
    
    RET
READ_NUM ENDP

CHECK_PRIME PROC
    MOV isPrime, 1              ; isPrime = true
    MOV CX, 2                   ; i = 2

PRIME_LOOP:

    MOV AX, n
    MOV DX, 0
    MOV BX, 2
    DIV BX                      ; AX = n/2

    CMP CX, AX                  
    JG  PRIME_DONE              ; if i > n/2 ? exit loop

    MOV AX, n
    MOV DX, 0
    MOV BX, CX                  ; divisor = i
    DIV BX                      ; DX = n % i

    CMP DX, 0                   ; remainder  0?
    JNE CONTINUE                ; no ? keep looping

    MOV isPrime, 0              ; isPrime = false
    RET                         ; break

CONTINUE:
    INC CX                      ; ++i
    JMP PRIME_LOOP

PRIME_DONE:
    RET
CHECK_PRIME ENDP

MAIN PROC 

    PRINT "Enter a positive integer: "
    PRINTN ""                                  
    CALL READ_NUM

    CALL CHECK_PRIME

    CMP isPrime,1
    JE  PRINT_PRIME

    PRINT "This is not a prime number "
    JMP EXIT_PROG

PRINT_PRIME:

    PRINT "This is a prime number"

EXIT_PROG:

    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN