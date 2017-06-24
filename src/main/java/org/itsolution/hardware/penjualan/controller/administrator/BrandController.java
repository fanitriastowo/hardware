package org.itsolution.hardware.penjualan.controller.administrator;

import java.util.List;

import org.itsolution.hardware.penjualan.entity.BrandEntity;
import org.itsolution.hardware.penjualan.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/brand")
public class BrandController {

   @Autowired
   private BrandService brandService;

   @RequestMapping
   public ModelAndView index() {
      List<BrandEntity> brandList = brandService.findAll();
      ModelAndView mav = new ModelAndView("administrator/brand/administrator-daftar-brand");
      mav.addObject("brandList", brandList);
      return mav;
   }

   @RequestMapping("/tambah")
   public ModelAndView tambah(@ModelAttribute("brand") BrandEntity brandEntity) {
      return new ModelAndView("administrator/brand/administrator-tambah-brand");
   }

   @RequestMapping(value = "/tambah_post", method = RequestMethod.POST)
   public ModelAndView tambahPost(@ModelAttribute("brand") BrandEntity brandEntity) {
      brandService.save(brandEntity);
      return new ModelAndView("redirect:/administrator/brand");
   }

   @RequestMapping("/prepare_update/{id}")
   public ModelAndView prepareUpdate(@PathVariable Integer id) {
      ModelAndView modelAndView = new ModelAndView("administrator/brand/administrator-update-brand");
      modelAndView.addObject("brand", brandService.findOne(id));
      return modelAndView;
   }

   @RequestMapping(value = "/update", method = RequestMethod.POST)
   public ModelAndView updatePost(@ModelAttribute("brand") BrandEntity brandEntity, BindingResult result) {

      if (result.hasErrors()) {
         return new ModelAndView("redirect:/administrator/brand");
      }

      brandService.update(brandEntity);
      return new ModelAndView("redirect:/administrator/brand");
   }

   @RequestMapping("/delete/{id}")
   public ModelAndView deleteBrand(@PathVariable Integer id) {
      brandService.delete(id);
      return new ModelAndView("redirect:/administrator/brand");
   }
}