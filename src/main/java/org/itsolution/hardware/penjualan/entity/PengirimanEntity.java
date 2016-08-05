package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "transaksi_pengiriman")
public class PengirimanEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserEntity userEntity;

	private String jneId;

	private String alamatPengiriman;

	@Temporal(TemporalType.DATE)
	private Date tanggalPengiriman;

	private String statusPengiriman;

	@OneToOne
	@JoinColumn(name = "pemesanan_id")
	private PemesananEntity pemesananEntity;

	private String kabupaten;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
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

	public PemesananEntity getPemesananEntity() {
		return pemesananEntity;
	}

	public void setPemesananEntity(PemesananEntity pemesananEntity) {
		this.pemesananEntity = pemesananEntity;
	}

	public String getKabupaten() {
		return kabupaten;
	}

	public void setKabupaten(String kabupaten) {
		this.kabupaten = kabupaten;
	}

}
