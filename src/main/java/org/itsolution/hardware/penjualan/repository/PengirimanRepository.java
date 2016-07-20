package org.itsolution.hardware.penjualan.repository;

import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PengirimanRepository extends JpaRepository<PengirimanEntity, Integer> {

}
