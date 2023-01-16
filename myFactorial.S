; myFactorial.S

global my_factorial ; global symbol
extern test
    section .text ; indicate where to store this

my_factorial:
    if:
        cmp rdi, 1
        jle else
        mov rsi, rdi
        dec rdi
        jmp loop
    else:
        mov rax, 1 
        ret

loop:
    cmp rdi, 1
    jle return
    mov rax, rsi
    mul rdi
    mov rsi, rax
    dec rdi
    jmp loop

return:
    ret