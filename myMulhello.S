; myMulhello.S

global my_mulhello ; global symbol
extern puts ; not define in this file (same as C)
extern test
    section .text ; indicate where to store this

footer:
    add rsp, 28h
    pop rbp
    ret

my_mulhello:
    ; Header:
    push rbp
    mov rbp, rsp
    sub rsp, 28h
    ; Code:
    mov rax, rdi
    mov r8, rdi
    test r8, r8 ; test r8&r8 so returns 0 only if r8 is 0
    ; Footer:
    jz footer
    jmp loop
    
loop:
    lea rdi, [rel message]
    call puts wrt ..plt
    dec r8
    mov rax, r8
    jnz loop
    ; Footer:
    jmp footer

section .rodata

message:
    db 'Hello', 0