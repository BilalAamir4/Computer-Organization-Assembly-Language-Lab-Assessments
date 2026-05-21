.data
msg1 db 10,13,"Enter the number : $"
msg2 db 10,13,"The number of even numbers is : $"
msg3 db 10,13,"The number of odd numbers is : $"
msg4 db 10,13,"More even numbers $"
msg5 db 10,13,"More odd numbers $"
msg6 db 10,13,"Equal even and odd numbers $"
even_count db 0
odd_count db 0
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

mov cx,10
mov si,0
xor ax,ax
mov bl,2

MyLoop2:  ;Loop to count even odd

mov al,arr[si]

div bl 

cmp ah,0
JE Even

inc odd_count
jmp Cont:

Even:
inc even_count

Cont:

xor ax,ax
inc si
Loop MyLoop2

;Print Even Count
mov ah,09h          
LEA dx,msg2
int 21h

mov ah,02h
mov dl,even_count 
add dl,48
int 21h

;Print Odd Count
mov ah,09h
LEA dx,msg3
int 21h

mov ah,02h
mov dl,odd_count
add dl,48
int 21h

;Check even more or odd
mov bl,odd_count

CMP even_count,bl
JE Equal
JL More_Odd
JG More_Even
JMP Cont2

Equal:

mov ah,09h
LEA dx,msg6
int 21h

jmp Cont2

More_even:
mov ah,09h
LEA dx,msg4
int 21h

jmp Cont2

More_Odd:
mov ah,09h
LEA dx,msg5
int 21h

Cont2:
 
mov ah,4Ch
int 21h
end main