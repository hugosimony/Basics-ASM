; mydiv.S

global mydiv ; global symbol
section .text ; indicate where to store this

mydiv:
    push rbp
    mov rbp, rsp

    mov rcx, rdx

    cmp rsi, 0        ; Compare divisor with 0
    jz divide_by_zero ; Jump to divide_by_zero if the division is by zero
    mov rax, rdi      ; Move the dividend into rax
    xor rdx, rdx      ; Clear rdx
    div rsi           ; Divide rax by rsi and store the result in rax and the remainder in rdx

    mov [rcx], rax    ; Store the result of the division in res.res
    mov [rcx+8], rdx  ; Store the remainder in res.rest
    mov r8, 1         ; Move 1 in r8 to indicate success
    jmp end

divide_by_zero:
    mov r8, 0         ; Move 0 in r8 to indicate division by zero
    mov [rcx], r8     ; Set the results to 0
    mov [rcx+8], r8   ; Set the results to 0

end:
    mov rax, r8       ; Move the success flag in rax
    pop rbp
    ret
