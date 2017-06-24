package org.itsolution.hardware.penjualan.test.controller.administrator;

import org.hamcrest.Matchers;
import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.service.UserService;
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
public class MemberControllerTest {

   @Autowired
   private WebApplicationContext webApplicationContext;

   @Autowired
   private UserService userService;

   private MockMvc mockMvc;

   @Before
   public void setUp() {
      mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
   }

   @Test
   public void testAksesDaftarMember() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/member"))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(MockMvcResultMatchers.model().attribute("memberList", userService.findAllMember()))

                 .andExpect(MockMvcResultMatchers.view().name("administrator/member/administrator-daftar-member"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testAmbilSatuMemberBerdasarkanIDUntukUpdate() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/member/prepare_update/{id}", 2))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(MockMvcResultMatchers.model().attribute("member", Matchers.instanceOf(UserDTO.class)))

                 .andExpect(MockMvcResultMatchers.model().attribute("member",
                         Matchers.hasProperty("id", Matchers.is(2))))

                 .andExpect(MockMvcResultMatchers.model().attribute("member",
                         Matchers.hasProperty("tanggal", Matchers.is(21))))

                 .andExpect(MockMvcResultMatchers.model().attribute("member",
                         Matchers.hasProperty("bulan", Matchers.is(7))))

                 .andExpect(MockMvcResultMatchers.model().attribute("member",
                         Matchers.hasProperty("tahun", Matchers.is(2016))))

                 .andExpect(MockMvcResultMatchers.view().name("administrator/member/administrator-update-member"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testSubmitAddBrand() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.post("/administrator/member/tambah_post").param("nama", "BLAH")
                 .param("phone", "085291070216").param("username", "blah").param("password", "blah")
                 .param("tanggal", "1").param("bulan", "3").param("tahun", "2000").param("jenisKelamin", "lakilaki"))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.model().attribute("member", Matchers.notNullValue()))

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/member"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testSubmitUpdateBrand() {
      try {
         UserDTO userDTO = userService.findOne(2);
         Assert.assertThat(userDTO.getId(), Matchers.is(2));
         Assert.assertThat(userDTO.getNama(), Matchers.equalTo("Angga Setyo"));

         this.mockMvc.perform(MockMvcRequestBuilders.post("/administrator/member/update").param("id", "2")
                 .param("nama", "BLAH").param("phone", "085291070216").param("username", "blah")
                 .param("password", "blah").param("tanggal", "1").param("bulan", "3").param("tahun", "2000")
                 .param("jenisKelamin", "lakilaki"))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.model().attribute("member", Matchers.notNullValue()))

                 .andExpect(MockMvcResultMatchers.model().attribute("member",
                         Matchers.hasProperty("id", Matchers.is(2))))

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/member"));

         UserDTO newUserDTO = userService.findOne(2);
         Assert.assertThat(newUserDTO.getId(), Matchers.is(2));
         Assert.assertThat(newUserDTO.getNama(), Matchers.equalTo("BLAH"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

   @Test
   public void testDeleteBrand() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/member/delete/{id}", 3))

                 .andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

                 .andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/member"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }
}
