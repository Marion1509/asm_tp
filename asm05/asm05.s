global _start

section.bss
    result_msg resb 50

section.text
_start:
    cmp edi, 2
    jl no_args

    mov ebp, esp
    mov eax, [ebp + 16]
    mov ebx, [ebp + 24]

    call atoi
    mov esi, eax
    mov eax, [ebp + 24]
    call atoi

    add eax, esi

    mov esi, result_msg
    call itoa

    mov eax, 1
    mov edi, 1
    mov esi, result_msg
    mov edx, 50
    syscall

    mov eax, 60
    xor edi, edi
    syscall

no_args:
    mov eax, 60
    mov edi, 1
    syscall

atoi:
    xor eax, eax
    xor ecx, ecx
loop_start:
    movzx edx, byte [ebx + ecx]
    cmp edx, '0'
    jl end_loop
    cmp edx, '9'
    jg end_loop
    sub edx, '0'
    imul eax, 10
    add eax, edx
    inc ecx
    jmp loop_start
end_loop:
    ret

itoa:
    xor ecx, ecx
    mov ebx, 10
loop_start:
    xor edx, edx
    div ebx
    add dl, '0'
    mov [esi + ecx], dl
    inc ecx
    cmp eax, 0
    jne loop_start
    mov byte [esi + ecx], 10
    ret
