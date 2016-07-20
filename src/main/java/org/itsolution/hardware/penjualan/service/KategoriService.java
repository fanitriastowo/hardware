package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.itsolution.hardware.penjualan.repository.KategoriRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class KategoriService {

	@Autowired
	private KategoriRepository kategoriRepository;

	public void save(KategoriEntity kategori) {
		if (kategori != null) {
			kategoriRepository.save(kategori);
		}
	}

	public List<KategoriEntity> findAll() {
		return kategoriRepository.findAll();
	}

	public KategoriEntity findOneByNama(String kategori) {
		return kategoriRepository.findOneByNama(kategori);
	}

	public KategoriEntity findOne(int id) {
		return kategoriRepository.findOne(id);
	}

	public void update(KategoriEntity kategoriEntity) {
		if (kategoriEntity != null) {
			kategoriRepository.save(kategoriEntity);
		}
	}

	public void delete(Integer id) {
		kategoriRepository.delete(id);
	}

}
