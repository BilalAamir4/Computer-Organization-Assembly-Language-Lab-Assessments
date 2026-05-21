.data

msg db "    *"    ,10,13,
    db "   ***"   ,10,13,
    db "  *****"  ,10,13,
    db " *******" ,10,13,
    db "  ***** " ,10,13 ,
    db "   *** ",10,13 ,
    db "    * ",10,13, "$"
    
.code
main:
mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,msg
int 21h 

mov ah,4Ch
int 21h
end main