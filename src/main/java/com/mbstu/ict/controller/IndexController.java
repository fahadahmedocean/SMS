package com.mbstu.ict.controller;

import com.mbstu.ict.Utils;
import com.mbstu.ict.dao.BarberRepository;
import com.mbstu.ict.dao.ServiceRepository;
import com.mbstu.ict.dao.UserRepository;
import com.mbstu.ict.model.Barber;
import com.mbstu.ict.model.Service;
import com.mbstu.ict.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


@Controller
public class IndexController {

    @Autowired
    private ServiceRepository serviceRepository;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BarberRepository barberRepository;


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        System.out.println("-----------index-------------");
        User user = userRepository.getUserByUserName(Utils.getLoggedUserName());
        List<Service> serviceList = new ArrayList<>();

        if(user.getBarber() != null && user.getBarber().getId() > 0){
            serviceList = serviceRepository.getServiceByBarberId(user.getBarber().getId());
            Barber barber = barberRepository.getBarberById(user.getBarber().getId());
            model.addAttribute("barber", barber);
        }

        model.addAttribute("serviceList", serviceList);

        return "index";
    }
}
