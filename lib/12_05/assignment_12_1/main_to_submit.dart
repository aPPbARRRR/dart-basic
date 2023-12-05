import 'computer.dart';

void main () {
  Computer com = Computer(name: 'com', price: 100, color: 'blue', makerName: 'asus', weight: 10.5);
  print(com.weight);
  com.weight = 20.1;
  print(com.weight);
}
