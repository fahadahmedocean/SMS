package com.mbstu.ict.controller;

import com.mbstu.ict.dao.ItemRepository;
import com.mbstu.ict.dao.UserRepository;
import com.mbstu.ict.model.Item;
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
public class ItemController {

    @Autowired
    private ItemRepository itemRepository;


    @RequestMapping(value = "/upsertItem", method = RequestMethod.GET)
    public String itemView(Model model, @RequestParam(value="itemId", required=false) Integer itemId) {
        System.out.println("-----------index-------------itemId:"+itemId);
        Item item = new Item();

        if(itemId != null && itemId > 0){
            item = itemRepository.getItemById(itemId);
        }

        model.addAttribute("item", item);
        return "item";
    }

    @RequestMapping(value = "/upsertItem", method = RequestMethod.POST)
    public String itemPost(Model model, @ModelAttribute("item") Item item, HttpServletRequest request) {
        System.out.println("-----------itemPost-------------");
        System.out.println(item);

        try{
            itemRepository.save(item);
            request.setAttribute("message", "Item saved successfully");
        }catch(Exception e){
            request.setAttribute("message", "Faild to save Item");
        }
        return "redirect:./itemList";
    }

    @RequestMapping(value = "/itemList", method = RequestMethod.GET)
    public String itemListView(Model model) {
        System.out.println("-----------Item list view -------------");
        model.addAttribute("itemList", itemRepository.findAll());
        return "itemList";
    }

    @RequestMapping(value = "/deleteItem", method = RequestMethod.GET)
    public String deleteItem(Model model, @RequestParam(value="itemId", required=true) Integer itemId) {
        System.out.println("-----------delete-------------itemId:"+itemId);
        Item item = itemRepository.getItemById(itemId);
        itemRepository.delete(item);
        return "redirect:./itemList";
    }
}
