package org.itsolution.hardware.penjualan.controller.front;

import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@Autowired
	private ProdukService produkService;

	@RequestMapping("/")
	public ModelAndView index() {
	    ModelAndView mav = new ModelAndView("front/home");

	    List<ProdukEntity> findAll = produkService.findAll();
	    Collections.shuffle(findAll, new Random());
	    
		mav.addObject("produks", findAll);
		return mav;
	}
	
	@RequestMapping("/search_autocomplete")
	@ResponseBody
	public List<ProdukEntity> searchAutocomplete(@RequestParam("term") String nama) {
		List<ProdukEntity> produkList = produkService.findAllByNamaLike(nama);
		return produkList;
	}
	
	@RequestMapping(value = "/search_submit", method = RequestMethod.POST)
	public ModelAndView searchSubmit(@RequestParam("search-result") String nama) {
		ProdukEntity produkEntity = produkService.findOneByNama(nama);
		return new ModelAndView("redirect:/" + produkEntity.getId());
	}

}
