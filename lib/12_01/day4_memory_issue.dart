void main() {
  // SomeClass.someVar;
  // SomeClass().someFunc();
  // SomeClass().someFunc;
  // SomeClass().someVar;
}

class SomeClass {
  static const String someVarStaticConst =
      'problem'; // data에 프로그램 실행시 올라감. 클래스 자체의 변수로 올라감.
  static final String someVarStaticFinal =
      'problem'; // final과 달리 프로그램 실행시 data에 올라감. static으로 인해 모든 인스턴스에서 해당 변수를 공유해야하기 때문.
  static String someVarStatic =
      'asdfas'; // data에 프로그램 실행시 올라감. 클래스 자체의 변수로 올라감.
  final someVarFinal = 'asdf'; // 인스턴스에 존재. 즉, 힙 영역에 올라감
  const someVarConst = 'asdfa'; // 오류 발생. const는 해당 클래스 인스턴스 생성 전에 메모리에 올라간다.
  /// 그런데 클래스 내에서 이걸 가능하게 해주는게 static임. static으로 선언시 클래스 자체의 변수로 data 영역에 올린다.
  /// static으로 선언시 프로그램 실행시 올라가서 죽을때까지 살아있음

  void someFunc() {
    // print(SomeClass.someVar); // 문제발생지점
  }

  // final anyVar = someVar;
}

int staticInt = 3;
