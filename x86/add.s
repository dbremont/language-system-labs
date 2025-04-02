    .section .text
    .global _start  # Entry point
    .global add     # Make add function visible

# _start function (entry point)
_start:
    # Push function arguments onto the stack
    pushq $20        # Second argument (b = 20)
    pushq $10        # First argument  (a = 10)
    call add         # Call add function
    addq $16, %rsp   # Clean up the stack (remove arguments)

    # Exit system call (using return value from add)
    movq %rax, %rdi  # Move result to rdi (exit code)
    movq $60, %rax   # syscall: exit
    syscall          # Trigger system call

# add function: adds two integers (a + b)
add:
    movq 8(%rsp), %rax  # Load first argument (a) into rax
    addq 16(%rsp), %rax # Add second argument (b) to rax
    ret                 # Return result in rax
