package org.itsolution.hardware.penjualan.repository;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PemesananRepository extends JpaRepository<PemesananEntity, Integer> {

	List<PemesananEntity> findAllByOrderByTransferDesc();

	PemesananEntity findOneByPemesananId(Integer pemesananId);

}
