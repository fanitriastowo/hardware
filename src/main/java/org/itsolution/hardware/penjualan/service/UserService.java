package org.itsolution.hardware.penjualan.service;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.repository.RoleRepository;
import org.itsolution.hardware.penjualan.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	public void save(UserDTO userDTO) {
		if (userDTO != null) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

			Integer tanggal = userDTO.getTanggal();
			Integer bulan = userDTO.getBulan();
			Integer tahun = userDTO.getTahun();

			Calendar tanggalLahir = new GregorianCalendar();
			tanggalLahir.set(tahun, bulan, tanggal);

			UserEntity userEntity = new UserEntity();
			userEntity.setNama(userDTO.getNama());
			userEntity.setUsername(userDTO.getUsername());
			userEntity.setJenisKelamin(userDTO.getJenisKelamin());
			userEntity.setPassword(encoder.encode(userDTO.getPassword()));
			userEntity.setPhone(userDTO.getPhone());
			userEntity.setRole(roleRepository.findOneByName("ROLE_MEMBER"));
			userEntity.setTanggalLahir(tanggalLahir.getTime());
			userEntity.setEnabled(true);
			userRepository.save(userEntity);
		}
	}

	public UserEntity findOneByUsername(String username) {
		return userRepository.findOneByUsername(username);
	}

	public List<UserEntity> findAllMember() {
		RoleEntity roleMember = roleRepository.findOneByName("ROLE_MEMBER");
		return userRepository.findAllByRole(roleMember);
	}
}
