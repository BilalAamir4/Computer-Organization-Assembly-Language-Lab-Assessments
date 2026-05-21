.data

num1 db ?
num2 db ?
num3 db ? 
hundred db 100
tens db 10
res db ?
temp db ?
space db 10,13,"$"


msg1 db "Enter the value of first number: $"
msg2 db "Enter the value of second number: $"
msg3 db "Enter the value of third number: $"
msg4 db "The number is : $"
.code
main:

mov ax,@data
mov ds,ax 
 
mov ah,09h
LEA dx,msg1
int 21h

LEA dx,space
int 21h


xor ax,ax
mov ah,01h
int 21h

mov num1,al
sub num1,48 

mov ah,09h
LEA dx,space
int 21h


;First number input stored

mov ah,09h
LEA dx,msg2
int 21h

LEA dx,space
int 21h


xor ax,ax
mov ah,01h
int 21h

mov num2,al
sub num2,48

mov ah,09h
LEA dx,space
int 21h

;Second number input stored

mov ah,09h
LEA dx,msg3
int 21h

LEA dx,space
int 21h


xor ax,ax
mov ah,01h
int 21h

mov num3,al
sub num3,48

mov ah,09h
LEA dx,space
int 21h 

;Third number input stored

xor ax,ax
mov al,num1

mul hundred

mov res,al
;Result is 100

xor ax,ax

mov al,num2

mul tens

add res,al

;20 added in 100

mov al,num3
add res,al


;3 added in 100

;Now break the number into parts to print it 

mov ax,ax

mov al,res

div hundred
mov num1,al

mov temp,ah

xor ax,ax

mov al,temp

div tens

mov num2,al
mov num3,ah

add num1,48
add num2,48
add num3,48

mov ah,09h
LEA dx,msg4
int 21h

mov ah,02h

mov dl,num1
int 21h

mov dl,num2
int 21h

mov dl,num3
int 21h

mov ah,4Ch
int 21h
end main