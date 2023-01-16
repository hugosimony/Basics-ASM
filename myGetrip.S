; myGetrip.S

global my_getrip ; global symbol
extern test
    section .text ; indicate where to store this

my_getrip:
    push rdi
    pop rax
    ret