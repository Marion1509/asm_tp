global _start

section .data
    msg db "1337", 10 

section .text

_start:

    mov rsi, [rsp + 8]     
    mov rsi, [rsi]         

    
    ; Comparer avec 42
    cmp rsi, 42
    je is_42               

not_42:
    ; Retourner 1
    mov rax, 60           
    xor rdi, rdi           
    syscall                

is_42:
    ; Afficher "1337"
    mov rax, 1            
    mov rdi, 1             
    mov rdx, 5             
    mov rsi, msg           
    syscall                

    ; Retourner 0
    xor rax, rax           
    xor rdi, rdi           
    syscall                
