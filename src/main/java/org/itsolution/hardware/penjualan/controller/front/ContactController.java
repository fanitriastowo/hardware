package org.itsolution.hardware.penjualan.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/contact")
public class ContactController {

   @RequestMapping
   public ModelAndView contact() {
      return new ModelAndView("front/contact");
   }
}
