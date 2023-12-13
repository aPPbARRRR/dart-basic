abstract class Asset {}

// 나 : IntangibleAsset 은 Asset class를 extends한 abstract class로 선언할 수 있다.
abstract class IntangibleAsset extends Asset {}

// 다 : Patent 등의 무형자산은 IntangibleAsset class를 extends한 class로 선언할 수 있다.
class Patent extends IntangibleAsset {
  // 출원번호, 출원상태, 등록여부 등의 Patent 고유 정보는 속성으로 여기에 선언될 수 있다.
}

class TradeMark extends IntangibleAsset {
  // 마찬가지로 무형자산을 extends하여 무형자산의 하위개념으로 선언할 수 있다.
}
