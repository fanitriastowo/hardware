package org.itsolution.hardware.penjualan.controller.administrator;

import java.util.ArrayList;
import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/pemesanan")
public class PemesananController {

	@Autowired
	private PemesananService pemesananService;

	@RequestMapping
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("administrator/administrator-pemesanan");
		mav.addObject("pemesanans", pemesananService.findAllOrderByTransfer());
		return mav;
	}

	@RequestMapping("/cetak/{id}")
	public String cetakPemesanan(@PathVariable("id") Integer id, ModelMap modelMap) {
		List<PemesananEntity> listPemesananEntity = new ArrayList<>();
		listPemesananEntity.add(pemesananService.findOne(id));
		modelMap.addAttribute("dataSource", listPemesananEntity);
		return "pemesanan";
	}
}
