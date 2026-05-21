.data  

msg db 13,10,"Enter the number : ",13,10,'$'
greatest db ?
msg2 db 13,10,"The Greatest number is : ",13,10,'$'

.code 
main:                                                             

mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,msg
int 21h

mov ah,01h
int 21h

mov greatest,al

mov cx,9

MyLoop:
mov ah,09h
LEA dx,msg
int 21h

mov ah,01h
int 21h

cmp al,greatest
jg NewGreatest

jmp Cont

NewGreatest:
mov greatest ,al

Cont:

loop MyLoop

mov ah,09h
LEA dx,msg2
int 21h

mov ah,02h
mov dl,greatest
int 21h

mov ah,4Ch
int 21h

end main
