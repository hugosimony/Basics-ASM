; my_Mul3.S

global my_mul3 ; global symbol
extern test
    section .text ; indicate where to store this

my_mul3:
    mov rax, 0
    add rax, rdi
    add rax, rdi
    add rax, rdi
    ret