global _start

section .data
    msg db "1337", 10 

section .text

_start:
    ; Récupérer l'argument (le nombre)
    mov rsi, [rsp + 8]     
    mov rsi, [rsi]         

    
    ; Comparer avec 42
    cmp rsi, 42
    je is_42               ; Si égal à 42, sauter à is_42

not_42:
    ; Retourner 1
    mov rax, 60            ; Code de sortie 1
    xor rdi, rdi           ; nettoi rdi
    syscall                ; Appel système pour terminer le programme

is_42:
    ; Afficher "1337"
    mov rax, 1             ; Appel système pour écrire sur la sortie standard
    mov rdi, 1             ; Descripteur de fichier STDOUT
    mov rdx, 5             ; Longueur du message (4 caractères + 1 pour le saut de ligne)
    mov rsi, msg           ; Adresse du message
    syscall                ; Appel système pour afficher le message

    ; Retourner 0
    xor rax, rax           ; Code de sortie 0
    xor rdi, rdi           ; Clear rdi
    syscall                ; Appel système pour terminer le programme
