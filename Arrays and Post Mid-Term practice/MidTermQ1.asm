.data
msg db 10,13,"Enter the number : ",10,13,"$"
msg2 db 10,13,"The number is less than 5 ",10,13,"$"
num db ?
divv db 2
msg3 db 10,13,"The number is : $"
div2 db 10
quot db ?
rem db ?
strquot db 10,13,"The quotient is $"
strrem db 10,13,"The remainder is $"
.code

main:
mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,msg
int 21h

mov ah,01h
int 21h
sub al,48

CMP al,5
JL LessThan5
mov num,al
xor ax,ax
mov al,num 
div divv

CMP ah,0
JE Even
JGE Odd
Odd:
xor ax,ax
mov al,num
MUL divv
mov num,al

CMP al,10
JGE double
JL Single

double:
xor ah,ah
div div2

mov cl,al
add cl,48

mov bl,ah
add bl,48 

mov ah,09h
LEA dx,msg3
int 21h

mov ah,02h
mov dl,cl
int 21h
mov dl,bl
int 21h
jmp Cont3

Single:

mov ah,09h
LEA dx,msg3
int 21h

mov ah,02h
mov dl,num
add dl,48
int 21h

Cont3:
jmp Cont2

Even:
xor ax,ax
mov al,num
div divv

mov quot,al
mov rem,ah

mov ah,09h
LEA dx,strrem
int 21h

mov ah,02h
mov dl,rem 
add dl,48
int 21h

mov ah,09h
LEA dx,strquot
int 21h

mov ah,02h
mov dl,quot
add dl,48
int 21h

Cont2:
JMP Cont
LessThan5:

mov ah,09h
LEA dx,msg2
int 21h

Cont:

mov ah,4Ch
int 21h
end main