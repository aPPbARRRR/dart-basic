// 다음 Future 함수를 실행하고 5초 이내에 완료되지 않으면 “timeout”을 출력하시오.

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}

// .then으로 해결
void main() async {
  timeoutFuture().timeout(Duration(seconds: 5), onTimeout: () {
    print('time out');
    return 'fail';
  }).then((value) => print(value)); // 결과 출력은 요구사항에 없음
}
