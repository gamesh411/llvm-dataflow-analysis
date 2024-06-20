a, b;
c() {
  if (a) {
    d();
    return 1;
  }
  e();
  int f = 3;
  while (a && !f--)
    a = g(b);
  if (a) {
    d();
    return 1;
  }
  return 0;
}
main() { c(); }
