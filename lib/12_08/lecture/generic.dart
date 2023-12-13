// class Book {
// String? someInfo;
// }

// 위와 같이 선언하면 Book의 인스턴스는 언제나 String 타입의 someInfo만 넣을 수 있다.
// 만약 someInfo가 제목(String)이 될 수도 있고, 페이지수(int)가 될 수도 있고, 출간일(DateTime)이 될 수 있어야 한다면?

// 아래와 같이 제네릭 <T>를 활용하여 class를 만들어주고,
class Book<T> {
  T? someInfo; // T type으로 선언되었다. T는 이미 존재하는 클래스(타입)를 명시하는 것이 아니다.
}

void main() {
  // 아래처럼 책 제목이나 책 설명같은 String이 담길 수 있는 Book의 인스턴스도 만들 수 있고
  Book<String> bookWithTitle = Book<String>();
  bookWithTitle.someInfo = '문자열이 들어감. 타입 T가 String인 인스턴스를 생성하였으므로';

// 아래처럼 출간일 등의 시간정보가 들어간 Book의 인스턴스도 만들 수 있다.
  Book<DateTime> bookWithPublishDate = Book<DateTime>();
  bookWithPublishDate.someInfo = DateTime(2023, 10, 4);

// -------------------------

// 활용 예
// 만약 어떤 정보가 담겨있든 내 책장의 모든 Book을 책장(List) 에 담아야한다면?
// 단, 책장에 Hero, Cleric등의 다른 클래스가 아닌 Book 만 넣어 정리하고 싶다면?

  List<Book> listA = []; // Book만 들어갈 수 있는 책장을 만들었다.
// List<Book> 책장에는 위에서 선언한 bookWithTitle, bookWithPublishDate 등이
// 모두 들어갈 수 있다. 왜냐하면 둘 다 모두 Book이기 때문이다.

  listA.addAll([bookWithPublishDate, bookWithTitle]);
}
