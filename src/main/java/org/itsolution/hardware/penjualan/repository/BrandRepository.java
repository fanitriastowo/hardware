package org.itsolution.hardware.penjualan.repository;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BrandRepository extends JpaRepository<BrandEntity, Integer> {

	BrandEntity findOneByNama(String brand);

}
