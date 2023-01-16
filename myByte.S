; myByte.S

global my_byte ; global symbol
extern test
    section .text ; indicate where to store this

my_byte:
    and rdi, 0xFF
    mov rax, rdi
    ret