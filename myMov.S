; myMov.S

global my_mov ; global symbol
extern test
    section .text ; indicate where to store this

my_mov:
    push rdi
    pop rax
    ret