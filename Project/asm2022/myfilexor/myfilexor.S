; myfilexor.S

extern open
extern read
extern close

extern puts

global myfilexor ; global symbol

%define BUFFER_SIZE 2048

section .text ; indicate where to store this

footer:
    ; close file
    call close    
    ; finished
    pop rbp
    ret

myfilexor:
    ; Header:
    push rbp
    mov rbp, rsp
    jmp footer
    
    ; Code:
    mov r9, rsi
    mov rsi, 0
    call open    
    mov r8, rax
    jmp myread

myread:
    mov rdi, r8
    lea rsi, [rel buffer]
    mov rdx, BUFFER_SIZE
    call read    
    cmp rax, 0
    jle footer
    jmp write

write:
    lea rdi, [rel endline]    
    call puts
    ;lea rsi, [rel buffer]
    ;xor r9b, sil
    
    ;mov [rax], r9b
    ;inc rax
    jmp myread

section .bss
buffer resb BUFFER_SIZE
section .rodata
endline:
    db 10, 0
