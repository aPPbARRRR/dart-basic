import 'dart:io';

void main() async {
  final file = File('lib/12_11/lecture/test.txt'); // open
  print(file);
  file.writeAsString('async');

  print(await file.readAsString()); // read, write

  // 닫는건 따로 없다.
}

// void main ()  {

//   final file = File('test.txt'); // open
//   print(file);
//   file.writeAsStringSync('sync');

//   print( file.readAsStringSync()); // read, write

//   // 닫는건 따로 없다.
// }
