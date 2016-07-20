package org.itsolution.hardware.penjualan.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/member")
public class MemberController {
	
	@RequestMapping
	public ModelAndView index() {
		return new ModelAndView("administrator/member/administrator-daftar-member");
	}

	@RequestMapping("/tambah")
	public ModelAndView tambah() {
		return new ModelAndView("administrator/member/administrator-tambah-member");
	}
}