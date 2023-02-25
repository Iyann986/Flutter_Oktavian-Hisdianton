import 'dart:math';

void main() {
  const pi = 3.14;
  double jariJari = 7.5;
  double luas = hitungLuasLingkaran(jariJari);
  print('Luas lingkaran dengan jari-jari $jariJari adalah: $luas');
}

double hitungLuasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}
