; mymul.S

global mymul ; global symbol
section .text ; indicate where to store this

mymul:
    push rbp
    mov rbp, rsp

    ; get the two operands and the result struct
    mov rax, [rbp+8]
    mov rdx, [rbp+16]
    mov rbx, [rbp+24]

    ; perform the multiplication
    mul rdx

    ; check if the result of the multiplication will overflow
    cmp rdx, rax
    jc overflow

    ; store the result in the resmul struct
    mov [rbx], rax
    mov [rbx+8], rdx
    jmp end

overflow:
    ; store -1 in the result struct if the multiplication will overflow
    mov rax, -1
    mov [rbx], rax
    mov [rbx+8], rax

end:
    pop rbp
    ret