package org.itsolution.hardware.penjualan.controller.front;

import java.security.Principal;
import java.util.List;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.itsolution.hardware.penjualan.service.PengirimanService;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PrincipalController {

	@Autowired
	private UserService userService;

	@Autowired
	private PemesananService pemesananService;

	@Autowired
	private PengirimanService pengirimanService;

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("/setting")
	public ModelAndView settingPage(Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		ModelAndView modelAndView = new ModelAndView("front/principal");
		String username = principal.getName();
		UserEntity userEntity = userService.findOneByUsername(username);
		List<PemesananEntity> pemesanans = pemesananService.findAllByUserEntity(userEntity);
		List<PengirimanEntity> pengirimans = pengirimanService.findAllByUserEntity(userEntity);
		modelAndView.addObject("principal", userEntity);
		modelAndView.addObject("pemesanans", pemesanans);
		modelAndView.addObject("pengirimans", pengirimans);
		return modelAndView;
	}
}
