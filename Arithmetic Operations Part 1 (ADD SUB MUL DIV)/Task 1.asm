.data 

var1 db 4
var2 db 2
msg1 db "The result of addition is : $"
msg2 db "The result of the subtraction is : $"
space db 10,13,"$"

.code
main:
mov ax,@data
mov ds,ax

mov cl,var1
add cl,var2
add cl,48

LEA dx,msg1

mov ah,09h
int 21h

;message displayed
mov dl,cl

mov ah,02h
int 21h
;number displayed
 
LEA dx,space
mov ah,09h
int 21h

;space displayed
 
LEA dx,msg2
int 21h

;message displayed

mov cl,var1
sub cl,var2
add cl,48

mov dl,cl
mov ah,02h
int 21h

;number displayed

mov ah,4Ch
int 21h

end main




