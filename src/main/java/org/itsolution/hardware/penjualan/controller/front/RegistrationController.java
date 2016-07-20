package org.itsolution.hardware.penjualan.controller.front;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
	
	@Autowired
	private UserService userService;

	@ModelAttribute(value = "user")
	public UserDTO constructUserModel() {
		return new UserDTO();
	}

	@RequestMapping
	public ModelAndView registrationPage() {
		return new ModelAndView("front/registration");
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView registerNewMember(@ModelAttribute("user") UserDTO userDTO) {
		userService.save(userDTO);
		return new ModelAndView("redirect:/login");
	}
}
