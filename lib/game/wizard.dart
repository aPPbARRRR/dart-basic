// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'wand.dart';

class Wizard {
  final String name;
  int hp;
  int? _mp;
  Wand? wand;

  void set mp(int mp) => this._mp =
      mp < 0 ? throw Exception('wizard의 mp는 0보다 작을 수 없습니다.') : _mp = mp;

  Wizard({
    required this.name,
    required this.hp,
    required int mp,
    this.wand,
  }) {
    this._mp = mp;
    if (name.length < 3) throw Exception('Wizard의 이름이 제대로 설정되지 않았습니다.');
    if (wand == null) throw Exception('Wand가 없습니다.');
    if (mp <= 0) throw Exception('Wizard의 mp가 제대로 설정되지 않았습니다.');
    if (hp < 0) this.hp = 0;
  }

  String get info =>
      'name: $name, hp/mp: $hp/$_mp, wand: ${wand!.name}/${wand!.power}';
}
