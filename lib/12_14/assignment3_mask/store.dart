// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Store {
  final String addr;
  final String code;
  final String createdAt;
  final double lat;
  final double lng;
  final String name;
  final String remainStat;
  final String stockAt;
  final String type;

  Store({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addr': addr,
      'code': code,
      'createdAt': createdAt,
      'lat': lat,
      'lng': lng,
      'name': name,
      'remainStat': remainStat,
      'stockAt': stockAt,
      'type': type,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      addr: map['addr'] ?? '?' as String,
      code: map['code'] ?? '?' as String,
      createdAt: map['created_at'] ?? '?' as String,
      lat: map['lat'] ?? 1.1 as double,
      lng: map['lng'] ?? 1.1 as double,
      name: map['name'] ?? '?' as String,
      remainStat: map['remain_stat'] ?? '?' as String,
      stockAt: map['stock_at'] ?? '?' as String,
      type: map['type'] ?? '?' as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String showInfoAsString() => '''
주소 : $addr
이름 : $name
잔여수량 : $remainStat
--------------------

''';
}
