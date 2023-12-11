import 'dart:collection';

import 'package:intl/intl.dart';

class Book implements Comparable {
  Book({required this.title, required this.comment, required this.publishDate});

  String title;
  DateTime publishDate;
  String comment;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            this.title == other.title &&
            // DateFormat.yMMMMd().format(this.publishDate) == DateFormat.yMMMMd().format(this.publishDate); // intl 사용
            // 이하 intl 사용하지 않고 날짜 비교
            this.publishDate.year == other.publishDate.year &&
            this.publishDate.month == other.publishDate.month &&
            this.publishDate.day == other.publishDate.day;
  }

  @override
  String toString() =>
      'Book(title: ${title}, publishDate: ${publishDate}, comment: ${comment})';

  @override
  // int get hashCode => 1; // 일단 동일한 해시 반환하도록 해놨음... 어떤 방법이 있을지 고민해봐야할듯 ..
  int get hashCode => title.hashCode ^ publishDate.hashCode;
  // 위와 같이 선언한 이유
  // 특정 문자열인 타이틀, 특정 데이트타임인 퍼블리쉬데이트는 각각 값에 따라 특정 해쉬코드를 가진다.
  // 그래서 만약 이 두 개가 같다면 같은 해쉬코드를 반환한다(get을 통해 구현).
  // 이렇게 하면 타이틀과 퍼블리쉬데이트가 특정값으로 같은 Book 인스턴스라면, 같은 해쉬코드를 반환할 수 있는 것.
  // 결국 위에서 ^가 아니더라도, 조건(특정 타이틀과 퍼블리쉬데이트가 같으면)을 만족할 때 같은 해쉬코드만 반환할 수 있으면 되는 것.

  @override
  int compareTo(other) => other.publishDate
      .compareTo(publishDate); // -publishDate.compareTo(other.publishDate);

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
        title: title ?? this.title,
        comment: comment ?? this.comment,
        publishDate: publishDate ?? this.publishDate);
  }
}

// 이하 테스트용 ---------//---------//---------//---------//---------//---------//---------//---------//---------
void main() {
  List books = List.generate(5, (index) => index)
      .map((e) => Book(
          title: 'title',
          comment: 'comment',
          publishDate: DateTime(2023, 10, 10)))
      .toList();

  print('책 리스트 : $books');
  //리스트 내 동등성 판단
  for (int i = 0; i <= books.length - 1; i++)
    i == 4
        ? print('${i + 1} : ${books[i] == books[0]}')
        : print('${i + 1} : ${books[i] == books[i + 1]}');

  //세트 내 동등성 판단
  print('세트 길이(1이면 모두 동일한 것으로 판단된 것임): ${books.toSet().length}');

  List booksToSort = List.generate(5, (index) => index)
      .map((e) => Book(
          title: 'title',
          comment: 'comment',
          publishDate: DateTime(2023, 3, e)))
      .toList();

  // sort
  print(booksToSort);
  booksToSort.sort();
  print(booksToSort);

  //copyWith
  Book originalBook =
      Book(title: 'title', comment: 'comment', publishDate: DateTime.now());
  print(originalBook);
  Book copyBook = originalBook.copyWith(title: 'copy');
  print(copyBook);

  Set ts = {};
  print(ts is LinkedHashSet);
}

// set는 동일성 판단할 때 ==, hashCode 두 요소를 사용한다. 각각 true, 그리고 hashcode도 같아야 그래야 동일하다고 판단한다. 그런데 hash코드를 비교하는 부분이 어디에 있는지 모르겠다...
// 이거 set는 기본적으로 linkedhashset로 선언되는듯(잘 보면 팩토리 컨스트럭터 있다..). 링크드해시셋은 기본적으로 ==, 해시코드, 밸리드키를 사용하여 동등성을 판단하는것으로 보이는데 이해가 잘... 다시 읽어볼 것..

// Dart에서 ^ 연산자는 비트 단위의 XOR (Exclusive OR) 연산을 수행합니다. 이 연산자는 두 비트가 서로 다를 때 1을 반환하고, 같을 때 0을 반환

/// var o = new Object();
/// var isIdentical = identical(o, new Object()); // false, different objects.
/// isIdentical = identical(o, o); // true, same object.
/// isIdentical = identical(const Object(), const Object()); // true, const canonicalizes.
/// isIdentical = identical([1], [1]); // false, different new objects.
/// isIdentical = identical(const [1], const [1]); // true.
/// isIdentical = identical(const [1], const [2]); // false.
/// isIdentical = identical(2, 1 + 1); // true, integers canonicalize.
///
/// var pair = (1, "a"); // Create a record.
/// isIdentical = identical(pair, pair); // true or false, can be either.
///
/// var pair2 = (1, "a"); // Create another(?) record.
/// isIdentical = identical(pair, pair2); // true or false, can be either.
///
/// isIdentical = identical(pair, (2, "a")); // false, not identical values.
/// isIdentical = identical(pair, (1, "a", more: true)); // false, wrong shape.
/// 

 /// Create an insertion-ordered hash set using the provided
  /// [equals] and [hashCode].
  ///
  /// The provided [equals] must define a stable equivalence relation, and
  /// [hashCode] must be consistent with [equals].
  ///
  /// If you supply one of [equals] and [hashCode],
  /// you should generally also supply the other.
  ///
  /// Some [equals] or [hashCode] functions might not work for all objects.
  /// If [isValidKey] is supplied, it's used to check a potential element
  /// which is not necessarily an instance of [E], like the argument to
  /// [contains] which is typed as `Object?`.
  /// If [isValidKey] returns `false`, for an object, the [equals] and
  /// [hashCode] functions are not called, and no key equal to that object
  /// is assumed to be in the map.
  /// The [isValidKey] function defaults to just testing if the object is an
  /// instance of [E], which means that:
  /// ```dart template:expression
  /// LinkedHashSet<int>(equals: (int e1, int e2) => (e1 - e2) % 5 == 0,
  ///                    hashCode: (int e) => e % 5);
  /// ```
  /// does not need an `isValidKey` argument, because it defaults to only
  /// accepting `int` values which are accepted by both `equals` and `hashCode`.
  ///
  /// If neither `equals`, `hashCode`, nor `isValidKey` are provided,
  /// the default `isValidKey` instead accepts all values.
  /// The default equality and hashcode operations are assumed to work on all
  /// objects.
  ///
  /// Likewise, if `equals` is [identical], `hashCode` is [identityHashCode]
  /// and `isValidKey` is omitted, the resulting set is identity based,
  /// and the `isValidKey` defaults to accepting all keys.
  /// Such a map can be created directly using [LinkedHashSet.identity].