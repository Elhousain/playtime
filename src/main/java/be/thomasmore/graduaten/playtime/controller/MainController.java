package be.thomasmore.graduaten.playtime.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.service.GebruikerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    GebruikerService gebruikerService;


    @RequestMapping("/")
    public String index(){
        return "index";
    }

    @RequestMapping("/registratie")
    public String registratie(){
        return "registratie";
    }


    /*@RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request) {
        //Long id = request.getParameter("id");
        Long id;
        String voornaam = request.getParameter("voornaam");
        String achternaam = request.getParameter("achternaam");
        Date geboortedatum = request.getParameter("geboortedatum");
        String email = request.getParameter("email");
        String paswoord = request.getParameter("paswoord");
        String telefoon = request.getParameter("telefoon");
        String woonplaats = request.getParameter("woonplaats");
        String postcode = request.getParameter("postcode");
        String straat = request.getParameter("straat");
        String huisnummer = request.getParameter("huisnummer");
       Gebruiker gebruiker = new Gebruiker(voornaam,achternaam,email,paswoord,telefoon,woonplaats,postcode,straat,huisnummer);
       //GebruikerService.addGebruiker(gebruiker);
        GebruikerService.addGebruiker(gebruiker);
        return "index";
        Gebruiker gebruiker = new Gebruiker();
        String voornaam = request.getParameter("voornaam");
        gebruiker.setVoornaam(voornaam);
        String achternaam = request.getParameter("achternaam");
        gebruiker.setAchternaam(achternaam);
        return "index";
    }  */


    @RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request) {
        String voornaam = request.getParameter("voornaam");
        String achternaam = request.getParameter("achternaam");
        //Date geboortedatum = (Date) request.getParameter("geboortedatum");
        String email = request.getParameter("email");
        String paswoord = request.getParameter("paswoord");
        String telefoon = request.getParameter("telefoon");
        String woonplaats = request.getParameter("woonplaats");
        String postcode = request.getParameter("postcode");
        String straat = request.getParameter("straat");
        String huisnummer = request.getParameter("huisnummer");


        Gebruiker gebruiker = new Gebruiker(voornaam,achternaam,email,paswoord,telefoon,woonplaats, postcode,straat,huisnummer);
        gebruikerService.addGebruiker(gebruiker);
        return "index";
    }


}
