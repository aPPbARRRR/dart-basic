import 'dart:io';

void modifyCSV() async {
  try {
    File target = File('lib/12_13/assignment/sample.csv');
    if (target.readAsStringSync().contains('한석봉'))
      await target
          .readAsString()
          .then((value) => target.writeAsString(value.replaceAll('한석봉', '김석봉')))
        ..copy('lib/12_13/assignment/sample_copy.csv');
  } catch (e) {
    print(e);
  }
}

void main() {
  modifyCSV();
}
