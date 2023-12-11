class Hero {
  Hero({required this.name});
  String name;
}

void main () {
  Hero hero = Hero(name: 'test');

  print(hero.hashCode);
  print(hero.name.hashCode);
  print('test'.hashCode);

  print('a');
  print('a');
  print('b');

  
}