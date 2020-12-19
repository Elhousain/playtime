package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.service.GebruikerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("gebruiker")
public class GebruikerController {

    @Autowired
    GebruikerService gebruikerService;

    @GetMapping("/list")
        public String lijstgebruikers (Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "list-gebruikers";
    }

    @GetMapping("showForm")
    public String showFormForAdd(Model model){
        Gebruiker gebruiker = new Gebruiker();
        model.addAttribute("gebruiker", gebruiker);
        return "gebruiker-form";
    }

    @PostMapping("/saveGebruiker")
    public String saveGebruiker(@ModelAttribute("gebruiker")Gebruiker gebruiker){
       gebruiker.setRol("ROLE_USER");

        gebruikerService.addGebruiker(gebruiker);
        return "redirect:/gebruiker/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("gebruikerId") int id, Model model){
        Gebruiker gebruiker = gebruikerService.getGebruikerById((long) id);
        model.addAttribute("gebruiker", gebruiker);
        return "gebruiker-form";
    }

    @GetMapping("/delete")
    public String deleteGebruiker(@RequestParam("gebruikerId") long id){
        gebruikerService.deleteGebruiker(id);
        return "redirect:/gebruiker/list";
    }


}
