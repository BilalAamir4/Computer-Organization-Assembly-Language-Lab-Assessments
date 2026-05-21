.data
input db ?
str db "Enter the character you want to print ","$"

.code
main:

mov ah,02h
mov dl,'c'
int 21h 

mov dl,10
int 21h

mov ax,@data
mov ds,ax
       
mov ah,09h       
LEA dx,str
int 21h

       
mov ah,1
int 21h

mov input,al

mov ah,02h

mov dl,10
int 21h

mov dl,input
int 21h

mov ah,4Ch
int 21h
end main