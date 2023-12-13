import 'package:dart_application_1/12_05/assignment_12_1/book.dart';

import 'asset.dart';
import 'computer.dart';

void main() {
  Computer com = Computer(
      name: 'com', price: 100, color: 'blue', makerName: 'asus', weight: 10.5);
  print(com.weight);
  com.weight = 20.1;
  print(com.weight);
}
