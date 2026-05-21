.data

a db 47,92,196,196,92,10,13,179,196,179,196,196,179,10,13,196,196,196,196,196,196, "$"
                                                                         
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