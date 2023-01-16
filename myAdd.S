; myAdd.S

global my_add ; global symbol
extern test
    section .text ; indicate where to store this

my_add:
    add rdi, rsi
    mov rax, rdi
    ret