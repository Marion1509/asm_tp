global _start

section .bss
    result_msg resb 50

section .text

_start:
    mov rsi, qword [rsp + 8]  
    mov rdi, qword [rsp + 16] 
    
    add rsi, rdi

    mov rax, rsi
    mov rbx, 10
    mov rcx, result_msg
    call int_to_str

    mov rax, 1
    mov rdi, 1
    mov rdx, 30
    mov rsi, result_msg
    syscall

    mov eax, 60
    xor edi, edi
    syscall

int_to_str:
    mov rdx, 0
    mov r10, rbx
.loop:
    xor rdx, rdx
    div r10
    add dl, '0'
    mov [rcx], dl
    inc rcx
    inc rdx
    test rax, rax
    jnz .loop
.reverse:
    dec rcx
    mov al, [rcx]
    mov dl, [rsi]
    mov [rcx], dl
    mov [rsi], al
    inc rsi
    cmp rdx, rcx
    jae .reverse
    ret
