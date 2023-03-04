import 'dart:async';

Future<int> factorialAsinkron(int n) async {
  if (n <= 1) {
    return 1;
  }
  return n * await factorialAsinkron(n - 1);
}

void main() async {
  int n = 5;
  var result = await factorialAsinkron(n);
  print('Hasil dari nilai tersebut $result');
}
