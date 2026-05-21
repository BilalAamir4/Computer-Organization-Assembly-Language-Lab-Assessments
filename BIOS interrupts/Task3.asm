.data
str1 db "2x 1 = $"
str2 db "2x 2 = $"
str3 db "2x 3 = $"
str4 db "2x 4 = $"
str5 db "2x 5 = $"
str6 db "2x 6 = $"
str7 db "2x 7 = $"
str8 db "2x 8 = $"
str9 db "2x 9 = $"
str10 db "2x 10 = $"
int1 db 2
int2 db 4
int3 db 6
int4 db 8
int5 db 10
int6 db 12
int7 db 14
int8 db 16
int9 db 18
int10 db 20

space db 9
newl db 10,13,"$"
 
.code
main:
mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,str1
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int1
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line

mov ah,09h
LEA dx,str2
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int2
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line 

mov ah,09h
LEA dx,str3
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int3
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line

mov ah,09h
LEA dx,str4
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int4
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line

mov ah,09h
LEA dx,str5
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int5
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line
 
mov ah,09h
LEA dx,str1
int 21h    

mov ah,02h
mov dl,space
int 21h

mov dl,int1
add dl,48
int 21h

mov dx,offset newl
mov ah,09h
int 21h

;New Line

mov ah,4Ch
int 21h
end main