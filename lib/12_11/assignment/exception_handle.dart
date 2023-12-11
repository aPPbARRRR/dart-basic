void main() {

  final numString = '5';

  int number = 0;

  try {
    number = int.parse(numString);
  } catch (e) {}
  
  print(number);
}
