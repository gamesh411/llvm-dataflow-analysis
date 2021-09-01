void urcu_begin();
void urcu_end();
void f();

int main() {
  urcu_begin();
  urcu_begin();
  f();
  urcu_end();
  return 0;
}

// Contexts in JSON format
// [{"begin":"urcu2.c@6:3","end":"urcu2.c@9:3"},{"begin":"urcu2.c@6:3","end":"urcu2.c@9:3"}]
