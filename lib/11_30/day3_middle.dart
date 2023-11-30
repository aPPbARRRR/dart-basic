
import 'dart:io';

// 순한맛 1 조용한 곳 찾기
void main() {
  List<Site> restSiteList = [];

  print('공사현장 x좌표, y좌표, 소음크기를 띄어쓰기로 구분하여 순서대로 입력하세요.');
  String? constructureSiteInfo = stdin.readLineSync()!;
  int constructureSiteX = int.parse(constructureSiteInfo.split(' ')[0]);
  int constructureSiteY = int.parse(constructureSiteInfo.split(' ')[1]);
  int constructureNoiseR = int.parse(constructureSiteInfo.split(' ')[2]);

  
  print('전체 휴식처의 수를 입력하시오');
  String? stringNumOfRestSite = stdin.readLineSync();
  if(stringNumOfRestSite == '' )  stringNumOfRestSite = stdin.readLineSync();

  for(int i = 1; i <= int.parse(stringNumOfRestSite!); i++) {
    
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
