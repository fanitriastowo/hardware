package org.itsolution.hardware.penjualan.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "master_brand")
public class BrandEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue
	private Integer id;

	private String nama;

	@Lob
	@Column(length = Integer.MAX_VALUE)
	private String deskripsi;

	@OneToMany(mappedBy = "brandEntity", cascade = CascadeType.REMOVE)
	private List<ProdukEntity> produkEntities;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNama() {
		return nama;
	}

	public void setNama(String nama) {
		this.nama = nama;
	}

	public String getDeskripsi() {
		return deskripsi;
	}

	public void setDeskripsi(String deskripsi) {
		this.deskripsi = deskripsi;
	}
}
