    .section .data
msgA:   .asciz "Entering funcA\n"
msgB:   .asciz "Entering funcB\n"
msgC:   .asciz "Entering funcC\n"
retA:   .asciz "Returning from funcA\n"
retB:   .asciz "Returning from funcB\n"
retC:   .asciz "Returning from funcC\n"

    .section .text
    .global _start

# Syscall to write a message
print:
    movq $1, %rax      # syscall: write
    movq $1, %rdi      # file descriptor: stdout
    syscall
    ret

# Entry Point
_start:
    call funcA         # Call first function

    # Exit with return value from funcA
    movq %rax, %rdi    # Move return value to exit code
    movq $60, %rax     # syscall: exit
    syscall

# Function A: Calls funcB
funcA:
    pushq %rbp
    movq %rsp, %rbp

    movq $msgA, %rsi   # Address of message
    movq $16, %rdx     # Length of message
    call print         # Print message

    movq $2, %rdi      # Argument for funcB
    call funcB         # Call function B

    movq $retA, %rsi   # Address of return message
    movq $19, %rdx     # Length of message
    call print         # Print message

    popq %rbp
    ret

# Function B: Calls funcC
funcB:
    pushq %rbp
    movq %rsp, %rbp

    movq $msgB, %rsi   # Address of message
    movq $16, %rdx     # Length of message
    call print         # Print message

    movq $3, %rsi      # Argument for funcC
    call funcC         # Call function C

    addq $5, %rax      # Add 5 to funcC's return value

    movq $retB, %rsi   # Address of return message
    movq $19, %rdx     # Length of message
    call print         # Print message

    popq %rbp
    ret

# Function C: Computes a simple value
funcC:
    pushq %rbp
    movq %rsp, %rbp

    movq $msgC, %rsi   # Address of message
    movq $16, %rdx     # Length of message
    call print         # Print message

    imulq %rdi, %rsi   # Multiply first and second arguments (2 * 3)
    movq %rsi, %rax    # Store result in RAX

    movq $retC, %rsi   # Address of return message
    movq $19, %rdx     # Length of message
    call print         # Print message

    popq %rbp
    ret
