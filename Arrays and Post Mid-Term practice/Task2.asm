.data
msg1 db 10,13,"Enter the number : $"
msg2 db 10,13,"Array in reverse Order: $"
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

mov ah,09h
LEA dx,msg2
int 21h

mov cx,10
mov si,9
Reverse:

mov ah,02h

mov dl,arr[si]
add dl,48
int 21h

dec si

CMP cl,0
Loop Reverse

 
mov ah,4Ch
int 21h
end main