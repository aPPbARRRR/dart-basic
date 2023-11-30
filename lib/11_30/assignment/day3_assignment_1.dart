// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cleric {

  final String name;
  int curHp;
  int curMp;
  static const int maxHp = 50;
  static const int maxMp = 10;

  Cleric({
    required this.name,
    required this.curHp,
    required this.curMp,
  });
}

void main() {
  Cleric cleric = Cleric(name: 'adf', curHp: 10, curMp: 20);
}
