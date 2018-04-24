package com.mbstu.ict.controller;

import com.mbstu.ict.dao.BarberRepository;
import com.mbstu.ict.model.Barber;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class BarberController {

    @Autowired
    private BarberRepository barberRepository;


    @RequestMapping(value = "/upsertBarber", method = RequestMethod.GET)
    public String barberView(Model model, @RequestParam(value="barberId", required=false) Integer barberId) {
        System.out.println("-----------index-------------barberId:"+barberId);
        Barber barber = new Barber();

        if(barberId != null && barberId > 0){
            barber = barberRepository.getBarberById(barberId);
        }

        model.addAttribute("barber", barber);
        return "barber";
    }

    @RequestMapping(value = "/upsertBarber", method = RequestMethod.POST)
    public String barberPost(Model model, @ModelAttribute("barber") Barber barber, HttpServletRequest request) {
        System.out.println("-----------barberPost-------------");
        System.out.println(barber);

        try{
            barberRepository.save(barber);
            request.setAttribute("message", "Barber saved successfully");
        }catch(Exception e){
            request.setAttribute("message", "Faild to save Barber");
        }
        return "redirect:./barberList";
    }

    @RequestMapping(value = "/barberList", method = RequestMethod.GET)
    public String barberListView(Model model) {
        System.out.println("-----------Barber list view -------------");
        model.addAttribute("barberList", barberRepository.findAll());
        return "barberList";
    }

    @RequestMapping(value = "/deleteBarber", method = RequestMethod.GET)
    public String deleteBarber(Model model, @RequestParam(value="barberId", required=true) Integer barberId) {
        System.out.println("-----------delete-------------barberId:"+barberId);
        Barber barber = barberRepository.getBarberById(barberId);
        barberRepository.delete(barber);
        return "redirect:./barberList";
    }

    @RequestMapping(value = "/report", method = RequestMethod.GET)
    public String reportView(Model model) {
        System.out.println("-----------report-------------");
        return "report";
    }

    @RequestMapping(value = "/getBarberDetails", method = RequestMethod.GET)
    public @ResponseBody
    JSONObject getBarberDetails(Model model, @RequestParam(value="barberId", required=true) Integer barberId) {
        System.out.println("-----------getBarberDetails-------------");
        return JSONObject.fromObject(barberRepository.getBarberById(barberId));
    }
}
