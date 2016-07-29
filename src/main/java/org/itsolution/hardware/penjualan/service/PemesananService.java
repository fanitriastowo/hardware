package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.repository.PemesananRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PemesananService {

    @Autowired
    private PemesananRepository pemesananRepository;

    @CacheEvict(value = { "pemesananFindAll", "pemesananFindAllOrderByTransfer",
            "pemesananFindOneByPemesananId" }, allEntries = true)
    public void save(PemesananEntity pemesanaanEntity) {
        pemesananRepository.save(pemesanaanEntity);
    }

    @CacheEvict(value = { "pemesananFindAll", "pemesananFindAllOrderByTransfer",
            "pemesananFindOneByPemesananId" }, allEntries = true)
    public void update(PemesananEntity pemesananEntity) {
        pemesananRepository.save(pemesananEntity);
    }

    @CacheEvict(value = { "pemesananFindAll", "pemesananFindAllOrderByTransfer",
            "pemesananFindOneByPemesananId" }, allEntries = true)
    public void delete(PemesananEntity pemesananEntity) {
        pemesananRepository.delete(pemesananEntity);
    }

    public PemesananEntity findOne(Integer id) {
        return pemesananRepository.findOne(id);
    }

    @Cacheable("pemesananFindAll")
    public List<PemesananEntity> findAll() {
        return pemesananRepository.findAll();
    }

    @Cacheable("pemesananFindAllOrderByTransfer")
    public List<PemesananEntity> findAllOrderByTransfer() {
        return pemesananRepository.findAllByOrderByTransferDesc();
    }

    @Cacheable("pemesananFindOneByPemesananId")
    public PemesananEntity findOneBypemesananId(Integer pemesananId) {
        return pemesananRepository.findOneByPemesananId(pemesananId);
    }

    @CacheEvict(value = { "pemesananFindAll", "pemesananFindAllOrderByTransfer",
            "pemesananFindOneByPemesananId" }, allEntries = true)
    public void ubahStatusTransfer(PemesananEntity pemesananEntity) {
        pemesananEntity.setTransfer(true);
        pemesananRepository.save(pemesananEntity);
    }
}
