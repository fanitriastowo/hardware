package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.dto.PengirimanDTO;
import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.repository.PengirimanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PengirimanService {

	@Autowired
	private PemesananService pemesananService;

	@Autowired
	private PengirimanRepository pengirimanRepository;

	@Autowired
	private UserService userService;

	@CacheEvict(value = "pengirimanFindAll", allEntries = true)
	public PengirimanEntity save(PengirimanDTO dto) {

		PemesananEntity pemesananEntity = pemesananService.findOneBypemesananId(dto.getPemesananId());
		UserEntity userEntity = userService.findOneByUsername(dto.getEmail());

		PengirimanEntity entity = new PengirimanEntity();
		entity.setAlamatPengiriman(dto.getAlamatPengiriman());
		entity.setJneId(dto.getJneId());
		entity.setPemesananEntity(pemesananEntity);
		entity.setStatusPengiriman(dto.getStatusPengiriman());
		entity.setTanggalPengiriman(dto.getTanggalPengiriman());
		entity.setUserEntity(userEntity);
		pengirimanRepository.save(entity);
		return entity;
	}

	@Cacheable("pengirimanFindAll")
	public List<PengirimanEntity> findAll() {
		return pengirimanRepository.findAll();
	}
}
