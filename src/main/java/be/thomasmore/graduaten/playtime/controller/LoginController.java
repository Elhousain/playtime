package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.MyUserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String login(@AuthenticationPrincipal MyUserDetails userDetails){
        String mail="";
        try{
            mail= userDetails.getUsername();
        } catch (Exception e){
        }
        if (mail==""){
            return "login";
        } else {
            return "index";
        }
    }
}

