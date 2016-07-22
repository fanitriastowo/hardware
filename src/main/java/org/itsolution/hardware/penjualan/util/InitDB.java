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
        
        UserEntity userMember2 = new UserEntity();
        userMember2.setUsername("fani.triastowo@gmail.com");
        userMember2.setPassword(encoder.encode("fani"));
        userMember2.setEnabled(true);
        userMember2.setJenisKelamin("lakilaki");
        userMember2.setNama("Fani Triastowo");
        userMember2.setPhone("087898745888");
        userMember2.setRole(roleMember);
        userMember2.setTanggalLahir(new Date());
        userRepository.save(userMember2);

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

        KategoriEntity kategoriAMDMotherboard = new KategoriEntity();
        kategoriAMDMotherboard.setNama("AMD Motherboard");
        kategoriAMDMotherboard.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        kategoriRepository.save(kategoriAMDMotherboard);

        KategoriEntity kategoriAMDProcessor = new KategoriEntity();
        kategoriAMDProcessor.setNama("AMD Processor");
        kategoriAMDProcessor.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        kategoriRepository.save(kategoriAMDProcessor);

        KategoriEntity kategoriFlashdisk = new KategoriEntity();
        kategoriFlashdisk.setNama("Flashdisk");
        kategoriFlashdisk.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        kategoriRepository.save(kategoriFlashdisk);

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

        BrandEntity brandVisipro = new BrandEntity();
        brandVisipro.setNama("Visipro");
        brandVisipro.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        brandRepository.save(brandVisipro);

        BrandEntity brandAMD = new BrandEntity();
        brandAMD.setNama("AMD");
        brandAMD.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        brandRepository.save(brandAMD);

        BrandEntity brandSanDisk = new BrandEntity();
        brandSanDisk.setNama("SanDisk");
        brandSanDisk.setDeskripsi(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        brandRepository.save(brandSanDisk);

        ProdukEntity produkMonitor1 = new ProdukEntity();
        produkMonitor1.setBrandEntity(brandSamsung);
        produkMonitor1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor1.setHarga(1500_000L);
        produkMonitor1.setKategoriEntity(kategoriMonitor);
        produkMonitor1.setNama("Monitor Samsung 20'");
        produkMonitor1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor1.setStok(30);
        produkMonitor1.setImage("produk-952521Monitor.png");
        produkRepository.save(produkMonitor1);

        ProdukEntity produkMonitor2 = new ProdukEntity();
        produkMonitor2.setBrandEntity(brandSamsung);
        produkMonitor2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor2.setHarga(1750_000L);
        produkMonitor2.setKategoriEntity(kategoriMonitor);
        produkMonitor2.setNama("Monitor Samsung 21'");
        produkMonitor2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMonitor2.setStok(30);
        produkMonitor2.setImage("produk-573576Monitor.png");
        produkRepository.save(produkMonitor2);

        ProdukEntity produkRAM1 = new ProdukEntity();
        produkRAM1.setBrandEntity(brandVisipro);
        produkRAM1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM1.setHarga(500_000L);
        produkRAM1.setKategoriEntity(kategoriRAM);
        produkRAM1.setNama("RAM Visipro 4GB DDR3");
        produkRAM1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM1.setStok(30);
        produkRAM1.setImage("produk-817089RAM.jpg");
        produkRepository.save(produkRAM1);

        ProdukEntity produkRAM2 = new ProdukEntity();
        produkRAM2.setBrandEntity(brandVisipro);
        produkRAM2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM2.setHarga(700_000L);
        produkRAM2.setKategoriEntity(kategoriRAM);
        produkRAM2.setNama("RAM Visipro 8GB DDR3");
        produkRAM2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkRAM2.setStok(30);
        produkRAM2.setImage("produk-706558RAM.jpg");
        produkRepository.save(produkRAM2);

        ProdukEntity produkSSD1 = new ProdukEntity();
        produkSSD1.setBrandEntity(brandLogitech);
        produkSSD1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD1.setHarga(900_000L);
        produkSSD1.setKategoriEntity(kategoriHardisk);
        produkSSD1.setNama("Logitech Hardisk SSD 256GB");
        produkSSD1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD1.setStok(30);
        produkSSD1.setImage("produk-426527SSD.JPG");
        produkRepository.save(produkSSD1);

        ProdukEntity produkSSD2 = new ProdukEntity();
        produkSSD2.setBrandEntity(brandLogitech);
        produkSSD2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD2.setHarga(1300_000L);
        produkSSD2.setKategoriEntity(kategoriHardisk);
        produkSSD2.setNama("Logitech Hardisk SSD 512GB");
        produkSSD2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkSSD2.setStok(30);
        produkSSD2.setImage("produk-612700SSD.JPG");
        produkRepository.save(produkSSD2);

        ProdukEntity produkProcessor1 = new ProdukEntity();
        produkProcessor1.setBrandEntity(brandAMD);
        produkProcessor1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor1.setHarga(700_000L);
        produkProcessor1.setKategoriEntity(kategoriAMDProcessor);
        produkProcessor1.setNama("AMD Phenom 3.0 GHz");
        produkProcessor1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor1.setStok(30);
        produkProcessor1.setImage("produk-203128AMDProcessor.jpg");
        produkRepository.save(produkProcessor1);

        ProdukEntity produkProcessor2 = new ProdukEntity();
        produkProcessor2.setBrandEntity(brandAMD);
        produkProcessor2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor2.setHarga(1500_000L);
        produkProcessor2.setKategoriEntity(kategoriAMDProcessor);
        produkProcessor2.setNama("AMD FX 3.0 GHz 8 Core");
        produkProcessor2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkProcessor2.setStok(30);
        produkProcessor2.setImage("produk-521307AMDProcessor.jpg");
        produkRepository.save(produkProcessor2);

        ProdukEntity produkMotherboard1 = new ProdukEntity();
        produkMotherboard1.setBrandEntity(brandAMD);
        produkMotherboard1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard1.setHarga(700_000L);
        produkMotherboard1.setKategoriEntity(kategoriAMDMotherboard);
        produkMotherboard1.setNama("AMD Motherboard Phenom Processor");
        produkMotherboard1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard1.setStok(30);
        produkMotherboard1.setImage("produk-209984AMDMotherboard.jpg");
        produkRepository.save(produkMotherboard1);

        ProdukEntity produkMotherboard2 = new ProdukEntity();
        produkMotherboard2.setBrandEntity(brandAMD);
        produkMotherboard2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard2.setHarga(1500_000L);
        produkMotherboard2.setKategoriEntity(kategoriAMDMotherboard);
        produkMotherboard2.setNama("AMD Motherboard FX Processor");
        produkMotherboard2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkMotherboard2.setStok(30);
        produkMotherboard2.setImage("produk-320020AMDMotherboard.jpg");
        produkRepository.save(produkMotherboard2);

        ProdukEntity produkFlashdisk1 = new ProdukEntity();
        produkFlashdisk1.setBrandEntity(brandSanDisk);
        produkFlashdisk1.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk1.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk1.setHarga(150_000L);
        produkFlashdisk1.setKategoriEntity(kategoriFlashdisk);
        produkFlashdisk1.setNama("SanDisk Flashdrive 16GB");
        produkFlashdisk1.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk1.setStok(30);
        produkFlashdisk1.setImage("produk-163984Flashdisk.png");
        produkRepository.save(produkFlashdisk1);

        ProdukEntity produkFlashdisk2 = new ProdukEntity();
        produkFlashdisk2.setBrandEntity(brandSanDisk);
        produkFlashdisk2.setDeskripsi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk2.setDetailProduk("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk2.setHarga(250_000L);
        produkFlashdisk2.setKategoriEntity(kategoriFlashdisk);
        produkFlashdisk2.setNama("SanDisk Flashdrive 32GB");
        produkFlashdisk2.setSpesifikasi("Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
                + "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.");
        produkFlashdisk2.setStok(30);
        produkFlashdisk2.setImage("produk-761024Flashdisk.png");
        produkRepository.save(produkFlashdisk2);

    }
}
