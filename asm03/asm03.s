global _start

section .data
    msg db "1337", 10

section .text
_start:
    cmp rdi, 1
    jle no_arg

    mov rsi, [rsp + 16]
    mov rsi, [rsi]

    mov rax, rsi
    call atoi

    cmp rax, 42
    je is_42

not_42:
    ; Retourner 1
    mov rax, 60
    mov rdi, 1
    syscall                

is_42:
    ; Afficher "1337"
    mov rax, 1
    mov rdi, 1
    mov rdx, 5
    mov rsi, msg
    syscall
    
    mov rax, 60
    xor rdi, rdi
    syscall                

no_arg:
    mov rax, 60            ; Appel système pour terminer le programme
    mov rdi, 1             ; Code de sortie 1
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
