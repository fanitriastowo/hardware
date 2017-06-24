package org.itsolution.hardware.penjualan.controller.administrator;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.itsolution.hardware.penjualan.dto.PengirimanDTO;
import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.PengirimanEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.event.OnCompleteAddPengirimanEvent;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.itsolution.hardware.penjualan.service.PengirimanService;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.PathVariable;
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
   private ApplicationEventPublisher eventPublisher;

   @Autowired
   private PemesananService pemesananService;

   @Autowired
   private UserService userService;

   @InitBinder
   public void initBinder(WebDataBinder binder) {
      SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
      binder.registerCustomEditor(Date.class, "tanggalPengiriman", new CustomDateEditor(formatter, false));
   }

   @RequestMapping
   public ModelAndView index() {
      ModelAndView mav = new ModelAndView("administrator/pengiriman/administrator-daftar-pengiriman");
      mav.addObject("pengirimanList", pengirimanService.findAll());
      return mav;
   }

   @RequestMapping("/cetak_detail/{id}")
   public ModelAndView cetakDetailPengiriman(@PathVariable Integer id, ModelMap modelMap, HttpServletRequest request) {

      PengirimanEntity pengirimanEntity = pengirimanService.findOne(id);
      List<PengirimanEntity> list = new ArrayList<>();
      list.add(pengirimanEntity);

      String uri = request.getScheme() + "://" +  // "http" + "://
              request.getServerName() + ":" +     // "localhost" + ":"
              request.getServerPort() +           // "80"
              request.getContextPath();           // hardware

      modelMap.addAttribute("dataSource", list);
      modelMap.addAttribute("logo", uri + "/assets/administrator/img/logo.png");
      modelMap.addAttribute("produkImage", uri + "/uploads/");

      return new ModelAndView("pengiriman", modelMap);
   }

   @RequestMapping("/tambah")
   public ModelAndView tambahPengiriman(@ModelAttribute("pengiriman") PengirimanDTO dto) {
      ModelAndView mav = new ModelAndView("administrator/pengiriman/administrator-tambah-pengiriman");

      List<PemesananEntity> pemesananList = pemesananService.findAll();
      List<UserEntity> userList = userService.findAllMember();

      mav.addObject("pemesananList", pemesananList);
      mav.addObject("userList", userList);
      return mav;
   }

   @RequestMapping("/tambah_post")
   public ModelAndView tambahPengirimanPost(@ModelAttribute("pengiriman") PengirimanDTO dto) {
      PengirimanEntity pengirimanEntity = pengirimanService.save(dto);
      eventPublisher.publishEvent(new OnCompleteAddPengirimanEvent(pengirimanEntity));
      return new ModelAndView("administrator/pengiriman/administrator-tambah-pengiriman");
   }

   @RequestMapping("/cetak_analisa_pasar")
   public ModelAndView cetakAnalisaPasar(ModelMap modelMap, HttpServletRequest request) {

      List<PengirimanDTO> listDTO = new ArrayList<>();
      List<Object[]> list = pengirimanService.findAllForPieChart();

      Long sum = 0L;
      for (Object[] object : list) {
         sum += (Long) object[0];
      }

      for (Object[] object : list) {

         PengirimanDTO dto = new PengirimanDTO();
         Long jumlah = (Long) object[0];
         dto.setJumlah(jumlah);
         dto.setKabupaten((String) object[1]);

         Double percentage = (jumlah.doubleValue() / sum.doubleValue()) * 100;
         dto.setStatusPengiriman(percentage.toString() + " %");
         listDTO.add(dto);
      }

      String uri = request.getScheme() + "://" +  // "http" + "://
              request.getServerName() + ":" +     // "localhost" + ":"
              request.getServerPort() +           // "80"
              request.getContextPath();           // hardware

      modelMap.addAttribute("dataSource", listDTO);
      modelMap.addAttribute("logo", uri + "/assets/administrator/img/logo.png");
      return new ModelAndView("cetakAnalisisPengiriman", modelMap);
   }
}
