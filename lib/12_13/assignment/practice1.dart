import 'dart:io';

void modifyCSV() async {
  try {
    File target = File('lib/12_13/assignment/sample.csv');
    await target
        .readAsString()
        .then((value) => target.writeAsString(value.replaceAll('한석봉', '김석봉')));
  } catch (e) {
    print(e);
  }
}

void main() {
  modifyCSV();
}
