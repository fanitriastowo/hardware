package org.itsolution.hardware.penjualan.util;

import java.util.Date;

import javax.annotation.PostConstruct;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.entity.RoleEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.repository.BrandRepository;
import org.itsolution.hardware.penjualan.repository.KategoriRepository;
import org.itsolution.hardware.penjualan.repository.ProdukRepository;
import org.itsolution.hardware.penjualan.repository.RoleRepository;
import org.itsolution.hardware.penjualan.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class InitDB {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private BrandRepository brandRepository;

	@Autowired
	private KategoriRepository kategoriRepository;

	@Autowired
	private ProdukRepository produkRepository;

	@PostConstruct
	public void initialDB() {

		RoleEntity admin = roleRepository.findOneByName("ROLE_ADMIN");
		if (admin != null) {
			return;
		}

		// inisial Role Name
		RoleEntity roleAdmin = new RoleEntity();
		roleAdmin.setName("ROLE_ADMIN");
		roleRepository.save(roleAdmin);

		RoleEntity roleMember = new RoleEntity();
		roleMember.setName("ROLE_MEMBER");
		roleRepository.save(roleMember);
		// =========================================================

		// inisial User
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		UserEntity userAdmin = new UserEntity();
		userAdmin.setUsername("admin@itsolution.com");
		userAdmin.setPassword(encoder.encode("admin"));
		userAdmin.setEnabled(true);
		userAdmin.setJenisKelamin("lakilaki");
		userAdmin.setNama("admin");
		userAdmin.setPhone("085747505359");
		userAdmin.setRole(roleAdmin);
		userAdmin.setTanggalLahir(new Date());
		userRepository.save(userAdmin);

		UserEntity userMember1 = new UserEntity();
		userMember1.setUsername("angga.setyo@gmail.com");
		userMember1.setPassword(encoder.encode("angga"));
		userMember1.setEnabled(true);
		userMember1.setJenisKelamin("lakilaki");
		userMember1.setNama("Angga Setyo");
		userMember1.setPhone("087898745888");
		userMember1.setRole(roleMember);
		userMember1.setTanggalLahir(new Date());
		userRepository.save(userMember1);

		KategoriEntity kategoriRAM = new KategoriEntity();
		kategoriRAM.setNama("RAM");
		kategoriRAM.setDeskripsi("Komputer Anda lemot? Banyak program yang hang atau not responding? "
				+ "Mungkin memory komputer Anda sudah tidak lagi menunjang kebutuhan Anda. "
				+ "Saatnya menambah memory komputer Anda! Temukan berbagai merk dan jenis memory komputer");
		kategoriRepository.save(kategoriRAM);

		KategoriEntity kategoriMonitor = new KategoriEntity();
		kategoriMonitor.setNama("Monitor");
		kategoriMonitor.setDeskripsi("Monitor adalah alat untuk menampilkan tampilan pada komputer Anda. "
				+ "Jenis monitor komputer saat ini ada banyak. Ada yang menggunakan panel TN dan IPS.");
		kategoriRepository.save(kategoriMonitor);

		KategoriEntity kategoriHardisk = new KategoriEntity();
		kategoriHardisk.setNama("Hardisk");
		kategoriHardisk.setDeskripsi(
				"Tempat penyimpanan/storage di komputer berfungsi untuk menyimpan berbagai macam file Anda, "
						+ "seperti file dokumen, musik, video, program, maupun games");
		kategoriRepository.save(kategoriHardisk);

		BrandEntity brandSamsung = new BrandEntity();
		brandSamsung.setNama("Samsung");
		brandSamsung.setDeskripsi("Samsung berkembang menjadi korporasi kelas dunia dengan bisnis yang meliputi "
				+ "teknologi canggih, semikonduktor, konstruksi pencakar langit dan pabrik, petrokimia, "
				+ "busana, obat, keuangan, hotel, dan banyak lagi.");
		brandRepository.save(brandSamsung);

		BrandEntity brandLogitech = new BrandEntity();
		brandLogitech.setNama("Logitech");
		brandLogitech.setDeskripsi("Logitech adalah sebuah perusahaan Swiss yang berfokus pada inovasi dan kualitas, "
				+ "Logitech merancang perangkat pribadi untuk membantu masyarakat menikmati pengalaman "
				+ "lebih baik dalam dunia digital");
		brandRepository.save(brandLogitech);

		ProdukEntity produkHardisk = new ProdukEntity();
		produkHardisk.setId(1);
		produkHardisk.setBrandEntity(brandSamsung);
		produkHardisk.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkHardisk.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkHardisk.setHarga(2000_000L);
		produkHardisk.setJumlahTerbeli(1);
		produkHardisk.setKategoriEntity(kategoriHardisk);
		produkHardisk.setNama("Samsung SSD 850 Evo 250Gb");
		produkHardisk.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkHardisk.setStok(100);
		produkRepository.save(produkHardisk);

		ProdukEntity produkMonitor = new ProdukEntity();
		produkMonitor.setId(2);
		produkMonitor.setBrandEntity(brandSamsung);
		produkMonitor.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkMonitor.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkMonitor.setHarga(2000_000L);
		produkMonitor.setJumlahTerbeli(1);
		produkMonitor.setKategoriEntity(kategoriMonitor);
		produkMonitor.setNama("LED Samsung 22 Inch");
		produkMonitor.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
				+ "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
		produkMonitor.setStok(100);
		produkRepository.save(produkMonitor);
	}
}
