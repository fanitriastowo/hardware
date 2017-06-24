package org.itsolution.hardware.penjualan.test.service.administrator;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.service.BrandService;
import org.itsolution.hardware.penjualan.service.KategoriService;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/applicationContext.xml")
@WebAppConfiguration
@Transactional
@ActiveProfiles("dev")
public class ProdukServiceTest {

   @Autowired
   private ProdukService produkService;

   @Autowired
   private BrandService brandService;

   @Autowired
   private KategoriService kategoriService;

   @Test
   public void testInsert() {

      BrandEntity brandEntity = brandService.findOneByNama("Samsung");
      KategoriEntity kategoriEntity = kategoriService.findOneByNama("Hardisk");

      ProdukEntity p = new ProdukEntity();
      p.setBrandEntity(brandEntity);
      p.setDeskripsi("BLAH");
      p.setDetailProduk("BLAH");
      p.setHarga(2000_000L);
      p.setJumlahTerbeli(1);
      p.setKategoriEntity(kategoriEntity);
      p.setNama("BLAH");
      p.setSpesifikasi("Blah");
      p.setStok(100);

      Assert.assertNull(p.getId());
      Assert.assertNotNull(p.getBrandEntity());
      Assert.assertNotNull(p.getKategoriEntity());

      produkService.save(p);

      Assert.assertNotNull(p.getId());

   }

   @Test
   public void testUpdate() {
      ProdukEntity produkEntity = produkService.findOneByNama("Samsung SSD 850 Evo 250Gb");
      Assert.assertNotNull(produkEntity);
      produkEntity.setJumlahTerbeli(produkEntity.getJumlahTerbeli() + 1);
      produkService.update(produkEntity);

      Assert.assertEquals(Integer.valueOf(2), produkEntity.getJumlahTerbeli());
      Assert.assertEquals(Long.valueOf(2000_000L), produkEntity.getHarga());
   }

   @Test
   public void testDelete() {
      ProdukEntity produkEntity = produkService.findOneByNama("Samsung SSD 850 Evo 250Gb");
      Assert.assertNotNull(produkEntity);

      produkService.delete(produkEntity.getId());

      produkEntity = produkService.findOneByNama("Samsung SSD 850 Evo 250Gb");
      Assert.assertNull(produkEntity);
   }
}
