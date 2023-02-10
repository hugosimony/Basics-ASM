; myorderlist.S

global orderlist
global printnumber

section .data
zero db '0', 0
minus db '-', 0
comma db ',', 0
space db ' ', 0
newline db 10, 0

section .text

orderlist:
    push rbp
    mov rbp, rsp

    mov r11, 0

    mov rax, rsi
    mov rbx, 8
    mul rbx
    mov rcx, rax
    mov r10, 0

for1:
    mov r9, 0
for2:
    mov rax, [rdi + r9]
    mov rbx, [rdi + r10]
    cmp rax, rbx
    jng endfor2

    mov [rdi + r9], rbx
    mov [rdi + r10], rax

endfor2:
    add r9, 8
    cmp r9, rcx
    jl for2

    add r10, 8
    cmp r10, rcx
    jl for1

    mov r10, 0
    mov r9, rdi

    mov rax, rsi
    mov rbx, 8
    mul rbx
    mov r8, rax

print_list:
    mov rdi, [r9+r10]
    mov rsi, r11
    push r8
    push r9
    push r10
    push r11
    call printnumber
    pop r11
    pop r10
    pop r9
    pop r8

    test rax, rax
    js return
    
    inc r11

    mov rax, r8
    dec rax
    cmp r10, rax
    jnl print_list2
    
    cmp r11, 0
    jle finish_print_list


    test rax, rax
    js return

print_list2:
    add r10, 8
    cmp r10, r8
    jl print_list

finish_print_list:
    mov	rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    test rax, rax
    js return

return:
    pop rbx
    ret

printnumber:
    push rbx
    mov r10, rdi

    cmp rsi, 0
    je printnumber2

    mov	rax, 1
    mov rdi, 1
    mov rsi, comma
    mov rdx, 1
    syscall

    mov	rax, 1
    mov rdi, 1
    mov rsi, space
    mov rdx, 1
    syscall

printnumber2:
    mov rdi, r10

    cmp rdi, 0
    je zero
    jg itoa

    neg r10

    mov	rax, 1
    mov rdi, 1
    mov rsi, minus
    mov rdx, 1
    syscall

    cmp rax, 0
    jge itoa

    mov rax, -1
    pop rbx
    ret

itoa:
    mov r9, 0
    mov rax, r10
    mov rcx, 10
    mov rdx, 0

itoa_loop:
    inc r9
    div rcx

    cmp rax, 0
    jg itoa_loop

    sub rsp, r9
    mov r8, r9
    dec r8

    mov rbx, 10

itoa_loop2:
    mov rdx, 0
    mov rax, r10
    div rbx

    add rdx, '0'
    mov byte [rsp + r8], dl

    mov rdx, 0
    mov rax, r10
    div rbx
    mov r10, rax
    
    dec r8

    test r8, r8
    jns itoa_loop2

    mov	rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, r9
    syscall

    add rsp, r9

    pop rbp
    ret

print_zero:
    mov	rax, 1
    mov rdi, 1
    mov rsi, zero
    mov rdx, 1
    syscall

    pop rbx
    ret