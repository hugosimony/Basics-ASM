; myadd.S

global myadd ; global symbol
section .text ; indicate where to store this

myadd:
    push rbp
    mov rbp, rsp

    add rdi, rsi
    mov rax, rdi
    
    pop rbp
    ret