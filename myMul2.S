; my_Mul2.S

global my_mul2 ; global symbol
extern test
    section .text ; indicate where to store this

my_mul2:
    shl rdi, 1
    mov rax, rdi
    ret