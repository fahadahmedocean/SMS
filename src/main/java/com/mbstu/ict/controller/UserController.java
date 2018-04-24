package com.mbstu.ict.controller;

import com.mbstu.ict.dao.BarberRepository;
import com.mbstu.ict.dao.UserRepository;
import com.mbstu.ict.model.Barber;
import com.mbstu.ict.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;


    @RequestMapping(value = "/upsertUser", method = RequestMethod.GET)
    public String userView(Model model, @RequestParam(value="userId", required=false) Integer userId) {
        System.out.println("-----------index-------------userId:"+userId);
        User user = new User();

        if(userId != null && userId > 0){
            user = userRepository.getUserById(userId);
        }

        model.addAttribute("user", user);
        return "user";
    }

    @RequestMapping(value = "/upsertUser", method = RequestMethod.POST)
    public String userPost(Model model, @ModelAttribute("user") User user, HttpServletRequest request) {
        System.out.println("-----------userPost-------------");
        System.out.println(user);

        try{
            userRepository.save(user);
            request.setAttribute("message", "User saved successfully");
        }catch(Exception e){
            request.setAttribute("message", "Faild to save User");
        }
        return "redirect:./userList";
    }

    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String userListView(Model model) {
        System.out.println("-----------User list view -------------");
        model.addAttribute("userList", userRepository.findAll());
        return "userList";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deleteUser(Model model, @RequestParam(value="userId", required=true) Integer userId) {
        System.out.println("-----------delete-------------userId:"+userId);
        User user = userRepository.getUserById(userId);
        userRepository.delete(user);
        return "redirect:./userList";
    }
}
