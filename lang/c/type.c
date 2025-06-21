// Exploration of C Tpe System
#include <stdio.h>

void basic_types() {
    // Basic types in C
    int integer = 10;          // Integer type
    float floating_point = 5.5; // Floating point type
    double double_precision = 3.14159; // Double precision type
    char character = 'C';      // Character type

    printf("Integer: %d\n", integer);
    printf("Float: %.2f\n", floating_point);
    printf("Double: %.5f\n", double_precision);
    printf("Character: %c\n", character);
}

void union_type(){
    // Union type in C
    union Data {
        int integer;
        float floating_point;
        char character;
    };

    union Data data;
    data.integer = 10;
    // data.floating_point = 5.5;
    // data.character = 'C';

    for (int i = 0; i < 3; i++) {
        printf("Union Integer: %d\n", data.integer);
        printf("Union Float: %.2f\n", data.floating_point);
        printf("Union Character: %c\n", data.character);

    }
}

int main() {

    // basic_types();
    union_type();

    return 0;
}