package com.mbstu.ict.controller;

import javax.mail.internet.MimeMessage;

import com.mbstu.ict.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SimpleEmailController3 {

    @Autowired
    private MailService mailService;

    @RequestMapping("/sendMail")
    @ResponseBody
    String home() {
        try {
            String body = "<html><body>Hi XYZ, </br>This is a test email from 'SAMS'. A service request for you. Please have a look or take necessary actions. <br>"
                           + "<a href='http://localhost:8090/serviceList' target='_blank'>Click here to preview</a>"
                           + "<body></html>";

            mailService.sendEmail("fahad.ahmed.ict13@gmail.com", "Service request from SAMS", body);
            return "Email Sent!";
        } catch (Exception ex) {
            return "Error in sending email: " + ex;
        }
    }



}