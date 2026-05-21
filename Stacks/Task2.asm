include emu8086.inc

.model small

.data 
counter dw 0 
divv db 2
num db ?
arr dw ?

.code

mov ax,@data
mov ds,ax 

mov cx,10

MyLoop:
Print "Enter the number : "

mov ah,01h
int 21h 

PrintN ""

sub al,48
mov num,al

xor ax,ax

mov al,num
div divv

cmp ah,0
JE Even
JMP Cont

Even:
mov bl,num
mov bh,0

Push bx
inc counter

Cont:

Loop MyLoop


Print "The numbers even and less than 5 are :"
PrintN ""
mov cx,counter
CMP cx,0
JE Skip
MyLoop2:

xor bx,bx

POP BX

CMP bx,5
JG  Cont2

xor dx,dx
mov dl,bl
add dl,48

mov ah,02h
int 21h

Cont2: 

loop MyLoop2
Skip:
mov ah,4Ch
int 21h