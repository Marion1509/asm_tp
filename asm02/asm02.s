global _start

section .data
    msg db "1337", 10 

section .text

_start: 
    mov rsi, [rsp + 8]
    mov rsi, [rsi]
    cmp rsi, 42
    je _is_42

_not_42:
    mov rax, 60
    xor rdi, rdi ; Correction: mettre rdi à zéro pour retourner 0
    syscall

_is_42:
    mov rax, 1
    mov rdi, 1
    mov rdx, 5
    mov rsi, msg
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
