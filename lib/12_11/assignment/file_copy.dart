import 'dart:io';

void copy(String source, String target) {
  File file = File(source);

  // 1. .copyFile 메소드 사용
  file.copySync(target);

  // // 2. 새로운 .txt 파일 생성 후 내용만 덮어씌우기(실제 파일 생성은 write 시에 이루어진다. 왜?)
  // File copyFile2 = File(target);
  // copyFile2.writeAsStringSync(file.readAsStringSync());
}

void main() {
  copy('lib/12_11/assignment/test.txt',
      'lib/12_11/assignment/copy.txt'); // ./lib/12_11/assignment/copy.txt
}
