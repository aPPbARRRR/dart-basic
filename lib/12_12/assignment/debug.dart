// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// final String json = '''{ "collectionChartDataList": [
//    {
//      "collectionName": "collectionName",
//      "collectionSalePrice": null
// }, {
//      "collectionName": "collectionName",
//      "collectionSalePrice": [
//        {
//          "price": 59.75,
//          "cvtDatetime": "2023-03-26T08:08:35"
// }, {"price": 60.00,
//          "cvtDatetime": "2023-03-26T08:08:45"
//        }
// ] }
// ] }''';

final Map mapData = {
  "collectionChartDataList": [
    {"collectionName": "collectionName", "collectionSalePrice": null},
    {
      "collectionName": "collectionName",
      "collectionSalePrice": [
        {"price": 59.75, "cvtDatetime": "2023-03-26T08:08:35"},
        {"price": 60.00, "cvtDatetime": "2023-03-26T08:08:45"}
      ]
    }
  ]
};

class CollectionChartDataList {
  String collectionName;
  CollectionSalePrice? collectionSalePrice;
  CollectionChartDataList({
    required this.collectionName,
    this.collectionSalePrice,
  });

  factory CollectionChartDataList.fromServerData(
          Map<String, dynamic> serverData) =>
      [];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionName': collectionName,
      'collectionSalePrice': collectionSalePrice?.toMap(),
    };
  }

  factory CollectionChartDataList.fromMap(Map<String, dynamic> map) {
    return CollectionChartDataList(
      collectionName: map['collectionName'] as String,
      collectionSalePrice: map['collectionSalePrice'] != null
          ? CollectionSalePrice.fromMap(
              map['collectionSalePrice'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionChartDataList.fromJson(String source) =>
      CollectionChartDataList.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class CollectionSalePrice {
  double price;
  DateTime cvtDatetime;
  CollectionSalePrice({
    required this.price,
    required this.cvtDatetime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'price': price,
      'cvtDatetime': cvtDatetime.millisecondsSinceEpoch,
    };
  }

  factory CollectionSalePrice.fromMap(Map<String, dynamic> map) {
    return CollectionSalePrice(
      price: map['price'] as double,
      cvtDatetime:
          DateTime.fromMillisecondsSinceEpoch(map['cvtDatetime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionSalePrice.fromJson(String source) =>
      CollectionSalePrice.fromMap(json.decode(source) as Map<String, dynamic>);
}

void main() {
  var data = jsonDecode(json);
  print(data);
  print(data.runtimeType);
}
