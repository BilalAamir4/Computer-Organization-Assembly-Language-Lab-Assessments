.data
str1 db "Enter the first Number :","$"
str2 db "Enter the second Number :","$"
num1 db ?
num2 db ?
newl db 10,13,"$"
.code 
main:

mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,str1
int 21h

mov ah,01h 
int 21h
mov num1,al

mov ah,09h
LEA dx,newl
int 21h

LEA dx,str2
int 21h

mov ah,01h
int 21h
mov num2,al


mov dl,num2
add dl,num1

sub dl,48
 
mov ah,09h
LEA dx,newl
int 21h

mov ah,02h
int 21h

mov ah,4Ch
int 21h
end main