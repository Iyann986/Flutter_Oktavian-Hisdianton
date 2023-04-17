## Summary

## Finite State Machine


> Terdapat 3 (tiga) hal utama yang saya pelajari pada *section* ini sebagai berikut.
>
>1. Mengenai *Finite State Machine*. *Finite State Machine* merupakan mesin yang memiliki sejumlah *state*. Setiap *state* tersebut menunjukkan apa yang terjadi sebelumnya. Contoh implementasinya adalah untuk *handle* beberapa kondisi dalam suatu *widget*, seperti *loading, error,* dan saat sukses. *Finite State Machine* ini mirip seperti *state* pada BLoC.
>2. Mengenai unit *testing*. Unit *test* merupakan salah satu jenis pengujian pada perangkat lunak. Pengujian ini dilakukan pada unit dalam perangkat lunak. Unit yang dimaksud umumnya adalah fungsi atau *method*. Tujuannya, adalah untuk memastikan fungsi atau *method* dapat mengolah berbagai jenis *input*. 
>3. Mengenai *grouping* dan *mocking* pada unit *test*. *Grouping* dilakukan ketika terdapat beberapa *test* dengan subjek yang sama sehingga dapat dikelompokkan. Sedangkan *mocking* adalah membuat suatu tiruan dari objek yang sebelumnya bergantung pada sistem eksternal yang dapat mempengaruhi berjalannya pengujian. Pengaruh tersebut dapat mengganggu proses pengujian itu sendiri. Sehingga, perlu dilakukan *mocking* untuk menghindari masalah-masalah tersebut.


### Finite State Machine

*Finite State Machine* merupakan mesin yang memiliki sejumlah *state*. Setiap *state* tersebut menunjukkan apa yang terjadi sebelumnya. 

Sebagai contoh, terdapat 3 *state* yang menunjukkan kejadian dalam suatu proses sebagai berikut.


1. `IDLE`, yaitu saat tidak terjadi proses.
2. `RUNNING`, yaitu saat proses sedang berjalan.
3. `ERROR`, yaitu saat proses gagal diselesaikan.

Dari 3 *state* tersebut, contoh alur pergantian antar *state* ketika suatu proses sukses adalah sebagai berikut.

1. `IDLE` berubah menjadi `RUNNING` saat proses berjalan.
2. `RUNNING` kembali menjadi `IDLE` saat proses selesai.

Kemudian, contoh alur pergantian antar *state* ketika suatu proses gagal adalah sebagai berikut.

1. `IDLE` berubah menjadi `RUNNING` saat proses berjalan.
2. `RUNNING` menjadi `ERROR` saat terjadi kegagalan.
3. `ERROR` kembali menjadi `IDLE`.




### Implementasi pada View-Model

Salah satu penerapan *Finite State Machine* adalah pada *View-Model* arsitektur MVVM yang ditunjukkan dengan beberapa cara sebagai berikut.

1. **Menambah Enum**
    
    Membuat `enum` untuk masing-masing *state*.
    
    ```dart
    enum ContactViewState {
    	none,
    	loading,
    	error,
    }
    ```
    
    1. `None` saat `IDLE`.
    2. `Loading` saat `RUNNING`.
    3. `Error` saat `ERROR`.



    
2. **Menambah Getter-Setter**
    
    Membuat *getter*-*setter* untuk menyimpan *state* dari *widget*.
    
    ```dart
    class ContactViewModel with ChangeNotifier {
      ContactViewState _state = ContactViewState.none;
      ContactViewState get state => _state;
    
      changeState(ContactViewState state) {
        _state = s;
        notifyListeners();
      }
    }
    ```

    
3. **Gunakan State**
    
    Tiap proses yang perlu *state* tersebut, dapat memanfaatkannya.
    
    ```dart
    class ContactViewModel with ChangeNotifier {
    
      // ...
    
      getAllContacts() async {
        changeState(ContactViewState.loading);
    
        try {
          final c = await ContactAPI.getAllContacts();
          _contacts = c;
          notifyListeners();
          changeState(ContactViewState.none);
        } catch (e) {
          changeState(ContactViewState.error);
        }
      }
    }
    ```
    

### Implementasi pada Widget

Implementasi *Finite State Machine* ditunjukkan sebagai berikut.

1. *Perbedaan Tampilan Tiap State*
    
    Informasi *Finite State* dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan.
    
    ```dart
    Widget body(ContactViewModel viewModel) {
      final isLoading = viewModel.state == ContactViewState.loading;
      final isError = viewModel.state == ContactViewState.error;
    
      if (isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
    
      if (isError) {
        return const Center(child: Text('Gagal Mengambil Data.'));
      }
    
      return listView(viewModel);
    }
    ```
    
    1. Saat *state* menunjukkan `RUNNING`, maka ditampilkan *progress indicator*. 
    2. Saat *state* menunjukkan `IDLE` setelah `RUNNING`, maka ditampilkan data yang didapatkan.
    3. Saat *state* menunjukkan `ERROR`, maka ditampilkan pesan yang menunjukkan bahwa proses tidak dapat diselesaikan.
    



### Unit Test

Unit *test* merupakan salah satu jenis pengujian pada perangkat lunak. Pengujian ini dilakukan pada unit dalam perangkat lunak. Unit yang dimaksud umumnya adalah fungsi atau *method*.

**Tujuan Unit Test**

Tujuan dari unit *test* sendiri adalah untuk memastikan fungsi atau *method* dapat mengolah berbagai jenis *input*. Selain itu juga memastikan hasil dari suatu fungsi atau *method* sudah sesuai dan menjadi dokumentasi dari fungsi atau *method* itu sendiri.



**Bagaimana Melakukan Unit Test?**

Unit *test* dapat dilakukan dengan 2 cara, yaitu manual dan *automated*.

1. **Manual**
    
    Unit dijalankan dan dicek hasilnya secara manual.
    
2. **Automated**
    
    Menulis *script* yang dapat dijalankan berkali-kali menggunakan *test runner*.
    



**Melakukan Automated Unit Test**

Untuk melakukan *automated* unit *test*, dapat dengan melakukan beberapa langkah sebagai berikut.

1. **Menambah Dependencies**
    
    Tambahkan `test`, pada bagian `dev_dependencies` dalam file `pubspec.yaml`. Kemudian, jalankan `flutter pub get` pada terminal.
    
    ```yaml
    dev_dependencies:
    	test:
    ```
 

   
2. **Membuat File Test**
    
    Pada folder `test`, tambahkan folder baru `model/api`. Dalam folder tersebut, tambahkan *file* baru yaitu `contact_api_test.dart`.
 
   
3. **Menulis Test Script**
    
    *Import* *package* `test`. Kemudian, buat *test case* dan jalankan fungsi yang ingin dites. Cek hasil dengan menggunakan `expect`. Contoh implementasinya adalah sebagai berikut.
    
    ```dart
    import 'package:test/test.dart';
    
    void main() {
      test('get all contacts returns data' () async {
        var contacts = await ContactAPI.getAllContacts();
        expect(contacts.isNotEmpty, true);
      });
    }
    ```

    
4. **Menjalankan Test**
    
    Menggunakan perintah `flutter test`.
    



### Mengelompokkan Test (Grouping)

Beberapa ****test**** dengan subjek yang sama dapat diletakkan dalam sebuah kelompok dengan menggunakan `Group`.

```dart
import 'package:test/test.dart';

void main() {

  group('ContactAPI', () {
    test('get all contacts returns data' () async {
      var contacts = await ContactAPI.getAllContacts();
      expect(contacts.isNotEmpty, true);
    });
  });
}
```



### Mocking

Dalam unit *test*, terkadang terdapat proses yang terikat dengan sistem eksternal yang dapat mempengaruhi berjalannya pengujian. Pengaruh tersebut dapat mengganggu proses pengujian itu sendiri. Sehingga, perlu dilakukan *mocking* untuk menghindari masalah-masalah tersebut.

**Bagaimana Cara Kerja Mocking?**

Suatu objek dibuat bentuk tiruannya, yang mana tiruan tersebut memiliki *input* dan *output* yang sama dengan yang asli. Bentu tiruan akan menghilangkan ketergantungan pada sistem eksternal (seperti data API).

*Mocking* dapat dilakukan dengan beberapa langkah berikut.

1. **Menambah Dependencies**
    
    Tambahkan `mockito` dan `build_runner`, pada bagian `dev_dependencies` dalam ****file**** `pubspec.yaml`. Kemudian, jalankan `flutter pub get` pada terminal
    
    ```yaml
    dev_dependencies:
    	mockito:
    	build_runner:
    ```
    



2. **Melakukan Mocking**
    
    Mengubah kode agar dapat dilakukan *mocking*. Sebagai contoh adalah kode berikut.
    
    ```dart
    class ContactAPI {
      static Future<List<Contact>> getAllContacts() async {
        final response = ...;
        List<Contact> contacts = ...;
        return contacts;
      }
    }
    ```
    
    Diubah menjadi seperti berikut.
    
    ```dart
    class ContactAPI {
      Future<List<Contact>> getAllContacts() async {
        final response = ...;
        List<Contact> contacts = ...;
        return contacts;
      }
    }
    ```


    

3. **Memasang Annotation**
    
    Memasang *annotation* untuk membuat *mock*.
    
    ```dart
    import 'package:test/test.dart';
    import 'package:mockito/mockito.dart';
    import 'package:mockito/annotations.dart';
    
    @GenerateMocks([ContactAPI])
    void main() {
    
      group('ContactAPI', () {
        test('get all contacts returns data' () async {
          var contacts = await ContactAPI.getAllContacts();
          expect(contacts.isNotEmpty, true);
        });
      });
    }
    ```
    



4. **Membuat File Mock**
    
    Membuat *file mock* dilakukan dengan menjalankan perintah `flutter pub run build_runner build`.
   
5. **Menggunakan Mock**
    
    Dengan *mocking*, ****test**** berjalan lebih cepat.
    
    ```dart
    import 'package:test/test.dart';
    import 'package:mockito/mockito.dart';
    import 'package:mockito/annotations.dart';
    
    @GenerateMocks([ContactAPI])
    void main() {
    
      group('ContactAPI', () {
        ContactAPI contactAPI = MockContactAPI();
    
        test('get all contacts returns data' () async {
          when(contactAPI.getAllContacts()).thenAnswer(
            (_) async => <Contact>[
              Contact(id: 1, name: 'Nur Muhammad', phone: '08123456789'),
            ],
          );
          var contacts = await contactAPI.getAllContacts();
          expect(contacts.isNotEmpty, true);
    
        });
      });
    }
    ```