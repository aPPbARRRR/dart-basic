bool isValidBraces(String s) {
  List<String> stack = [];

  Map<String, String> braces = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  for (int i = 0; i < s.length; i++) {
    String ch = s[i];

    if (braces.values.contains(ch)) {
      // If it's an opening brace, push to stack
      stack.add(ch);
    } else if (braces.containsKey(ch)) {
      // If it's a closing brace, check if the top of the stack matches
      if (stack.isEmpty || stack.removeLast() != braces[ch]) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

abstract interface class TestAbstractClass {
  // String testAbstractFunc();
  int testConcreteFunction() => 1;

}


// class testClass implements TestAbstractClass {
  
// }