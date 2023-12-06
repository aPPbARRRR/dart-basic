class Tribe {}

class Terran extends Tribe {}
class Protoss extends Tribe {}
class Zerg extends Tribe {}

abstract class Bionic {} // 테란은 종족(Tribe)이기도 하면서 Bionic 이니까... // mixin, abstract interface 선택 가능. 추후 어떤 요구기능 있는지에 따라 결정할 수 있을듯.
abstract class Mechanic {} // 상동

class SCV extends Terran implements Mechanic {
  void getResource () { } // 자원채취
  void repair (Mechanic target) {} // 메카닉 수리, 메카닉 타입을 인자로 받으므로 메카닉만 수리 가능
}
class Tank extends Terran implements Mechanic {}
class Vulutre extends Terran implements Mechanic {}

class Marine extends Terran implements Bionic {
}

class Medic extends Terran implements Bionic {
  void heal (Bionic target) {} // scv도 치료가 가능해야 하는데, 이렇게 하면 scv는 치료를 못함
  // 방안 1. scv를 bionic 상속하여 만든다.
  // 방안 2. heal 함수 내부에서 인자를 분류하여 치료 여부를 결정한다.
  // 방안 3. scv 전용 heal 함수를 만든다.
}

void main () {
  
}