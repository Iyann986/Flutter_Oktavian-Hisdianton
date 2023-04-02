## Summary

## Flutter State Management (BLoC)


> 
> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai *state* pada Flutter. *State* merupakan data yang dibaca saat awal pembuatan *widget*. *State* hanya dapat berubah saat *widget* sedang aktif dan hanya dimiliki oleh `StatefulWidget`. Salah satu *state* terdapat pada Flutter adalah *global state*.
>2. Mengenai *global state* pada Flutter. Seperti yang telah disinggung sebelumnya, *global state* merupakan *state* biasa yang dapat digunakan pada seluruh *widget*. Salah satu *global state* yang umum digunakan pada Flutter adalah `BLoC`. 
>3. Mengenai *state* `BLoC` **pada Flutter. *State* *management* `BLoC` (*Business Logic Component*) merupakan *state management* yang memisahkan antara *business logic* dengan UI (*user interface*). *State management* `BLoC` mirip dengan MVC pada pengembangan *website*. *State management* ini perlu di-*install* agar dapat digunakan. Instalasi `BLoC` dilakukan dengan menambah *package* `BLoC` pada bagian *dependencies* dalam file `pubspec.yaml`. Kemudian, dapat dijalankan perintah `flutter pub get`. Terdapat beberapa kelebihan dari *state management* `BLoC`, beberapa di antaranya adalah *simple*, *powerful*, dan *testable*. *State management* `BLoC` bekerja dengan menerima *event* sebagai *input* yang kemudian dianalisa dan dikelola di dalam `BLoC`. Selanjutnya, akan dihasilkan *state* yang juga merupakan *output* dari `BLoC`.

### BLoC
 `BLoC` adalah sebuah pattern atau pola arsitektur pada Flutter yang memisahkan logika bisnis dari tampilan atau UI. BLoC bertanggung jawab untuk mengambil data dari berbagai sumber, memprosesnya dan kemudian memberikan data tersebut ke tampilan. Hal ini membantu menjaga kode agar terstruktur, mudah dibaca, dan mudah dikelola.

 Dalam `BLoC`, state diatur dengan menggunakan stream. Stream adalah aliran data yang dapat diakses secara asinkron, yang memungkinkan penggunaan data dalam waktu nyata tanpa memerlukan request yang berulang. Ketika data berubah, stream akan mengirimkan data baru ke tampilan dan mengupdate tampilan sesuai dengan data tersebut.

 Secara umum, dalam BLoC, sebuah aplikasi terdiri dari 3 komponen utama: event, bloc, dan state. Event adalah tindakan atau aksi yang dilakukan oleh pengguna, seperti mengklik sebuah tombol. Bloc bertanggung jawab untuk memproses event dan menghasilkan state baru. State adalah representasi dari keadaan aplikasi pada suatu waktu.

 Dalam penggunaannya, BLoC juga sering digabungkan dengan teknik Dependency Injection (DI) untuk memudahkan pengaturan dependensi dalam aplikasi Flutter. Dengan menggunakan BLoC sebagai teknik state management, pengembang dapat membuat aplikasi yang mudah di-maintain dan di-scale, dan dapat menghindari masalah yang sering terjadi dalam aplikasi yang kompleks.

 Terdapat beberapa kelebihan dari *state management* `BLoC`, beberapa di antaranya adalah sebagai berikut.

1. *Simple*
2. *Powerful*
3. *Testable*

**Cara Kerja BLoC**

*State management* `BLoC` bekerja dengan menerima *event* sebagai *input* yang kemudian dianalisa dan dikelola di dalam `BLoC`. Selanjutnya, akan dihasilkan *state* yang juga merupakan *output* dari `BLoC`.

**Stream**

`Stream` merupakan proses yang dilakukan *asynchronous* yang merupakan aktor atau proses utama di dalam *state management* `BLoC`.