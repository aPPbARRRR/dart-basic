import 'dart:io';

void main() {
  middle2();
}

// 중간맛 1 조용한 곳 찾기
void middle1() {
  List<Site> restSiteList = [];

  print('공사현장 x좌표, y좌표, 소음크기를 띄어쓰기로 구분하여 순서대로 입력하세요.');
  String? constructureSiteInfo = stdin.readLineSync()!;
  int constructureSiteX = int.parse(constructureSiteInfo.split(' ')[0]);
  int constructureSiteY = int.parse(constructureSiteInfo.split(' ')[1]);
  int constructureNoiseR = int.parse(constructureSiteInfo.split(' ')[2]);

  print('전체 휴식처의 수를 입력하시오');
  String? stringNumOfRestSite = stdin.readLineSync();
  if (stringNumOfRestSite == '') stringNumOfRestSite = stdin.readLineSync();

  for (int i = 1; i <= int.parse(stringNumOfRestSite!); i++) {
    print('$i번째 휴식처의 x, y 좌표를 띄어쓰기로 구분하여 순서대로 입력하시오.');
    String? coordinate = stdin.readLineSync()!;
    int x = int.parse(coordinate.split(' ')[0]);
    int y = int.parse(coordinate.split(' ')[1]);
    restSiteList.add(Site(x: x, y: y));
  }

  findQuitePlace(
      restSiteList: restSiteList,
      constructureSiteX: constructureSiteX,
      constructureSiteY: constructureSiteY,
      constructureNoiseR: constructureNoiseR);
}

class Site {
  Site({required this.x, required this.y});
  int x;
  int y;
}

void findQuitePlace(
    {required List<Site> restSiteList,
    required int constructureSiteX,
    required int constructureSiteY,
    required int constructureNoiseR}) {
  for (int i = 0; i < restSiteList.length; i++) {
    (restSiteList[i].x - constructureSiteX) *
                    (restSiteList[i].x - constructureSiteX) +
                (restSiteList[i].y - constructureSiteY) *
                    (restSiteList[i].y - constructureSiteY) <
            constructureNoiseR * constructureNoiseR
        ? print('noisy')
        : print('slient');
  }
}

// 중간맛2 카드 찾기
void middle2() {
  // 4개의 숫자 입력받기
  print('1-9 사이의 숫자 4개를 띄어쓰기로 구분하여 입력하시오');
  String? stringCards = stdin.readLineSync()!;
  int a = int.parse(stringCards.split(' ')[0]);
  int b = int.parse(stringCards.split(' ')[1]);
  int c = int.parse(stringCards.split(' ')[2]);
  int d = int.parse(stringCards.split(' ')[3]);
  List cardList = [a, b, c, d];
  // print(cadrList);

  // 4개 숫자를 조합하기
  List wholeCaseList = [];
  for (int i = 0; i < 4; i++) {
    List tempList = [];
    tempList.add(cardList[i]);
    cardList.remove(cardList[i]);
    // print(tempList);
    if (i == 3) print('-----------------------');
    for (int j = 0; j < 3; j++) {
      tempList.add(cardList[j]);
      cardList.remove(cardList[j]);
      // print(tempList);
      if (j == 2) print('-----------------------');

      for (int k = 0; k < 2; k++) {
        tempList.addAll(cardList);
        cardList = [a, b, c, d];
        wholeCaseList.add(tempList);
      }
    }
  }
  print(wholeCaseList);
}
