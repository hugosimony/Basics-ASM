; myorderlist.S

global orderlist ; global symbol
section .text ; indicate where to store this

orderlist:
    push rbp
    mov  rbp, rsp
   
    xor rax, rax        ;Setting EAX to 0, it'll be our iterator
   
    MainLoop:
        ;If 'i' >= the number of items, exit the loop
        cmp rax, rsi
        jge EndLoop    
       
        ;If 'i' == 0, move to the next element
        cmp rax, 0
        je IncreaseCounter
       
        ;If array[i-1] <= array[i], it means they are
        ;sorted, so move to the next element
        mov r8, [rdi]      ;EBX = array[i]
        mov r9, [rdi-8]    ;EDX = array[i-1]
        cmp r8, r9
        jle IncreaseCounter
       
        ;else, swap array[i-1] with array[i]
        
        mov r8, [rdi]
	mov r9, [rdi-8]
	mov [rdi], r9
	mov [rdi-8], r8 
       
        ;Move to the previous element in the array
        ;and decrease 'i'
        sub rdi, 8
        dec rax
       
        ;Loop back to the top
        BackToMainLoop:
        jmp MainLoop
       
        ;Moving to the next element in the array
        ;and increasing 'i'
    IncreaseCounter:
        inc rax
        add rdi, 8
        jmp BackToMainLoop
   
    EndLoop:
        jmp PrintList

    PrintList:
        ; Need to print the list here as i think it's sorted
        jmp Finished

    Finished: 
    	pop rbp
    	ret
