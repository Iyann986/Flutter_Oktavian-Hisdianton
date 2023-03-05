import 'dart:io';

class Hewan {
  late double beratHewan;
  late String namaHewan;

  Hewan(double beratHewan, String namaHewan) {
    this.beratHewan = beratHewan;
    this.namaHewan = namaHewan;
  }
}

class Mobil {
  late double kapasitas;
  List<Hewan> muatan = [];

  Mobil(double kapasitas) {
    this.kapasitas = kapasitas;
  }

  void tambahMuatan(Hewan hewan) {
    if ((totalMuatan() + hewan.beratHewan) <= kapasitas) {
      muatan.add(hewan);
      print(
          '${hewan.namaHewan} dengan berat ${hewan.beratHewan} berhasil ditambahkan ke dalam muatan.');
    } else {
      print("Muatan melebihi kapasitas mobil!");
    }
  }

  double totalMuatan() {
    double total = 0.0;
    for (int i = 0; i < muatan.length; i++) {
      total += muatan[i].beratHewan;
    }
    return total;
  }

  double kapasitasTersisa() {
    return kapasitas - totalMuatan();
  }
}

void main() {
  print("Masukkan kapasitas muatan mobil: ");
  double kapasitas = double.parse(stdin.readLineSync()!);
  print("Kapasitas mobil $kapasitas kg");

  Mobil mobil = Mobil(kapasitas);

  while (mobil.totalMuatan() < mobil.kapasitas) {
    print("Masukkan nama hewan:");
    String nama = stdin.readLineSync()!;

    print("Masukkan berat hewan: ");
    double berat = double.parse(stdin.readLineSync()!);

    Hewan hewan = Hewan(berat, nama);
    mobil.tambahMuatan(hewan);

    if (mobil.totalMuatan() == mobil.kapasitas) {
      print('KAPASITAS MOBIL TELAH TERPENUHI');
      break;
    } else if (mobil.totalMuatan() < mobil.kapasitas &&
        mobil.kapasitasTersisa() > 0) {
      print('KAPASITAS MOBIL TERSISA ${mobil.kapasitasTersisa()}');
    } else {
      print('KAPASITAS MOBIL SUDAH PENUH');
      break;
    }
  }

  print("Total muatan mobil: ${mobil.totalMuatan()} kg");
}
