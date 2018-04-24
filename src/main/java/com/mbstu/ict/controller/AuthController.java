package com.mbstu.ict.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by habib on 12/30/17.
 */

@Controller
public class AuthController {

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String loginView(Model model) {

       return "login";
    }

}
