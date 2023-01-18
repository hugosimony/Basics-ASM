; mymul.S

global mymul ; global symbol
section .text ; indicate where to store this

mymul:
    push rbp
    mov rbp, rsp
    
    mov rcx, rdx
    mov rax, rdi
    mul rsi
    mov [rcx], rdx
    mov [rcx+8], rax

    pop rbp
    ret