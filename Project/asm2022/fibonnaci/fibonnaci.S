; fibonnaci.S

global fibonnaci ; global symbol
section .text ; indicate where to store this

fibonnaci:
    push rbp
    mov rbp, rsp

    cmp rdi, 1
    jle check_negative
    mov r8, 0
    mov r9, 1
    mov r10, 2
    jmp loop

check_negative:
    cmp rdi, 0
    jl negative
    mov rax, rdi
    pop rbp
    ret

negative:
    mov rax, -1
    pop rbp
    ret

loop:
    cmp r10, rdi
    jge return
    inc r10
    cmp r8, r9
    jle addr8
    add r9, r8
    jmp loop

addr8:
    add r8, r9
    jmp loop

return:
    add r8, r9
    mov rax, r8

    pop rbp
    ret
