package org.itsolution.hardware.penjualan.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

   @RequestMapping("/login")
   public ModelAndView login() {
      return new ModelAndView("front/login");
   }

   @RequestMapping(value = "/loginfail")
   public ModelAndView loginFail(RedirectAttributes redirectAttributes) {
      redirectAttributes.addFlashAttribute("fail", true);
      return new ModelAndView("redirect:/login");
   }
}
