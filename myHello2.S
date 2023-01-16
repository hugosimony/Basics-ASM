; myGetrip.S

global my_hello2 ; global symbol
extern test
    section .text ; indicate where to store this

footer:
    add rsp, 28h
    pop rbp
    ret

my_hello2:
    ; Header:
    push rbp
    mov rbp, rsp
    sub rsp, 28h
    ; Code:
    mov rdi, 1
    lea rsi, [rel msg]
    mov rdx, msg_len
    mov rax, 1
    syscall
    ; Footer:
    jmp footer

section .rodata

msg:
    db 'Hello world!', 10, 0
msg_len: equ $-msg