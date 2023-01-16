; myIncone.S

global my_incone ; global symbol
extern test
    section .text ; indicate where to store this

my_incone:
    inc rdi
    mov rax, rdi
    ret