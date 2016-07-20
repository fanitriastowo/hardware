package org.itsolution.hardware.penjualan.test.controller.administrator;

import org.hamcrest.Matchers;
import org.itsolution.hardware.penjualan.dto.ProdukDTO;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
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
public class ProdukControllerTest {

	@Autowired
	private WebApplicationContext webApplicationContext;

	@Autowired
	private ProdukService produkService;

	private MockMvc mockMvc;

	@Before
	public void setUp() {
		mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
	}

	@Test
	public void testIndex() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/produk"))

					.andExpect(MockMvcResultMatchers.status().isOk())

					.andExpect(MockMvcResultMatchers.view().name("administrator/produk/administrator-daftar-produk"))

					.andExpect(MockMvcResultMatchers.model().attribute("produks", produkService.findAll()));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testGetOneData() {
		try {
			this.mockMvc.perform(
					MockMvcRequestBuilders.get("/administrator/produk/{id}", 1).contentType(MediaType.APPLICATION_JSON))

					.andExpect(MockMvcResultMatchers.status().isOk())

					.andExpect(MockMvcResultMatchers.jsonPath("$.id", Matchers.is(1)))

					.andExpect(MockMvcResultMatchers.jsonPath("$.harga", Matchers.equalTo(2000_000)));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testPrepareUpdate() {
		try {
			ProdukEntity produkEntity = produkService.findOne(1);
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/produk/prepare_update/{id}", 1))

					.andExpect(MockMvcResultMatchers.status().isOk())

					.andExpect(MockMvcResultMatchers.view().name("administrator/produk/administrator-update-produk"))

					.andExpect(MockMvcResultMatchers.model().attribute("model", produkEntity))

					.andExpect(
							MockMvcResultMatchers.model().attribute("model", Matchers.instanceOf(ProdukEntity.class)))

					.andExpect(MockMvcResultMatchers.model().attribute("produk", Matchers.instanceOf(ProdukDTO.class)))

					.andExpect(MockMvcResultMatchers.model().attribute("produk",
							Matchers.hasProperty("kategori", Matchers.notNullValue())))

					.andExpect(MockMvcResultMatchers.model().attribute("produk",
							Matchers.hasProperty("brand", Matchers.notNullValue())))

					.andExpect(MockMvcResultMatchers.model().attribute("produk",
							Matchers.hasProperty("filename", Matchers.nullValue())));
		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	@Ignore
	public void testSubmitUpdateForm() {
		try {
			ProdukEntity produkEntity = produkService.findOne(1);

			this.mockMvc.perform(MockMvcRequestBuilders.put("/administrator/produk/update_post")
					.contentType(MediaType.APPLICATION_FORM_URLENCODED)
					.param("nama", produkEntity.getNama())
					.param("kategori", produkEntity.getKategoriEntity().getNama())
					.param("brand", produkEntity.getBrandEntity().getNama())
					.param("detailProduk", produkEntity.getDetailProduk())
					.param("deskripsi", produkEntity.getDeskripsi())
					.param("stok", produkEntity.getStok().toString())
					.param("spesifikasi", produkEntity.getSpesifikasi())
					.param("filename", "")
					.param("harga", "1")
					.sessionAttr("produk", new ProdukDTO()))

					.andDo(MockMvcResultHandlers.print())
					
					.andExpect(MockMvcResultMatchers.status().isBadRequest())

					.andExpect(MockMvcResultMatchers.model().attribute("produk", Matchers.notNullValue()))

					.andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/produk"));


		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}

	@Test
	public void testDeleteData() {
		try {
			this.mockMvc.perform(MockMvcRequestBuilders.get("/administrator/produk/delete/{id}", 1))

					.andExpect(MockMvcResultMatchers.status().isMovedTemporarily())

					.andExpect(MockMvcResultMatchers.redirectedUrl("/administrator/produk"))

					.andExpect(MockMvcResultMatchers.flash().attribute("success", true));

		} catch (Exception e) {
			e.printStackTrace();
			Assert.fail(e.getMessage());
		}
	}
}
