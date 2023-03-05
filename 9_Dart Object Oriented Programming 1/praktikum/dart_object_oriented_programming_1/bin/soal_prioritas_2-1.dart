class Calculator {
  double penjumlahan(double x, double y) {
    return x + y;
  }

  double pengurangan(double x, double y) {
    return x - y;
  }

  double perkalian(double x, double y) {
    return x * y;
  }

  double pembagian(double x, double y) {
    if (y == 0) {
      throw Exception('Error: Pembagian dengan nol tidak terdefinisi');
    }
    return x / y;
  }
}

void main() {
  Calculator calc = Calculator();

  double x = 30;
  double y = 10;

  double hasilTambah = calc.penjumlahan(x, y);
  double hasilKurang = calc.pengurangan(x, y);
  double hasilKali = calc.perkalian(x, y);
  double hasilBagi = calc.pembagian(x, y);

  print('$x + $y = $hasilTambah');
  print('$x - $y = $hasilKurang');
  print('$x * $y = $hasilKali');
  print('$x / $y = $hasilBagi');
}
