// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() => 'name: ${this.name}, hp: ${this.curHp}, mp: ${this.curMp}';

}

void main() {
  Cleric cleric = Cleric(name: 'adf', curHp: 10, curMp: 20);
  print(cleric.toString());

  cleric.selfAid();
  print(cleric.toString());
}
