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
import java.time.DateTimeException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;


@Controller
public class MainController {

    @Autowired

    GebruikerService gebruikerService;


    @RequestMapping("/")
    public String index(){
        return "index";

    }
    @RequestMapping("/overzichtWinkelwagen")
    public String overzichtWinkelwagen()
    {
        return "overzichtWinkelwagen";
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
        List<Taal> talen = taalService.getTalen();
        model.addAttribute("talen", talen);
        List<Uitgever> uitgevers = uitgeverService.getUitgevers();
        model.addAttribute("uitgevers", uitgevers);
        return "overzichtSpellen";
    }

    @RequestMapping("/overzichtGebruikers")
    public String overzichtGebruikers(Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "overzichtGebruikers";
    }


   /* @RequestMapping("/registratie")
    public String registratie(){
        return "registratie";
    }*/


    @RequestMapping("/registratie")
    public String navigateForm(Model model) {
        HashMap<String, String> values = new HashMap<>();
        HashMap<String, String> errors = new HashMap<>();
        values.put(Gebruiker.VOORNAAM, "");
       values.put(Gebruiker.ACHTERNAAM, "");
        values.put(Gebruiker.EMAIL, "");
        values.put(Gebruiker.TELEFOON, "");
        values.put(Gebruiker.GEBOORTEDATUM, "");
        values.put(Gebruiker.STRAAT, "");
        values.put(Gebruiker.PASWOORD, "");
        values.put(Gebruiker.POSTCODE, "");
        values.put(Gebruiker.WOONPLAATS, "");
        values.put(Gebruiker.HUISNUMMER, "");
        model.addAttribute("values", values);
        model.addAttribute("errors", errors);
        return "registratie";
    }


    /*@RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request) {
        String voornaam = request.getParameter("voornaam");
        String achternaam = request.getParameter("achternaam");
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
    } */


    @RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request, Model model) {
        //Initializing maps of values and errors
        HashMap<String, String> values = new HashMap<>();
        HashMap<String, String> errors = new HashMap<>();

        //Validatie voornaam
        String voornaam = request.getParameter(Gebruiker.VOORNAAM);
        values.put(Gebruiker.VOORNAAM, voornaam);
        if (voornaam.isEmpty()) {
            errors.put(Gebruiker.VOORNAAM, "Gelieve de voornaam in te vullen.");
        }


        //Validatie Achternaam
        String achternaam = request.getParameter(Gebruiker.ACHTERNAAM);
        values.put(Gebruiker.ACHTERNAAM, achternaam);
        if (achternaam.isEmpty()) {
            errors.put(Gebruiker.ACHTERNAAM, "Gelieve de familienaam in te vullen.");
        }


        String rol = "ROLE_USER";


        //Validatie Geboortedatum
        String geboortedatumString = request.getParameter(Gebruiker.GEBOORTEDATUM);
        values.put(Gebruiker.GEBOORTEDATUM, geboortedatumString);
        LocalDate geboortedatum = null;
        if (geboortedatumString.isEmpty())
            {
                errors.put(Gebruiker.GEBOORTEDATUM, "Gelieve de geboortedatum in te vullen.");
            }






        //Validatie email-adres
        String email = request.getParameter(Gebruiker.EMAIL);
        values.put(Gebruiker.EMAIL, email);

        int posAt = email.indexOf("@");
        int posDot = (posAt != -1) ? email.substring(posAt).indexOf(".") : -1;
        if (email.isEmpty()) {
            errors.put(Gebruiker.EMAIL, "Gelieve het e-mailadres in te vullen.");
        } else if (posAt == -1 || posDot == -1 || posDot > posAt) {
            errors.put(Gebruiker.EMAIL, "Dit e-mailadres is niet geldig.");
        }



        //Validatie Paswoord
        String paswoord = request.getParameter(Gebruiker.PASWOORD);
        values.put(Gebruiker.PASWOORD, paswoord);
        if (paswoord.isEmpty()) {
            errors.put(Gebruiker.PASWOORD, "Gelieve een wachtwoord te kiezen.");
        }




        //Validatie Telefoon
        String telefoon = request.getParameter(Gebruiker.TELEFOON);
        values.put(Gebruiker.TELEFOON, telefoon);
        if (telefoon.isEmpty()) {
            errors.put(Gebruiker.TELEFOON, "Gelieve een telefoonnummer in te vullen.");
        }


        //Validatie Woonplaats
        String woonplaats = request.getParameter(Gebruiker.WOONPLAATS);
        values.put(Gebruiker.WOONPLAATS, woonplaats);
        if (woonplaats.isEmpty()) {
            errors.put(Gebruiker.WOONPLAATS, "Gelieve de woonplaats in te vullen.");
        }



        //Validatie Postcode
        String postcode = request.getParameter(Gebruiker.POSTCODE);
        values.put(Gebruiker.POSTCODE, postcode);
        if (postcode.isEmpty()) {
            errors.put(Gebruiker.POSTCODE, "Gelieve de postcode in te vullen.");
        }



        //Validatie Straat
        String straat = request.getParameter(Gebruiker.STRAAT);
        values.put(Gebruiker.STRAAT, straat);
        if (straat.isEmpty()) {
            errors.put(Gebruiker.STRAAT, "Gelieve de straatnaam in te vullen.");
        }




        //Validatie Huisnummer
        String huisnummer = request.getParameter(Gebruiker.HUISNUMMER);
        values.put(Gebruiker.HUISNUMMER, huisnummer);
        if (huisnummer.isEmpty()) {
            errors.put(Gebruiker.HUISNUMMER, "Gelieve het huisnummer in te vullen.");
        }

        //Navigate to correct page with correct actions
        if (errors.isEmpty()) {


            gebruikerService.addGebruiker(new Gebruiker(voornaam,achternaam, rol, geboortedatum,email,paswoord,telefoon,woonplaats, postcode,straat,huisnummer));
            return "index";
        } else {
            model.addAttribute("values", values);
            model.addAttribute("errors", errors);
            return "registratie";
        }
    }








}
