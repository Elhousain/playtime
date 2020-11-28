package be.thomasmore.graduaten.playtime.controller;


import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.Spel;
import be.thomasmore.graduaten.playtime.entity.Taal;
import be.thomasmore.graduaten.playtime.entity.Uitgever;
import be.thomasmore.graduaten.playtime.service.GebruikerService;
import be.thomasmore.graduaten.playtime.service.SpelService;
import be.thomasmore.graduaten.playtime.service.TaalService;
import be.thomasmore.graduaten.playtime.service.UitgeverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.util.List;


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

    @Autowired
    TaalService taalService;

    @Autowired
    UitgeverService uitgeverService;

    @RequestMapping("/overzichtSpellen")
    public String overzichtSpellen(Model model) {
        List<Spel> spellen = spelService.getSpellen();
        model.addAttribute("spellen", spellen);
        return "overzichtSpellen";
    }

    @RequestMapping("/overzichtGebruikers")
    public String overzichtGebruikers(Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "overzichtGebruikers";
    }

    @RequestMapping("/overzichtTalen")
    public String overzichtTalen(Model model) {
        List<Taal> talen = taalService.getTalen();
        model.addAttribute("talen", talen);
        return "overzichtTalen";
    }
    @RequestMapping("/overzichtUitgevers")
    public String overzichtUitgevers(Model model) {
        List<Uitgever> uitgevers = uitgeverService.getUitgevers();
        model.addAttribute("uitgevers", uitgevers);
        return "overzichtUitgevers";
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
