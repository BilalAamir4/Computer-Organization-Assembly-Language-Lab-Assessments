.model small

.data
msg db 10,13,"Enter the number: $"
invld db 10,13,"You entered an invalid number $"
mnd db 10,13,"Monday $" 
tus db 10,13,"Tuesday $"
wed db 10,13,"Wednesday $"
thr db 10,13,"Thursday $"
frd db 10,13,"Friday $"
str db 10,13,"Saturday $" 
snd db 10,13,"Sunday $"
input db ?

.code
mov ax,@data
mov ds,ax

mov ah,09h
LEA dx,msg
int 21h

mov ah,01h
int 21h

sub al,48
mov input,al

CMP al,0
JE Invalid

CMP al,7
JG Invalid

CMP al,1
JE Monday

CMP al,2
JE Tuesday

CMP al,3
JE Wednesday

CMP al,4
JE Thursday

CMP al,5
JE Friday

CMP al,6
JE Saturday

mov ah,09h
LEA dx,snd
int 21h

jmp Cont

Monday:
mov ah,09h
LEA dx,mnd
int 21h

jmp Cont

Tuesday:

mov ah,09h
LEA dx,tus
int 21h

jmp Cont

Wednesday:
mov ah,09h
LEA dx,wed
int 21h

jmp Cont

Thursday:

mov ah,09h
LEA dx,thr
int 21h

jmp Cont
Friday:

mov ah,09h
LEA dx,frd
int 21h

jmp Cont 

Saturday:

mov ah,09h
LEA dx,str
int 21h

jmp Cont

Invalid:
mov ah,09h
LEA dx,invld
int 21h

Cont:

mov ah,4Ch
int 21h