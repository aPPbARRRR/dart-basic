import 'package:dart_application_1/game/wand.dart';
import 'package:dart_application_1/game/wizard.dart';

import 'cleric.dart';

void main() {
  // Cleric asus = Cleric(name: 'asus', curHp: 10, curMp: 3);
  // Cleric mac = Cleric(name: 'mac');
  // Cleric window = Cleric(name: 'window', curHp: 20);
  // print(asus.toString());
  // print(mac.toString());
  // print(window.toString());

  // asus.selfAid();
  // print(asus.toString());

  // print('회복량 : ${asus.pray(0)}');
  // print(asus.toString());

  try {
    Wizard wizard1 = Wizard(
        name: 'asdgf', hp: 10, mp: 5, wand: Wand(name: 'wand', power: 100));
    print(wizard1.info);
    try {
      wizard1.mp = 5;
      wizard1.hp = -5;
      // wizard1.wand = Wand(name: '111', power: 10);
      wizard1.wand = null;
    } catch (e) {
      print(e);
    }
    print(wizard1.info);
  } catch (e) {
    print(e);
  }

}
