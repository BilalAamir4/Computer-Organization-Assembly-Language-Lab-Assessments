include emu8086.inc
.model small

.data
count dw 1
spaces db 32    
stars db 42
pattern macro var
    local PrintSpaces,Exitspaces,PrintStars,ExitStars
    PUSH count
    
    mov bx,var
    sub bl,1
    PrintSpaces:
    CMP bl,0
    JE Exitspaces
    putc spaces   
    dec bl
    jmp PrintSpaces
    
    Exitspaces:
    
    PrintStars:
    CMP count,0
    JE ExitStars
    putc stars
    dec count
    jmp PrintStars
    
    ExitStars:
    PrintN ""
    
    POP count 
    add count,2
    
ENDM

.code
mov ax,@data
mov ds,ax

mov cx,6

PatternLoop:

pattern CX

Loop PatternLoop

mov ah,4Ch
int 21h