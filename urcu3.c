void urcu_begin();
void urcu_end();
void f();

int main() {
  urcu_begin();
  f();
  urcu_end();
  urcu_end();
  return 0;
}
