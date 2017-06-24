package org.itsolution.hardware.penjualan.test.controller.front;

import org.hamcrest.Matchers;
import org.itsolution.hardware.penjualan.entity.UserEntity;
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
public class PrincipalControllerTest {

   @Autowired
   private WebApplicationContext webApplicationContext;

   private MockMvc mockMvc;

   @Before
   public void setUp() {
      mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
   }

   @Test
   public void testAksesDaftarBrand() {
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/setting"))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(
                         MockMvcResultMatchers.model().attribute("principal", Matchers.instanceOf(UserEntity.class)))

                 .andExpect(MockMvcResultMatchers.view().name("front/principal"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

}
