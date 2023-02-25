import 'dart:io';

void main() {
  print('Masukkan sebuah bilangan:');
  int bilangan = int.parse(stdin.readLineSync()!);

  bool isPrima = true;

  if (bilangan < 2) {
    isPrima = false;
  } else {
    for (int i = 2; i <= bilangan ~/ 2; i++) {
      if (bilangan % i == 0) {
        isPrima = false;
        break;
      }
    }
  }

  if (isPrima) {
    print('$bilangan bilangan prima');
  } else {
    print('$bilangan bukan bilangan prima');
  }
}
