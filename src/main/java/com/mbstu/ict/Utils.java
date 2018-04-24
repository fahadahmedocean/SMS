package com.mbstu.ict;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Created by habib on 1/7/18.
 */
public class Utils {

    public static String getLoggedUserName(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = null ;
        name = auth.getName();
        return name;
    }

}
