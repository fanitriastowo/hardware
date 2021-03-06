package org.itsolution.hardware.penjualan.service;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.repository.BrandRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BrandService {

   @Autowired
   private BrandRepository brandRepository;

   @CacheEvict(value = "brandFindAll", allEntries = true)
   public void save(BrandEntity brandEntity) {
      if (brandEntity != null) {
         brandRepository.save(brandEntity);
      }
   }

   @Cacheable("brandFindAll")
   public List<BrandEntity> findAll() {
      return brandRepository.findAll();
   }

   public BrandEntity findOneByNama(String brand) {
      return brandRepository.findOneByNama(brand);
   }

   public BrandEntity findOne(Integer id) {
      return brandRepository.findOne(id);
   }

   @CacheEvict(value = {"brandFindAll", "produkFindAll"}, allEntries = true)
   public void update(BrandEntity brandEntity) {
      if (brandEntity != null) {
         brandRepository.save(brandEntity);
      }
   }

   @CacheEvict(value = {"brandFindAll", "produkFindAll"}, allEntries = true)
   public void delete(Integer id) {
      BrandEntity brandEntity = findOne(id);
      if (brandEntity != null) {
         brandRepository.delete(brandEntity);
      }
   }

}
