package org.itsolution.hardware.penjualan.test.controller.administrator;

import org.hamcrest.Matchers;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
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
public class PemesananControllerTest {

   @Autowired
   private WebApplicationContext webApplicationContext;

   private MockMvc mockMvc;

   @Before
   public void setUp() {
      mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
   }

   @Test
   @Ignore
   public void testAksesDaftarBrand() {

      MockHttpServletRequest request = new MockHttpServletRequest();
      try {
         this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/pemesanan/cetak/{id}", 1))

                 .andExpect(MockMvcResultMatchers.status().isOk())

                 .andExpect(MockMvcResultMatchers.model().attribute("url",
                         Matchers.is(request.getServletContext().getRealPath("/assets/images/produk/"))))

                 .andExpect(MockMvcResultMatchers.view().name("pemesanan"));

      } catch (Exception e) {
         e.printStackTrace();
         Assert.fail(e.getMessage());
      }
   }

}
