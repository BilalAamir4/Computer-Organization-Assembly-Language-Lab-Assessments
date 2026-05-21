.data
 
msg1 db "Enter the dividend : $"
msg2 db "Enter the divisor : $"
msg3 db "The remainder  is : $"
msg4 db "The quotient is : $" 
space db 10,13,"$"

dividend db ?
divisor db ?
quotient db ?
remainder db ?

.code
main:
mov ax,@data
mov ds,ax

LEA dx,msg1
mov ah,09h
int 21h

;displayed enter dividend

mov ah,01h
int 21h

mov dividend,al
sub dividend,48
;first number input

mov ah,09h
LEA dx,space
int 21h
;space

LEA dx,msg2
int 21h
;displayed enter divisor

mov ah,01h
int 21h

mov divisor,al
sub divisor,48
;first number input

xor ax,ax
mov al,dividend
div divisor
;division done 

mov quotient,al
mov remainder,ah
;vaues stored

mov ah,09h
LEA dx,space
int 21h
;space

mov ah,09h
LEA dx,msg3
int 21h
;displayed remainder message

mov ah,02h
mov dl,remainder
add dl,48
int 21h
;displayed remainder 

mov ah,09h
LEA dx,space
int 21h
;space

mov ah,09h
LEA dx,msg4
int 21h
;displayed quotient message

mov ah,02h
mov dl,quotient
add dl,48
int 21h
;displayed quotient
 
mov ah,4Ch
int 21h

end main




