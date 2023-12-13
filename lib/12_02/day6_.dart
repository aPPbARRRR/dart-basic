class Test {
  int _hp = 10;
  int get hp => _hp;

  int getHp() => _hp;
}

void main() {
  Test test = Test();
  print(test.getHp());
  print(test.hp);
}
