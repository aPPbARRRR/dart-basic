import 'dart:async';

import 'package:dart_application_1/12_14/assignment3_mask/repository.dart';
import 'package:dart_application_1/12_14/assignment3_mask/stores.dart';

class StoreService {
  final String uri;
  Stores? stores;

  StoreService._({required this.repository, required this.uri}) {
    getStores();
  }

  factory StoreService({required Repository repository, required String uri}) {
    return StoreService._(repository: repository, uri: uri);
  }

  final Repository repository;

  Future<void> getStores() async {
    try {
      stores = await repository.fetchStores(uri: uri);
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> storesInit({required String uri}) async {
    try {
      stores = await repository.fetchStores(uri: uri);
    } catch (e) {
      print(e);
    }
  }
}
