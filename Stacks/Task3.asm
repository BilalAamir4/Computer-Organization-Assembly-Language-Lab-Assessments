include emu8086.inc

.model small

.data
greatest dw 0 
counter dw ?
arr db ?
.code   

mov ax,@data
mov ds,ax

Loopp:

Print "Enter the number : "

mov ah,01h
int 21h  

PrintN ""

CMP al,13
JE Exit 

mov ah,0
sub al,48
PUSH AX
inc counter

jmp Loopp
Exit:
PrintN ""    
Print "You Pressed Enter key "
PrintN ""
mov cx,counter

MyLoop:

POP BX
CMP greatest,bx
JL greater
jmp skipp
greater:
XCHG greatest,bx
skipp:

loop MyLoop

xor dx,dx
mov dx,greatest
add dl,48

Print "The greatest number is :"
mov ah,02h
int 21h

mov ah,4Ch
int 21h