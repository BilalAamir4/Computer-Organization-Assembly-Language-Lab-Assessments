include emu8086.inc

.data
OuterBack db ?
InnerBack1 db ? 
InnerBack2 db ?
SpacesLoop db 3
Minus db 1
comp db 1
start db 1
startPrint db ?
ToPrint db 0
 
.code
main:
mov ax,@data
mov ds,ax
mov cx,4
Outer:
    mov OuterBack, cl
    
    mov cl, SpacesLoop
    cmp SpacesLoop, 0
    je SkipSpaces     
    
    Spaces:
        putc 32       
    loop Spaces
    
    SkipSpaces:       
    mov cl, start      
    mov startPrint, cl 
    
    InnerLoop1:
        cmp startPrint, 0
        jz Cont
        mov dl, startPrint
        add dl, 48
        putc dl
        dec startPrint  
    loop InnerLoop1
    
    Cont:       
        
    mov cl, ToPrint
    mov startPrint, 2
    
    InnerLoop2:
        cmp cl, 0
        je Cont2
        mov dl, startPrint
        add dl, 48
        putc dl
        inc startPrint
    loop InnerLoop2
    
    Cont2:
    mov cl, OuterBack 
    printn ""
    inc start
    dec SpacesLoop
    inc ToPrint              
loop Outer

mov ah,4Ch
int 21h
end main