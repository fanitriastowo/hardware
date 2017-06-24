package org.itsolution.hardware.penjualan.repository;

import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {

   RoleEntity findOneByName(String string);

}
