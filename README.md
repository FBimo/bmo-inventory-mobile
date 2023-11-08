<details>
<summary> 
Tugas 7
</summary>

<br>

# Tugas 7 PBP 2023
## A. Implementasi _Checklist_
### Membuat Proyek Program Flutter
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

### Membuat Tiga Tombol Sederhana
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

### Memunculkan `Snackbar`
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
_Stateless widget_ merupakan _widget_ statis yang berarti _widget_ tersebut tidak berubah atau dapat dikatakan tidak akan ada perubahan tampilan pada _ouput_ jika proses pengeluaran _output_ tidak dihentikan dan kode _output_ tidak dimodifikasi. Sementara itu, _stateful widget_ merupakan _widget_ dinamis yang dapat merubah tampilannya sesuai respons dari _events_ yang dipicu baik dari interaksi _user_ maupun adanya variabel atau nilai baru yang didapat.

#### _Widgets_
| No. | Widget | Fungsi |
|:--- |:---:|:---:|
| 1. |`Scaffold`|memberikan tema material yang menjadi dasar dari tampilan|
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

</details>
