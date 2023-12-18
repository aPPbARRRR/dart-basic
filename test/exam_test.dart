import 'dart:math';

import 'package:dart_application_1/12_18/exam.dart';
import 'package:test/test.dart';

void main() {
  Exam exam = Exam();
  test('연습문제 2. 0 입력시 잘 터집니다.', () {
    expect(exam.isEven(0), Exception);
  });
  test('연습문제 2. 음수 입력시 잘 터집니다.', () {
    expect(exam.isEven(-4), Exception);
  });
  test('연습문제 2. 짝수 입력시 잘 작동합니다.', () {
    expect(exam.isEven(2), true);
  });
  test('연습문제 2. 홀수 입력시 잘 작동합니다.', () {
    expect(exam.isEven(3), false);
  });

  test('연습문제 3. 잘 작동합니다.', () {
    List<int> nums = [
      1,
      3453,
      32,
      14,
      14,
      516,
      314,
      347,
      1,
      6,
      32,
      23232,
      999999999
    ];
    expect(exam.findMax(nums), 999999999);
  });

  test('연습문제 4. 잘 작동합니다.', () {
    expect(exam.reverseString('12345'), '54321');
  });
}
