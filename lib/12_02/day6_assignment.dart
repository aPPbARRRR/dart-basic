// ignore_for_file: public_member_api_docs, sort_constructors_first
// 다음 정보를 저장하기 좋은 컬렉션을 List, Set, Map 중 고르시오
// 1) 대한민국의 도시 이름 모음 (순서 상관 없음) : 맵, 도시 이름 중복 가능하기 때문. 만약 그냥 이름 모음만 필요하면 set, 이름& 각 이름의 중복되는 수 까지 필요하면 list
// 2) 10명 학생의 시험 점수 : 맵, 각 학생 정보라서..
// 3) 대한민국의 도시별 인구수 (순서 상관 없음) : 맵, 각 도시 정보라서...

class Person {
  final String name;
  Person({
    required this.name,
  });
}

void main () {

  // 연습문제 2-2
  List<String> nameList = ['홍길동', '한석봉'];
  List<Person> personList = nameList.map((e) => Person(name: e)).toList();
  personList.forEach((e) => print(e.name));

  // 연습문제 2-3
  Map<String, int> personMap = {'홍길동' : 20, '한석봉' : 25};
  personMap.forEach((e, int i) => print('$e의 나이는 $i살입니다.'));
}
