package org.itsolution.hardware.penjualan.repository;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdukRepository extends JpaRepository<ProdukEntity, Integer> {

	ProdukEntity findOneByNama(String nama);

	@Query("SELECT p FROM ProdukEntity p WHERE p.nama LIKE %:term%")
	List<ProdukEntity> findAllByNamaLike(@Param("term") String nama);

}
