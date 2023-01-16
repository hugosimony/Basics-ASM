; mydiv.S

global mydiv ; global symbol
section .text ; indicate where to store this

mydiv:
    push ebp
    mov ebp, esp

    ; get the two operands and the result struct
    mov eax, [ebp+8]
    mov edx, [ebp+12]
    mov ebx, [ebp+16]

    ; check if the divisor is 0
    cmp edx, 0
    jz div_by_zero

    ; perform the division
    xor edx, edx
    div edx

    ; store the result and remainder in the resdiv struct
    mov [ebx], eax
    mov [ebx+8], edx

    ; return 1 on success
    mov eax, 1
    jmp end

div_by_zero:
    ; return 0 if a division by 0 has been detected
    xor eax, eax

end:
    pop ebp
    ret