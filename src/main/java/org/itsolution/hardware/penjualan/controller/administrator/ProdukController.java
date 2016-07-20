package org.itsolution.hardware.penjualan.controller.administrator;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.math.NumberUtils;
import org.itsolution.hardware.penjualan.dto.ProdukDTO;
import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.service.BrandService;
import org.itsolution.hardware.penjualan.service.KategoriService;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.itsolution.hardware.penjualan.util.IDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/administrator/produk")
public class ProdukController {

	@Autowired
	private BrandService brandService;

	@Autowired
	private KategoriService kategoriService;

	@Autowired
	private ProdukService produkService;

	// @ModelAttribute("produk")
	public ProdukDTO constructModel() {
		return new ProdukDTO();
	}

	@RequestMapping
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("administrator/produk/administrator-daftar-produk");
		mav.addObject("produks", produkService.findAll());
		return mav;
	}

	@RequestMapping("/{id}")
	@ResponseBody
	public ProdukEntity getOneProdukJsonFormat(@PathVariable Integer id) {
		ProdukEntity produk = produkService.findOne(id);
		return produk;
	}

	@RequestMapping("/tambah")
	public ModelAndView tambah() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("produk", new ProdukDTO());
		mav.addObject("kategoriList", kategoriService.findAll());
		mav.addObject("brandList", brandService.findAll());
		mav.setViewName("administrator/produk/administrator-tambah-produk");
		return mav;
	}

	@RequestMapping(value = "/tambah_post", method = RequestMethod.POST)
	public ModelAndView tambahPost(@ModelAttribute("produk") ProdukDTO produkDTO, RedirectAttributes redirectAttributes,
			HttpServletRequest request, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			redirectAttributes.addFlashAttribute("errorResult", true);
			return new ModelAndView("redirect:/administrator/produk/tambah");
		}

		// Root Directory.
		String uploadRootPath = request.getServletContext().getRealPath("assets/images/produk");
		System.out.println("uploadRootPath=" + uploadRootPath);

		File uploadRootDir = new File(uploadRootPath);

		// Create directory if it not exists.
		if (!uploadRootDir.exists()) {
			uploadRootDir.mkdirs();
		}

		// Client File Name
		String name = "produk-" + IDGenerator.generateImageName() + produkDTO.getFilename().getOriginalFilename();
		System.out.println("Client File Name = " + name);

		if (name != null && name.length() > 0) {
			try {
				byte[] bytes = produkDTO.getFilename().getBytes();

				// Create the file on server
				File serverFile = new File(uploadRootDir.getAbsolutePath() + File.separator + name);

				// Stream to write data to file in server.
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				System.out.println("Write file: " + serverFile);

				// Simpan nama file ke database
				BrandEntity brandEntity = brandService.findOneByNama(produkDTO.getBrand());
				KategoriEntity kategoriEntity = kategoriService.findOneByNama(produkDTO.getKategori());
				ProdukEntity produkEntity = new ProdukEntity();
				produkEntity.setBrandEntity(brandEntity);
				produkEntity.setKategoriEntity(kategoriEntity);
				produkEntity.setDeskripsi(produkDTO.getDeskripsi());
				produkEntity.setDetailProduk(produkDTO.getDetailProduk());
				produkEntity.setHarga(produkDTO.getHarga());
				produkEntity.setImage(name);
				produkEntity.setNama(produkDTO.getNama());
				produkEntity.setSpesifikasi(produkDTO.getSpesifikasi());
				produkEntity.setStok(produkDTO.getStok());
				produkService.save(produkEntity);

			} catch (Exception e) {
				System.out.println("Error Write file: " + name);
			}
		}

		return new ModelAndView("redirect:/administrator/produk/tambah");
	}

	@RequestMapping("/prepare_update/{id}")
	public ModelAndView prepareUpdateProduk(@PathVariable Integer id) {

		// populate data to DTO before response
		ProdukEntity produkEntity = produkService.findOne(id);
		ProdukDTO produkDTO = new ProdukDTO();
		produkDTO.setBrand(produkEntity.getBrandEntity().getNama());
		produkDTO.setDeskripsi(produkEntity.getDeskripsi());
		produkDTO.setDetailProduk(produkEntity.getDetailProduk());
		produkDTO.setHarga(produkEntity.getHarga());
		produkDTO.setKategori(produkEntity.getKategoriEntity().getNama());
		produkDTO.setNama(produkEntity.getNama());
		produkDTO.setSpesifikasi(produkEntity.getSpesifikasi());
		produkDTO.setStok(produkEntity.getStok());

		ModelAndView mav = new ModelAndView();
		mav.addObject("produk", produkDTO);
		mav.addObject("model", produkEntity);
		mav.addObject("kategoriList", kategoriService.findAll());
		mav.addObject("brandList", brandService.findAll());
		mav.setViewName("administrator/produk/administrator-update-produk");
		return mav;
	}

	@RequestMapping("/update_post")
	public ModelAndView updateProduk(@ModelAttribute("produk") ProdukDTO produkDTO,
			RedirectAttributes redirectAttributes, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			redirectAttributes.addFlashAttribute("success", false);
			return new ModelAndView("redirect:/administrator/produk");
		}

		ProdukEntity produkEntity = produkService.findOneByNama(produkDTO.getNama());
		produkService.update(produkEntity);
		redirectAttributes.addFlashAttribute("success", true);
		return new ModelAndView("redirect:/administrator/produk");
	}

	@RequestMapping(value = "/delete/{id}")
	public ModelAndView deleteProduk(@PathVariable Integer id, RedirectAttributes redirectAttributes) {

		if (id == null || !NumberUtils.isNumber(id.toString())) {
			redirectAttributes.addFlashAttribute("success", false);
			return new ModelAndView("redirect:/administrator/produk");
		}

		produkService.delete(id);
		redirectAttributes.addFlashAttribute("success", true);
		return new ModelAndView("redirect:/administrator/produk");
	}
}