enum KeyType { padlock, button, dial, finger }

class StrongBox<T> {
  StrongBox({required this.keyType});

  T? _instance;
  KeyType keyType;
  int _count = 0;

  void put(T instance) => _instance = instance;

  //test
  get count => _count;

  T? get() {
    // count++ 은 공통으로 올리면 됨.
    T? result = null;
    switch (keyType) {
      case KeyType.padlock:
        _count < 1024 ? _count++ : result = _instance;
      case KeyType.button:
        _count < 10000 ? _count++ : result = _instance;
      case KeyType.dial:
        _count < 30000 ? _count++ : result = _instance;
      case KeyType.finger:
        _count < 1000000 ? _count++ : result = _instance;
    }
    return result;
  }
}

void main() {
  StrongBox<String> box = StrongBox(keyType: KeyType.button);
  box.put('ㅁㄴㅇㄹ');

  for (int i = 1; i < 10005; i++) {
    print('${box.count + 1}번째 시도');
    print(box.get());
  }
}
