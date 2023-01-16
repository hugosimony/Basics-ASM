; myDecone.S

global my_decone ; global symbol
extern test
    section .text ; indicate where to store this

my_decone:
    dec rdi
    mov rax, rdi
    ret