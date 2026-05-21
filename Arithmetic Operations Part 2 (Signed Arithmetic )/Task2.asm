.data

var1 db -2
var2 db -2
divisor db -2

msg1 db "The result of -2 x -2:  $"
msg2 db "The result of 4/-2:  $"


.code
main:

mov ax,@data
mov ds,ax 

LEA dx,msg1
mov ah,09h
int 21h

mov ax,0
mov al,var1

IMUL var2

mov bl,al  ; To see the answer of - 2 x -2

IDIV divisor

mov bl,al  ; To see the answer of 4 / -2 

end main