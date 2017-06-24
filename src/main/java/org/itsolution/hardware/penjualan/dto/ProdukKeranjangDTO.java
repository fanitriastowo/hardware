package org.itsolution.hardware.penjualan.dto;

import java.io.Serializable;

public class ProdukKeranjangDTO implements Serializable {

   private static final long serialVersionUID = 1L;

   private String nama;

   private Long harga;

   private Integer jumlahBarang;

   private Long totalHarga;

   public String getNama() {
      return nama;
   }

   public void setNama(String nama) {
      this.nama = nama;
   }

   public Long getHarga() {
      return harga;
   }

   public void setHarga(Long harga) {
      this.harga = harga;
   }

   public Integer getJumlahBarang() {
      return jumlahBarang;
   }

   public void setJumlahBarang(Integer jumlahBarang) {
      this.jumlahBarang = jumlahBarang;
   }

   public Long getTotalHarga() {
      return totalHarga;
   }

   public void setTotalHarga(Long totalHarga) {
      this.totalHarga = totalHarga;
   }

}
