import 'dart:io';

void main() {
  int n = 11; // jumlah baris pola
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      // mencetak bintang di dalam area jam pasir
      if (j >= i && j <= n - i + 1 || j <= i && j >= n - i + 1) {
        stdout.write('*');
      } else {
        stdout.write(' ');
      }
    }
    stdout.write('\n');
  }
}
