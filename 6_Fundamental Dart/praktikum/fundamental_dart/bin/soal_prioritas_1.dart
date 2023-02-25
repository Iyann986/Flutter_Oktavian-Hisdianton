void main() {
  // Persegi
  int sisi = 5;
  int kelilingPersegi = 4 * sisi;
  int luasPersegi = sisi * sisi;
  print('Hasil keliling persegi: $kelilingPersegi');
  print('Hasil luas persegi: $luasPersegi');

  print(" ");

  // Persegi panjang
  int panjang = 8;
  int lebar = 6;
  int kelilingPersegiPanjang = 2 * (panjang + lebar);
  int luasPersegiPanjang = panjang * lebar;
  print('Hasil keliling persegi panjang: $kelilingPersegiPanjang');
  print('Hasil luas persegi panjang: $luasPersegiPanjang');

  print(" ");

  //Lingkaran
  double jariJari = 7.5;
  double kelilingLingkaran = 2 * 3.14 * jariJari;
  double luasLingkaran = 3.14 * jariJari * jariJari;
  print('Hasil keliling lingkaran: $kelilingLingkaran');
  print('Hasil luas lingkaran: $luasLingkaran');
}
