
import 'cleric.dart';

void main() {
  Cleric cleric = Cleric(name: 'adf', curHp: 10, curMp: 3);
  print(cleric.toString());

  cleric.selfAid();
  print(cleric.toString());

  print('회복량 : ${cleric.pray(0)}');
  print(cleric.toString());
}
