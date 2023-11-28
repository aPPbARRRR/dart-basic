
// 플레이어 4명
// 30배수 -> ahh
// 3배수 -> clap
// 10배수 -> rool
// 나머지 -> 숫자 그대로 출력
// 총 클랩, 아, 룰 갯수 출력
// 플레이어당 클랩 수 출력
// 가장 많은 클랩 한 player 출력

void countGame() {
  int clapCount = 0;
  int roolCount = 0;
  int ahhCount = 0;
  int p1Count = 0;
  int p2Count = 0;
  int p3Count = 0;
  int p4Count = 0;
  String? bestPlayer;
  for (int i = 1; i <= 100; i++) {
    String result;
    if (i % 30 == 0) { result = 'ahh'; ahhCount++; }
    else if (i % 10 == 0) { result = 'rool'; roolCount++; }
    else if (i % 3 == 0) {
      result = 'clap';
      clapCount++;
      switch (i % 4) {
        case 1: p1Count++;
        case 2: p2Count++;
        case 3: p3Count++;
        case 0: p4Count++;
      }
    } else result = i.toString();
    print('player${i % 4} : ${result.toString()}');
  }

  List sortList = [p1Count, p2Count,p3Count, p4Count]..sort();
  if (sortList[3] == p1Count) bestPlayer = 'player1';
  if (sortList[3] == p2Count) bestPlayer = 'player2';
  if (sortList[3] == p3Count) bestPlayer = 'player3';
  if (sortList[3] == p4Count) bestPlayer = 'player4';
  
  print('clap 총 갯수 : ${clapCount}');
  print('rool 총 갯수 : ${roolCount}');
  print('ahh 총 갯수 : ${ahhCount}');
  print('player1 clab 수 : ${p1Count}');
  print('player2 clab 수 : ${p2Count}');
  print('player3 clab 수 : ${p3Count}');
  print('player4 clab 수 : ${p4Count}');
  print('가장 많은 clap player : $bestPlayer!');
}
