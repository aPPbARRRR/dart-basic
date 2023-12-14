// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dart_application_1/12_14/assignment3_mask/store.dart';

class Stores {
  final int count;
  final List<Store> stores;
  Stores({
    required this.count,
    required this.stores,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'stores': stores.map((x) => x.toMap()).toList(),
    };
  }

  factory Stores.fromMap(Map<String, dynamic> map) {
    return Stores(
      count: map['count'] as int,
      stores: List<Store>.from((map['stores']).map<Store>((x) => Store.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stores.fromJson(String source) => Stores.fromMap(json.decode(source) as Map<String, dynamic>);
}
