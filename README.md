# counter_7 & Budget
A simple counter and budget tracker project

## Assignment 7
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
**Stateless Widget**<br>
Stateless widget merupakan sebuah widget yang state-nya tidak dapat diubah setelah selesai dibangun/build. Secara sederhana, ini berarti stateless widget tidak dapat berubah atau tidak akan pernah berubah. Widget ini bersifat immutable, sehingga tampilan dan properti dari widget tidak akan berubah selama runtime.<br>

**Stateful Widget**<br>
Stateful widget merupakan sebuah widget yang state-nya dapat diubah setelah selesai dibangun/build. Secara sederhana, ini berarti stateful widget bisa mengalami perubahan dan juga dinamis. Widget ini bersifat mutable, sehingga tampilan dan properti dari widget dapat berubah saat runtime.<br>

**Stateless Widget vs Stateful Widget**<br>
| Stateless | Stateful |
| --------- | -------- |
| Static Widgets | Dynamic Widgets |
| Tidak bergantung pada perubahan data atau perilaku | Bisa berubah pada saat runtime berdasarkan perubahan data atau aksi dari user|
| Tidak memiliki state, hanya akan di-render sekali dan hanya akan di-update jika terdapat perubahan data eksternal | Memiliki internal state, dapat dilakukan render ulang jika input data berubah atau state dari widget berubah |
| Contoh: Text, Icon, RaisedButton | Contoh: Checkbox, Radio Button, Slider |

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Pada proyek kali ini, saya menggunakan beberapa widget. Widget tersebut serta fungsinya antara lain:
- Scaffold<br>
Scaffold adalah struktur layout dari proyek ini. Semua widget lainnya terdapat di dalam scaffold.
- AppBar<br>
Appbar terdapat pada bagian paling atas aplikasi ini. Pada proyek kali ini, Appbar hanya memuat judul dari aplikasi yaitu ```Program Counter```
- Column<br>
Column merupakan sebuah layout yang meletakkan child widgets secara vertikal. Pada aplikasi ini, digunakan Column untuk menata widget teks genap/ganjil dan counter
- Row<br>
Row merupakan sebuah layout yang meletakkan child widgets secara horizontal. Pada aplikasi ini, digunakan Row untuk menata widget floatting action button untuk increment dan decrement   
- Text<br>
Text terdapat pada beberapa lokasi seperti counter itu sendiri, teks genap atau ganjil, serta pada teks judul pada Appbar
- Button<br>
Terdapat widget button pada aplikasi ini, khususnya tipe Floating Button. Pada proyek ini terdapat 2 button yang masing-masing memiliki fungsi increment dan decrement counter.

Terdapat juga beberapa widget lainnya seperti Center, Padding, Opacity dan Align.
 
### Apa fungsi dari ```setState()```? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut. 
Pemanggilan ```setState()``` memberi informasi kepada framework bahwa internal state dari suatu objek di dalam fungsi tersebut berubah, dan perubahan tersebut berdampak kepada tampilan. Dikarenakan tampilan akan berubah, ```setState()``` mengakibatkan framework untuk melakukan build untuk state dari objek tersebut.<br>
Variabel yang terdampak fungsi tersebut pada aplikasi ini adalah ```_counter```. Fungsi penambahan dan pengurangan counter dibungkus dengan fungsi ```setState()```, sehingga saat fungsi increment ataupun decrement counter dipanggil akan mengakibatkan perubahan state dari objek tersebut.

### Jelaskan perbedaan antara const dengan final.
Terdapat beberapa perbedaan antara const dan final. <br>
Final berarti single-assignment. Final memodifikasi **variables**. Setelah dipasangkan suatu value, value dari final variable tersebut tidak dapat diubah. Final digunakan saat value tidak diketahui pada compile time, dan baru akan dikalkulasikan pada runtime. <br>
Const memodifikasi **value**. Const berarti deep state dari suatu objek dapat ditentukan saat compile time dan objek tersebut akan menjadi immutable. Maka perbedaan utama adalah value dari const sudah harus dapat ditentukan saat compile time.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- [x] Membuat sebuah program Flutter baru dengan nama ```counter_7```.<br>
Masuk ke dalam direktori pbp-flutter-lab. Lalu buka command prompt dan jalankan ```flutter create counter_7 ```.
- [x] Mengubah tampilan program menjadi seperti berikut<br>
Untuk tampilan, pertama kita ubah title dengan menggantinya pada ```home: const MyHomePage(title: "Program Counter")```. Selanjutnya, teks di atas counter kita ganti dengan conditional yang memanfaatkan ternary operator yaknni ```(_counter % 2 == 0)? genap:ganjil```. Untuk counter tidak perlu diubah karena dengan aplikasi default sudah sesuai. Selanjutnya kita perlu menambahkan button untuk decrement. Kita tambahkan floatingActionButton pada Scaffold dengan memanfaatkan:
```
return Scaffold(
    ...
    floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Padding(
        ...
        child: Row(
            ...
            children: <Widget>[
                Align(
                    ...
                    child: FloatingActionButton(
                    ...
                    ) // FloatingActionButton
                ), // Align
                ...
            ], // <Widget>[]
        ), // Row
    ), // Padding
); // Scaffold
```
- [x] Mengimplementasikan logika berikut pada program.
    - [x] Tombol + menambahkan angka sebanyak satu satuan.<br>
    Sudah ada pada default app, yaitu dengan fungsi ```_incrementCounter()```. Lalu pada tombol + tambahkan ```onPressed: _incrementCounter```
    - [x] Tombol - mengurangi angka sebanyak satu satuan.<br>
    Buat fungsi ```_decrementCounter()``` yang mirip dengan ```_incrementCounter()```, hanya saja tambahkan conditional ```if (_counter != 0)``` sehingga hanya memperbolehkan melakukan decrement jika counter bukan 0. Lalu pada tombol - tambahkan ```onPressed: _decrementCounter``` 
    - [x] Apabila counter bernilai 0, maka tombol - tidak memiliki efek apapun pada counter.<br>
    Sudah di-cover pada checkpoint di atas
    - [x] Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru.<br>
    Buat suatu variable bernama genap seperti:
        ```
        Text genap = const Text(
          'GENAP',
          style: TextStyle(color: Color.fromRGBO(255, 0, 0, 100)),
        );
        ```
        Kemudian tambahkan ```(_counter % 2 == 0)? genap:ganjil``` pada widget yang berkesesuaian, yakni di atas counter. 
    - [x] Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah.<br>
    Buat suatu variable bernama ganjil seperti:
        ```
        Text ganjil = const Text(
          'GANJIL',
          style: TextStyle(color: Color.fromRGBO(0, 0, 255, 100)),
        );
        ```
        Kemudian tambahkan ```(_counter % 2 == 0)? genap:ganjil``` pada widget yang berkesesuaian, yakni di atas counter.
    - [x] Angka 0 dianggap sebagai angka genap.<br>
    ```(_counter % 2 == 0)? genap:ganjil``` sudah meng-cover hal tersebut dikarenakan 0 % 2 = 0 dan jika hasil modulo 2 adalah 0 maka angka tersebut adalah genap
- [x] Bonus: Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0<br>
Untuk dapat menyembunyikan tombol - apabila counter bernilai 0, kita hanya perlu menambahkan widget Opacity() di luar tombol -. Diperlukan juga untuk melakukan conditional pada opacity-nya. Kode adalah sebagai berikut:
```
return Scaffold(
    ...
    floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Padding(
        ...
        child: Row(
            ...
            children: <Widget>[
                Align(
                    ...
                    child: Opacity(
                        opacity: (_counter > 0)? 1:0.2,
                        child: FloatingActionButton(
                        ...
                        tooltip: (_counter > 0)? 'Decrement':'',
                        ...
                        ) // FloatingActionButton
                    ) // Opacity
                ), // Align
                ...
            ], // <Widget>[]
        ), // Row
    ), // Padding
); // Scaffold
```

## Assignment 8
### Jelaskan perbedaan ```Navigator.push``` dan ```Navigator.pushReplacement```.
Seperti pada stack, ```Navigator.push``` melakukan push routing yang ingin dituju. Maka jumlah routing di dalam stack akan bertambah. Sedangkan ```Navigator.pushReplacement``` akan melakukan push terhadap route yang ingin dituju, serta membuang atau melakukan pop terhadap route sebelumnya setelah route yang baru selesai dilakukan build.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
Terdapat widgets yang telah dijelaskan pada [Assignment 7](#assignment-7). Lalu terdapat beberapa widget tambahan seperti:
- Drawer<br>
Widget ini dipergunakan untuk menyediakan drawer atau hamburger menu untuk tombol menuju routing page yang lain.
- Navigator<br>
Bertindak untuk menuju ke routing yuang lain. Bisa menggunakan ```Navigator.push``` dan ```Navigator.pushReplacement```.
- ListTile<br>
Semacam container yang memiliki tinggi yang fixed yang dapat berisikan text. Digunakan sebagai tombol terhadap page lain.
- Form<br>
Suatu container untuk mewadahi bermacam widget form. Digunakan pada ```form.dart```
- TextFormField<br>
Merupakan suatu field untuk menerima input berupa teks. Pada tugas kali ini dimanfaatkan untuk menerima input judul dan nominal budget.
- DropdownButtonField<br>
Merupakan suatu field yang menyediakan dropdown agar user dapat memilih opsi. Digunakan untuk menyediakan pilihan jenis budget.
- TextButton<br>
Kasarnya button yang dapat ditekan dan memiliki fungsi setelah ditekan. Digunakan sebagai tombol submit dari form budget.
- Card<br>
Sebuah panel yang bisa digunakan untuk menunjukkan informasi atau text. Pada tugas ini digunakan untuk menampilkan data dari budget.<br>
Masih ada beberapa widget lain yang terdapat pada tugas ini.

### Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
Terdapat berbagai macam jenis event di Flutter. Beberapa contoh adalah onPressed, onChanged, onSaved, onTap, onLongPress, onHover dan masih banyak lagi.

### Jelaskan bagaimana cara kerja ```Navigator``` dalam "mengganti" halaman dari aplikasi Flutter.
Dalam Flutter, navigasi terdiri dari stck yang berisikan widgets. Navigator menyediakan method untuk melakukan mutasi terhadap stack dengan pop ataupun push. ```Navigator.push``` digunakan untuk menavigasi ke halaman baru, dan ```Navigator.pop``` digunakan untuk kembali ke halaman yang sebelumnya. Push mengambil argumen BuildContext dan PageBuilder, sedangkan pop hanya mengambil argumen BuildContext. Selain itu kita perlu menyediakan rute terhadap halaman yang ingin dituju.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
- [x] Menambahkan drawer/hamburger menu pada app yang telah dibuat sebeumnya.<br>
Pada property drawer milik Scaffold, tambahkan:
```
Drawer(
  child: Column(
    children: [
      ...
    ],
  ),
);
```
- [x] Menambahkan tiga tombol navigasi pada drawer/hamburger.<br>
  - [x] Navigasi pertama untuk ke halaman counter.<br>
  Pada children Column dari Drawer, tambahkan: 
```
ListTile(
  title: const Text("counter_7"),
  onTap: () {
    Navigator.pushReplacement(
     context,
     MaterialPageRoute(builder: (context) => const MyHomePage()),
    );
  },
),
```
  - [x] Navigasi kedua untuk ke halaman form.<br>
  Pada children Column dari Drawer, tambahkan:
```
ListTile(
  title: const Text("Tambah Budget"),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyFormPage()),
    );
  },
),
```
  - [x] Navigasi ketiga untuk ke halaman yang menampilkan data budget yang telah di-input melalui form.<br>
  Pada children Column dadri Drawer, tambahkan:
```
ListTile(
  title: const Text("Data Budget"),
    onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyDataPage()),
    );
  },
)
```
- [x] Menambahkan halaman form<br>
  Membuat file baru bernama ```form.dart``` di direktori yang sama. Buat juga ```_formKey``` dan ```Scaffold()``` yang memiliki body ```Form()```. Buat juga list yang menyimpan data-data dari tiap budget.
  - [x] Menambahkan elemen input dengan tipe data String berupa judul budget.<br>
  Dengan widget ```TextFormField()``` buat property onSaved, onChanged dan validator untuk menyimpan pada list, mengambil serta validasi input judul budget.
  - [x] Menambahkan elemen input dengan tipe data int berupa nominal budget.<br>
  Dengan widget ```TextFormField()``` buat property onSaved, onChanged dan validator untuk menyimpan pada list, mengambil serta validasi input nominal budget. Tambahkan juga keyboardType dan inputFormatters agar user hanya bisa melakukan input berupa digit.
  - [x] Menambahkan elemen dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran.<br>
  Dengan widget ```DropdownButtonFormField()``` buat property items, onChanged, onSaved dan validator. items berisikaan DropdownMenuItem dari pilihan Pemasukan dan Pengeluaran.
  - [x] Menambahkan button untuk menyimpan budget.<br>
  Gunakan ```TextButton()``` yang melakukan validasi pada state ```_formKey```. Jika valid, lakukan penyimpanan dan reset form tersebut. Kemudian gunakan ```Dialog()``` untuk melakukan popup informasi budget.
- [x] Menambahkan halaman data budget<br>
Membuat file baru bernama ```data.dart``` di direktori yang sama. Body dari ```Scaffold()``` adalah ```ListView.seperated()```.
  - [x] Menampilkan semua judul, nominal, dan tipe budget yang telah ditambahkan pada form.<br>
  Di dalam ```ListView.seperated()```, gunakan ```itemBuilder()``` yang mengembalikan ```Card()```. Di dalam card, manfaatkan children untuk menampilkan informasi dari budget.
- [x] Bonus:<br>
  - [x] Menambahkan elemen date picker pada halaman form.<br>
  Gunakan widget ```TextButton()``` yang memiliki property onPressed dengan fungsi ```showDatePicker()```. Kemudian dengan method ```then()```, kita bisa mendapatkan value dari tanggal yang dipilih.
  - [x] Menampilkan elemen date (format bebas) pada setiap elemen budget yang ada pada halaman data budget.<br>
  Lakukan ```import 'package:intl/intl.dart';``` terlebih dahulu agar memiliki fungsi untuk melakukan format. Jika belum ada, install terlebih dahulu dependensi-nya. Kemudian di dalam children ```Card()```, tambahkan informasi tanggal dengan menggunakan ```Text(DateFormat.yMMMEd().format(tanggalList[index]))```
  - [x] Refactor widget Drawer ke sebuah file terpisah.<br>
 Buat file ```drawer.dart``` pada direktori yang sama. Kemudian setelah melakukan import file-file yang lain, hanya perlu membuat fungsi yang mengembalikan ```Drawer()``` yang telah dibuat sebelumnya. Kemudian dari masing-masing file, lakukan import dan lakukan ```drawer: returnMyDrawer(context),```