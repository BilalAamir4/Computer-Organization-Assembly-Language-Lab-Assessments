INCLUDE EMU8086.INC
.MODEL SMALL
.STACK 100H
.DATA
    num         DB ?
    count       DB 0
    num_count   DB 0
    swapped     DB 0
    limit       DB 0
    arr         DB ?
.CODE

READ_INPUT PROC
    MOV AX, @DATA
    MOV DS, AX

    PRINT "Enter the numbers you want to Sort : "
    PRINTN ""

    MOV SI, 0           ; array index
    MOV count, 0
    MOV num, 0

Input:
    MOV AH, 01H
    INT 21H

    CMP AL, 27          ; ESC ? exit
    JE  InputDone

    CMP AL, 13          ; Enter ? store number
    JE  Store

    INC count
    SUB AL, 48

    CMP count, 2
    JE  Double

    MOV num, AL         ; save first digit
    JMP Input

Double:
    MOV AH, 0
    MOV BL, 10
    XCHG num, AL        ; AL = first digit, num = second digit
    MUL BL              
    ADD AL, num         ; AL = tens + units
    MOV num, AL         ; save built number
    JMP Input

Store:
    MOV AL, num                 ; get the built number
    MOV arr[SI], AL             ; store into array
    INC SI
    INC num_count
    
    PRINTN ""    
    
    MOV count, 0
    MOV num, 0
    JMP Input

InputDone:
    PRINTN ""
    RET
READ_INPUT ENDP


BUBBLE_SORT PROC
    MOV AL, num_count
    DEC AL
    MOV limit, AL

OuterLoop:
    MOV BX, 0
    MOV swapped, 0

InnerL:
    MOV AL, arr[BX]
    CMP AL, arr[BX+1]
    JBE NoSwap

    MOV DL, arr[BX+1]
    MOV arr[BX+1], AL
    MOV arr[BX], DL
    MOV swapped, 1

NoSwap:
    INC BX
    MOV AL, BL
    CMP AL, limit
    JNE InnerL

    CMP swapped, 1
    JE  OuterLoop

    RET
BUBBLE_SORT ENDP

PRINT_ARR PROC
    PRINTN ""
    PRINT "The Sorted Array is : "

    MOV SI, 0
    XOR BX, BX
    MOV BL, num_count

PrintLoop:
    CMP BL, 0
    JE  PrintDone

    MOV DL, arr[SI]

    CMP DL, 9
    JBE Single

    ; Double digit
    XOR AX, AX
    MOV AL, DL
    MOV CH, 10
    DIV CH              ; AL = tens, AH = units
    MOV CL, AH          ; save units

    ADD AL, 48
    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; print tens

    MOV DL, CL          

Single:      

    ADD DL, 48
    MOV AH, 02H
    INT 21H

    PRINT " "
    INC SI
    DEC BL
    JMP PrintLoop

PrintDone:
    RET
PRINT_ARR ENDP


MAIN PROC
    CALL READ_INPUT
    CALL BUBBLE_SORT
    CALL PRINT_ARR

    MOV AH, 4CH
    INT 21H       
    
MAIN ENDP
END MAIN