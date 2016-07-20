package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.repository.ProdukRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProdukService {
	
	@Autowired
	private ProdukRepository produkRepository;

	public void save(ProdukEntity produkEntity) {
		produkRepository.save(produkEntity);
	}

	public List<ProdukEntity> findAll() {
		return produkRepository.findAll();
	}

	public ProdukEntity findOne(Integer id) {
		return produkRepository.findOne(id);
	}

	public ProdukEntity findOneByNama(String nama) {
		return produkRepository.findOneByNama(nama);
	}

	public List<ProdukEntity> findAllByNamaLike(String nama) {
		return produkRepository.findAllByNamaLike(nama);
	}

	public void update(ProdukEntity produkEntity) {
		produkRepository.save(produkEntity);
	}
	
	public void delete(Integer id) {
		ProdukEntity one = produkRepository.findOne(id);
		produkRepository.delete(one);
	}
}
