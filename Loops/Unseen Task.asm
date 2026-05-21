
.data  
bckp db ?
bckp2 db ? 
bckpdl db ?
newl db 13,10,'$'
comp db 4

.code 
main:                                                             

mov ax,@data
mov ds,ax

mov cx,4

OuterLoop:

mov bckp,cl


InnerLoop:

cmp cl,0
jg Print1

jmp Cont1

Print1:
mov dl,cl
mov bckpdl,dl
add dl,48
mov ah,02h
int 21h
mov dl,bckpdl
Cont1:

loop InnerLoop

   
mov dl,cl
add dl,2
mov cl,bckp


InnerLoop2:
cmp dl,comp
jle Print2

jmp Cont2

Print2:
mov bckpdl,dl
add dl,48
mov ah,02h
int 21h
mov dl,bckpdl
INC dl

Cont2:

loop InnerLoop2
DEC comp

mov cl,bckp

mov ah,09h
LEA dx,newl
int 21h
loop OuterLoop

mov ah,4Ch
int 21h

end main
