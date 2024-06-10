global _start

section .text

_start:
    
    mov eax, [rsp + 16]
    test eax, 1
    jz _return_0

    
    mov eax, 1
    jmp _exit

_return_0:
    xor eax, eax

_exit:
    mov ebx, eax
    mov eax, 60
    syscall
