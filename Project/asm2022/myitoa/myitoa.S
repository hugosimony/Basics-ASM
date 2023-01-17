; myitoa.S

global myitoa ; global symbol
section .text ; indicate where to store this

myitoa:
    push rbp
    mov rbp, rsp

    xor r8, r8    ; use register r8 to store the result
    xor rcx, rcx  ; use register rcx as a counter

    ; check if the first character is '-'
    mov cl, [rdi]
    cmp cl, '-'
    jne positive

    ; handle negative numbers
    inc rdi
    mov r8, 0
    mov cl, [rdi]
    jmp convert

positive:
    ; handle positive numbers
    mov r8, 0

convert:
    ; start the loop
    loop:
    cmp cl, 0
    je end
    mov rax, r8
    mov r9, 10
    mul r9
    mov r8, rax
    ; check if the current character is a digit
    cmp cl, '0'
    jl end
    cmp cl, '9'
    jg end
    ; convert the character to a digit
    sub cl, '0'
    ; add the digit to the result
    add r8, rcx
    ; move the string pointer to the next character
    inc rdi
    mov cl, [rdi]
    jmp loop

end:
    mov rax, r8  ; move the final result to rax
    pop rbp
    ret
