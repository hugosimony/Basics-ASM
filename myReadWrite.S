; myGetrip.S

global my_readwrite ; global symbol

%define BUFFER_SIZE 2048

extern test
    section .text ; indicate where to store this

footer:
    ; close file
    mov rax, 3
    syscall
    ; add a \n in the end
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel endline]
    mov rdx, 2
    syscall
    ; finished
    add rsp, 28h
    pop rbp
    ret

my_readwrite:
    ; Header:
    push rbp
    mov rbp, rsp
    sub rsp, 28h

    ; Code:
    mov rax, 2
    mov rsi, 0
    syscall
    mov r8, rax
    jmp read

read:
    mov rax, 0
    mov rdi, r8
    lea rsi, [rel buffer]
    mov rdx, BUFFER_SIZE
    syscall
    cmp rax, 0
    je footer
    jmp write

write:
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel buffer]
    syscall
    jmp read

section .bss
buffer resb BUFFER_SIZE
section .rodata
endline:
    db 10, 0