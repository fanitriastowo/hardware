package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.itsolution.hardware.penjualan.entity.base.BasisEntity;

@Entity
@Table(name = "transaksi_pemesanan")
public class PemesananEntity extends BasisEntity implements Serializable {

   private static final long serialVersionUID = 1L;

   private Integer pemesananId;

   @ManyToOne
   @JoinColumn(name = "produk_id")
   private ProdukEntity produkEntity;

   private String namaPenerima;
   private String phonePenerima;
   private String namaItem;
   private String alamatPengiriman;
   private Integer jumlahItems;
   private Long totalHarga;
   private Boolean transfer;

   @Temporal(TemporalType.DATE)
   private Date tanggalPemesanan;

   @ManyToOne
   @JoinColumn(name = "user_id")
   private UserEntity userEntity;

   private String kabupaten;

   public Integer getPemesananId() {
      return pemesananId;
   }

   public void setPemesananId(Integer pemesananId) {
      this.pemesananId = pemesananId;
   }

   public ProdukEntity getProdukEntity() {
      return produkEntity;
   }

   public void setProdukEntity(ProdukEntity produkEntity) {
      this.produkEntity = produkEntity;
   }

   public String getNamaPenerima() {
      return namaPenerima;
   }

   public void setNamaPenerima(String namaPenerima) {
      this.namaPenerima = namaPenerima;
   }

   public String getPhonePenerima() {
      return phonePenerima;
   }

   public void setPhonePenerima(String phonePenerima) {
      this.phonePenerima = phonePenerima;
   }

   public String getNamaItem() {
      return namaItem;
   }

   public void setNamaItem(String namaItem) {
      this.namaItem = namaItem;
   }

   public String getAlamatPengiriman() {
      return alamatPengiriman;
   }

   public void setAlamatPengiriman(String alamatPengiriman) {
      this.alamatPengiriman = alamatPengiriman;
   }

   public Integer getJumlahItems() {
      return jumlahItems;
   }

   public void setJumlahItems(Integer jumlahItems) {
      this.jumlahItems = jumlahItems;
   }

   public Long getTotalHarga() {
      return totalHarga;
   }

   public void setTotalHarga(Long totalHarga) {
      this.totalHarga = totalHarga;
   }

   public Boolean getTransfer() {
      return transfer;
   }

   public void setTransfer(Boolean transfer) {
      this.transfer = transfer;
   }

   public Date getTanggalPemesanan() {
      return tanggalPemesanan;
   }

   public void setTanggalPemesanan(Date tanggalPemesanan) {
      this.tanggalPemesanan = tanggalPemesanan;
   }

   public UserEntity getUserEntity() {
      return userEntity;
   }

   public void setUserEntity(UserEntity userEntity) {
      this.userEntity = userEntity;
   }

   public String getKabupaten() {
      return kabupaten;
   }

   public void setKabupaten(String kabupaten) {
      this.kabupaten = kabupaten;
   }

}
