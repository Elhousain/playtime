package be.thomasmore.graduaten.playtime.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @Autowired


    @RequestMapping("/")
    public String index(){
        return "index";

    }



}
