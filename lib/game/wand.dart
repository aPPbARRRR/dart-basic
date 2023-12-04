class Wand {
  final String name;
  final double power;

  Wand({
    required this.name,
    required this.power,
  }) {
    if (name.length < 3) throw Exception('Wand의 이름이 제대로 설정되지 않았습니다.');
    if (power < 0.5 || power > 100)
      throw Exception('Wand의 마력범위가 제대로 설정되지 않았습니다.');
  }
}
