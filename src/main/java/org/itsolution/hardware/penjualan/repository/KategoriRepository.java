package org.itsolution.hardware.penjualan.repository;

import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KategoriRepository extends JpaRepository<KategoriEntity, Integer> {

   KategoriEntity findOneByNama(String kategori);

}
