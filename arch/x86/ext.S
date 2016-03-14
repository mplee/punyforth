defprimitive "=",1,eq,1         // optional
    pop eax
    pop ebx
    cmp eax, ebx
    setz al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive ">",1,gt,1         // optional
    pop eax
    pop ebx
    cmp ebx, eax
    setg al
    movzbd eax, al
    neg eax
    push eax
    NEXT
    
defprimitive ">=",2,gte,1       // optional
    pop eax
    pop ebx
    cmp ebx, eax
    setge al
    movzbd eax, al
    neg eax
    push eax
    NEXT
    
defprimitive "<=",2,lte,1       // optional
    pop eax
    pop ebx
    cmp ebx, eax
    setle al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive "0=",2,eq0,1
    pop eax
    test eax, eax
    setz al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive "1=",2,eq1,1
    pop eax
    dec eax
    setz al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive "1+",2,inc,1
    pop eax
    inc eax
    push eax
    NEXT

defprimitive "1-",2,dec,1
    pop eax
    dec eax
    push eax
    NEXT

defprimitive "0<",2,lt0,1
    pop eax
    cmp eax, 0
    setl al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive "0>",2,gt0,1
    pop eax
    cmp eax, 0
    setg al
    movzbd eax, al
    neg eax
    push eax
    NEXT

defprimitive "over",4,over,1    // optional
    mov eax, [esp + CELLS]
    push eax
    NEXT

defprimitive "time",4,time,1 /* ( -- unixtime ) */
    mov eax, 13
    mov ebx, OFFSET FLAT:var0
    int 0x80
    mov eax, [var0]
    push eax
    NEXT