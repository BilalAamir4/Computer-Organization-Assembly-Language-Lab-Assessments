.data
msg1 db "Enter the number you want to check even or odd for $" 
msg2 db "The number is even $"
msg3 db "The number is odd $" 
space db 10,13,'$'
var db ?

.code
main:
mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,msg1
int 21h

mov ah,01h
int 21h 

mov ah,09h
LEA dx,space
int 21h

sub al,48
mov var,al

xor ax,ax
mov al,var

mov var,2
div var

cmp ah,0
je IfEqual

LEA dx,msg3
mov ah,09h
int 21h

mov ah,4Ch
int 21h

IfEqual:

LEA dx,msg2
mov ah,09h
int 21h

mov ah,4Ch
int 21h
end main
