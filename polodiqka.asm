org 100h

.data
    
    str1 db "Shkruaj nje string: ", "$" 
    len dw 0
    zgjidhja dw "Stringu eshte polodiqka", "$"
    zgjidhja1 dw "Stringu nuk eshte polodiqka", "$"
    nl db 0Ah, 0DH, "$" 
    mid dw 0
    eq db '='
    neq db '!'
    neq1 db '='
    buff    db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
            db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
            db  26 dup(0) ;CHARACTERS ENTERED BY USER.


.code
    mov ax, @data
    mov ds, ax
     
    mov bx, 0
    mov dx, offset str1
    mov ah, 09
    int 21h
    
    mov ah, 0Ah 
    mov dx, offset buff
    int 21h                           
                   
    mov si, offset buff + 2 


       
    next:
        CMP [si],13
        JE done
        INC len
        INC SI
        JMP next
        
    done:
        lea si, buff+2
        mov ax, 0
        mov ax, len
        mov bx, 2        
        mov dx, 0        
        div bx 
        dec len 
        lea di, si 
        mov mid, ax
              

    check:
       
        mov dx, len 
        mov ax, mid
        
        cmp dx, ax
        jb print
        
        add di, dx
        
        mov dx, 0       
        mov dl, [si]
        
        mov dl, [di]
 
        lea di, buff + 2
        
        mov al, [si] 
        
        cmp al, dl
        je equal
        
        jmp print1
        
       
        
    equal:
        mov bx, 0
        mov bh, dl
        mov bl, al
        mov dx, 0
        mov dx, offset nl
        mov ah, 09
        int 21h
        
        mov dx, 0
        mov dl, bh
        mov ah, 02
        int 21h 
        
        mov dl, eq
        int 21h 
        mov dl, eq
        int 21h
        
        mov dl, bl
        int 21h
        
         
        inc si
        dec len   
        jmp check
                 
    print: 
      
        mov dx, 0
        mov dx, offset nl
        mov ah, 09
        int 21h
        mov dx, offset zgjidhja
        int 21h
        
        jmp exit 
        
    print1: 
        mov bx, 0
        mov bh, dl
        mov bl, al
        mov dx, 0
        mov dx, offset nl
        mov ah, 09
        int 21h
        
        mov dx, 0
        mov dl, bh
        mov ah, 02
        int 21h 
        
        mov dl, neq
        int 21h 
        mov dl, neq1
        int 21h
        
        mov dl, bl
        int 21h
        mov ax, 0
        lea dx, nl
        mov ah, 09
        int 21h  
        
        lea dx, zgjidhja1
        int 21h 
        

       
        
    exit:
        ret    
        
            
         
    
        