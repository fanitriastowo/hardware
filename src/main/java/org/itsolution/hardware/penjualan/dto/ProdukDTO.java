package org.itsolution.hardware.penjualan.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProdukDTO {

   private String nama;

   private String kategori;

   private String brand;

   private Long harga;

   private String detailProduk;

   private String deskripsi;

   private Integer stok;

   private String spesifikasi;

   private MultipartFile filename;

   public String getNama() {
      return nama;
   }

   public void setNama(String nama) {
      this.nama = nama;
   }

   public String getKategori() {
      return kategori;
   }

   public void setKategori(String kategori) {
      this.kategori = kategori;
   }

   public String getBrand() {
      return brand;
   }

   public void setBrand(String brand) {
      this.brand = brand;
   }

   public Long getHarga() {
      return harga;
   }

   public void setHarga(Long harga) {
      this.harga = harga;
   }

   public String getDetailProduk() {
      return detailProduk;
   }

   public void setDetailProduk(String detailProduk) {
      this.detailProduk = detailProduk;
   }

   public String getDeskripsi() {
      return deskripsi;
   }

   public void setDeskripsi(String deskripsi) {
      this.deskripsi = deskripsi;
   }

   public Integer getStok() {
      return stok;
   }

   public void setStok(Integer stok) {
      this.stok = stok;
   }

   public String getSpesifikasi() {
      return spesifikasi;
   }

   public void setSpesifikasi(String spesifikasi) {
      this.spesifikasi = spesifikasi;
   }

   public MultipartFile getFilename() {
      return filename;
   }

   public void setFilename(MultipartFile filename) {
      this.filename = filename;
   }

}
