; Name: Bilal Aamir
;ENrolment: 01-135232-016


include emu8086.inc
.stack 100h
DEFINE_SCAN_NUM       ; NUM IN CX
DEFINE_PRINT_STRING   ; OFFSET IN SI
DEFINE_GET_STRING     ; BUFFER IN DI 
DEFINE_PRINT_NUM_UNS  ; NUMBER IN AX 

.data
name db 5 dup(?)
days db 5 dup(?)  
COUNTER DW 0
CHOICE DB 0


.code

add_student proc
PUSH BP
MOV BP,SP


PRINT "ENTER THE NAME OF THE STUDENT: " 
PUSH DI,[BP+6]
CALL GET_STRING
 


PRINT "ENTER HOW MANY DAYS HE WAS PRESENT:  "
CALL SCAN_NUM
INC COUNTER      ;COUNTER FOR HOW MANY RECORDS STORED
MOV SI,COUNTER
DEC SI
                 ;INDEX 1 LESS THAN COUNTER
MOV BX,[BP+4]
MOV BX[SI],CX    ;STORE NAME IN THE INDEX 1 LESS THAN THE COUNTER   

POP BP
    
    ret 4
endp

show_student proc
PUSH BP
MOV BP,SP
   
   mov cx,counter
   mov si,0
   mov bx,[bp+6]
   printname:
   
   mov dx,bx[si]
   inc si
   mov ah,09h 
   int 21h
   
   loop printname
   xor si,si
   xor ax,ax
   mov bx,[bp+4]
   
   printdays:
   mov ax,bx[si]
   inc si
   call PRINT_NUM_UNS   ;number in ax 

   loop printdays 
   pop bp
       
  ret 4  
endp    


;Student with most days using 1 local variable
findmost proc
PUSH BP
MOV BP,SP
sub sp,2
    
mov bx,[bp+4]
    mov si,0
    mov di,[bp-2]
    MOV [DI],0
    mov cx,counter
    
    checkloop:
    mov ax,[di]
    cmp ax,bx[si]
    
    jg noreplace
    
    mov ax,bx[si]
    mov [di],ax
    
    noreplace:
    inc si
    loop checkloop
    
    Print "The most number of days are :"
    CALL PRINT_NUM_UNS
       
endp


main:

mov ax,@data
mov ds,ax

MENULOOP:

PRINT "1. ADD RECORD "
PRINTN "2. SHOW ALL "
PRINTN "3. FIND WITH THE MOST DAYS"
PRINTN "4. EXIT"
CALL SCAN_NUM
              ;CHECK CHOICE 
CMP CX,1
JE ADDD

CMP CX,2
JE SHOWALL

CMP CX,3
JE MOSTDAYS

CMP CX,4
JE EXITT

JMP MENULOOP


ADDD:
MOV AX,OFFSET NAME
PUSH AX

MOV AX,OFFSET DAYS
PUSH AX

CALL ADD_STUDENT
JMP MENULOOP

SHOWALL:

MOV AX,OFFSET NAME
PUSH AX

MOV AX,OFFSET DAYS
PUSH AX

call show_student

JMP MENULOOP


MOSTDAYS:

MOV AX,OFFSET DAYS
PUSH AX


JMP MENULOOP

EXITT:

MOV AH,4Ch
INT 21H

end main