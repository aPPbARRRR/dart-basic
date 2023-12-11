class Word {
  String sord = '';
// 모음이면 true 반환하도록 작성하시오.
  bool isVowel(int i) => 0 <= i && i < sord.length
      ? 'aeiouAEIOU'.contains(sord[i])
      : throw Exception('범위를 벗어난 입력입니다.');

// 자음이면 bool값을 반환하시오.
  bool isConsonant(int i) {
    String consonants = 'bcdfghjklmnpqrstvwxyz';
    consonants = consonants + consonants.toUpperCase();
    return consonants.contains(sord[i]);
  }
}

void main() {
  Word word = Word();
  word.sord = 'ababaAFGD';

  print(word.isVowel(5)); // A - true
  print(word.isConsonant(5)); // A - false
}
