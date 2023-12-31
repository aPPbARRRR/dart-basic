void main() {
  m6(145);
}

// M1. 더 큰수 판별하기
// 기능:
// A, B 두 정수 중 더 큰 수를 출력
// A, B가 같다면 ‘eq’를 출력
// 미션:
// 1. 10, 20 중 더 큰수를 출력
// 2. 10,10은 ‘eq’ 출력
// 출력예시:
// 20
// eq

void m1(int a, int b) {
  dynamic result;
  a > b ? result = a : result = b;
  if (a == b) result = 'ab';
  print(result);
}

// —------------------------------------------------------------------------------------------------

// 󰜣󰜷

// M2. 짝수 홀수
// 당신은 회사를 대표하여 2개의 숫자를 골라야 합니다. 두 수가 모두 짝수이면
// 홀수파(홀수를 좋아하는 사람들의 모임)가 싫어합니다. 두 수가 모두 홀수이면 짝수파가
// 싫어합니다. 당신은 짝수 하나 홀수 하나를 골라서 모두를 만족시켜야 합니다.

// 설명:
// N, M 두 정수가 짝수와 홀수의 쌍이면 “YES”, 그렇지 않으면 “NO”를 출력합니다.
// 미션:
// 1. 30, 15 일 때
// 2. 12, 40 일 때

// 출력예시:
// YES
// NO
void m2(int n, int m) => (n + m) % 2 != 0 ? print('yes') : print('no');

//-----------------------------------------------------------------------------

// M3. 연락처 문자열 결합
// 당신은 이름과 연락처를 한줄로 정리하고 있는데 그 양이 1억개라면? 어떻게 할까요?
// 미션:
// - ‘모두연’ , ‘010’, ‘1234’, ‘5678’ 을 한줄로 만들어 보시요

// 출력예시:
// 모두연 010-1234-5678

void m3(List<String> stringList) => print(stringList[0] +
    ' ' +
    stringList.sublist(1).reduce((value, e) => value + '-' + e));

// —------------------------------------------------------------------------------------------------

// 1️⃣3️⃣5️⃣7️⃣9️⃣

// M4. 등차수열 예제 생성기 만들어 보기
// 당신은 초등학교 수학선생님입니다. 학생들에게 등차수열에 대한 설명자료를 만들기 위해
// 예제를 만들어야 합니다. 매번 만들기 어려워 등차수열 예제 생성기를 만들려고 합니다.
// 어떻게 할까요?

// 설명:
// - 등차수열이란?
// 5 8 11 14 17 20 23 26 29 32
// 첫번째 숫자가 5에서 3 씩 증가 해가는 것을 알 수 있습니다.
// 일반적으로 이것을 첫항이 5, 공차가 3인 등차수열이라고 합니다.
// 이런 수열을 출력하는 프로그램을 만들어 보자.

// 미션:
// - 첫 항 5, 공차 10인 등차수열을 10번째까지 출력 해 보세요

// 출력예시:
// 5 15 25 35 45 55 65 75 85 95

void m4(int performNum, int initVal, int tolerance) {
  for (int i = 1; i <= performNum; i++) print(initVal + tolerance * (i - 1));
}

// M5. 부족한 카드 찾기
// 당신은 1, 2, 3, 4, 5의 숫자가 적힌 5 종류의 카드를 모으고 있습니다.
// 4번째까지 모여서 1장만 더 모으면 되는 상황에 카드가 섞여 버렸습니다.
// 4장의 카드 정보는 줄 바꿈으로 구분하여 입력되므로 1~5의 카드 중 부족한 카드의 숫자를
// 출력 합니다.

// 미션:
// - 리스트 [1,3,2,5] 중 빠진 수를 출력 하시오
// 출력예시:
// 4

void m5(List<int> cadrList) {
  List curList = [1, 2, 3, 4, 5];
  curList.removeWhere((e) => cadrList.contains(e));
  print(curList);
}
// —------------------------------------------------------------------------------------------------

// M6. 연속된 같은 수 판별
// 당신은 입력된 수를 판별하는 프로그램을 만들고 있습니다. 프로그램은 입력된 숫자의 각
// 자리 수가 모두 같은 숫자라면 그 숫자를 그대로 출력하고, 아니라면 "No"를 출력합니다.

// 미션:
// - 777 일때
// - 725 일때
// 출력예시:
// 777
// No

void m6(int number) {
  for (int i = 0; i < number.toString().length - 1; i++) {
    if (number.toString()[i] != number.toString()[i + 1]) print('No');
  }
}

// M7. 태풍의 간격
// 당신은 기상청 데이터 분석가로써 태풍 상륙 간격에 대해 데이터를 만들어야 한다.
// 샘플로 5개의 태풍 상륙일 정보가 주어지면, 다음 태풍이 몇 일 간격으로 발생했는지 일수를
// 구하는 프로그램을 작성하시오.

// 미션:
// - 태풍 상륙일 [5,8,19,25,31]
// 출력예시:
// 3
// 11
// 6
// 6

void m7(List<int> accidentDayList) {
  for (int i = 0; i < accidentDayList.length - 1; i++)
    print(accidentDayList[i + 1] - accidentDayList[i]);
}
// —------------------------------------------------------------------------------------------------

// M8. 빼빼로 파티
// 오늘은 빼빼로 데이 파티를 하는 날입니다. 하지만 빼빼로가 11개 이상 있어야 파티를 열 수
// 있습니다.

// 빼빼로 1개는 "1"로 표시하며 1로 연속되는 문자열이 주어집니다.
// 파티를 열 수 있으면 "OK", 파티를 열 수 없다면 앞으로 최소한의 더 필요한 빼빼로의 수를
// 출력합니다.

// 미션:
// - 111111111 일때
// - 11111 일때
// 출력예시:
// OK
// 6

void m8(int number) => number.toString().length >= 11
    ? print('OK')
    : print('${11 - number.toString().length}개 더 필요해요');
