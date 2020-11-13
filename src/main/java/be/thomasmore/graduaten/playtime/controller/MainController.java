package be.thomasmore.graduaten.playtime.controller;


import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.List;

import be.thomasmore.graduaten.playtime.service.GebruikerService;

import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.service.SpelService;





@Controller
public class MainController {

    @Autowired

    GebruikerService gebruikerService;


    @RequestMapping("/")
    public String index(){
        return "index";

    }

    @Autowired
    SpelService spelService;

    @RequestMapping("/overzichtSpellen")
    public String overzichtSpellen(Model model) {
        List<Spel> spellen = spelService.getSpellen();
        model.addAttribute("spellen", spellen);
        return "overzichtSpellen";
    }

    @RequestMapping("/overzichtGebruikers")
    public String overzichtGebruikers(Model model) {
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "overzichtGebruikers";
    }




    @RequestMapping("/registratie")
    public String registratie(){
        return "registratie";
    }


    @RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request) {
        String voornaam = request.getParameter("voornaam");
        String achternaam = request.getParameter("achternaam");



        /*DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
        LocalDate geboortedatum = LocalDate.parse(request.getParameter("geboortedatum"));*/

        LocalDate geboortedatum = LocalDate.parse(request.getParameter("geboortedatum"));

        String email = request.getParameter("email");
        String paswoord = request.getParameter("paswoord");
        String telefoon = request.getParameter("telefoon");
        String woonplaats = request.getParameter("woonplaats");
        String postcode = request.getParameter("postcode");
        String straat = request.getParameter("straat");
        String huisnummer = request.getParameter("huisnummer");


        Gebruiker gebruiker = new Gebruiker(voornaam,achternaam,geboortedatum,email,paswoord,telefoon,woonplaats, postcode,straat,huisnummer);
        gebruikerService.addGebruiker(gebruiker);
        return "index";
    }

}
