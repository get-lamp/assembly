#include <stdio.h>

extern int f_add(int, int);

int main() {
    printf("Hello World!");
    int number = f_add(40, 2);
    printf("%i", number);
    return 0;
};