#include <stdio.h>


void
ralph(int a, int b, int c) {
  // b = a * c / 2000;
  printf("%d, %d, %d\n", a, b, c);
}

int
main() {
  ralph(10, 100, 1000);
  return 0;
}

