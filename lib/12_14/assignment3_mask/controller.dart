import 'dart:io';

import 'package:dart_application_1/12_14/assignment3_mask/store_service.dart';

import 'store.dart';
import 'stores.dart';

class Controller {
  final StoreService service;

  Controller._({required this.service}) {
    refreshStores();
  }

  factory Controller({required StoreService service}) {
    return Controller._(service: service);
  }

  void refreshStores() async {
    await service.getStores();
    showMenu();
  }

// 리스트 최신화 완료시 화면에 표시 & 질문 수행
  void showMenu() async {
    if (service.stores == null) return; // 이하 ! 사용
    print('전체 판매처 수 : ${service.stores!.count}');
    print(
        '판매처 지역 구분 : ${service.stores!.stores.map((e) => e.addr.split(' ')[1]).toSet().toList()}');
    print('정보를 보기를 원하는 지역을 입력해주세요.');
    String? district = stdin.readLineSync();
    if (district != null || district != '') {
      print('다음은 ${district}내에 있는 판매처입니다.');
      print(
          '${service.stores!.stores.where((e) => e.addr.split(' ')[1] == district).toList().map((e) => e.showInfoAsString()).toList()}');
    }
  }
}
