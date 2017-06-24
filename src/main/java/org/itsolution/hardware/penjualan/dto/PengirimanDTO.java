package org.itsolution.hardware.penjualan.dto;

import java.util.Date;

public class PengirimanDTO {

   private Integer pemesananId;
   private String email;
   private String jneId;
   private String alamatPengiriman;
   private Date tanggalPengiriman;
   private String statusPengiriman;
   private String kabupaten;
   private Long jumlah;

   public Integer getPemesananId() {
      return pemesananId;
   }

   public void setPemesananId(Integer pemesananId) {
      this.pemesananId = pemesananId;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getJneId() {
      return jneId;
   }

   public void setJneId(String jneId) {
      this.jneId = jneId;
   }

   public String getAlamatPengiriman() {
      return alamatPengiriman;
   }

   public void setAlamatPengiriman(String alamatPengiriman) {
      this.alamatPengiriman = alamatPengiriman;
   }

   public Date getTanggalPengiriman() {
      return tanggalPengiriman;
   }

   public void setTanggalPengiriman(Date tanggalPengiriman) {
      this.tanggalPengiriman = tanggalPengiriman;
   }

   public String getStatusPengiriman() {
      return statusPengiriman;
   }

   public void setStatusPengiriman(String statusPengiriman) {
      this.statusPengiriman = statusPengiriman;
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
