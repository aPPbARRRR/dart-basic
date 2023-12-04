// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'wand.dart';

class Wizard {
  final String name;
  int hp;
  int mp;
  Wand? wand;

  void validation() {}

  Wizard({
    required this.name,
    required this.hp,
    required this.mp,
    this.wand,
  }) {
    if (name.length < 3) throw Exception('Wizard의 이름이 제대로 설정되지 않았습니다.');
    if( wand == null ) throw Exception('Wand가 없습니다.');
    if( mp <= 0) throw Exception('Wizard의 mp가 제대로 설정되지 않았습니다.');
    if( hp < 0 ) this.hp = 0;
  }

  String get info => 'name: $name, hp/mp: $hp/$mp, wand: ${wand!.name}/${wand!.power}';
}


