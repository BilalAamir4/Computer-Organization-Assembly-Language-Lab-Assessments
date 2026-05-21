.data

dividend db 4
divisor db -2
dividend2 db -4
divisor2 db -2

.code
main:

mov ax,@data
mov ds,ax 

mov ax,0

mov al,dividend2
CBW

IDIV divisor2

mov bl,al  ; Just to see the AX register  for -4 / -2



mov al,dividend
CBW

IDIV divisor  

mov bl,al  ; Just to see the AX register for  4 / -2

end main