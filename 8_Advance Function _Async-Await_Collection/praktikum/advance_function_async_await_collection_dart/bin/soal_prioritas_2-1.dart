void main() {
  // Membuat list dengan tiap elemen yang berupa list dengan 2 data
  List<List<String>> dataDiri = [
    ['name', 'Oktavian'],
    ['age', '21'],
    ['address', 'Malang Kota'],
    ['job', 'Software Engineering']
  ];

  // Mengonversi list menjadi map
  Map<String, String> mapDataList = {};
  dataDiri.forEach((item) {
    mapDataList[item[0]] = item[1];
  });

  // Menampilkan map
  print(
      mapDataList); // Output: {nama: John, usia: 25, alamat: Jl. Sudirman No. 123, pekerjaan: Developer}
}
