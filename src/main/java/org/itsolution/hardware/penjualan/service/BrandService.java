package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BrandService {

	@Autowired
	private BrandRepository brandRepository;

	public void save(BrandEntity brandEntity) {
		if (brandEntity != null) {
			brandRepository.save(brandEntity);
		}
	}

	public List<BrandEntity> findAll() {
		return brandRepository.findAll();
	}

	public BrandEntity findOneByNama(String brand) {
		return brandRepository.findOneByNama(brand);
	}

	public BrandEntity findOne(Integer id) {
		return brandRepository.findOne(id);
	}

	public void update(BrandEntity brandEntity) {
		if (brandEntity != null) {
			brandRepository.save(brandEntity);
		}
	}

	public void delete(Integer id) {
		BrandEntity brandEntity = findOne(id);
		if (brandEntity != null) {
			brandRepository.delete(brandEntity);
		}
	}

}
