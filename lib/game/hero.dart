import 'dart:math';
import '../12_05/day7_assignment.dart';

class Hero {
  static int money = 100;

  static void moneyRandom() {
    Hero.money = Random().nextInt(1000);
  }

  String name;
  int _hp;
  Sword? sword;

  Hero({
    required this.name,
    required int hp,
    this.sword,
  }) : _hp = hp {
    print('1. Hero 생성자');
  }

  // getter
  // 프로퍼티
  int get hp => _hp;

  set hp(int value) {
    if (value < 0) {
      throw Exception('hp는 0보다 작을 수 없다');
    }

    _hp = value;
  }

  void attack(Slime slime) {
    slime.hp -= 10;
    print('10의 데미지!!!');
  }

  void run() {
    print('뛰었다');
  }
}

class Sword {
}
