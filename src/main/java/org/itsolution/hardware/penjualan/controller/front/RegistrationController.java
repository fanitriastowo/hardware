package org.itsolution.hardware.penjualan.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.itsolution.hardware.penjualan.dto.UserDTO;
import org.itsolution.hardware.penjualan.entity.UserEntity;
import org.itsolution.hardware.penjualan.event.OnCompleteRegistrationEvent;
import org.itsolution.hardware.penjualan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Autowired
    private UserService userService;

    @RequestMapping
    public ModelAndView registrationPage() {
        ModelAndView modelAndView = new ModelAndView("front/registration");
        modelAndView.addObject("user", new UserDTO());
        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView registerNewMember(@ModelAttribute("user") UserDTO userDTO, final HttpServletRequest request) {
        final UserEntity userEntity = userService.registerNewUser(userDTO);
        eventPublisher
                .publishEvent(new OnCompleteRegistrationEvent(getAppUrl(request), request.getLocale(), userEntity));
        return new ModelAndView("redirect:/login");
    }

    @RequestMapping("/registration_confirm")
    public ModelAndView confirmRegistrationMember(@RequestParam("token") final String token) {
        final String result = userService.validateVerificationToken(token);
        System.out.println(result);
        return new ModelAndView("redirect:/login");
    }

    // NON API
    private String getAppUrl(HttpServletRequest request) {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
                + "/registration";
    }
}
