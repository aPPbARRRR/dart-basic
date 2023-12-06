// class 로 선언하라고 명시되어있지 않은 부분은 추상클래스, 인터페이스로 하였음
// 모든 유닛, 빌딩은 unit, building을 implements 할 것임

class Tribe {
  // 부대지정 요구사항 분석
  // 각 종족마다 부대지정 가능. 1플레이어 1종족이라고 하셨던 걸로 기억함..

  //  List<Group> groups = <Group>[];

  //   void addGroupToList (Group group) { groups.add(group); }
  //   void makeGroup () {}
  //   void addUnitToGroup (Unit unit, Group group) {}
}

class Group {
  List<Unit> units = <Unit>[];
}

abstract class Terran extends Tribe {}

abstract class Protoss extends Tribe {
  Protoss({required int sheild}) : this._sheild = sheild;

  int _sheild;

  // shield를 외부에서 접근하여 건드리게되면 setter body부분 통해서 autoShieldRecovery 실행
  set shield(int damage) {}

  void autoShieldRecovery() {} //
}

abstract class Zerg extends Tribe implements Bionic {
  // 13-5. 에서 저그는 모든 유닛, 건물이 bionic으로 구성되어 있다고 요구하여 bionic impl하였음.
  void recovery() {} // 13-5. 자동회복 기능
  // 자동회복은 하위 클래스에서 트리거됨.
}

abstract interface class Bionic {} // 테란은 종족(Tribe)이기도 하면서 Bionic 이니까... // mixin, abstract interface 선택 가능. 추후 어떤 요구기능 있는지에 따라 결정할 수 있을듯.

abstract interface class Mechanic {} // 상동

class SCV extends Terran implements Mechanic {
  void getResource(Resource resource) {} // 자원채취
  void repair(Mechanic target) {} // 메카닉 수리, 메카닉 타입을 인자로 받으므로 메카닉만 수리 가능
}

class Tank extends Terran implements Mechanic {}

class Vulutre extends Terran implements Mechanic {}

abstract interface class Unit {}
// 동호님: 인터페이스로 선언시 유닛에 필드가 필요한 경우는...? -> 공통분모(예-hp) 있다면 공통분모 해당하는 만큼 상위개념으로 올라가서 선언하는 방식으로 해결. 만약 그 최종 상위개념이 인터페이스가 되는 경우 인터페이스 대신 믹스인 고려. 안되면 앱스트랙트에 넣고 상속 - 상속 중간에 끼워넣는 방식으로..
// 예) 각 유닛별 공통속성(이름)이 있는 경우 인터페이스인 유닛에 멤버변수를 설정할 수 없으니... 더 효율적인 방법은? -> 상동

abstract interface class Building {}

class Marine extends Terran implements Bionic {}

class Medic extends Terran implements Bionic, Unit {
  void heal(Bionic bionic) {
    if (bionic is Building) return;
    // 여기에 힐 기능 효과 수행하는 코드 삽입(빌딩 아닌 경우 수행)
  }

  void healForSCV(SCV scv) {} // SCV 전용 치료 기능

  // 13-4 문제. 바이오닉을 인자로 받으면 scv도 치료가 가능해야 하는데, 이렇게 하면 scv는 치료를 못함
  // 방안 1. scv를 bionic 상속하여 만든다.
  // 방안 2. heal 함수 내부에서 인자를 분류하여 치료 여부를 결정한다(함수 인자는 Bionic이 아닌 모든 인자를 받음).
  // 방안 3. scv 전용 heal 함수를 만든다.

  // 13-5 문제. bionic중 건물은 치료할 수 없다. 를 어떻게 적용할 것인가?
  // 방안 1. 13-4의 방안 2. 처럼 함수 내부에서 판별로직을 부여함.
  // 방안 2. 13-4의 방안 3. 처럼 저그 전용 heal 함수를 만든다.
  // 방안 3. 치료받을 수 있는 객체를 유닛으로 한정시킨다. -> 객체를 Unit으로 한정시킨다.
}

class Zealot extends Protoss implements Unit, Bionic {
  Zealot({required super.sheild});
}
class Dragun extends Protoss implements Unit, Mechanic {
  Dragun({required super.sheild});
}


abstract class Resource {}

void main() {}
