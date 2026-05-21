.data

ab db "This",10,13,09,"is",10,13,09,09,"my",10,13,09,09,09,""Name"","$"

.code
main:
mov ax,@data
mov ds,ax
mov dx, offset ab

mov ah,9
int 21h

mov ah,4ch
int 21h
end main