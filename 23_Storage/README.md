## Summary

## Flutter Storage

> 
> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai penyimpanan lokal pada Flutter, yaitu *shared preferences* dan *local database*. *Shared preferences* berfungsi untuk menyimpan data yang sederhana dengan menggunakan format *key-value*. *Shared preferences* digunakan untuk menyimpan tipe data dasar seperti teks, angka, dan *boolean*. Contoh penggunaan *shared preference* seperti menyimpan data *login/token* dan menyimpan riwayat pencarian. Sedangkan *local database* digunakan untuk menyimpan dan meminta data dalam jumlah besar pada *local device. Database* ini bersifat *private*.
>2. Mengenai SQLite pada Flutter. SQLite merupakan layanan *database* untuk implementasi *local database* melalui *package* `sqflite`. SQLite adalah *database open source* yang mendukung *insert, read, update,* dan *remove* data. *Database* SQLite ini disimpan di dalam *project*.
>3. Mengenai penggunaan SQLite pada aplikasi Task Management sebelumnya. Dengan menggunakan *database* seperti SQLite ini, data-data yang telah dibuat atau diedit sebelumnya masih akan tersimpan di dalam tabel meskipun aplikasi sudah ditutup atau diberhentikan. Jangan lupa juga untuk menerapkan *asyncronus* dalam menyimpan atau mengambil data dari *database*.

### **Penyimpanan Lokal**

Penyimpanan lokal diperlukan untuk efisiensi penggunaan data internet. Ada beberapa cara implementasi penyimpanan lokal, contohnya seperti *Shared Preferences* dan *Local Database*.



### **Shared Preferences**

*Shared preferences* berfungsi untuk menyimpan data yang sederhana dengan menggunakan format *key-value*. *Shared preferences* digunakan untuk menyimpan tipe data dasar seperti teks, angka, dan *boolean*. Contoh penggunaan *shared preference* seperti menyimpan data *login* dan menyimpan riwayat pencarian.

Implementasi *shared preference* dapat dilakukan seperti langkah-langkah berikut pada fitur *login*.

1. Tambahkan *package* `shared_preference`.
2. Buat properti baru untuk `TextEditingController` dan tambahkan di setiap `TextFromField`.
3. Buat *method* `dispose()`, untuk menghindari kebocoran memori.
4. Buat variabel baru untuk menyimpan `SharedPreference` dan nilai *boolean* `newUser`.
5. Buat *method* baru dengan nama `checkLogin()`.
6. Panggil *method* `checkLogin()` di *method* `initState()`.
7. Di dalam `onPressed ElevatedButton`, buat variabel baru *username* untuk menampung *input* dari *user*.
8. Buat `setBool` dan `setString` baru di dalam blok kode `if`, dan buat navigasi untuk ke halaman `HomePage`.
9. Buat *file* dart baru `home_page.dart` dan tambahkan UI-nya.
10. (Pada `home_page.dart`) Buat variabel baru untuk menyimpan `SharedPreference` dan *username*.
11. (Pada `home_page.dart`) Buat *method* baru `initial()`, dan panggil di method `initState()`.
12. (Pada `home_page.dart`) Ganti *text* ‘username’ menjadi variabel *username.*
13. (Pada `home_page.dart`) tambahkan *method* `setBool` dan *remove* pada `ElevateButton`.

Hasil akhir dari langkah-langkah tersebut adalah ketika menekan *login*, maka akan masuk ke *home page* dan menampilkan *text* *username* sesuai yang di-*input*-kan di *text form field.*

### **Local Database (SQLite)**

*Local database* digunakan untuk menyimpan dan meminta data dalam jumlah besar pada *local device. Database* ini bersifat *private*. Untuk mengimplementasi *local database*, dapat dengan menggunakan SQLite *database* melalui *package* `sqflite`. SQLite adalah *database open source* yang mendukung *insert, read, update,* dan *remove* data.


### **Aplikasi Task Management (lanjutan)**

1. Tambahkan *login screen* pada aplikasi Task Management dan tambahkan `shared_preference` *package* serta `email_validator` *package*.
2. (Pada `main.dart`) Ganti `home` menjadi `routes`.
3. (Pada `profile_sheet.dart`) Tambahkan kode untuk *shared preference* di *profile sheet*.
4. Tambahkan *package* `sqflite` dan *path* (`pubspec.yaml`). Pastikan *import packages*-nya di *file* dart yang sedang dikerjakan.
5. (Pada `task_model.dart`) Buat model/modifikasi model yang sudah ada dan membuat fungsi `toMap` dan `fromMap`.
6. Buat folder baru helper dan di dalamnya buat *file* dart baru `database_helper.dart`.
7. (Pada `database_helper.dart`) Buat kelas baru `DatabaseHelper` dan tambahkan *factory constructor*.
8. (Pada `database_helper.dart`) Buat objek *database*.
9. (Pada `database_helper.dart`) Buka koneksi ke *database* dan buat tabelnya.
10. (Pada `database_helper.dart`) Buat *method* untuk menambahkan data ke tabel.
11. (Pada `database_helper.dart`) Buat *method* untuk membaca data.
12. (Pada `database_helper.dart`) Buat *method* untuk mengambil data dengan id.
13. (Pada `database_helper.dart`) Buat *method* untuk memperbarui data.
14. (Pada `database_helper.dart`) Buat *method* untuk menghapus data.
15. Buat *file* dart baru `db_manager.dart`.
16. (Pada `db_manager.dart`) Buat *constructor* untuk membuat *instance* kelas `DatabaseHelper`.
17. (Pada `db_manager.dart`) Buat *method* `_getAllTasks`.
18. (Pada `db_manager.dart`) Buat *method* `addTask`, `getTaskById`, `updateTask`, dan `deleteTask`.
19. (Pada `main.dart`) Ganti `provider` menjadi `DbManager`.
20. (Pada `task_screen.dart`) Ganti `Consumer` yang ada di `buildTaskScreen` menjadi `DbManager`.
21. (Pada `task_screen.dart`) Ganti kode yang ada di `onPressed FloatingActionButton`.
22. (Pada `task_item_screen.dart`) Hapus properti `onCreate` dan membuat properti baru `taskModel`.
23. (Pada `task_item_screen.dart`) Hapus properti `_taskName`, buat properti baru `_isUpdate`, dan ganti kode pada blok *method* `initState()`.
24. (Pada `task_item_screen.dart`) Ganti kode yang ada di blok kode `onPressed builButton()`.
25. (Pada `task_list_screen.dart`) Ganti `TaskManager` menjadi `DbManager`.
26. (Pada `task_list_screen.dart`) Bungkus `ListView.separated` dengan `Consumer<DbManager>()`. Pindahkan variabel `taskItems` di dalam *builder* `Consumer`.
27. (Pada `task_list_screen.dart`) Hapus *key* yang ada di *widget* `TaskItemCard`. Ganti *index* untuk `deleteTask`-nya menggunakan `item.id`.
28. (Pada `task_list_screen.dart`) Bungkus *widget* `TaskItemCard` dengan *widget* `InkWell` dan gunakan `onTap` dengan fungsi *async*. Di dalam blok fungsinya tambahkan variabel `selectedTask` yang menampung `item.id` dan tambahkan navigasi ke `TaskItemScreen`.