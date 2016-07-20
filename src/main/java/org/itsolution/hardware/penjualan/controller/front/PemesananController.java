package org.itsolution.hardware.penjualan.controller.front;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.itsolution.hardware.penjualan.dto.PemesananDTO;
import org.itsolution.hardware.penjualan.dto.ProdukKeranjangDTO;
import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.entity.ProdukEntity;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.itsolution.hardware.penjualan.service.ProdukService;
import org.itsolution.hardware.penjualan.service.UserService;
import org.itsolution.hardware.penjualan.util.IDGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller(value = "frontEndPemesananController")
@SessionAttributes(value = "produk_keranjang")
public class PemesananController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PemesananService pemesananService;
	
	@Autowired
	private ProdukService produkService;

	@RequestMapping("/checkout")
	public ModelAndView checkoutProduk(@ModelAttribute("produk_keranjang") List<ProdukKeranjangDTO> listKeranjang, 
									   @ModelAttribute("pemesanan") PemesananDTO pemesananDTO, Principal principal,
									   RedirectAttributes redirectAttributes) {
		
		if (SecurityContextHolder.getContext().getAuthentication() != null && 
			SecurityContextHolder.getContext().getAuthentication().isAuthenticated() &&
			principal != null) {
			
			String username = principal.getName();
			UserEntity userEntity = userService.findOneByUsername(username);
			
			for (ProdukKeranjangDTO produkKeranjangDTO : listKeranjang) {
				ProdukEntity produkEntity = produkService.findOneByNama(produkKeranjangDTO.getNama());
				produkEntity.setJumlahTerbeli(produkEntity.getJumlahTerbeli() + produkKeranjangDTO.getJumlahBarang());
				produkEntity.setStok(produkEntity.getStok() - produkKeranjangDTO.getJumlahBarang());
				produkService.update(produkEntity);
				
				PemesananEntity pemesanan = new PemesananEntity();
				pemesanan.setPemesananId(IDGenerator.generatePemesananID());
				pemesanan.setAlamatPengiriman(pemesananDTO.getAlamat());
				pemesanan.setJumlahItems(produkKeranjangDTO.getJumlahBarang());
				pemesanan.setNamaItem(produkKeranjangDTO.getNama());
				pemesanan.setNamaPenerima(pemesananDTO.getNama());
				pemesanan.setPhonePenerima(pemesananDTO.getPhone());
				pemesanan.setProdukEntity(produkEntity);
				pemesanan.setTanggalPemesanan(new Date());
				pemesanan.setTotalHarga(produkKeranjangDTO.getTotalHarga());
				pemesanan.setTransfer(false);
				pemesanan.setUserEntity(userEntity);
				pemesananService.save(pemesanan);
			}
			listKeranjang.clear();
			return new ModelAndView("redirect:/");
		} else {
			redirectAttributes.addFlashAttribute("login", false);
			return new ModelAndView("redirect:/login");
		}
		
	}
}