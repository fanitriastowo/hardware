package org.itsolution.hardware.penjualan.controller.front;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import java.security.Principal;
import java.util.List;
import java.util.Calendar;
import java.util.GregorianCalendar;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.itsolution.hardware.penjualan.service.PengirimanService;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping("/ubah_principal")
	public ModelAndView ubahProfilePage(Principal principal) {

		ModelAndView modelAndView = new ModelAndView("front/ubah_principal");
		
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		String username = principal.getName();
		UserEntity userEntity = userService.findOneByUsername(username);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(userEntity.getTanggalLahir());
		
		UserDTO dto = new UserDTO();
		dto.setId(userEntity.getId());
		dto.setNama(userEntity.getNama());
		dto.setPhone(userEntity.getPhone());
		dto.setTanggal(calendar.get(Calendar.DATE));
        dto.setBulan(calendar.get(Calendar.MONTH) + 1);
        dto.setTahun(calendar.get(Calendar.YEAR));

		modelAndView.addObject("principal", dto);
		return modelAndView;
	}

	@PreAuthorize("hasRole('ROLE_MEMBER')")
	@RequestMapping(value = "/submit_ubah_principal")
	public ModelAndView submitUbahProfile(@ModelAttribute("principal") UserDTO userDTO) {

		userService.ubahProfileMember(userDTO);

		return new ModelAndView("redirect:/setting");
	}
}
