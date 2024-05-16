global _start

section .data
    msg db "Sum: %d", 10, 0

section .bss
    result resq 1 

section .text 
    extern printf

_start 
    mov rdi, [rsp + 8]
    mov rdi, [rdi]
    sub rdi, '0'

    xor rax, rax 
    xor rcx, rcx

sum_loop: 
    cmp rcx, rdi
    jge sum_done
    add rax, rcx
    inc rcx
    jmp sum_loop

sum_res:
    mov [result], rax

    mov rdi, msg
    mov rsi, [result]
    xor rax, rax
    call printf

    mov rax, 60
    xor rdi, rdi
    syscall

