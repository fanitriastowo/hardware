The OpenShift `jbossews` cartridge documentation can be found at:

http://openshift.github.io/documentation/oo_cartridge_guide.html#tomcat

#APLIKASI PENJUALAN HARDWARE KOMPUTER

### Deskripsi
Aplikasi yang digunakan untuk menejemen barang hardware komputer dan pemesanan.

### Teknologi
* JDK 1.7 Keatas
* Spring WEB MVC 3.2.16.RELEASE
* Spring Security 3.2.9.RELEASE
* Spring Data JPA 1.5.3.RELEASE
* Hibernate Entity Manager 4.3.4.Final
* Hibernate Validator 4.3.2.Final
* Servlet 3.1
* Apache Maven 3.9
* Jetty Maven Plugin 9.3.7.v20160115
* Jaspersoft Studio 6.2.0
* Slf4j 1.7.13
* Jackson 2.6.4

### How To Run
1. Install JDK 1.7 keatas dan Apache Maven 3
2. lewat command line, masuk ke root project, ketikan `mvn jetty:run` (PostgreSQL)
3. lewat command line, masuk ke root project, ketikan `mvn jetty:run -P dev -Dspring.profiles.active="dev"` (HSQL)
4. Tunggu download selesai (download diperlukan hanya 1 kali)
5. buka browser, masukan URL `localhost:8080/hardware.itsolution`

### TODO
* ~~Download gambar untuk produk ukuran : 370 x 250 (Front)~~
* ~~Search produk di navbar (Front)~~
* ~~Hapus produk di dalam keranjang dan Edit jumlah pesanan (Front)~~
* ~~Isi Content Halaman Bantuan (Front)~~
* Isi Content Halaman Hubungi Kami (Front)
* Halaman Setting Member (Front)
* ~~Setelah Checkout keranjang, stok berkurang dan jumlah terbeli bertambah (Front)~~
* Konfirmasi Email aktivasi akun setelah registrasi (Front)
* Konfirmasi Email transfer setelah checkout (Front)
* Paging halaman beranda (Front)
* JQuery Validation (Front)
* Menampilkan Produk per-kategori dan per-brand (Front)
* Pesanan Per alamat pengirim (Administrator)
* Isi Content Halaman Summary (Administrator)
* Report Daftar Pengiriman (Administrator)
* Edit dan Hapus daftar Produk (Administrator)
* ~Edit dan Hapus daftar Kategori (Administrator)~
* ~Edit dan Hapus daftar Brands (Administrator)~
* ~~Daftar Member CRUD (Administrator)~~
* Halaman Setting (Administrator)
* ~~Integerasi Google analytics (Administrator)~~
* Konfirmasi email pengiriman (Administrator)
* report grafik pie pemesanan (Administrator)
* Jquery Validation (Administrator)
