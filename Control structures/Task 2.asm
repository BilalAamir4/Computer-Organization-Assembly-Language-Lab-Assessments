.data

msg1 db "The grade is :  $"
msg2 db "The number is invalid $"
number db 85

.code
main:
mov ax,@data
mov ds,ax

cmp number,0
jl Invalid

cmp number,100
jg Invalid

cmp number,49
jle Fgrade

cmp number,79
jle Cgrade

cmp number,89
jle Bgrade

mov ah,09h
LEA dx,msg1
int 21h

mov ah,02h
mov dl,'A'
int 21h

mov ah,4Ch
int 21h

Fgrade:

mov ah,09h
LEA dx,msg1
int 21h

mov ah,02h
mov dl,'F'
int 21h

mov ah,4Ch
int 21h

Cgrade:

mov ah,09h
LEA dx,msg1
int 21h

mov ah,02h
mov dl,'C'
int 21h

mov ah,4Ch
int 21h

Bgrade:

mov ah,09h
LEA dx,msg1
int 21h

mov ah,02h
mov dl,'B'
int 21h

mov ah,4Ch
int 21h

Invalid: 

LEA dx,msg2
mov ah,09h
int 21h

mov ah,4Ch
int 21h

end main

