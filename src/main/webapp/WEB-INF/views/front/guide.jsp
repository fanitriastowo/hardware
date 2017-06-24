<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/template/front/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

   <%@ include file="/WEB-INF/template/front/css.jsp" %>
   <link rel="stylesheet"
         href='<spring:url value="/assets/front/css/bootstrap-vertical-tabs.min.css" />'>
   <title>Guide | Hardware IT Solution</title>

</head>
<body>

<%@ include file="/WEB-INF/template/front/navbar.jsp" %>

<section>
   <div class="container">
      <div class="row">
         <div class="col-xs-3"> <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs tabs-left" id="my_tab">
               <li class="active"><a href="#pembayaran" data-toggle="tab">Pembayaran</a></li>
               <li><a href="#pengiriman" data-toggle="tab">Pengiriman</a></li>
               <li><a href="#cara_belanja" data-toggle="tab">Cara Belanja</a></li>
               <li><a href="#status_pesanan" data-toggle="tab">Status Pesanan</a></li>
               <li><a href="#glorasium" data-toggle="tab">Glorasium</a></li>
               <li><a href="#tentang_kami" data-toggle="tab">Tentang Kami</a></li>
               <li><a href="#faq" data-toggle="tab">FAQ</a></li>
            </ul>
         </div>

         <div class="col-xs-9">
            <!-- Tab panes -->
            <div class="tab-content">
               <div class="tab-pane active" id="pembayaran">
                  <h3>Pembayaran</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p><strong>Q: Bagaimana cara melakukan pembayaran dengan Transfer ke Rekening
                        BRI?</strong></p>
                     <p><strong>A:</strong></p>
                     <ol>
                        <li>Setelah proses pemesanan, Lakukan transfer ke Rekening BRI 93884-499393
                           Cabang Cilacap.
                        </li>
                        <li>Klik link yang ada di akun email Anda.</li>
                        <li>Email tersebut akan mengubah status pesanan Anda dan pengiriman akan
                           segera dilakukan.
                        </li>
                     </ol>
                  </div>
               </div>
               <div class="tab-pane" id="pengiriman">
                  <h3>Pengiriman</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p><strong>Metode Pengiriman</strong></p>
                     <ul>
                        <li>Pengiriman barang melalui jasa logistik partner <strong>JNE</strong>
                        </li>
                     </ul>

                     <p><strong>Biaya Pengiriman</strong></p>
                     <p>
                        Biaya pengiriman ditentukan berdasarkan berat produk dan lokasi pengiriman.
                        Secara otomatis, sistem kami akan menghitung biaya pengiriman dan estimasi
                        tanggal produk
                        diterima sesuai dengan jasa logistik yang Anda pilih di laman proses
                        PENGIRIMAN dan PEMBAYARAN.
                     </p>

                     <p><strong>Dangerous Goods (DG)</strong></p>
                     <p>
                        Dangerous Goods (DG) adalah produk yang dikategorikan berbahaya jika dikirim
                        melalui jalur udara,
                        sehingga membutuhkan penanganan khusus dalam proses pengiriman. Produk ini
                        memiliki ketentuan
                        Free Shipping yang berbeda dengan produk lainnya.
                     </p>
                     <p>Berikut adalah klasifikasi produk yang termasuk dalam kategori Dangerous
                        Goods (DG):</p>
                     <ul>
                        <li>Produk yang mudah meledak</li>
                        <li>Produk yang mengandung gas</li>
                        <li>Produk yang mengandung cairan</li>
                        <li>Benda padat yang mudah terbakar</li>
                        <li>Produk yang dapat menyulut kebakaran</li>
                        <li>Produk yang bersubstansi racun</li>
                        <li>Produk yang mengandung radioaktif</li>
                        <li>Produk yang menyebabkan korosi</li>
                        <li>Substansi lainnya yang berbahaya apabila dikirim melalui jalur udara
                        </li>
                     </ul>
                  </div>
               </div>
               <div class="tab-pane" id="cara_belanja">
                  <div role="tabpanel">
                     <!-- Nav tabs -->
                     <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                           <a href="#cara-belanja" aria-controls="cara-belanja" role="tab"
                              data-toggle="tab">
                              <img src='<spring:url value="/assets/front/images/ic_cara_belanja.png" />'>
                              <h3>Cara Belanja</h3>
                           </a>
                        </li>
                        <li role="presentation">
                           <a href="#cara-pembayaran" aria-controls="pembayaran" role="tab"
                              data-toggle="tab">
                              <img src='<spring:url value="/assets/front/images/ic_pembayaran.png" />'>
                              <h3>Pembayaran</h3>
                           </a>
                        </li>
                        <li role="presentation">
                           <a href="#terima-produk" aria-controls="terima-produk" role="tab"
                              data-toggle="tab">
                              <img src='<spring:url value="/assets/front/images/ic_terima_produk.png" />'>
                              <h3>Terima Produk</h3>
                           </a>
                        </li>
                     </ul>

                     <!-- Tab panes -->
                     <div class="tab-content">
                        <div role="tabpanel" class="tab-pane fade in active" id="cara-belanja">
                           <br>
                           <p style="font-size: 12px">
                              Mencari produk original favorit menjadi lebih mudah dengan hadirnya
                              beragam fitur seperti melalui fitur Pencarian dan pilihan Kategori.
                              Klik produk untuk masuk ke halaman produk detil. Klik tombol <strong>"Masukan
                              Ke Keranjang"</strong> lalu klik <strong>"Checkout"</strong> jika Anda
                              ingin menyelesaikan transaksi. Atau pilih produk lain jika Anda masih
                              ingin berbelanja.
                           </p>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="cara-pembayaran">
                           <br>
                           <p style="font-size: 12px">Beberapa metode pembayaran yang dapat Anda
                              gunakan, seperti:</p>
                           <div class="thumbnail">
                              <img src='<spring:url value="/assets/front/images/bri.jpg" />'
                                   alt="BRI">
                           </div>
                           <p style="font-size: 12px">
                              Kami menjamin dan melindungi segala informasi transaksi yang bersifat
                              pribadi dan rahasia.
                              Pastikan alamat pengiriman telah terisi dengan benar. Masuk ke profile
                              Anda, pilih <strong>"Setting"</strong> untuk mengubah informasi alamat
                              pengiriman.
                           </p>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="terima-produk">
                           <br>
                           <p style="font-size: 12px">
                              Nikmati mudahnya berbelanja online yang bebas resiko dengan proses
                              pengemasan yang baik serta gratis ongkos kirim ke seluruh Indonesia.
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="tab-pane" id="status_pesanan">
                  <h3>Status Pesanan</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p>
                        Anda juga akan menerima Email Konfirmasi Pesanan Dalam Proses Pengiriman
                        Logistik. Nomor resi bisa Anda temukan pada bagian <strong>DETAIL
                        PEMESANAN</strong>.
                     </p>
                  </div>
               </div>
               <div class="tab-pane" id="glorasium">
                  <h3>Glorasium</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p><strong>Aktivasi dan Belanja Sekarang</strong></p>
                     <p>Tombol yang terdapat pada email aktivasi untuk melanjutkan proses menjadi
                        <em>member</em>.</p>

                     <p><strong>Keranjang</strong></p>
                     <p>Keranjang belanja untuk menampung produk yang sudah dipilih oleh customer.
                        Terletak di atas website.</p>

                     <p><strong>Nomor Pesanan</strong></p>
                     <p>Nomor yang diperoleh customer setelah melakukan pemesanan. Nomor ini akan
                        berguna untuk mengetahui pengiriman produk dari jasa logistik.</p>

                     <p><strong>Nomor Resi</strong></p>
                     <p>Nomor yang dikeluarkan oleh jasa pengiriman untuk melacak produk yang sudah
                        Anda pesan.</p>

                  </div>
               </div>
               <div class="tab-pane" id="tentang_kami">
                  <h3>Tentang Kami</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p>
                        <a href='<spring:url value="/" />'>hardware.itsolution.com</a>, adalah Toko
                        Online Terlengkap &amp;
                        Terpercaya Dengan Beragam Produk Pilihan Serta Promo Menarik
                     </p>
                     <p>
                        Sebagai salah satu pelopor online mall di Indonesia, <a
                             href='<spring:url value="/" />'>hardware.itsolution.com</a>
                        hadir dengan beragam produk pilihan yang disertai promo istimewa &amp;
                        menarik setiap hari.
                     </p>
                  </div>
               </div>
               <div class="tab-pane" id="faq">
                  <h3>FAQ</h3>
                  <hr>
                  <div style="font-size: 12px">
                     <p><strong>Apakah Anda butuh bantuan?</strong></p>
                     <p>24/7 Customer Care siap membantu Anda selama 24 jam dari hari Senin sampai
                        Minggu</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</section>

<%@ include file="/WEB-INF/template/front/footer.jsp" %>
<%@ include file="/WEB-INF/template/front/js.jsp" %>

<script type="text/javascript">
   $(document).ready(function () {
      $('#guide').addClass('active');
   });
</script>
</body>
</html>