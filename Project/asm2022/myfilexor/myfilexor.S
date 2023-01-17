; myfilexor.S

global myfilexor ; global symbol
section .text ; indicate where to store this

myfilexor:
    push ebp
    mov ebp, esp

    ; get filepath and key
    mov ebx, [ebp+8]
    mov cl, byte [ebp+12]

    ; open the file
    push 0          ; O_RDONLY flag
    push ebx        ; filepath
    call open
    add esp, 8
    mov edx, eax    ; save the file descriptor

    ; get the file size
    mov eax, edx
    call lseek
    mov ecx, eax    ; save the file size

    ; allocate memory for the file content
    push ecx        ; size
    call malloc
    add esp, 4
    mov edi, eax    ; save the allocated memory pointer

    ; read the file content
    mov eax, edx    ; file descriptor
    mov ebx, edi    ; buffer
    mov ecx, ecx    ; size
    call read

    ; xor each byte of the file content with the key
    xor_loop:
    cmp ecx, 0
    jz end_xor
    xor byte [ebx], cl
    inc ebx
    dec ecx
    jmp xor_loop

end_xor:
    ; close the file
    mov eax, edx
    call close

    ; return the allocated memory pointer
    mov eax, edi
    pop ebp
    ret