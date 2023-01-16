; mymul.S

global mymul ; global symbol
section .text ; indicate where to store this

mymul:
    push ebp
    mov ebp, esp

    ; get the two operands and the result struct
    mov eax, [ebp+8]
    mov edx, [ebp+12]
    mov ebx, [ebp+16]

    ; perform the multiplication
    mul edx

    ; store the result in the resmul struct
    mov [ebx], eax
    mov [ebx+8], edx

    pop ebp
    ret