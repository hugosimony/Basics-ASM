; myMulhello.S

global my_mulhello ; global symbol
extern puts ; not define in this file (same as C)
extern test
    section .text ; indicate where to store this

my_mulhello:
    mov rax, rdi
    mov rdi, message
    jmp loop
    
loop:
    call puts
    dec rax
    mov rax, r8
    jnz loop
    ret

message:
    db 'Hello', 0