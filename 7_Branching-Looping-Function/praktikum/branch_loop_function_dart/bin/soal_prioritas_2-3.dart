void main() {
  List<int> nilai = [10, 40, 50];

  for (int i = 0; i < nilai.length; i++) {
    int faktorial = 1;

    for (int j = 1; j <= nilai[i]; j++) {
      faktorial *= j;
    }

    print('Faktorial dari ${nilai[i]} adalah: $faktorial');
  }
}
