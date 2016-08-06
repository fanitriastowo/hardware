package org.itsolution.hardware.penjualan.repository;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface PengirimanRepository extends JpaRepository<PengirimanEntity, Integer> {

	@Query("SELECT COUNT(P.kabupaten) AS jumlah, P.kabupaten AS kabupaten FROM PengirimanEntity P GROUP BY P.kabupaten")
	List<Object[]> findAllForPieChart();
}
