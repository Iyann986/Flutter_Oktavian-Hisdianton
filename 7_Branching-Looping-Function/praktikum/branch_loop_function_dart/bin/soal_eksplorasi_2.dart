import 'dart:io';

void main() {
  print('Masukkan bilangan yang ingin ditampilkan tabel perkaliannya:');
  int bilangan = int.parse(stdin.readLineSync()!);

  print('Tabel perkalian $bilangan:');
  for (int i = 1; i <= 10; i++) {
    int hasil = bilangan * i;
    print('$bilangan x $i = $hasil');
  }
}
