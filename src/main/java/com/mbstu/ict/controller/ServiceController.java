package com.mbstu.ict.controller;

import com.mbstu.ict.Utils;
import com.mbstu.ict.dao.BarberRepository;
import com.mbstu.ict.dao.ItemRepository;
import com.mbstu.ict.dao.ServiceRepository;
import com.mbstu.ict.model.Barber;
import com.mbstu.ict.model.Item;
import com.mbstu.ict.model.Service;
import com.mbstu.ict.service.MailService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;


@Controller
public class ServiceController {

    @Autowired
    private ServiceRepository serviceRepository;
    @Autowired
    private BarberRepository barberRepository;
    @Autowired
    private ItemRepository itemRepository;
    @Autowired
    private MailService mailService;

    @RequestMapping(value = "/upsertService", method = RequestMethod.GET)
    public String serviceView(Model model, @RequestParam(value="serviceId", required=false) Integer serviceId) {
        System.out.println("-----------index-------------serviceId:"+serviceId);
        Service service = new Service();

        List<Barber> barberList = barberRepository.findAll();
        List<Item> itemList = itemRepository.findAll();

        if(serviceId != null && serviceId > 0){
            service = serviceRepository.getServiceById(serviceId);
        }

        model.addAttribute("service", service);
        model.addAttribute("barberList", barberList);
        model.addAttribute("itemList", itemList);
        return "service";
    }

    @RequestMapping(value = "/upsertService", method = RequestMethod.POST)
    public String servicePost(Model model, @ModelAttribute("service") Service service, HttpServletRequest request) {
        System.out.println("-----------servicePost-------------");
        System.out.println(service);

        try{
            Integer id = service.getId();
//            service.setCompletedDate(new Date());

            Barber barber = barberRepository.getBarberById(service.getBarber().getId());
            Item item = itemRepository.getItemById(service.getItem().getId());

            if(id == null || id < 1){
                String body = "<html><body>Hi "+barber.getName()+", </br>This is a test email from user '"
                        + Utils.getLoggedUserName()
                        +"'. A service request for you. Please have a look or take necessary actions. <br>"
                        + "<span>Item Code:"+ item.getCode() +"</span>"
                        + "<span>Item Name:"+ item.getName()+"</span>"
                        + "<span>Service Charge:"+ item.getCharge() +"</span>"
                        + "<span><a href='http://localhost:8090/serviceList' target='_blank'>Click here to preview</a></span>"
                        + "<body></html>";

                mailService.sendEmail(barber.getEmail(), "Service request from SAMS", body);
                System.out.println("Mail send successfully....");

                service.setStatus("PENDING");
            }

            serviceRepository.save(service);

            request.setAttribute("message", "Service saved successfully");
        }catch(Exception e){
            request.setAttribute("message", "Faild to save Service");
        }
        return "redirect:./serviceList";
    }

    @RequestMapping(value = "/serviceList", method = RequestMethod.GET)
    public String serviceListView(Model model) {
        System.out.println("-----------Service list view -------------");
        model.addAttribute("serviceList", serviceRepository.findAll());
        return "serviceList";
    }

    @RequestMapping(value = "/deleteService", method = RequestMethod.GET)
    public String deleteService(Model model, @RequestParam(value="serviceId", required=true) Integer serviceId) {
        System.out.println("-----------delete-------------serviceId:"+serviceId);
        Service service = serviceRepository.getServiceById(serviceId);
        serviceRepository.delete(service);
        return "redirect:./serviceList";
    }

    @RequestMapping(value = "/getItemById", method = RequestMethod.GET)
    public @ResponseBody
    Integer getItemById(Model model, @RequestParam(value="itemId", required=true) Integer itemId) {
        System.out.println("-----------getItemById-------------itemId:"+itemId);
        Item item = itemRepository.getItemById(itemId);
        return item.getCharge();
    }

    @RequestMapping(value = "/changeServiceStatus", method = RequestMethod.GET)
    public String changeServiceStatus(Model model, @RequestParam(value="status", required=true) String status,
            @RequestParam(value="serviceId", required=true) Integer serviceId) {
        System.out.println("-----------changeServiceStatus-------------status:"+status);
        Service service = serviceRepository.getServiceById(serviceId);
        service.setStatus(status);
        serviceRepository.save(service);
        return "redirect:./";
    }
}
