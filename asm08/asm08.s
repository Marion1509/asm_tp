global _start

section .bss
    binary resb 33 

section .data
    msg db "decimal: ", 0
    result_ db "binary: " , 0
    line db 10, 0

section .text
    extern printf 
    extern scanf

_start

    mov rdi , msg
    xor rax, rax 
    call printf

    mov rdi, _decimal
    lea rsi, [rsp + 8]
    xor rax, rax 
    call scanf

    mov rdi, [rsp + 8]

    lea rsi, [binary + 32]
    mov byte [rsi] , 0
    dec rsi


conv_binary:

    test rdi, rdi
    jz print_result

    mov rax, rdi
    and rax, 1
    add al, '0'
    mov [rsi], al
    dec rsi 

    shr rdi,1 
    jmp conv_binary

print_result:

    mov rdi, result_
    xor rax, rax
    call printf

    mov rdi, rsi 
    add rdi, 1
    xor rax, rax 
    call printf

    mov rdi, line
    xor rax, rax
    call printf

    mov rax, 60
    xor rdi, rdi
    syscall