global _start

section .text
_start:
    ; push './flg.txt\x00'
    xor sil, sil        ; Ponemos a 0 sil que es la parte baja de si ( los 8 bytes menos significativos)
    push si            ; push NULL string terminator ; Pusheamos si entero; La suma de estas dos instrucciones ocupa menos espacio que la instrucción push 0
    mov rdi, '/flg.txt' ; rest of file name
    push rdi            ; push to stack 
    
    ; open('rsp', 'O_RDONLY')
    mov al, 2          ; open syscall number ; Ponemos a 2 en al que es la parte baja de rax (los 8 bytes menos significativos)
    mov rdi, rsp        ; move pointer to filename
    xor rsi, rsi        ; set O_RDONLY flag ; Errata anterior commit, era rsi xor con el mismo es lo mismo que =0 pero ocupa menos espacio
    syscall

    ; read file
    lea rsi, [rdi]      ; pointer to opened file
    mov rdi, rax        ; set fd to rax from open syscall
    xor al, al          ; read syscall number
    mov dl, 24         ; size to read
    syscall

    ; write output
    mov al, 1          ; write syscall
    mov dil, 1          ; set fd to stdout
    mov dl, 24         ; size to read
    syscall

    ; exit //Retiramos exit para ahorrar espacio
