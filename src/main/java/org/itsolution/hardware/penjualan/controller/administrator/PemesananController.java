package org.itsolution.hardware.penjualan.controller.administrator;

import org.itsolution.hardware.penjualan.dto.PemesananDTO;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.itsolution.hardware.penjualan.entity.PemesananEntity;
import org.itsolution.hardware.penjualan.service.PemesananService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/pemesanan")
public class PemesananController {

    @Autowired
    private PemesananService pemesananService;

    @RequestMapping
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView("administrator/administrator-pemesanan");
        mav.addObject("pemesanans", pemesananService.findAllOrderByTransfer());
        return mav;
    }
    
    @RequestMapping("/ubah_status_transfer/{id}")
    public ModelAndView ubahStatusTransfer(@PathVariable Integer id) {
        
        PemesananEntity pemesananEntity = pemesananService.findOne(id);
        pemesananService.ubahStatusTransfer(pemesananEntity);
        return new ModelAndView("redirect:/administrator/pemesanan");
    }

    @RequestMapping("/cetak/{id}")
    public ModelAndView cetakPemesanan(@PathVariable("id") Integer id, ModelMap modelMap, HttpServletRequest request) {

        PemesananEntity pemesananEntity = pemesananService.findOne(id);
        List<PemesananEntity> list = new ArrayList<>();
        list.add(pemesananEntity);

        String uri = request.getScheme() + "://" +  // "http" + "://
                request.getServerName() + ":" +     // "localhost" + ":"
                request.getServerPort() +           // "80"
                request.getContextPath();           // hardware

        modelMap.addAttribute("dataSource", list);
        modelMap.addAttribute("logo", uri + "/assets/administrator/img/logo.png");
        modelMap.addAttribute("produkImage", uri + "/uploads/");

        return new ModelAndView("pemesanan", modelMap);
    }

    @RequestMapping("/cetak_analisa_pasar")
    public ModelAndView cetakAnalisaPasar(ModelMap modelMap, HttpServletRequest request) {

        List<PemesananDTO> listDTO = new ArrayList<>();
        List<Object[]> list = pemesananService.findAllForPieChart();

        Long sum = 0L;
        for (Object[] object : list) {
            sum += (Long) object[0];
        }
        
        for (Object[] object : list) {
            
            PemesananDTO dto = new PemesananDTO();
            Long jumlah = (Long) object[0];
            dto.setJumlah(jumlah);
            dto.setKabupaten((String) object[1]);
            
            Double percentage = (jumlah.doubleValue() / sum.doubleValue()) * 100;
            dto.setNama(percentage.toString() + " %");
            listDTO.add(dto);
        }

        String uri = request.getScheme() + "://" +  // "http" + "://
                request.getServerName() + ":" +     // "localhost" + ":"
                request.getServerPort() +           // "80"
                request.getContextPath();           // hardware

        modelMap.addAttribute("dataSource", listDTO);
        modelMap.addAttribute("logo", uri + "/assets/administrator/img/logo.png");
        return new ModelAndView("cetakAnalisisPemesanan", modelMap);
    }
}
