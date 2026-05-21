include emu8086.inc
.model small

.data 
msg db "You pressed enter key $"
innercount db 1
Pattern MACRO rows
    local numofrows,Exit,InnerLoop,repeat
    mov innercount,1
    
    
    mov cl,rows
    
    repeat:
    push cx
    
    mov cl,innercount
    
    InnerLoop:
    
    putc '*'
    
    loop InnerLoop
    
    PrintN ""
    
    pop cx
    
    inc innercount
    
    loop repeat
    
    ENDM

.code
mov ax,@data
mov ds,ax 

Loopp: 

PrintN "Press the number of rows You want to Print Or Press Enter to Stop Printing "

mov ah,01h
int 21h

PrintN ""

CMP al,13
JE Exit

sub al,48
Pattern al
jmp Loopp
Exit:

mov ah,09h
LEA dx,msg
int 21h 

mov ah,4Ch
int 21h