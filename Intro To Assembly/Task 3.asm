.data

a db "*",10,13,"**",10,13,"***",10,13,"****",10,13,"*****","$"

.code
main:
mov ax,@data
mov ds,ax
mov dx,offset a

mov ah,9
int 21h

mov ah,4ch
int 21h
end main