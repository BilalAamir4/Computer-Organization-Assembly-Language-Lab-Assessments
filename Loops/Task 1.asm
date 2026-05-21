.data

.code

main:
mov ax,@data
mov ds,ax

mov cx,26
mov dl,'z'
mov ah,02h

MyLoop:

int 21h
DEC DL

loop MyLoop

mov ah,4Ch
int 21h
end main         
