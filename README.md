<details>
<summary> 
Tugas 7
</summary>

<br>

# Tugas 7 PBP 2023
## A. Implementasi _Checklist_
### Pembuatan Proyek Program Flutter
1. Saya membuat direktori proyek baru dengan,
    ```
    flutter create <nama_aplikasi>
    ```

2. Setelah itu saya melakukan pengecekan untuk memastikan program Flutter dapat berjalan dengan,
    ```
    flutter config --enable-web
    flutter run -d chrome
    ```

3. Selanjutnya saya melakukan inisialisasi ke GitHub,
    ```
    git init
    git add .
    git commit -m "initialize"
    git branch -M main
    git remote add origin <tautan_repositori_GitHub>
    git push -u origin main
    ```

### Pembuatan Tiga Tombol Sederhana
1. Saya membuat `class` yang berisikan komponen tombol,
    ```
    class MyItem {
        final String name;
        final IconData icon;

        MyItem(this.name, this.icon);
    }
    ```

2. Setelah itu saya menambahkan informasi mengenai tombol-tombol yang akan dibuat,
    ```
    final List<MyItem> items = [
        MyItem("Lihat Produk", Icons.checklist),
        MyItem("Tambah Produk", Icons.add_shopping_cart),
        MyItem("Logout", Icons.logout),
    ];
    ```

3. Selanjutnya saya menambahkan kode berikut di dalam `children: <Widget>`,
    ```
    GridView.count(
                // Container untuk tombol.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((MyItem item) {
                  // Iterasi untuk setiap item
                  return ItemCard(item);
                }).toList(),
              ),
    ```

### Pembuatan `Snackbar`
1. Saya menambahkan kode berikut pada bagian `Widget build` di dalam `return Material()`,
    ```
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
        ),

    ```

## B. Pertanyaan
#### Perbedaan _Stateless_ dan _Stateful Widget_
_Stateless widget_ merupakan _widget_ statis yang berarti _widget_ tersebut tidak berubah atau dapat dikatakan tidak akan ada perubahan tampilan pada _output_ jika proses pengeluaran _output_ tidak dihentikan dan kode _output_ tidak dimodifikasi. Sementara itu, _stateful widget_ merupakan _widget_ dinamis yang dapat merubah tampilannya sesuai respons dari _events_ yang dipicu baik dari interaksi _user_ maupun adanya variabel atau nilai baru yang didapat.

#### _Widgets_
| No. | Widget | Fungsi |
|:--- |:---:|:---:|
| 1. |`Scaffold`|Mengimplementasi desain dasar material sebagai struktur awal tata letak visual|
| 2. |`AppBar`|Kontainer yang menampilkan konten beserta fiturnya pada bagian atas|
| 3. | `Text`|Menampilkan teks|
| 4. | `Column`|Menampilkan _children_ secara vertikal| 
| 5. | `SingleChildScrollView`|_Widget wrapper_ yang dapat dilakukan _scroll_|
| 6. | `Icon`|Material untuk menampilkan ikon tertentu|
| 7. | `Padding`|_Widget_ untuk mengatur posisi bagian dalam dari _children_-nya|
| 8. | `GridView`|Menampilkan _list_ komponen dalam bentuk _array_ secara horizontal atau vertikal|
| 9. | `Container`|Sebagai kontainer untuk beberapa komponen yang memiliki ciri yang serupa|
| 10.| `Center`|Pengaturan posisi di tengah dengan _child_-nya sendiri|
| 11.| `Theme`|Pengaturan awal untuk tema aplikasi|

## C. Bonus
Saya menambahkan atribut `color` untuk setiap tombol sehingga apabila tombol telah diiterasi, tombol akan memiliki warnanya masing-masing.

1. Penambahan atribut `color`
    ```
    class Feature {
        final String name;
        final IconData icon;
        final MaterialColor color;

        Feature(this.name, this.icon, this.color);
    }
    ```

2. Inisialisasi warna
    ```
    final List<Feature> items = [
        Feature("Lihat Item", Icons.checklist, Colors.blue),
        Feature("Tambah Item", Icons.add_shopping_cart, Colors.green),
        Feature("Logout", Icons.logout, Colors.red),
    ];
    ```

3. Pemanggilan warna
    ```
    class FeatureCard extends StatelessWidget {
        final Feature item;

        const FeatureCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
            return Material(
            color: item.color,

            ...

            );
        }
    }
    ```
</details>

<details>
<summary> 
Tugas 8
</summary>

<br>

# Tugas 8 PBP 2023
## A. Implementasi _Checklist_
### Pembuatan Halaman Formulir
1. Saya membuat berkas baru pada direktori `lib` dengan nama `itemlist_form.dart` dan menambahkan kode berikut agar `ItemFormPage` dapat memiliki _state_ yang dinamis,

    ```
    class ItemFormPage extends StatefulWidget {
        const ItemFormPage({super.key});

        @override
        State<ItemFormPage> createState() => _ItemFormPageState();
    }
    ```

2. Setelah itu saya membuat `class` yang meng-_extends state_ `ItemFormPage`, 
    ```
    class _ItemFormPageState extends State<ItemFormPage> {
        final _formKey = GlobalKey<FormState>();
        String _name = "";
        int _amount = 0;
        String _description = "";

        ...
    }
    ```
    - `_formkey` berguna sebagai variabel yang berfungsi sebagai _handler form state_, validasi formulir, dan penyimpanan formulir.
    - `_name`, `_amount`, dan `_description` berfungsi sebagai variabel yang menyimpan input dari masing-masing _field_.

3. Selanjutnya saya membuat _widget_ `Scaffold` sebagai pondasi `ItemFormPage` di bawah inisialisasi variabel `_description`,

    ```
    ...
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Center(
                    child: Text(
                        'Item Form',
                    ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            ...
        );
    }
    ```
    - `AppBar` berguna sebagai komponen bagian atas di suatu halaman atau _screen_.
    - `drawer` berguna untuk menambahkan _drawer_ sebagai navigasi aplikasi yang akan dibuat nantinya.

4. Setelah itu, saya membuat _widget_ `body` berupa `Form` tepat setelah `drawer` dengan kode berikut,

    ```
    body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ),
        ),
    ),
    ```
    - Atribut `key` akan berfungsi sebagai _handler_ dari _form state_, validasi _form_, dan penyimpanan _form_.
    - _Widget_ `SingleChildScrollView` berfungsi untuk membuat _child_ _widget_ di dalamnya agar dapat di-_scroll_.
    - `crossAxisAlignment` berguna untuk mengatur _alignment_ `children` dari `Column`.

5. Selanjutnya saya isi `children` dengan beberapa komponen yang akan ada di _form_,

    ```
    Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            decoration: InputDecoration(
                hintText: "Item Name",
                labelText: "Item Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                ),
            ),
            onChanged: (String? value) {
                setState(() {
                    _name = value!;
                });
            },
            validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return "Name cannot be empty!";
                }
                return null;
            },
        ),
    ),

    // ... Komponen `Padding` lainnya ...

    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                    if (_formKey.currentState!.validate()) {
                        // ... Kode untuk memunculkan notifikasi ...
                        _formKey.currentState!.reset();
                    }
                },
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
    ),
    ```
    - Kode untuk memunculkan notifikasi dapat dilihat pada bagian [ini](#pembuatan-notifikasi-penambahan-barang)
    - `padding` berguna sebagai pengatur jarak komponen dari sisi dalam.
    - `TextFormField` kolom untuk melakukan _input_ formulir.
    - `onChanged` akan dijalankan setiap ada perubahan isi `TextFormField`.
    - `validator` berguna sebagai validasi isi `TextFormField` dan mengembalikan `String` jika terdapat _error_.
    - `?` menandakan variabel boleh berisi `String` atau `null`.
    - `!` menandakan variabel tersebut dijamin tidak akan berisi `null`.


### Pembuatan Akses ke Halaman Formulir
1. Pada berkas `menu.dart`, khususnya di bagian fungsi `onTap`, saya menambahkan kode berikut,

    ```
    ...

    if (item.name == "Add Item") {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ItemFormPage(),
            ));
    }

    ...
    ```
    > _Widget_ `Navigator` berguna untuk melakukan perpindahan halaman pada aplikasi. 

### Pembuatan Notifikasi Penambahan Barang
1. Berikut kode untuk membuat notifikasi bahwa barang berhasil disimpan,

    ```
    showDialog(
        context: context,
        builder: (context) {
            return AlertDialog(
                title: const Text('Item saved'),
                content: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text('Name: $_name'),
                            Text('Amount: $_amount'),
                            Text('Description: $_description'),
                        ],
                    ),
                ),
                actions: [
                    TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                            Navigator.pop(context);
                            Item currItem =
                                Item(_name, _amount, _description);
                            itemList.add(currItem);
                        },
                    ),
                ],
            );
        },
    );
    ```
    > `showDialog` memunculkan notifikasi seperti _pop up message_ jika penambahan menggunakan formulir berhasil.

### Pembuatan _Drawer_ Aplikasi
1. Pertama, saya membuat `DrawerHeader` sebagai komponen atas _drawer_,

    ```
    class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

        @override
        Widget build(BuildContext context) {
            return Drawer(
                child: ListView(
                    children: [
                        const DrawerHeader(
                            decoration: BoxDecoration(
                            color: Colors.indigo,
                            ),
                            child: Column(
                                children: [
                                    Text(
                                        'My Inventory',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                        ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text(
                                        "Note all of your items here!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                        // bagian routing ke halaman lain
                    ],
                ),
            );
        }
    }
    ```

2. Kedua, saya membuat 'bagian routing ke halaman lain' dengan beberapa komponen `ListTile` sebagai kumpulan akses halaman pada aplikasi,

    ```
    ...

    ListTile(
        leading: const Icon(Icons.home_outlined),
        title: const Text('Home'),
        // Bagian redirection ke MyHomePage
        onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                ));
        },
    ),

    // ... Komponen `ListTile` lainnya ...
    ```


## B. Pertanyaan
#### Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`
Perbedaan kedua _method_ tersebut terletak pada apa yang dilakukan kepada _route_ yang berada pada atas _stack_. `Navigator.push()` akan menambahkan _route_ baru diatas _route_ yang sudah ada pada atas _stack_. Sementara itu, `Navigator.pushReplacement()` menggantikan _route_ yang sudah ada pada atas _stack_ dengan _route_ baru tersebut.

<br>

Metode `Navigator.push()` digunakan jika kita ingin membiarkan pengguna kembali ke layar sebelumnya dengan menekan tombol _back_ di perangkat. Misalnya, ketika kita ingin menunjukkan halaman _detail_ dan memberi pengguna kemampuan untuk kembali ke halaman utama. Sementara itu, metode `Navigator.pushReplacement()` digunakan jika kita ingin menggantikan layar saat ini dengan layar baru dan tidak ingin pengguna dapat kembali ke layar sebelumnya. Misalnya, setelah pengguna melakukan _login_.

#### Macam-Macam _Layout Widget_ pada Flutter
| Nama _Widget_| Konteks Penggunaan|
|:---|:---|
|`Container`| Mengatur konten dalam kotak, menetapkan dekorasi, _margin_, _padding_, dan _constraints_. `Container` digunakan sebagai wadah umum untuk _widget_ lainnya.|
|`Row` dan `Column`| Mengatur _widget_ secara horizontal (`Row`) atau vertikal (`Column`). _Widget_ ini berguna untuk menyusun _widget_ secara berurutan.|
|`ListView`| Menampilkan daftar _widget_ dalam bentuk _list_. _Widget_ ini Mendukung daftar yang panjang atau tak terbatas.|
|`Expanded`| Memperluas (`Expanded`) atau menyesuaikan (`Flexible`) ruang yang tersedia dalam _widget parent_, digunakan dalam `Row` atau `Column`.|
|`Stack` dan `Positioned`| Menumpuk _widget_ di atas satu sama lain sehingga dapat memberikan kontrol penempatan _widget_.  |
|`SizedBox`| Menetapkan dimensi tetap pada _widget_, memberikan jarak atau spasi di antara _widget_.|
|`Card`| Menampilkan konten dalam kartu, cocok untuk menampilkan informasi yang spesifik dan rinci.|
|`GridView`| Menyusun _widget_ dalam bentuk _grid_, mendukung penempatan _widget_ dalam baris dan kolom.|
|`Wrap`| Menyusun _widget_ dalam baris atau kolom, membalikkan baris jika perlu. _Widget_ ini Berguna untuk mengelola ukuran _widget_ yang bervariasi.|

#### Elemen Input pada Formulir
Elemen input yang saya gunakan dalam tugas kali ini adalah `name` sebagai nama barang dengan tipe `String`, `amount` sebagai jumlah barang yang ada dengan tipe `Integer`, dan `description` sebagai deskripsi rinci dari barang dengan tipe `String`. Saya memilih ketiga elemen tersebut karena elemen-elemen tersebut merupakan `field` dasar yang dapat mencakup informasi-informasi pokok dari setiap barang sehingga cukup mudah dan fleksibel dalam pengembangannya. 

#### Penerapan _Clean Architecture_ pada Aplikasi Flutter
_Clean Architecture_ merupakan salah satu pendekatan dalam pengembangan aplikasi dengan melakukan pemisahan komponen dengan kriteria atau tugas-tugas tertentu untuk membuat struktur yang teratur dan mudah baik dalam pengelolaan maupun pengujian. Dalam tugas Flutter kali ini, saya menerapkan _clean architecture_ yang sederhana agar struktur aplikasi dapat terorganisir dengan baik.

<br>

|_File_|Penggunaan|Lokasi|
|:---:|:---:|:---:|
|`left_drawer.dart`, `feature_card.dart`|Berisi _widgets_ untuk mengakses halaman lain dalam aplikasi|`package:bmo_inventory/widgets/`|
|`item_page.dart`, `itemlist_form.dart`, `menu.dart`|_Pages_ dalam aplikasi yang dapat diakses oleh pengguna|`package:bmo_inventory/screens/`|
|`main.dart`|Berisi fungsi untuk menjalankan program keseluruhan|`package:bmo_inventory/`|

## C. Bonus
- [x] Membuat `class` model `Item` untuk meyimpan data _input form_.
- [x] Membuat halaman baru, yaitu `item_page.dart` yang akan menampilkan seluruh daftar barang yang sudah berhasil ditambahkan.
- [x] Membuat tombol baru pada _drawer_ dan _homepage_ yang akan mengarahkan pengguna untuk mengakses halaman Item List.

</details>

<details>
<summary> 
Tugas 8
</summary>

<br>

# Tugas 9 PBP 2023
## A. Implementasi _Checklist_
### _Deployment_ Proyek Tugas Django
(insert gambar)

### Pembuatan Halaman _Login_
- [x] Saya membuat file baru pada folder `screens` dengan nama `login.dart`.
- [x] Saya mengintegrasikan sistem autentikasi terlebih dahulu dengan Django agar halaman _login_ dapat bekerja. _Checklist_ pengintegrasian dapat dilihat di sini.
- [x] Pada bagian `MaterialApp(...)` pada `main.dart`, saya mengubah `home: MyHomePpage()` menjadi `home: LoginPage()` agar ketika pengguna menggunakan aplikasi, pengguna harus mengautentikasi dirinya terlebih dahulu.

### Pengintegrasian Sistem Autentikasi Django
- [x] Saya membuat `django-app` yang bernama `authentication`. _File_ ini digunakan untuk mengatur keperluan autentikasi Flutter-Django.
- [x] Saya menambahkan juga _app_ yang baru saja dibuat ke `INSTALLED_APPS` pada _main project_ `settings.py`.
- [x] Saya mengunduh `django-cors-headers`, menambahkannya pada `INSTALLED_APPS` _main project_ `settings.py`, dan menambahkan `corsheaders.middleware.CorsMiddleware` di `settings.py` yang sama pada bagian `MIDDLEWARE`.
- [x] Saya juga menambahkan beberapa variabel yang dibutuhkan di `settings.py` yang sama.
- [x] Saya membuat metode _view_ pada `authentication/views.py` dan tidak lupa untuk menambahkannya _routing_-nya pada `authentication/urls.py` dan `marpellus_cenep/urls.py`.
- [x] Pada aplikasi Flutter, saya mengunduh beberapa modul yang dibutuhkan untuk pengintegrasian, seperti `provider` dan `pbp_django_auth`.
- [x] Saya memodifikasi _root widget_ untuk menyediakan `CookieRequest` _library_ ke seluruh _child widgets_ menggunakan `Provider`.
- [x] Saya membuat halaman _login_ sebagai autentikasi pengguna aplikasi, rinciannya dapat dilihat di sini.

### Pembuatan Model Kustom
- [x] Untuk membuat model kustom, saya menggunakan struktur data JSON yang sudah pernah dibuat pada aplikasi _web_.
- [x] Contoh dari JSON _data_ yang ada akan disalin pada situs Quicktype.
- [x] Kode yang di-_generate_ oleh Quicktype akan disalin lalu dipindahkan ke `lib/models/card.dart`.

### Pembuatan Halaman yang Berisi Daftar Seluruh _Item_
- [x] Agar dapat melakukan pengambilan data melalui internet, saya mengunduh modul `http` dan menambahkan kode _permission_ pada _file_ `android/app/src/main/AndroidManifest.xml`.
- [x] Saya menambahkan _file_ `list_card.dart` pada `lib/screens` sebagai halaman untuk melihat seluruh daftar produk yang telah ditambahkan.
- [x] Pada _file_ `list_card.dart`, saya menambahkan kode untuk melakukan pengambilan data JSON dan mengubahnya menjadi _object Product_ serta mengembalikannya dalam bentuk _list_ sehingga nantinya dapat diiterasikan.

### Pembuatan Halaman Rincian untuk Seluruh Daftar Produk
- [x] Dalam pembuatannya, saya menambahkan _widget_ `ElevatedButton()` yang dilengkapi dengan fungsi `onPressed: ()` dan `showDialog()` untuk menampilkan atribut-atribut dari produk.
[x] Saya juga menambahkan tombol untuk kembali lagi ke daftar lengkap produk

## B. Pertanyaan
#### Pengambilan Data JSON Tanpa Pembuatan Model
Hal ini tentu sangat mungkin dilakukan dan cukup fleksibel karena kita tidak perlu membuat model terlebih dahulu, namun cukup rentan akan beberapa hal, seperti kesalahan tipe data, kode menjadi kurang terbaca atau sulit dimengerti, dan performanya pun ikut menurun karena menggunakan deserialisasi dinamis yang cukup memakan lebih banyak sumber daya jika dibandingkan denagan adanya model yang sudah didefinisikan terlebih dahulu.

#### Fungsi dari `CookieRequest`
`CookieRequest` merupakan kelas yang digunakan untuk mengelola permintaan yang melibatkan manipulasi atau pengelolaan _cookie_ di level aplikasi. Biasanya `CookieRequest` perlu untuk dibagikan ke semua komponen aplikasi agar menjaga konsisten pengelolaan _cookie_, efisiensi memori, dan keperluan untuk _maintenance_ kode. 

#### Mekanisme Pengambilan Data dari JSON
- Menggunakan _package_ seperti http untuk membuat permintaan HTTP ke server atau API yang menyediakan data JSON.
- Melakukan permintaan `GET` atau `POST` untuk mendapatkan data JSON.
- Mengurai data JSON ke dalam struktur data yang sesuai dengan menggunakan fungsi `json.decode()`.
- Menggunakan model Dart untuk menyimpan data yang diurai dari JSON.
- Menggunakan _widget_ seperti `ListView` atau `GridView` untuk menampilkan data yang telah diurai ke dalam tampilan yang sesuai.
- Menggunakan _widget_ `FutureBuilder` untuk menampilkan data yang diperoleh dari permintaan HTTP secara asinkron.

#### Mekanisme Autentikasi dari _Input_ Data Akun pada Flutter ke Django
- Mengimplementasikan _form_ di Flutter untuk mengambil informasi _login_ seperti _username_ dan _password_ dari pengguna.
- Menggunakan _package_ http untuk membuat permintaan HTTP dari Flutter ke Django.
- Mengirimkan data _login_ yang sudah dimasukkan oleh pengguna ke _endpoint_ autentikasi yang telah di Django.
- Validasi data yang diterima dari permintaan dan mencocokkan dengan data yang ada di sistem autentikasi.
- Jika autentikasi berhasil, akan ada token akses atau sesi yang dikirim kembali ke Flutter sebagai konfirmasi keberhasilan autentikasi
- Jika autentikasi berhasil, tampilkan menu atau halaman yang sesuai kepada pengguna.

#### Macam-Macam _Widget_ yang Digunakan pada Tugas 9

| Nama _Widget_         | Fungsi                                                                                                 |
|---------------------|--------------------------------------------------------------------------------------------------------|
| `Scaffold`          | Memberikan kerangka dasar untuk tata letak halaman termasuk `appBar`, `drawer`, dan `body`.|
| `AppBar`            | Menampilkan judul halaman dan berbagai aksi yang terkait dengan halaman.|
| `Drawer`            | Menyediakan navigasi samping yang dapat diakses oleh pengguna untuk navigasi ke bagian lain aplikasi.|
| `FutureBuilder`     | Mengelola `state` _Future_ dan membangun UI berdasarkan hasil dari `future`.|
| `ListView.builder`  | Menampilkan daftar _item_ yang bisa digulirkan secara dinamis dengan memanfaatkan `builder` untuk efisiensi. |
| `Container`         | _Widget_ pembungkus yang memungkinkan _styling_ seperti `border`, `padding`, dan lainnya.|
| `Text`              | Menampilkan teks dengan gaya tertentu.|
| `Align`             | Menyusun `widget-child` dalam kontainer secara tepat sesuai posisi yang diinginkan.|
| `Padding`           | Menambahkan `padding` di sekeliling `widget-child`.|
| `ElevatedButton`    | Tombol dengan gaya yang lebih menonjol, biasanya digunakan untuk aksi atau interaksi pengguna.|
| `AlertDialog`       | Menampilkan dialog dengan pesan dan aksi tertentu.|
| `TextButton`        | Tombol yang menampilkan teks tanpa latar belakang, biasanya digunakan untuk aksi sederhana.|
| `Column`            | Mengatur anak-anaknya dalam kolom secara vertikal.|
| `SingleChildScrollView` | Memungkinkan konten di dalamnya digulir tanpa membatasi tinggi kontennya.|
| `SnackBar`               | Menampilkan pesan notifikasi yang muncul sementara di bagian bawah layar setelah _login_ berhasil.|
| `showDialog`             | Menampilkan dialog untuk pesan kesalahan saat _login_ gagal.|
| `AlertDialog`            | Menampilkan dialog dengan pesan error jika _login_ gagal.|
| `TextButton`             | Tombol dalam dialog untuk menutup dialog error saat _login_ gagal.|
| `TextEditingController`   | Mengendalikan _input field_ untuk _username_ dan _password_.|
| `Provider`               | Memungkinkan akses ke `CookieRequest` yang digunakan untuk melakukan permintaan HTTP ke server untuk _login_.|

</details>