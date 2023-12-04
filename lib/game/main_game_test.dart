
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
  Wizard wizard1 = Wizard(name: 'asdgf', hp: -18, mp: 10, wand: Wand(name: 'wand', power: 100));
  print(wizard1.info); }
  catch (e) {print(e);}

     Map list = {'1' : 1, '2' : 2, '3' : 3};
    print(list.keys.toList());

}


