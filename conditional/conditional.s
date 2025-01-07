global _start

section .text
_start:
    mov rax, 2      ; Seteamos 2    
    imul rax, 5     ;2x5=10
loop:
    cmp rax, 10     ;(10==10)=0
    jnz loop