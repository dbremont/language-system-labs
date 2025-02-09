#include <stdio.h>
#include <setjmp.h>

jmp_buf buf;

void second() {
    printf("Inside second function. Performing longjmp...\n");
    longjmp(buf, 1);  // Jump back to where setjmp was called
    printf("This will never be printed.\n");
}

void first() {
    printf("Inside first function. Calling second function...\n");
    second();
    printf("This will never be printed either.\n");
}

int main() {
    if (setjmp(buf) == 0) {
        printf("Initial call to setjmp. Calling first function...\n");
        first();
    } else {
        printf("Returned to main from longjmp!\n");
    }
    return 0;
}
