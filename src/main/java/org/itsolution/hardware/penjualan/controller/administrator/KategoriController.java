package org.itsolution.hardware.penjualan.controller.administrator;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.KategoriEntity;
import org.itsolution.hardware.penjualan.service.KategoriService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/kategori")
public class KategoriController {

	@Autowired
	private KategoriService kategoriService;

	@RequestMapping
	public ModelAndView index() {
		List<KategoriEntity> kategoriList = kategoriService.findAll();
		ModelAndView mav = new ModelAndView("administrator/kategori/administrator-daftar-kategori");
		mav.addObject("kategoriList", kategoriList);
		return mav;
	}

	@RequestMapping("/tambah")
	public ModelAndView tambah() {
		ModelAndView mav = new ModelAndView("administrator/kategori/administrator-tambah-kategori");
		mav.addObject("kategori", new KategoriEntity());
		return mav;
	}

	@RequestMapping(value = "/tambah_post", method = RequestMethod.POST)
	public ModelAndView tambahPost(@ModelAttribute("kategori") KategoriEntity kategoriEntity) {
		kategoriService.save(kategoriEntity);
		return new ModelAndView("redirect:/administrator/kategori");
	}

	@RequestMapping("/prepare_update/{id}")
	public ModelAndView prepareUpdate(@PathVariable Integer id) {
		ModelAndView mav = new ModelAndView("administrator/kategori/administrator-update-kategori");
		KategoriEntity kategoriEntity = kategoriService.findOne(id);
		mav.addObject("kategori", kategoriEntity);
		return mav;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView submitUpdate(@ModelAttribute("kategori") KategoriEntity kategoriEntity) {
		kategoriService.update(kategoriEntity);
		return new ModelAndView("redirect:/administrator/kategori");
	}
	
	@RequestMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable Integer id) {
		kategoriService.delete(id);
		return new ModelAndView("redirect:/administrator/kategori");
	}
}
