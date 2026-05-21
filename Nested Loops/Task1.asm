include emu8086.inc
.data
OuterBack db ?
InnerBack db 9
num db ?
Spaces db 1
.code
main:
mov ax,@data
mov ds,ax

mov cx,5

OuterLoop:
    mov OuterBack,cl
    mov cl,Spaces
    INC Spaces
    SpacesLoop:
    
    PutC 32
    
    Loop SpacesLoop
    mov cl,OuterBack
    
    mov OuterBack,cl
    mov num,cl
    mov cl,InnerBack
    
    InnerLoop:

        mov dl,num
        add dl,48
        putc dl

    loop InnerLoop
    sub InnerBack,2

    xor cx,cx
    mov cl,OuterBack
    PrintN ""
loop OuterLoop


mov ah,4Ch
int 21h
end main