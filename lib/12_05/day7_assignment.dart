// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dart_application_1/game/hero.dart';
import 'package:dart_application_1/game/wand.dart';
import 'package:dart_application_1/game/wizard.dart';

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

class PoisonSlime extends Slime {
  int _attackRemainNum = 5;

  PoisonSlime(super.suffix);

  @override
  void attack(Hero hero) {
    print('최초 hero.hp : ${hero.hp}');
    super.attack(hero);
    if (_attackRemainNum > 0) {
      print('공격당한 뒤 hero.hp : ${hero.hp}');
      print('추가로, 독 포자를 살포했다!');
      print(hero.hp);
      print('hero.hp~/5 : ${hero.hp ~/ 5}');
      hero.hp -= hero.hp ~/ 5;
      print('최종 hero.hp : ${hero.hp}');
      _attackRemainNum -= 1;
      print(_attackRemainNum);
    }
  }
}

void main() {
  PoisonSlime ps = PoisonSlime('(독)');
  Hero hero = Hero(name: 'hero', hp: 55);
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);
  ps.attack(hero);

}
