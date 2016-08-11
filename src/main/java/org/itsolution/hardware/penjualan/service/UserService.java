package org.itsolution.hardware.penjualan.service;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.entity.VerificationToken;
import org.itsolution.hardware.penjualan.repository.RoleRepository;
import org.itsolution.hardware.penjualan.repository.UserRepository;
import org.itsolution.hardware.penjualan.repository.VerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
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
    
    @Autowired
    private VerificationTokenRepository verificationTokenRepository;

    @CacheEvict(value = "memberFindAll", allEntries = true)
    public void save(UserDTO userDTO) {
        if (userDTO != null) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

            Integer tanggal = userDTO.getTanggal();
            Integer bulan = userDTO.getBulan();
            Integer tahun = userDTO.getTahun();

            Calendar tanggalLahir = new GregorianCalendar();
            tanggalLahir.set(tahun, bulan - 1, tanggal);

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
    
    @CacheEvict(value = "memberFindAll", allEntries = true)
    public UserEntity registerNewUser(UserDTO userDTO) {
        if (userDTO != null) {
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

            Integer tanggal = userDTO.getTanggal();
            Integer bulan = userDTO.getBulan();
            Integer tahun = userDTO.getTahun();

            Calendar tanggalLahir = new GregorianCalendar();
            tanggalLahir.set(tahun, bulan - 1, tanggal);

            UserEntity userEntity = new UserEntity();
            userEntity.setNama(userDTO.getNama());
            userEntity.setUsername(userDTO.getUsername());
            userEntity.setJenisKelamin(userDTO.getJenisKelamin());
            userEntity.setPassword(encoder.encode(userDTO.getPassword()));
            userEntity.setPhone(userDTO.getPhone());
            userEntity.setRole(roleRepository.findOneByName("ROLE_MEMBER"));
            userEntity.setTanggalLahir(tanggalLahir.getTime());
            userEntity.setEnabled(false);
            return userRepository.save(userEntity);
        }
        return null;
    }

    public UserEntity findOneByUsername(String username) {
        return userRepository.findOneByUsername(username);
    }

    @Cacheable("memberFindAll")
    public List<UserEntity> findAllMember() {
        RoleEntity roleMember = roleRepository.findOneByName("ROLE_MEMBER");
        return userRepository.findAllByRole(roleMember);
    }

    public UserDTO findOne(int id) {
        UserEntity entity = userRepository.findOne(id);
        
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(entity.getTanggalLahir());
        
        UserDTO dto = new UserDTO();
        dto.setId(entity.getId());
        dto.setTanggal(calendar.get(Calendar.DATE));
        dto.setBulan(calendar.get(Calendar.MONTH) + 1);
        dto.setTahun(calendar.get(Calendar.YEAR));
        dto.setJenisKelamin(entity.getJenisKelamin());
        dto.setNama(entity.getNama());
        dto.setPhone(entity.getPhone());
        dto.setUsername(entity.getUsername());
        
        return dto;
    }

    @CacheEvict(value = "memberFindAll", allEntries = true)
    public void delete(Integer id) {
        userRepository.delete(id);
    }

    @CacheEvict(value = "memberFindAll", allEntries = true)
    public void update(UserDTO userDTO) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        Integer tanggal = userDTO.getTanggal();
        Integer bulan = userDTO.getBulan();
        Integer tahun = userDTO.getTahun();

        Calendar tanggalLahir = new GregorianCalendar();
        tanggalLahir.set(tahun, bulan - 1, tanggal);

        UserEntity userEntity = new UserEntity();
        userEntity.setId(userDTO.getId());
        userEntity.setNama(userDTO.getNama());
        userEntity.setUsername(userDTO.getUsername());
        userEntity.setJenisKelamin(userDTO.getJenisKelamin());
        userEntity.setPassword(encoder.encode(userDTO.getPassword()));
        userEntity.setPhone(userDTO.getPhone());
        userEntity.setTanggalLahir(tanggalLahir.getTime());
        userEntity.setRole(roleRepository.findOneByName("ROLE_MEMBER"));
        userEntity.setEnabled(true);
        userRepository.save(userEntity);
    }

    public void saveVerificationToken(UserEntity userEntity, String token) {
        final VerificationToken verificationToken = new VerificationToken(token, userEntity);
        verificationTokenRepository.save(verificationToken);
    }

    public String validateVerificationToken(String token) {
        final VerificationToken verifiedToken = verificationTokenRepository.findByToken(token);
        
        final UserEntity userEntity = verifiedToken.getUserEntity();
        userEntity.setEnabled(true);
        userRepository.save(userEntity);
        
        verificationTokenRepository.delete(verifiedToken);
        return null;
    }

    public void ubahProfileMember(UserDTO userDTO) {

        Integer tanggal = userDTO.getTanggal();
        Integer bulan = userDTO.getBulan();
        Integer tahun = userDTO.getTahun();

        Calendar tanggalLahir = new GregorianCalendar();
        tanggalLahir.set(tahun, bulan - 1, tanggal);

        UserEntity userEntity = userRepository.findOne(userDTO.getId());
        userEntity.setNama(userDTO.getNama());
        userEntity.setPhone(userDTO.getPhone());
        userEntity.setTanggalLahir(tanggalLahir.getTime());
        userRepository.save(userEntity);
    }
}
