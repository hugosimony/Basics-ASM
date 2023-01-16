; myHello.S

global my_hello ; global symbol
extern puts ; not define in this file (same as C)
extern test
    section .text ; indicate where to store this

my_hello:
    push rax
    lea rdi, [rel message]
    call puts wrt ..plt
    pop rax
    ret

section .rodata

message:
    db 'Hello world!', 0