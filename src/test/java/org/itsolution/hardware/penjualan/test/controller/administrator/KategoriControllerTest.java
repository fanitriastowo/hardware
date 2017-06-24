package org.itsolution.hardware.penjualan.test.controller.administrator;

import org.hamcrest.Matchers;
import org.itsolution.hardware.penjualan.service.KategoriService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/dispatcher-servlet.xml",
        "file:src/main/webapp/WEB-INF/applicationContext.xml"})
@WebAppConfiguration
@Transactional
@ActiveProfiles("dev")
public class KategoriControllerTest {

   @Autowired
   private WebApplicationContext webApplicationContext;

   @Autowired
   private KategoriService kategoriService;

   private MockMvc mockMvc;

   @Before
   public void setUp() {
      mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
   }

   @Test
   public void testAksesDaftarKategori() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/kategori"))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(MockMvcResultMatchers.model().attribute("kategoriList", kategoriService.findAll()))

                 .andExpect(
                         MockMvcResultMatchers.view().name("administrator/kategori/administrator-daftar-kategori"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testAmbilSatuKategoriBerdasarkanIDUntukUpdate() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/kategori/prepare_update/{id}", 1))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori", kategoriService.findOne(1)))

                 .andExpect(
                         MockMvcResultMatchers.view().name("administrator/kategori/administrator-update-kategori"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testSubmitAddBrand() {
      try {
         this.mockMvc
                 .perform(MockMvcRequestBuilders.post("/administrator/kategori/tambah_post").param("nama", "BLAH"))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori", Matchers.notNullValue()))

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori",
                         Matchers.hasProperty("nama", Matchers.equalTo("BLAH"))))

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/kategori"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testSubmitUpdateKategori() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.post("/administrator/kategori/update").param("id", "1")
                 .param("nama", "A").param("deskripsi", "Deskripsi"))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori", Matchers.notNullValue()))

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori",
                         Matchers.hasProperty("id", Matchers.is(1))))

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori",
                         Matchers.hasProperty("nama", Matchers.is("A"))))

                 .andExpect(MockMvcResultMatchers.model().attribute("kategori",
                         Matchers.hasProperty("deskripsi", Matchers.is("Deskripsi"))))

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/kategori"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testDeleteKategori() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/kategori/delete/{id}", 1))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/kategori"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

}
