; myadd.S

global myadd ; global symbol
extern test
    section .text ; indicate where to store this

myadd:
    add rdi, rsi
    mov rax, rdi
    ret