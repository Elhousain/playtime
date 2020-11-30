package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.service.SpelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;
import java.util.List;

@Controller
@RequestMapping("spel")
public class SpelController {

    @Autowired SpelService spelService;

    @GetMapping ("/list")
    public String lijstSpellen (Model model){
        List<Spel> spellen = spelService.getSpellen();
        model.addAttribute("spellen",spellen);
        return "list-spellen";
    }

    @GetMapping ("showForm")
    public String showFormForAdd(Model model){
        Spel spel = new Spel();
        model.addAttribute("spel", spel);
        return "spel-form";
    }

    @PostMapping("/saveSpel")
    public String saveSpel(@ModelAttribute("spel") Spel spel){
        spelService.addSpel(spel);
        return "redirect:/spel/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("spelId") int id, Model model) {
        Spel spel = spelService.getSpelById((long) id);
        model.addAttribute("spel", spel);
        return "spel-form";
    }

    @GetMapping("/delete")
    public String deleteSpel(@RequestParam("spelId") Long id)  {
        spelService.deleteSpel(id);
        return "redirect:/spel/list";
    }
}
