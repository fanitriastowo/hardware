package org.itsolution.hardware.penjualan.dto;

public class PemesananDTO {

   private String nama;
   private String phone;
   private String alamat;
   private String kabupaten;
   private Long jumlah;

   public String getNama() {
      return nama;
   }

   public void setNama(String nama) {
      this.nama = nama;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getAlamat() {
      return alamat;
   }

   public void setAlamat(String alamat) {
      this.alamat = alamat;
   }

   public String getKabupaten() {
      return kabupaten;
   }

   public void setKabupaten(String kabupaten) {
      this.kabupaten = kabupaten;
   }

   public Long getJumlah() {
      return jumlah;
   }

   public void setJumlah(Long jumlah) {
      this.jumlah = jumlah;
   }

}
