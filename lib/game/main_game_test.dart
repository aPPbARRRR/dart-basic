
import 'cleric.dart';

void main() {

  Cleric asus = Cleric(name: 'asus', curHp: 10, curMp: 3);
  Cleric mac = Cleric(name: 'mac');
  Cleric window = Cleric(name: 'window', curHp: 20);
  print(asus.toString());
  print(mac.toString());
  print(window.toString());

  asus.selfAid();
  print(asus.toString());

  print('회복량 : ${asus.pray(0)}');
  print(asus.toString());
}


