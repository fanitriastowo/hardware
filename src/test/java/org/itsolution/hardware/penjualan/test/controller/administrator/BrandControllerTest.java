package org.itsolution.hardware.penjualan.test.controller.administrator;

import org.hamcrest.Matchers;
import org.itsolution.hardware.penjualan.service.BrandService;
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
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/dispatcher-servlet.xml",
		"file:src/main/webapp/WEB-INF/applicationContext.xml" })
@WebAppConfiguration
@Transactional
@ActiveProfiles("dev")
public class BrandControllerTest {

	@Autowired
	private WebApplicationContext webApplicationContext;

	@Autowired
	private BrandService brandService;

	private MockMvc mockMvc;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}

	@Test
	public void testAksesDaftarBrand() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/brand"))

					.andExpect(MockMvcResultMatchers.status().isOk())

					.andExpect(MockMvcResultMatchers.model().attribute("brandList", brandService.findAll()))

					.andExpect(MockMvcResultMatchers.view().name("administrator/brand/administrator-daftar-brand"));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testAmbilSatuBrandBerdasarkanIDUntukUpdate() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/brand/prepare_update/{id}", 1))

					.andExpect(MockMvcResultMatchers.status().isOk())

					.andExpect(MockMvcResultMatchers.model().attribute("brand", brandService.findOne(1)))

					.andExpect(MockMvcResultMatchers.view().name("administrator/brand/administrator-update-brand"));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testSubmitAddBrand() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.post("/administrator/brand/tambah_post").param("nama", "BLAH"))

					.andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

					.andExpect(MockMvcResultMatchers.model().attribute("brand", Matchers.notNullValue()))

					.andExpect(MockMvcResultMatchers.model().attribute("brand",
							Matchers.hasProperty("nama", Matchers.equalTo("BLAH"))))

					.andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/brand"));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testSubmitUpdateBrand() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.post("/administrator/brand/update").param("id", "1")
					.param("nama", "A").param("deskripsi", "Deskripsi"))

					.andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

					.andExpect(MockMvcResultMatchers.model().attribute("brand", Matchers.notNullValue()))

					.andExpect(MockMvcResultMatchers.model().attribute("brand",
							Matchers.hasProperty("id", Matchers.is(1))))

					.andExpect(MockMvcResultMatchers.model().attribute("brand",
							Matchers.hasProperty("nama", Matchers.is("A"))))

					.andExpect(MockMvcResultMatchers.model().attribute("brand",
							Matchers.hasProperty("deskripsi", Matchers.is("Deskripsi"))))

					.andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/brand"));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}
	
	@Test
	public void testDeleteBrand() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/brand/delete/{id}", 1))

					.andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

					.andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/brand"));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}
}
