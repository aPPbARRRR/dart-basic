import 'dart:convert';

import 'package:http/http.dart' as http;

import 'stores.dart';

class Repository {
  Repository._();

  factory Repository() {
    return Repository._();
  }

  Future<Stores> fetchStores({required String uri}) async {
    http.Response res = await http.get(Uri.parse(uri));
    return Stores.fromJson(utf8.decode(res.bodyBytes));
  }
}