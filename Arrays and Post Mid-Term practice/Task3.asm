.model small

.data
msg1 db 10,13,"Enter the number : $"
outerback db ?
innerback db ?
msg2 db 10,13,"The Sorted Array is :",10,13,"$"
arr db ?


.code 
main:
mov ax,@data
mov ds,ax

mov cx,10
mov si,0

MyLoop:  ; Loop to store numbers
mov ah,09h
LEA dx,msg1
int 21h

mov ah,01h
int 21h
sub al,48

mov arr[si],al
inc si
xor ax,ax 

Loop MyLoop 


xor ax,ax
mov cx,9


OuterLoop:
mov outerback,cl
mov si,0

InnerLoop:

mov al,arr[si]
mov bl,arr[si+1]
CMP al,bl
JAE Cont

XCHG al,bl
mov arr[si],al
mov arr[si+1],bl

Cont:
inc si
dec outerback
CMP outerback,0
JE ExitInner 

JMP InnerLoop

ExitInner:
loop OuterLoop 


mov ah,09h
LEA dx,msg2
int 21h

  
mov cx,10
mov si,0

MyLoop2:

mov ah,02h

mov dl,arr[si]
add dl,48
int 21h

inc si

Loop MyLoop2 


mov ah,4Ch
int 21h

