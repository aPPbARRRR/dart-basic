// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Cleric {

    Cleric({
    required this.name,
    required this.curHp,
    required this.curMp,
  });

  final String name;
  int curHp;
  int curMp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  void selfAid () {
    if(curMp<5) return;
    curMp-5;
    curHp = maxHp;
  }

  int pray (int seconds) {
    if(seconds == 0) return 0;
    int randomNum = Random().nextInt(3);
    int amountOfRecovory = seconds+randomNum;
    amountOfRecovory + curMp > maxMp? curMp = maxMp : curMp += amountOfRecovory;
    return amountOfRecovory;
  }

  @override
  String toString() => 'name: ${this.name}, hp: ${this.curHp}, mp: ${this.curMp}';

}

void main() {
  Cleric cleric = Cleric(name: 'adf', curHp: 10, curMp: 3);
  print(cleric.toString());

  cleric.selfAid();
  print(cleric.toString());

  cleric.pray(1);
  print(cleric.toString());
}
