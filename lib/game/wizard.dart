// 요구사항
// 다음 1.~4. 의 경우에 따른 타당성 검사를 추가한다.
// 만약 타당하지 않은 경우 Exception을 던져 프로그램은 종료시킨다.
// 1. 마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
// 2. 지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
// 3. 마법사의 지팡이는 null 일 수 없다.
// 4. 마법사의 MP는 0 이상이어야 한다.

// 다음 5. 의 경우 에러처리 대신 다음 기능을 수행한다.
// 5. HP가 음수가 되는 상황에서는 대신 Hp를 0으로 설정한다.

import 'wand.dart';

class Wizard {
  final String name;
  int _hp;
  int _mp;
  Wand? _wand; // Wand가 nullable로 선언된 이유에 대한 의문이 있습니다(Wand가 nullable인데 null일 경우 Exception을 throw한다는 점 등).

  // mp 변경시 validation 수행하기 위해 세터를 선언합니다. mp에 대한 변경은 세터를 통해서만 이루어지며, 변경시마다 다음 validation을 수행합니다.
  void set mp(int mp) => this._mp =
      mp < 0 ? throw Exception('wizard의 mp는 0보다 작을 수 없습니다.') : _mp = mp;
  // hp 변경시 조건을 적용하기 위해 세터를 선언합니다. hp에 대한 변경은 세터를 통해서만 이루어지며, 변경시마다 다음 조건에 따라 기능이 수행됩니다.
  void set hp(int hp) => hp < 0 ? this._hp = 0 : this._hp = hp;

  // wand 교체시 다음과 같은 세터를 통해 밸리데이션을 수행하고, 경우에 따라 예외를 던집니다.
  void set wand(Wand? wand) => wand != null ? this._wand = wand : throw Exception('wand가 null입니다. 뭐라도 주세요.');


  Wizard({
    required this.name,
    required int hp, //
    required int mp, //
    required Wand wand,
  })  : this._mp = mp,
        this._hp = hp,
        this._wand = wand {
    if (name.length < 3) throw Exception('Wizard의 이름이 제대로 설정되지 않았습니다.');
    if (mp <= 0) throw Exception('Wizard의 mp가 제대로 설정되지 않았습니다.');
  }

  String get info =>
      'name: $name, hp/mp: $_hp/$_mp, wand: ${_wand!.name}/${_wand!.power}';
}
