


//
class A {}
class B extends A {}
class C extends B {}


void main () {

A a = C();
C c = A(); // subclass인 C로 선언된 c 의 값이 super class인 A가 될 수는 없다.

}