void urcu_begin();
void urcu_end();
void f();

extern int i;

void will_end_urcu() {
  if (i) {
    urcu_end();
  }

  while (--i != 0) {
    urcu_end();
  }
}

int main() {
  urcu_begin();
  f();
  will_end_urcu();
  urcu_end();
  return 0;
}
