.data  

msg db 13,10,"The first five numbers in reverse order: ",13,10,'$'
divisor db 2

.code 
main:                                                             

mov ax,@data
mov ds,ax

mov cx,9


MyLoop:
xor ax,ax

mov al,cl

div divisor

cmp ah,0
jne Print

jmp Cont

Print:

mov dl,cl
add dl,48
mov ah,02h
int 21h

Cont:


loop MyLoop

mov ah,4Ch
int 21h

end main
