.data

num dw 123 
numm db ?
divisor db ?
num1 db ?
num2 db ?
num3 db ?

msg db "The number is : $"

.code
main:
mov ax,@data
mov ds,ax

mov ax,num
mov divisor,100
div divisor         

mov numm,al          
mov num1,ah        

mov al,num1          
mov ah,0             
mov divisor,10
div divisor          

mov num2,al          
mov num3,ah          

; Print Message
mov ah,09h
lea dx,msg
int 21h

mov ah,02h

mov dl,numm
add dl,48
int 21h
 
mov dl,num2
add dl,48
int 21h

mov dl,num3
add dl,48
int 21h
 
mov ah,4Ch
int 21h

end main
