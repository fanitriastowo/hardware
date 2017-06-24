package org.itsolution.hardware.penjualan.service;

import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.itsolution.hardware.penjualan.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RoleService {

   @Autowired
   private RoleRepository roleRepository;

   public void save(RoleEntity roleAdmin) {
      roleRepository.save(roleAdmin);
   }
}
