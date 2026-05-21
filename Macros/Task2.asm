include emu8086.inc
.model small

.data
num1 db ?
num2 db ?
Ten db 10
quo db ?
rem db ?

MyMacro MACRO var1,var2
    Local Double,Cont
    Print "The result is : "
    xor ax,ax
    xor bx,bx
    mov al,var1
    mov bl,var2
    
    MUL bl
    PUSH AX
    
    CMP ax,9
    JA Double
    
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h
    
    jmp Cont
    
    Double:

    xor ax,ax
    POP AX
    
    div ten
     
    mov quo,al
    add quo,48
    
    mov rem,ah
    add rem,48
    
    mov ah,02h
    mov dl,quo
    int 21h
    mov dl,rem
    int 21h
    
    Cont:
    PrintN ""
ENDM

.code
mov ax,@data
mov ds,ax

Loopp:
Print "Enter the first number : "
mov ah,01h
int 21h
sub al,48

mov num1,al
PrintN ""
Print "Enter the second number : "
mov ah,01h
int 21h
sub al,48

mov num2,al

CMP num1,0
JNE Multiply

CMP num2,0
JE Exit

Multiply:

PrintN ""

MyMacro num1,num2

JMP Loopp

Exit:
PrintN ""
Print "You Entered Two 0s "
mov ah,4Ch
int 21h