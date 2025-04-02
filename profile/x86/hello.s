section .data
    result db 'Result: ', 0
    newline db 10

section .bss
    buffer resb 20  ; Buffer to store the result as a string

section .text
    global _start

_start:
    ; Multiplication (e.g., 7 * 5)
    mov rax, 7
    mov rbx, 5
    imul rax, rbx  ; RAX = RAX * RBX

    ; Convert integer result to string
    mov rdi, buffer  ; Destination buffer
    call int_to_str

    ; Print "Result: "
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    mov rsi, result   ; message
    mov rdx, 8        ; length
    syscall

    ; Print the converted number
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    mov rsi, buffer   ; message
    mov rdx, 20       ; max length
    syscall

    ; Print newline
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall

    ; Exit
    mov rax, 60       ; syscall: exit
    xor rdi, rdi      ; status 0
    syscall

; Converts integer in RAX to a null-terminated string at RDI
int_to_str:
    mov rcx, 10       ; Base 10
    mov rbx, rdi      ; Save buffer pointer
    add rbx, 19       ; Move to end of buffer
    mov byte [rbx], 0 ; Null terminator

.convert_loop:
    dec rbx
    mov rdx, 0
    div rcx           ; RAX = RAX / 10, RDX = RAX % 10
    add dl, '0'       ; Convert remainder to ASCII
    mov [rbx], dl
    test rax, rax
    jnz .convert_loop
    mov rdi, rbx      ; Set RDI to point to converted string
    ret
