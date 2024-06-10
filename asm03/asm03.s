global _start

section .data
    msg db "1337", 10 

section .text

_start:
    mov rsi, [rsp + 8]     
    mov rsi, [rsi]         

    cmp rsi, 42
    jne not_42             

is_42:
    mov rax, 1             
    mov rdi, 1             
    mov rdx, 5             
    mov rsi, msg           
    syscall                

    xor rax, rax           
    xor rdi, rdi           
    syscall                 

not_42:
    mov rax, 60            
    xor rdi, rdi           
    syscall                
