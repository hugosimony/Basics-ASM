; myTest.S

global my_test ; global symbol
extern test
    section .text ; indicate where to store this

my_test:
    if:
        cmp di, si
        jl else
        mov rax, 0
        ret
    else:
        mov rax, 1
        ret