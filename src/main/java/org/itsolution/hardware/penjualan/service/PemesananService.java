package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.repository.PemesananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PemesananService {

	@Autowired
	private PemesananRepository pemesananRepository;

	public void save(PemesananEntity pemesanaanEntity) {
		pemesananRepository.save(pemesanaanEntity);
	}

	public void update(PemesananEntity pemesananEntity) {
		pemesananRepository.save(pemesananEntity);
	}

	public void delete(PemesananEntity pemesananEntity) {
		pemesananRepository.delete(pemesananEntity);
	}
	
	public PemesananEntity findOne(Integer id) {
		return pemesananRepository.findOne(id);
	}

	public List<PemesananEntity> findAll() {
		return pemesananRepository.findAll();
	}

	public List<PemesananEntity> findAllOrderByTransfer() {
		return pemesananRepository.findAllByOrderByTransferDesc();
	}

	public PemesananEntity findOneBypemesananId(Integer pemesananId) {
		return pemesananRepository.findOneByPemesananId(pemesananId);
	}
}
