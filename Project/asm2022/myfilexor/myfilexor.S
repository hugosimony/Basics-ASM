; myfilexor.S

section .data
    filepath db 0
    key db 0
    buffer db 0


section .bss
    fileSize resq 1
    bufferSize resq 1

global myfilexor ; global symbol
section .text ; indicate where to store this

myfilexor:
    push rbp
    mov rbp, rsp

    ; Store filepath and key arguments in local variables
    mov [filepath], rdi
    mov [key], rsi

    ; Open file
    mov rax, 2
    mov rdi, [filepath]
    mov rsi, 0
    syscall

    ; Store file descriptor in rax
    mov [fileDescriptor], rax

    ; Get file size
    mov rax, 8
    mov rdi, [fileDescriptor]
    syscall
    mov [fileSize], rax

    ; Allocate buffer
    mov rdi, [fileSize]
    mov rax, 9
    syscall
    mov [buffer], rax

    ; Read file into buffer
    mov rax, 0
    mov rdi, [fileDescriptor]
    mov rsi, [buffer]
    mov rdx, [fileSize]
    syscall

    ; XOR each byte of buffer with key
    mov rdi, [buffer]
    mov rsi, [key]
    mov rcx, [fileSize]

xor_loop:
    cmp rcx, 0
    je xor_done
    xor byte [rdi], rsi
    inc rdi
    dec rcx
    jmp xor_loop

xor_done:

    ; Close file
    mov rax, 3
    mov rdi, [fileDescriptor]
    syscall

    ; Return buffer
    mov rax, [buffer]

    pop rbp
    ret
