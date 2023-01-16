; myorderlist.S

global orderlist ; global symbol
section .text ; indicate where to store this

orderlist:
    push ebp
    mov ebp, esp

    mov ebx, [ebp+8]  ; get the address of the list
    mov ecx, [ebp+12] ; get the size of the list

    ; sorting the list using bubble sort algorithm
sort_loop:
    mov esi, ebx
    mov edi, ebx
    add edi, 8
    mov eax, [esi]
    mov edx, [edi]
    cmp eax, edx
    jg swap
    dec ecx
    jz print_list
    add ebx, 8
    jmp sort_loop

swap:
    mov [edi], eax
    mov [esi], edx
    dec ecx
    jz print_list
    add ebx, 8
    jmp sort_loop

print_loop:
    ; print the sorted list
    mov eax, [ebx]
    call _print_dec
    mov edx, ','
    mov ecx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80
    mov edx, ' '
    mov ecx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80
    add ebx, 8
    dec ecx
    jnz print_loop
    mov edx, '\n'
    mov ecx, 1
    mov ebx, 1
    mov eax, 4
    int 0x80
    pop ebp
    ret

_print_dec:
    push ebx
    push ecx
    push edx
    mov ebx, 10
    mov ecx, 0
    mov edx, 0
    mov eax, [esp + 12]
    call _print_number
    pop edx
    pop ecx
    pop ebx
    ret

_print_number:
    push ebx
    push edi
    mov edi, esp
    add edi, 16
    mov ebx, 10
    mov eax, [esp + 8]
    cld
    call _print_number_loop
    pop edi
    pop ebx
    ret

_print_number_loop:
    xor edx, edx
    div ebx
    push edx
    inc ecx
    test eax, eax
    jnz _print_number_loop
    call _print_number_print
    ret

_print_number_print:
    mov ebx, 1
    mov eax, 4
    pop edx
    add dl, 48
    int 0x80
    dec ecx
    jnz _print_number_print
    ret

