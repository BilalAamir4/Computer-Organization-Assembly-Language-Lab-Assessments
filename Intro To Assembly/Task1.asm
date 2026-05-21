.data

a db "Name : Bilal Aamir",10,13, "Enrollment : 01-135232-016",10,13, "Section : BSIT-6B",10,13,"$"

.code
main:
mov ax,@data
mov ds,ax
mov dx,offset a

mov ah,9
int 21h

mov ah,4Ch
int 21h
end main