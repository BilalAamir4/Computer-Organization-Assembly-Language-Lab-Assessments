include emu8086.inc

.model small
.data
arr dw 1,2,3,4,5,6,7,8,9,1

.code

mov ax,@data
mov ds,ax

mov cx,10
mov si,0
Print "The Array is : "

MyLoop:

mov bx,arr[si]
push bx
mov dx,bx

mov dh,0 
add dl,48
mov ah,02h
int 21h 

add si,2

Loop MyLoop

mov cx,10
PrintN ""
Print "Array in Reverse is :"

MyLoop2:

POP DX
mov dh,0
add dl,48
mov ah,02h
int 21h

loop MyLoop2

mov ah,4Ch
int 21h
