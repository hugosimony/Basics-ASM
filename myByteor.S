; myByteor.S

global my_byteor ; global symbol
extern test
    section .text ; indicate where to store this

my_byteor:
    or rdi, 0x00FF
    mov ax, di
    ret