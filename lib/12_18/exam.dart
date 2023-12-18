class Exam {
  // 연습문제2 - 짝수 판별기 함수
  bool isEven(int val) =>
      val > 0 ? val % 2 == 0 : throw Exception('양의 정수를 입력해주세요!');

  // 연습문제3 - 최댓값 찾기 함수
  int findMax(List<int> numList) =>
      numList.reduce((value, element) => value < element ? element : value);

  // 연습문제4 - 문자열 뒤집기 함수
  String reverseString(String text) => text.split('').reversed.join();
}
