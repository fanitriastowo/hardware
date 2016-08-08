package org.itsolution.hardware.penjualan.repository;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PemesananRepository extends JpaRepository<PemesananEntity, Integer> {

	List<PemesananEntity> findAllByOrderByTransferDesc();

	PemesananEntity findOneByPemesananId(Integer pemesananId);

	@Query("SELECT COUNT(P.kabupaten) AS jumlah, P.kabupaten AS kabupaten FROM PemesananEntity P GROUP BY P.kabupaten")
	List<Object[]> findAllForPieChart();

	List<PemesananEntity> findAllByUserEntity(UserEntity userEntity);

}
