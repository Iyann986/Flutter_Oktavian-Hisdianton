import 'dart:io';

void main() {
  stdout.write('Masukkan bilangan: ');
  int bilangan = int.parse(stdin.readLineSync()!);
  List<int> faktor = [];

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      faktor.add(i);
    }
  }

  print('Faktor dari $bilangan adalah: $faktor');
}
