include emu8086.inc
.model big

.data
msg db "The sum of these 5 numbers is : $"
ten db 10
rem db ?
quo db ?

 MyMacro Macro
    Local Label,double,Cont
    
    mov cx,5
    mov bl,0
    Label:
    
    Print "Enter the number : "
    mov ah,01h
    int 21h 
    
    sub al,48
    add bl,al
   
    PrintN ""
        
    Loop Label

    mov ah,09h
    LEA dx,msg
    int 21h

    CMP bl,9
    JA double
    
    mov dl,bl
    add dl,48
    mov ah,02h
    int 21h
    
    jmp Cont
    double:
    xor ax,ax
    mov al,bl
    
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

mov cx,5
MyLoop:
  push cx
  MyMacro
  pop cx
Loop MyLoop
 
mov ah,4Ch
int 21h   