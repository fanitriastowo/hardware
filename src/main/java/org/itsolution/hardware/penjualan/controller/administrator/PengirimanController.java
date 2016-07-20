package org.itsolution.hardware.penjualan.controller.administrator;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.itsolution.hardware.penjualan.dto.PengirimanDTO;
import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.itsolution.hardware.penjualan.service.PengirimanService;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/pengiriman")
public class PengirimanController {
	
	@Autowired
	private PengirimanService pengirimanService;
	
	@Autowired
	private PemesananService pemesananService;
	
	@Autowired
	private UserService userService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, "tanggalPengiriman", new CustomDateEditor(formatter, false));
	}
	
	@ModelAttribute("pengiriman")
	public PengirimanDTO construct() {
		return new PengirimanDTO();
	}

	@RequestMapping
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView("administrator/pengiriman/administrator-daftar-pengiriman");
		mav.addObject("pengirimanList", pengirimanService.findAll());
		return mav;
	}

	@RequestMapping("/tambah")
	public ModelAndView tambahPengiriman() {
		ModelAndView mav = new ModelAndView("administrator/pengiriman/administrator-tambah-pengiriman");
		
		List<PemesananEntity> pemesananList = pemesananService.findAll();
		List<UserEntity> userList = userService.findAllMember();
		
		mav.addObject("pemesananList", pemesananList);
		mav.addObject("userList", userList);
		return mav;
	}
	
	@RequestMapping("/tambah_post")
	public ModelAndView tambahPengirimanPost(@ModelAttribute("pengiriman") PengirimanDTO dto) {
		pengirimanService.save(dto);
		return new ModelAndView("administrator/pengiriman/administrator-tambah-pengiriman");
	}
}
