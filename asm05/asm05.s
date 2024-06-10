global _start

section .bss
    result_msg resb 50

section .text
_start:
    cmp rdi, 2
    jl no_args

    mov rsi, [rsp + 16]
    mov rdx, [rsp + 24]

    call atoi
    mov r8, rax
    mov rsi, rdx
    call atoi

    add r8, rax

    mov rdi, result_msg
    call itoa

    mov rax, 1
    mov rdi, 1
    mov rsi, result_msg
    mov rdx, 50
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

no_args:
    mov rax, 60
    mov rdi, 1
    syscall

atoi:
    xor rax, rax
    xor rcx, rcx
loop_start:
    movzx rdx, byte [rsi + rcx]
    cmp rdx, '0'
    jl end_loop
    cmp rdx, '9'
    jg end_loop
    sub rdx, '0'
    imul rax, 10
    add rax, rdx
    inc rcx
    jmp loop_start
end_loop:
    ret

itoa:
    xor rcx, rcx
    mov rdx, 10
loop_start:
    xor rdx, rdx
    div rdx
    add dl, '0'
    mov [rdi + rcx], dl
    inc rcx
    cmp rax, 0
    jne loop_start
    mov byte [rdi + rcx], 10
    ret
