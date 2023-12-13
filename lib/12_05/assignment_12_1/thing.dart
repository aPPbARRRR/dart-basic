// getter setter 만 추상으로 생성

// 의문
// getter와 setter 를 abstract로 선언하는 방법은?
// 인터페이스에서는 게터, 세터도 abstract로 선언해야 하는지?
// 문제의 의도가 이게 맞는지?

// 질문 : 'getter, setter를 abstract로 선언하는 방법 = getter/setter body 부분만 작성하지 않는 것.' 이 맞나요?

abstract interface class Thing {
  double get weight;
  set weight(double inputWeight);
}
