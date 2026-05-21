.model small

.data
msg db 10,13,"Enter the number : $"
invld db 10,13,"Invalid number : ",10,13,"$"
fgrd db 10,13,"Your grade is F ",10,13,"$"
cgrd db 10,13,"Your grade is C ",10,13,"$"
bgrd db 10,13,"Your grade is B ",10,13,"$"
agrd db 10,13,"Your grade is A ",10,13,"$"
entr db 10,13,"You pressed Enter key ",10,13,"$"
num db ?

.code
mov ax,@data
mov ds,ax

MyLoop:

mov ah,09h
LEA dx,msg
int 21h

mov ah,01h
int 21h

CMP al,13
JE ExitLoop

sub al,48

CMP al,0
JL Invalid

CMP al,10
JA Invalid

CMP al,3
JL Fgrade

CMP al,4
JLE Cgrade

CMP al,7
JLE Bgrade

mov ah,09h
LEA dx,agrd
int 21h
JMP Cont

Bgrade:
mov ah,09h
LEA dx,bgrd
int 21h
JMP Cont

Cgrade:
mov ah,09h
LEA dx,cgrd
int 21h
JMP Cont

Fgrade:
mov ah,09h
LEA dx,fgrd
int 21h
JMP Cont

Invalid:

mov ah,09h
LEA dx,invld
int 21h

Cont:

jmp MyLoop

ExitLoop:

mov ah,09h
LEA dx,entr
int 21h

mov ah,4Ch
int 21h
