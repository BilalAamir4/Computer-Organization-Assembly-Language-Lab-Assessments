.data
 
msg1 db "Enter the first Number : $"
msg2 db "Enter the second Number : $"
msg3 db "The result of multiplication is : $"
space db 10,13,"$"

num1 db ?
num2 db ?

.code
main:
mov ax,@data
mov ds,ax

LEA dx,msg1
mov ah,09h
int 21h
;displayed enter number 1 message

mov ah,01h
int 21h

mov num1,al
sub num1,48
; first number input

mov ah,09h
LEA dx,space
int 21h
;space

LEA dx,msg2
mov ah,09h
int 21h
;displayed enter number 2 message

mov ah,01h
int 21h

mov num2,al
sub num2,48
;second number input

mov ah,09h
LEA dx,space
int 21h
;space

LEA dx,msg3
mov ah,09h
int 21h
;displayed the multiplication  message

mov al,num1
mul num2

mov dl,al
add dl,48

mov ah,02h
int 21h
;displayed result

mov ah,4Ch
int 21h

end main




