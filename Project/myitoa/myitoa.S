; myitoa.S

section .data
    buffer db 20 dup(0)

global myitoa ; global symbol
section .text ; indicate where to store this
    
myitoa:
    push ebp
    mov ebp, esp

    mov eax, [ebp+8]  ; get the integer argument
    xor edx, edx     ; clear edx
    mov ecx, 10      ; set the base to 10
    div ecx          ; divide eax by 10, quotient in eax, remainder in edx
    add edx, 48      ; convert remainder to ascii
    mov [buffer], dl
    inc dword [buffer]

    cmp eax, 0
    jz  store_string

    ; recursive call to convert quotient to string
    push eax
    call _itoa
    add esp, 4

store_string:
    mov eax, buffer
    pop ebp
    ret