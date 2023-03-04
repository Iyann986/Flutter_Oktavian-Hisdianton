import 'dart:math';

void main() {
  List<int> nilai = [7, 5, 3, 5, 2, 1];

  int total = 0;
  for (int i = 0; i < nilai.length; i++) {
    total += nilai[i];
  }

  double rataRata = total / nilai.length;
  int rataRataBulat = rataRata.ceil();

  print("Hasil dari nilai tersebut $rataRataBulat");
}
