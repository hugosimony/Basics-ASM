; myGetrip.S

global my_getrip ; global symbol
extern test
    section .text ; indicate where to store this

test:
    pop rax

footer:
    add rsp, 28h
    pop rbp
    ret

my_getrip:
    ; Header:
    push rbp
    mov rbp, rsp
    sub rsp, 28h
    ; Code:
    call test