import 'dart:io';

void main() {
  // meminta pengguna memasukkan kata yang akan diperiksa
  stdout.write("Masukkan kata: ");
  String kata = stdin.readLineSync()!;

  // menghapus spasi dan mengubah huruf kecil pada kata
  kata = kata.replaceAll(" ", "").toLowerCase();

  // membalikkan kata
  String kataBalik = kata.split('').reversed.join();

  // mengecek apakah kata asli dan kata balik sama
  if (kata == kataBalik) {
    print("palindrom");
  } else {
    print("bukan palindrom");
  }
}
