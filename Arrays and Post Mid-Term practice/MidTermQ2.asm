.model small


.data
msg1 db 10,13,"Enter the number : $"
res  db 10,13,"The number is : $"
msg2 db 10,13,"Enter another number : $"
divv db 2
quot db ?
rem  db ?
num  db ?
num2 db ?

.code
mov ax, @data
mov ds, ax


mov ah, 09h
LEA dx, msg1
int 21h
mov ah, 01h
int 21h
sub al, 48          
mov num, al


xor ax, ax
mov al, num
mov divv, 2
div divv            

CMP ah, 0
JE Divisible        

xor ax, ax
mov al, num
mov divv, 2
MUL divv            

CMP al, 10
JGE double_odd     


mov num, al
add num, 48         
mov ah, 09h
LEA dx, res
int 21h
mov dl, num
mov ah, 02h
int 21h
jmp Cont

double_odd:

mov num, al
mov ah, 09h
LEA dx, res
int 21h
xor ax, ax
mov al, num
mov divv, 10
div divv           
mov quot, al
mov rem, ah
add quot, 48       
add rem, 48

mov ah, 02h
         
mov dl, quot
int 21h

mov dl, rem        
int 21h

jmp Cont


Divisible:
mov ah, 09h
LEA dx, msg2
int 21h
mov ah, 01h
int 21h
sub al, 48          
mov num2, al


xor ax, ax
mov al, num2
mov divv, 2
MUL divv

CMP al, 10
JGE double_even     


mov num2, al
add num2, 48

mov ah, 09h
LEA dx, res
int 21h

mov dl, num2
mov ah, 02h
int 21h

jmp Cont

double_even:

mov num2, al
mov ah, 09h
LEA dx, res
int 21h

xor ax, ax
mov al, num2

mov divv, 10
div divv

mov quot, al
mov rem, ah
add quot, 48
add rem, 48 

mov ah, 02h

mov dl, quot
int 21h

mov dl, rem
int 21h

Cont:
mov ah, 4Ch
int 21h