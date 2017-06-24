package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.itsolution.hardware.penjualan.entity.base.BasisEntity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name = "master_produk")
@JsonIgnoreProperties(value = {"kategoriEntity", "brandEntity", "pemesananEntities"})
public class ProdukEntity extends BasisEntity implements Serializable {

  private static final long serialVersionUID = 1L;

	private String nama;

	private Long harga;

	@Lob
	@Column(length = Integer.MAX_VALUE, name = "detail_produk")
	private String detailProduk;

	@Column(name = "jumlah_terbeli", columnDefinition="int default 0")
	private Integer jumlahTerbeli = 0;

	@Lob
	@Column(length = Integer.MAX_VALUE)
	private String deskripsi;

	private String image;

	private Integer stok;

	@Lob
	@Column(length = Integer.MAX_VALUE)
	private String spesifikasi;

	@ManyToOne
	@JoinColumn(name = "kategori_id")
	private KategoriEntity kategoriEntity;

	@ManyToOne
	@JoinColumn(name = "brand_id")
	private BrandEntity brandEntity;

	@OneToMany(mappedBy = "produkEntity")
	private List<PemesananEntity> pemesananEntities;

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

	public String getDetailProduk() {
		return detailProduk;
	}

	public void setDetailProduk(String detailProduk) {
		this.detailProduk = detailProduk;
	}

	public Integer getJumlahTerbeli() {
		return jumlahTerbeli;
	}

	public void setJumlahTerbeli(Integer jumlahTerbeli) {
		this.jumlahTerbeli = jumlahTerbeli;
	}

	public String getDeskripsi() {
		return deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public KategoriEntity getKategoriEntity() {
		return kategoriEntity;
	}

	public void setKategoriEntity(KategoriEntity kategoriEntity) {
		this.kategoriEntity = kategoriEntity;
	}

	public BrandEntity getBrandEntity() {
		return brandEntity;
	}

	public void setBrandEntity(BrandEntity brandEntity) {
		this.brandEntity = brandEntity;
	}

	public List<PemesananEntity> getPemesananEntities() {
		return pemesananEntities;
	}

	public void setPemesananEntities(List<PemesananEntity> pemesananEntities) {
		this.pemesananEntities = pemesananEntities;
	}

}
