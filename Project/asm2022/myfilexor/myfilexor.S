; myfilexor.S

global myfilexor ; global symbol
section .text ; indicate where to store this

myfilexor:
    push rbp
    mov rbp, rsp

    ; get filepath and key
    mov rsp, [rbp+8]
    mov cl, byte [rbp+12]

    ; open the file
    push 0          ; O_RDONLY flag
    push rsp        ; filepath
    call open
    add rsp, 8
    mov rdx, rax    ; save the file descriptor

    ; get the file size
    mov rax, rdx
    call lseek
    mov rcx, rax    ; save the file size

    ; allocate memory for the file content
    push rcx        ; size
    call malloc
    add rsp, 4
    mov rdi, rax    ; save the allocated memory pointer

    ; read the file content
    mov rax, rdx    ; file descriptor
    mov rsp, rdi    ; buffer
    mov rcx, rcx    ; size
    call read

    ; xor each byte of the file content with the key
    xor_loop:
    cmp rcx, 0
    jz end_xor
    xor byte [rsp], cl
    inc rsp
    dec rcx
    jmp xor_loop

end_xor:
    ; close the file
    mov rax, rdx
    call close

    ; return the allocated memory pointer
    mov rax, rdi
    pop rbp
    ret