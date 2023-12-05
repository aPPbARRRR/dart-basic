import 'package:dart_application_1/12_05/assignment_12_1/asset.dart';
import 'package:dart_application_1/12_05/assignment_12_1/thing.dart';

// 인터페이스 Thing을 impl
// Thing에서 추상으로 선언된 getter / setter 구체적으로 작성
// 생존코딩 룰에 따라 멤버변수 _weight, constructor 생성

abstract class TangibleAsset extends Asset implements Thing {
  double _weight;

  TangibleAsset({required double weight}) : this._weight = weight;

  @override
  double get weight => _weight;

  @override
  set weight(double inputWeight) => this._weight = inputWeight;
}
