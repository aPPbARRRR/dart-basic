import 'hero.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  final String suffix;
  int _attackRemainNum = 5;

  PoisonSlime({required this.suffix}) : super(suffix);

  @override
  void attack(Hero hero) {
    super.attack(hero);
    if(_attackRemainNum > 0) {
      print('추가로, 독 포자를 살포했다!');
      print(hero.hp);
      print(hero.hp~/5);
       hero.hp -= hero.hp~/5;
    }
  }
}