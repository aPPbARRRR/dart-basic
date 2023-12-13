import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CollectionChartDataList {
  List<CollectionChartData> collectionChartDataList;

  CollectionChartDataList({
    required this.collectionChartDataList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionChartDataList':
          collectionChartDataList.map((x) => x.toMap()).toList(),
    };
  }

  factory CollectionChartDataList.fromMap(Map<String, dynamic> map) {
    return CollectionChartDataList(
      collectionChartDataList: List<CollectionChartData>.from(
        (map['collectionChartDataList'] as List<int>).map<CollectionChartData>(
          (x) => CollectionChartData.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionChartDataList.fromJson(String source) =>
      CollectionChartDataList.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class CollectionChartData {
  String collectionName;
  List<CollectionSalePrice>? collectionSalePrice;
  CollectionChartData({
    required this.collectionName,
    this.collectionSalePrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'collectionName': collectionName,
      'collectionSalePrice':
          collectionSalePrice.map((x) => x?.toMap()).toList(),
    };
  }

  factory CollectionChartData.fromMap(Map<String, dynamic> map) {
    return CollectionChartData(
      collectionName: map['collectionName'] as String,
      collectionSalePrice: map['collectionSalePrice'] != null
          ? List<CollectionSalePrice>.from(
              (map['collectionSalePrice'] as List<int>)
                  .map<CollectionSalePrice?>(
                (x) => CollectionSalePrice.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CollectionChartData.fromJson(String source) =>
      CollectionChartData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CollectionSalePrice {}

void main() {
  final String json = '''{ "collectionChartDataList": [
   {
     "collectionName": "collectionName",
     "collectionSalePrice": null
}, {
     "collectionName": "collectionName",
     "collectionSalePrice": [
       {
         "price": 59.75,
         "cvtDatetime": "2023-03-26T08:08:35"
}, {
         "cvtDatetime": "2023-03-26T08:08:45"
       }
] }
] }''';
}
