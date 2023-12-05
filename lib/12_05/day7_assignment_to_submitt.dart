// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dart_application_1/game/hero.dart';

// 상위개념 슬라임
class Slime {
  int hp = 50;
  final String suffix;

  Slime(this.suffix);

  void attack(Hero hero) {
    print('슬라임$suffix이/가 공격했다!');
    print('10의 데미지');
    hero.hp -= 10;
  }
}

// 슬라임 하위개념 포이즌슬라임
class PoisonSlime extends Slime {
  int _attackRemainNum = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if (_attackRemainNum > 0) {
      print(hero.hp);
      hero.hp -= hero.hp ~/ 5;
      _attackRemainNum -= 1;
      print(_attackRemainNum);
    }
  }
}

// 테스트 main
void main() {
  PoisonSlime ps = PoisonSlime('(독)');
  Hero hero = Hero(name: 'hero', hp: 55);
  ps.attack(hero);
}
