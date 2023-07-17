class BangunRuang {
  late double panjang;
  late double lebar;
  late double tinggi;

  double volume() {
    return 0;
  }
}

class Kubus extends BangunRuang {
  late double sisi;

  @override
  double volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  @override
  double panjang;
  @override
  double lebar;
  @override
  double tinggi;

  Balok(this.panjang, this.lebar, this.tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Kubus kubus = Kubus();
  kubus.sisi = 5.0;
  print("Volume kubus: ${kubus.volume()}");

  Balok balok = Balok(3.0, 4.0, 5.0);
  print("Volume balok: ${balok.volume()}");
}
