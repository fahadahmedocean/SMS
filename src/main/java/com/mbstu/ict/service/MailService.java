package com.mbstu.ict.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;

/**
 * Created by habib on 1/7/18.
 */

@Service
public class MailService {

    @Autowired
    private JavaMailSender sender;


    public void sendEmail(String toAddress, String subject, String body) throws Exception {
        MimeMessage message = sender.createMimeMessage();

        // Enable the multipart flag!
        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setTo(toAddress);
        helper.setText(body, true);
        helper.setSubject(subject);

//        ClassPathResource file = new ClassPathResource("cat.jpg");
//        helper.addInline("id101", file);

        sender.send(message);
    }
}
