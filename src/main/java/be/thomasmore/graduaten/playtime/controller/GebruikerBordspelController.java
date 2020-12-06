package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import be.thomasmore.graduaten.playtime.service.GebruikerBordspelService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;
import java.util.List;


@Controller
@RequestMapping("gebruikerBordspel")

public class GebruikerBordspelController {

    @Autowired GebruikerBordspelService gebruikerBordspelService;

    @GetMapping ("/list")
        public String lijstGebruikerBordspellen (Model model)
        {
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen",gebruikerBordspellen);
        return "list-gebruikerBordspellen";
        }

    @GetMapping ("showForm")
    public String showFormForAdd(Model model)
    {
        GebruikerBordspel gebruikerBordspel = new GebruikerBordspel();
        model.addAttribute("gebruikerBordspel",gebruikerBordspel);
        return "gebruikerBordspel-form";
    }

    @PostMapping("/saveGebruikerBordspel")
    public String saveGebruikerBordspel(@ModelAttribute("gebruikerBordspel") GebruikerBordspel gebruikerBordspel)
    {
        gebruikerBordspelService.addGebruikerBordspel(gebruikerBordspel);
        return "redirect:/gebruikerBordspel/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("gebruikerBordspelId") int id, Model model) {
        GebruikerBordspel gebruikerBordspel = gebruikerBordspelService.getGebruikerBordspelById((long) id);
        model.addAttribute("gebruikerBordspel", gebruikerBordspel);
        return "gebruikerBordspel-form";
    }

    @GetMapping("/delete")
    public String deleteGebruikerBordspel(@RequestParam("gebruikerBordspelId") Long id)  {
        gebruikerBordspelService.deleteGebruikerBordspel(id);
        return "redirect:/gebruikerBordspel/list";
    }

}
