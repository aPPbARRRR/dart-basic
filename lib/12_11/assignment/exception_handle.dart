void main() {
  final numString = '5';

  int number = 0;
  try {
    number = int.parse(numString);
  } catch (e) {}
  print(number);

  print(int.tryParse(numString) ?? 0); // 요렇게 하면 위에 코드 한 줄 굳.
}
