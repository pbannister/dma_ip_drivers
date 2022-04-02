#include <stdio.h>
#include <unistd.h>

int main(int ac, char** av) {
    unsigned n = (1 << 20);
    char a[n];
    for (unsigned i = 0; i < n; ++i) {
        a[i] = 255 & i;
    }
    write(1, a, n);
    return 0;
}
