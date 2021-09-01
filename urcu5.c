void urcu_begin();
void urcu_end();
void f();

void will_end_urcu() {
  urcu_end();
}

int main() {
  urcu_begin();
  f();
  will_end_urcu();
  urcu_end();
  return 0;
}
