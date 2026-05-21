include emu8086.inc
.model small       

.data
count db 0
quot db ?
rem db ?
num db ?
num_count db 0

input macro  
    local Input,Store,Double,Tripple,Exit

    xor dx,dx
    
    Print "Enter the number : "
    PrintN "" 
    
    Input:
    
    CMP count,3
    JE Exit
    
    mov ah,01h
    int 21h
    
    CMP AL,13
    JE Store
    
    inc count
    sub al,48
    
    CMP count,2
    JE Double
    
    CMP count,3
    JE Tripple
    
    mov num,al
    mov dl,num
     
    JMP Input 
    Double:
    
    mov AH,0
    mov BL,10
    
    XCHG num,AL
    MUL BL
    add AL,num
    
    MOV DX,AX
    mov num,dl
    
    JMP Input 
    Tripple:
    
    mov AH,0     ;Clear AH for correct Multiplication
    mov BL,10    ;Store 10 in BL to multiply with new number to form hundreds
    
    xchg num,AL
    
    MUL BL
    
    xor bx,bx    ;Clear BX for storing num in it 
    mov bl,num   ;mov num into lower BX
    ADD AX,BX    ;add newly entered number into tripple digit number built
    mov DX,AX    ;mov into DX so the built number can be pushed into stack 
    
    Store:
    
    PUSH DX      ;The final number stored in the stack 
    PrintN ""
    inc num_count
    xor DX,DX
    
    Exit:
    
    ENDM
    
output macro numb
    local single,double,
    
    Print "The number you entered is : "
    CMP count,1    ;Is it a one digit number ?                     
    JE single
    
    CMP count,2    ;Is it a two digit number ?
    JE double
    
    mov ax,numb     ;Its a three digit number 
    mov bl,100
    
    Div bl
    
    mov quot,al
    mov rem,ah 
    
    mov dl,quot
    add dl,48
    mov ah,02h
    int 21h
    
    mov bl,rem
    mov numb,bx
    
    double:
    
    mov ax,numb
    
    xor bx,bx
    mov bl,10
    
    Div bl
    
    mov quot,al
    mov rem,ah 
    
    mov dl,quot
    add dl,48
    mov ah,02h
    int 21h
    
    mov bl,rem
    mov numb,bx
    
    single:
    
    mov dx,numb
    add dl,48
    mov ah,02h
    int 21h
        
ENDM

.code

mov ax,@data
mov ds,ax 

input
POP CX
output CX

mov ah,4ch
int 21h

