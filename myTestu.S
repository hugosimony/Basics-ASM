; myTestu.S

global my_testu ; global symbol
extern test
    section .text ; indicate where to store this

my_testu:
    if:
        cmp di, si
        jb else
        mov rax, 0
        ret
    else:
        mov rax, 1
        ret