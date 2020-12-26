package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.ShopmeUserDetails;
import be.thomasmore.graduaten.playtime.service.GebruikerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccountController {

    @Autowired
    private GebruikerService service;

    @GetMapping("/account")
    public String viewUserAccountForm(
            @AuthenticationPrincipal ShopmeUserDetails userDetails,
            Model model) {
        String userEmail = userDetails.getUsername();
        Gebruiker gebruiker = service.getGebruikerByEmail(userEmail);

        model.addAttribute("gebruiker", gebruiker);
        model.addAttribute("pageTitle", "Account Details");

        return "account_form";
    }
}