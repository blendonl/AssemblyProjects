name "Pow"

org 100h

.data
    nr db 0 
    shuma dw 0
    temp db 0    
    title1 db "Power of a given number", "$"
    mesazhiPerNr db "Shtyp numrin: ", "$"
    mesazhiPerPow db "Shtyp fuqin: ", "$"
    zgjidhja db "Zjgidhja = ", "$"  
    mesazhZgjedhja db "Shtyp p per te vazhduar: ", "$"
    n_line db 0Ah, 0DH, "$"     
    
    

.code  

    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, title1
    int 21h
    
    main:
         
        mov ah, 09
        mov dx, offset n_line
        int 21h 
        mov dx, offset mesazhiPerNr
        int 21h
        
        mov bx, 1 
        
        mov cx, 10 
        
        mov ah, 01
        int 21h 
        
        sub al, 48 
        
        mov bl, al
    
    addNumber: 
       
    
        mov ah, 01
        int 21h 
        
        cmp al, 13
        je addPow 
        
        mov ah, 0
    
        sub al, 48 
        
        mov temp, al
        
        mov ax, bx
        
         
        mul cx
    
        mov bl, al
        
        add bl, temp
         
        
        jmp addNumber
    
    
    addPow:
        mov ax, 0 
        
        mov ah, 09
        mov dx, offset n_line
        int 21h
        
        mov ah, 09
        mov dx, offset mesazhiPerPow
        int 21h
        
        mov ah, 01
        int 21h
        
        mov cl, al
        
        sub cl, 48 
        
        mov nr, bl 
    
        mov shuma, bx  
        
        mov bx, 10
        
        didntPressEnter:
            mov ah, 01
            int 21h 
            
            
            cmp al, 13
            je checkNumber 
            
            mov ah, 0
        
            sub al, 48 
            
            mov temp, al
            
            mov ax, cx
            
             
            mul bx
        
            mov cl, al
            
            add cl, temp
            
            jmp didntPressEnter
    
    checkNumer:       

    
    powOfNumber: 
        cmp cx, 1
        je printZjidhjen
        
        mov ax, 0
        mov al, nr 
        
        
        
        mov bx, shuma
        
        findingPowOfNumber:
            
            
            add shuma, bx
        
            dec ax
            
            cmp ax, 1
            ja findingPowOfNumber
            
                     
        dec cx 
        jmp powOfNumber
        
        
        
    printZjidhjen: 
        mov ah, 09
        mov dx, offset n_line
        int 21h 
    
        mov ah, 09
        mov dx, offset zgjidhja
        int 21h
        
        mov bx, shuma
        
        cmp bx, 9
        ja numberAbove9
        mov ax, 0
                
        mov ah, 02
        mov dx, bx
        
        add dx, 48
        
        int 21h 
        
        jmp choose
    numberAbove9:
        mov cx, 0
        mov ax, bx
        mov bx, 10  
        mov dx, 0
        
        addToStack:
        
            cmp ax, 0
            je printNumberAbove9
            
            div bx
            
            inc cx
            
            push dx
            
            mov dx, 0  
            jmp addToStack
    
    printNumberAbove9:
        cmp cx, 0
        je choose
        
        pop dx 
        
        add dx, 48
        dec cx
        
        mov ah, 02
        int 21h    
        
        mov dx, 0
        
        jmp printNumberAbove9
        
     choose:   
        mov ah, 09
        mov dx, offset n_line
        int 21h 
        
        mov dx, offset mesazhZgjedhja
        int 21h
        
        
        mov ah, 01
        int 21h 
         
        
        
        cmp al, 'p'
        je main
        
         
        
     exit:
        ret
        
         


