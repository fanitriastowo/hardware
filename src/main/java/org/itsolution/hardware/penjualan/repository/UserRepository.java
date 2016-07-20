package org.itsolution.hardware.penjualan.repository;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Integer> {

	UserEntity findOneByUsername(String username);

	List<UserEntity> findAllByRole(RoleEntity roleMember);

}
