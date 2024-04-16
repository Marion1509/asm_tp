global _start

section .bss
    result_msg resb 50

section .text

_start:
    
    mov ebp, esp

    
    mov eax, [ebp + 8]  
    mov ebx, [ebp + 12] 
    
    add eax, ebx

    
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 30 
    syscall

    mov eax, 1
    xor ebx, ebx
    syscall
