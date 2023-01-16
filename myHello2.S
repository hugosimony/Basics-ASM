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
    mov rsi, message
    mov rdx, message_len
    mov rax, 1
    syscall
    ; Footer:
    jmp footer

section .rodata

message:
    db 'Hello world!', 0
message_len: equ $-message