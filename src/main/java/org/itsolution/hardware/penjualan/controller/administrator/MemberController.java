package org.itsolution.hardware.penjualan.controller.administrator;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/administrator/member")
public class MemberController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("administrator/member/administrator-daftar-member");
        modelAndView.addObject("memberList", userService.findAllMember());
        return modelAndView;
    }

    @RequestMapping("/tambah")
    public ModelAndView tambah() {
        return new ModelAndView("administrator/member/administrator-tambah-member");
    }

    @RequestMapping(value = "/tambah_post", method = RequestMethod.POST)
    public ModelAndView tambahPost(@ModelAttribute("member") UserDTO userDTO) {
        userService.save(userDTO);
        return new ModelAndView("redirect:/administrator/member");
    }

    @RequestMapping("/prepare_update/{id}")
    public ModelAndView prepareUpdate(@PathVariable Integer id) {
        ModelAndView modelAndView = new ModelAndView("administrator/member/administrator-update-member");
        modelAndView.addObject("member", userService.findOne(id));
        return modelAndView;
    }

    @RequestMapping("/update")
    public ModelAndView update(@ModelAttribute("member") UserDTO userDTO) {
        userService.update(userDTO);
        return new ModelAndView("redirect:/administrator/member");
    }

    @RequestMapping("/delete/{id}")
    public ModelAndView delete(@PathVariable Integer id) {
        userService.delete(id);
        return new ModelAndView("redirect:/administrator/member");
    }
}