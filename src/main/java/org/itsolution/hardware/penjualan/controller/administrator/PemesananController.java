package org.itsolution.hardware.penjualan.controller.administrator;

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

    @RequestMapping("/cetak/{id}")
    public ModelAndView cetakPemesanan(@PathVariable("id") Integer id, ModelMap modelMap, HttpServletRequest request) {

        PemesananEntity pemesananEntity = pemesananService.findOne(id);
        List<PemesananEntity> list = new ArrayList<>();
        list.add(pemesananEntity);

        modelMap.addAttribute("dataSource", list);
        modelMap.addAttribute("logo", request.getServletContext().getRealPath("/assets/administrator/img/logo.png"));
        modelMap.addAttribute("url", request.getServletContext().getRealPath("/assets/images/produk/"));
        System.out.println(request.getServletContext().getRealPath("/assets/images/produk/"));

        return new ModelAndView("pemesanan", modelMap);
    }
}
