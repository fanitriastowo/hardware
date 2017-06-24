package org.itsolution.hardware.penjualan.controller.front;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.itsolution.hardware.penjualan.dto.PemesananDTO;
import org.itsolution.hardware.penjualan.dto.ProdukKeranjangDTO;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "frontEndProdukController")
@SessionAttributes(value = "produk_keranjang")
public class ProdukController {

   @Autowired
   private ProdukService produkService;

   @ModelAttribute("pemesanan")
   public PemesananDTO constructPemesanan() {
      return new PemesananDTO();
   }

   @ModelAttribute("produkKeranjang")
   public ProdukKeranjangDTO constructKeranjang() {
      return new ProdukKeranjangDTO();
   }

   @RequestMapping("/{id}")
   public ModelAndView detailProduk(Model model, @PathVariable("id") Integer id) {

      ModelAndView mav = new ModelAndView("front/detail_produk");
      mav.addObject("detailProduk", produkService.findOne(id));
      if (!model.containsAttribute("produk_keranjang")) {
         mav.addObject("produk_keranjang", new HashMap<Integer, ProdukKeranjangDTO>());
      }
      return mav;
   }

   @RequestMapping(value = "/simpan_ke_keranjang/{id}", method = RequestMethod.POST)
   public ModelAndView simpanProdukKeKeranjang(Model model, @PathVariable("id") Integer id,
                                               @ModelAttribute("produkKeranjang") ProdukKeranjangDTO produkKeranjangDTO,
                                               @ModelAttribute("produk_keranjang") HashMap<Integer, ProdukKeranjangDTO> listKeranjang) {

      ModelAndView mav = new ModelAndView("redirect:/keranjang");
      if (!model.containsAttribute("produk_keranjang")) {
         mav.addObject("produk_keranjang", new HashMap<Integer, ProdukKeranjangDTO>());
      }

      ProdukEntity produkEntity = produkService.findOne(id);
      produkKeranjangDTO.setHarga(produkEntity.getHarga());
      produkKeranjangDTO.setNama(produkEntity.getNama());
      produkKeranjangDTO.setTotalHarga(produkEntity.getHarga() * produkKeranjangDTO.getJumlahBarang());

      listKeranjang.put(produkEntity.getId(), produkKeranjangDTO);
      mav.addObject("produk_keranjang", listKeranjang);
      return mav;
   }

   @RequestMapping("/keranjang")
   public ModelAndView halamanKeranjang(Model model) {

      ModelAndView mav = new ModelAndView("front/keranjang");
      if (!model.containsAttribute("produk_keranjang")) {
         model.addAttribute("produk_keranjang", new HashMap<Integer, ProdukKeranjangDTO>());
      }
      return mav;
   }

   @RequestMapping("/ubah_jumlah_barang/{id}")
   public ModelAndView ubahItemDiKeranjang(Model model, @PathVariable Integer id,
                                           @ModelAttribute("produk_keranjang") HashMap<Integer, ProdukKeranjangDTO> listKeranjang,
                                           @ModelAttribute("produkKeranjang") ProdukKeranjangDTO produkKeranjangDTO) {

      ModelAndView mav = new ModelAndView("redirect:/keranjang");

      ProdukEntity produkEntity = produkService.findOne(id);
      ProdukKeranjangDTO dto = listKeranjang.get(id);
      dto.setJumlahBarang(produkKeranjangDTO.getJumlahBarang());
      dto.setTotalHarga(produkEntity.getHarga() * produkKeranjangDTO.getJumlahBarang());

      return mav;
   }

   @RequestMapping("/hapus_item_keranjang/{id}")
   public ModelAndView hapusItemDiKeranjang(Model model, @PathVariable Integer id,
                                            @ModelAttribute("produk_keranjang") HashMap<Integer, ProdukKeranjangDTO> listKeranjang) {

      ModelAndView mav = new ModelAndView("redirect:/keranjang");
      listKeranjang.remove(id);

      return mav;
   }

   @SuppressWarnings("unchecked")
   @RequestMapping("/count_keranjang")
   @ResponseBody
   public Integer jumlahProdukDalamKeranjang(HttpSession session) {

      Integer countKeranjang = 0;
      if (session.getAttribute("produk_keranjang") == null) {
         session.setAttribute("produk_keranjang", new HashMap<Integer, ProdukKeranjangDTO>());
      } else {
         HashMap<Integer, ProdukKeranjangDTO> listKeranjang = (HashMap<Integer, ProdukKeranjangDTO>) session
                 .getAttribute("produk_keranjang");

         if (!listKeranjang.isEmpty() && listKeranjang != null) {
            countKeranjang = listKeranjang.size();
         }
      }
      return countKeranjang;
   }
}
