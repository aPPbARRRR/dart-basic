// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;
  Employee(
      {required this.name,
      required this.age}); // name, age가 비는 경우 오류가 발생할 수 있으므로 required로 생성한다.

  factory Employee.fromJson(Map<String, dynamic> json) =>
      Employee(name: json['name'] as String, age: json['age'] as int);

  toMap() => {'name': this.name, 'age': this.age};

  // 이하 json serialization generator 돌린 코드임
  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'age': age,
  //   };
  // }

  // factory Employee.fromMap(Map<String, dynamic> map) {
  //   return Employee(
  //     map['name'] as String,
  //     map['age'] as int,
  //   );
  // }

  // // map을 json 형식의 String으로 변환 -> 이런식으로 하면 실제로 사용시에 상당히 편하다. main함수에서 확인 가능.
  // String toJson() => json.encode(toMap());

  // // map을 받는게 아니라 String 형식의 json을 받아서 바로 Employee로 deserialize
  // factory Employee.fromJson(String source) =>
  //     Employee.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Department {
  String name;
  Employee leader;

  Department({required this.name, required this.leader});

  factory Department.fromJson(Map<String, dynamic> json) =>
      Department(name: json['name'], leader: Employee.fromJson(json['leader']));

  toMap() => {'name': this.name, 'leader': this.leader.toMap()};

  // 이하 generator 코드
  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'name': name,
  //     'leader': leader.toMap(),
  //   };
  // }

  // factory Department.fromMap(Map<String, dynamic> map) {
  //   return Department(
  //     map['name'] as String,
  //     Employee.fromMap(map['leader'] as Map<String, dynamic>),
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory Department.fromJson(String source) =>
  //     Department.fromMap(json.decode(source) as Map<String, dynamic>);
}

// 총무부 리더 홍길동의 인스턴스를 생성
// 홍길동 클래스를 직렬화
// 홍길동.json 을 company.txt 파일에 쓰시오

void main() {
  Employee me = Employee(name: '나', age: 21);
  Department b3 = Department(name: 'b3team', leader: me);

  print(b3.toMap().toString()); // 로그용
  print('--------------- 위 출력은 파일에 저장하기 전 map입니다.\n');

  File file = File('company.txt'); // 파일 생성
  file.writeAsStringSync(
      jsonEncode(b3.toMap())); // encoder로 map을 string으로 변환하여 파일에 씀.

  print(file.readAsStringSync()); // 파일에 기록 잘 되었는지 확인용
  print('--------------- 위 출력은 string으로 파일에 저장된 내용입니다.\n');

  print(jsonDecode(file.readAsStringSync())['leader'].toString());
  print(
      '--------------- 위 출력은 파일에 저장된 데이터를 json decode한 결과를 toString한 것입니다.\n');

  Employee newEmployee = Employee.fromJson(
      jsonDecode(file.readAsStringSync())['leader']); // Deserialization
  Department newDepartment =
      Department.fromJson(jsonDecode(file.readAsStringSync()));
  print('new Employee : ${newEmployee.name}, ${newEmployee.age}');
  print(
      'new Department : ${newDepartment.name}, ${newDepartment.leader.name}, ${newDepartment.leader.age}');
  print(
      '--------------- 위 출력은 파일에 저장된 정보를 이용하여 역직렬화를 통해 Employee 객체를 만드는 deserialization 결과입니다.\n');
}
