package org.itsolution.hardware.penjualan.controller.administrator;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/dashboard")
public class DashboardController {

	@RequestMapping
	public ModelAndView index() {
		return new ModelAndView("administrator/administrator-dashboard");
	}
}
