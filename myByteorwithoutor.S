; my_Byteorwithoutor.S

global my_byteorwithoutor ; global symbol
extern test
    section .text ; indicate where to store this

my_byteorwithoutor:
    mov ax, di
    mov al, 0xFF
    ret