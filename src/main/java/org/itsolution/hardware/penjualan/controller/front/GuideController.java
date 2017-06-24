package org.itsolution.hardware.penjualan.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/guide")
public class GuideController {

   @RequestMapping
   public ModelAndView guide() {
      return new ModelAndView("front/guide");
   }

}
