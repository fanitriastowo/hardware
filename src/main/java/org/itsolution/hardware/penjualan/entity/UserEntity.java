package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.itsolution.hardware.penjualan.entity.base.BasisEntity;

@Entity
@Table(name = "master_user")
public class UserEntity extends BasisEntity implements Serializable {

   private static final long serialVersionUID = 1L;

   private String username;
   private String password;
   private Boolean enabled;
   private String nama;
   private String phone;
   @Temporal(TemporalType.DATE)
   private Date tanggalLahir;
   private String jenisKelamin;
   @ManyToOne
   @JoinColumn(name = "role_id")
   private RoleEntity role;

   @OneToMany(mappedBy = "userEntity", cascade = CascadeType.REMOVE)
   private List<PemesananEntity> pemesananEntities;

   @OneToMany(mappedBy = "userEntity", cascade = CascadeType.REMOVE)
   private List<PengirimanEntity> pengirimanEntities;

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public Boolean getEnabled() {
      return enabled;
   }

   public void setEnabled(Boolean enabled) {
      this.enabled = enabled;
   }

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

   public Date getTanggalLahir() {
      return tanggalLahir;
   }

   public void setTanggalLahir(Date tanggalLahir) {
      this.tanggalLahir = tanggalLahir;
   }

   public String getJenisKelamin() {
      return jenisKelamin;
   }

   public void setJenisKelamin(String jenisKelamin) {
      this.jenisKelamin = jenisKelamin;
   }

   public RoleEntity getRole() {
      return role;
   }

   public void setRole(RoleEntity role) {
      this.role = role;
   }

   public List<PemesananEntity> getPemesananEntities() {
      return pemesananEntities;
   }

   public void setPemesananEntities(List<PemesananEntity> pemesananEntities) {
      this.pemesananEntities = pemesananEntities;
   }

   public List<PengirimanEntity> getPengirimanEntities() {
      return pengirimanEntities;
   }

   public void setPengirimanEntities(List<PengirimanEntity> pengirimanEntities) {
      this.pengirimanEntities = pengirimanEntities;
   }

}
