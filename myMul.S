; myMul.S

global my_mul ; global symbol
extern test
    section .text ; indicate where to store this

my_mul:
    mov rax, rdi
    mul rsi
    ret