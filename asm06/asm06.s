global _start

section .text

_start:

    mov eax, [rsp + 8]

    cmp eax, 1
    jle not_prime

    cmp eax, 2
    je prime

    mov ecx, 2 
    
_loop: 
    mov ebx, eax
    xor edx, edx
    div ecx
    test edx, edx
    jz not_prime

    inc ecx

    cmp ecx, eax
    jg prime 
    
    jmp _loop

not_prime:
    mov eax, 1
    jmp exit

prime:
    xor eax, eax

exit: 
    mov ebx, eax
    mov eax, 60
    syscall
