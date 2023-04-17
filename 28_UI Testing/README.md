## Summary

## UI Testing

> 
> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai UI *testing*. UI *testing* merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. UI *testing* di Flutter disebut *widget testing*, sehingga pengujian dilakukan pada *widgets* dengan menuliskan *script* yang dapat dijalankan secara otomatis.
>2. Mengenai keuntungan melakukan UI *testing*. Beberapa keuntungan melakukan UI *testing* adalah memastikan seluruh *widget* memberi tampilan yang sesuai, memastikan seluruh interaksi dapat diterima dengan baik, serta menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada *widget*.
>3. Mengenai cara melakukan UI *testing*. Sama seperti saat melakukan *unit testing*, UI *testing* harus menggunakan *package testing*. Selanjutnya, pada struktur *script*, harus memuat skenario pengujian *widget* yang dilakukan. Misalnya, untuk melakukan pengujian `AboutScreen`, maka *test case* diawali dengan `testWidgets` dan diberi judul. Lalu, dilakukan simulasi proses dalam mengaktifkan halaman `AboutScreen`. Dan terakhir, memeriksa apakah di halaman tersebut terdapat teks “About Screen” dengan menggunakan `find()`.


### **Pengertian UI Testing**

*Testing* merupakan salah satu hal yang penting dalam tahapan pengembangan aplikasi. UI *testing* merupakan pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. UI *testing* di Flutter disebut *widget testing*, sehingga pengujian dilakukan pada *widgets* dengan menuliskan *script* yang dapat dijalankan secara otomatis.

Terdapat beberapa keuntungan melakukan UI *testing* sebagai berikut.

1. Memastikan seluruh *widget* memberi tampilan yang sesuai.
2. Memastikan seluruh interaksi dapat diterima dengan baik.
3. Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada *widget*. 

### **Melakukan UI Testing**

Pada umumnya, *package testing* sudah ter-*install* sejak *project* pertama kali dibuat. Tetapi terdapat cara yang dapat dilakukan jika ingin meng-*install* secara manual sebagai berikut. Tidak lupa, jalankan `flutter pub get` pada terminal.

```yaml
dev_dependencies:
	flutter_test:
		sdk: flutter
```

**Penulisan Script Testing**

Penulisan *script testing* dilakukan pada folder `test`. Nama file harus diikuti dengan `_test.dart`. Tiap *file* berisi fungsi `main()` yang di dalamnya dapat dituliskan *script testing*. Tiap skenario pengujian disebut dengan `test case`.

```dart
void main() {
	testWidgets('Judul halaman harus ...', (WidgetTester tester) async {
	// ...
	});

	testWidgets('Tombol harus ...', (WidgetTester tester) async {
	// ...
	});
}
```

Pada tiap *script test*, terdapat struktur yang harus diperhatikan. Sebagai contoh adalah sebagai berikut beserta keterangan tiap bagiannya.

```dart
// 1
testWidgets('Judul halaman harus ...', (WidgetTester tester) async {
	
	// 2
	await tester.pumpWidget(
		const MaterialApp(
			home: AboutScreen(),
		),
	);	

	// 3
	expect(find.text('About Screen'), findsOneWidget);
});
```

1. *Test case* diawali dengan `testWidgets` dan diberi judul.
2. Simulasi proses dalam mengaktifkan halaman `AboutScreen`.
3. Memeriksa apakah di halaman tersebut terdapat teks “About Screen”.


**Menjalankan Testing**

*Testing* dapat dilakukan dengan menjalankan perintah `flutter test` pada terminal yang akan menjalankan seluruh *file* *test* yang dibuat. Hasil dari perintah ini adalah lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil. Jika **testing** gagal, maka akan ditampilkan penyebab gagalnya.