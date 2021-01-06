package be.thomasmore.graduaten.playtime.controller;


import be.thomasmore.graduaten.playtime.entity.*;
import be.thomasmore.graduaten.playtime.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.DateTimeException;
import java.time.format.DateTimeFormatter;
import java.util.*;


@Controller
public class MainController {

    @Autowired
    GebruikerService gebruikerService;

    @Autowired
    SpelService spelService;

    @Autowired
    TaalService taalService;

    @Autowired
    UitgeverService uitgeverService;

    @Autowired
    GebruikerBordspelService gebruikerBordspelService;



    @RequestMapping("/overzichtGebruikers")
    public String overzichtGebruikers(Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "overzichtGebruikers";
    }


    @RequestMapping("/")
    public String index(){
        return "index";

    }

    @RequestMapping("/overzichtSpellen")
    public String overzichtSpellen(Model model, @Param("keyword") String keyword) {
        List<Spel> spellen = spelService.getSpellenActief(keyword);
        model.addAttribute("spellen", spellen);
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);
        return "overzichtSpellen";
    }

    @RequestMapping("/overzichtWinkelwagen")
    public String overzichtWinkelwagen(Model model, @Param("keyword") String keyword) {
        List<Spel> spellen = spelService.getSpellen(keyword);
        model.addAttribute("spellen", spellen);
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);


        return "overzichtWinkelwagen";
    }

    @RequestMapping("/shoppingCart")
    public String shoppingCart( HttpServletRequest request, HttpServletResponse response,Model model, @Param("keyword") String keyword) throws ServletException, IOException
    {
        String iAction = request.getParameter("action");

        if (iAction != null && !iAction.equals("")) {
            switch (iAction) {
                case "Kopen":
                    addToCart(request);
                    break;
                case "Huren":
                    addToCart(request);
                    break;
                case "Update":
                    updateCart(request);
                    break;
                case "X":
                    deleteCart(request);
                    break;
            }
        }
        List<Spel> spellen = spelService.getSpellen(keyword);
        model.addAttribute("spellen", spellen);

        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);

        return "overzichtWinkelwagen";
    }
    protected void deleteCart(HttpServletRequest request) {
        HttpSession session = request.getSession();

        int iSTT =Integer.parseInt(request.getParameter("stt")) ;
        CartBean cartBean = null;

        Object iObject = session.getAttribute("cart");
        if (iObject != null) {
            cartBean = (CartBean) iObject;
        } else {
            cartBean = new CartBean();
        }
        cartBean.deleteCart(iSTT);
    }

    protected void updateCart(HttpServletRequest request) {
        HttpSession session = request.getSession();

        String iQuantity = request.getParameter("aantal");
        int iSTT =Integer.parseInt( request.getParameter("stt"));

        CartBean cartBean = null;

        Object objCartBean = session.getAttribute("cart");
        if (objCartBean != null) {
            cartBean = (CartBean) objCartBean;
        } else {
            cartBean = new CartBean();
        }
        cartBean.updateCart(iSTT, iQuantity);
    }

    protected void addToCart(HttpServletRequest request) {
        HttpSession session = request.getSession();

        String iId = request.getParameter("id");
        String iAfbeelding = request.getParameter("afbeelding");
        String iPrijs = request.getParameter("prijs");
        String iAantal = request.getParameter("aantal");
        String iTitel = request.getParameter("titel");

        CartBean cartBean = null;

        Object objCartBean = session.getAttribute("cart");

        if (objCartBean != null) {
            cartBean = (CartBean) objCartBean;
        } else {
            cartBean = new CartBean();
            session.setAttribute("cart", cartBean);
        }

        cartBean.addCart(iId,iAfbeelding, iPrijs, iAantal,iTitel);


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



    @RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request, Model model) {
        //Initializing maps of values and errors
        HashMap<String, String> values = new HashMap<>();
        HashMap<String, String> errors = new HashMap<>();


        String voornaam = request.getParameter(Gebruiker.VOORNAAM);
        validatieVoornaam(values, errors , voornaam);

        //Validatie Achternaam

        String achternaam = request.getParameter(Gebruiker.ACHTERNAAM);
        validatieAchternaam(values, errors , achternaam);


        String rol = "ROLE_USER";








        //Validatie email-adres
        String email = request.getParameter(Gebruiker.EMAIL);
        values.put(Gebruiker.EMAIL, email);

        int posAt = email.indexOf("@");
        int posDot = (posAt != -1) ? email.substring(posAt).indexOf(".") : -1;
        if (email.isEmpty()) {
            errors.put(Gebruiker.EMAIL, "Gelieve het e-mailadres in te vullen.");
        } else if (posAt == -1 || posDot == -1 || posDot > posAt) {
            errors.put(Gebruiker.EMAIL, "Dit e-mailadres is niet geldig.");
        } else {
            List<Gebruiker> lijstGebruikers = gebruikerService.getGebruikers();

            int count=0;
            for (Gebruiker item : lijstGebruikers)
            {
                    String itemString =item.getEmail();
                    String gebruikerString = request.getParameter(Gebruiker.EMAIL);

                    if (itemString.equals(gebruikerString))
                    {
                        count++;
                    }
            }
            if (count>0)
            {
                errors.put(Gebruiker.EMAIL, "Dit e-mailadres heeft al een PlayTime-account");
            }
        }



        String paswoord = request.getParameter(Gebruiker.PASWOORD);
        validatiePaswoord(values, errors , paswoord);




        String telefoon = request.getParameter(Gebruiker.TELEFOON);
        validatieTelefoon(values, errors , telefoon);


        String woonplaats = request.getParameter(Gebruiker.WOONPLAATS);
        validatieWoonplaats(values, errors , woonplaats);



        String postcode = request.getParameter(Gebruiker.POSTCODE);
        validatiePostcode(values, errors , postcode);



        String straat = request.getParameter(Gebruiker.STRAAT);
        validatieStraat(values, errors , straat);




        String huisnummer = request.getParameter(Gebruiker.HUISNUMMER);
        validatieHuisnummer(values, errors , huisnummer);


        String geboortedatumString = request.getParameter(Gebruiker.GEBOORTEDATUM);
        validatieGeboortedatum(values, errors , geboortedatumString);


        //Navigate to correct page with correct actions
        if (errors.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
            LocalDate date = LocalDate.parse(geboortedatumString, formatter);

            gebruikerService.addGebruiker(new Gebruiker(voornaam,achternaam, rol, date,email,paswoord,telefoon,woonplaats, postcode,straat,huisnummer));

            //Hier code toevoegen om in te loggen
            return "overzichtSpellen";
        } else {
            model.addAttribute("values", values);
            model.addAttribute("errors", errors);
            return "registratie";
        }
    }



    //VALIDATIE VOORNAAM
    private void validatieVoornaam(HashMap values,   HashMap errors, String voornaam) {
        values.put(Gebruiker.VOORNAAM, voornaam);
        if (voornaam.isEmpty()) {
            errors.put(Gebruiker.VOORNAAM, "Gelieve de voornaam in te vullen.");
        }
    }

    //VALIDATIE ACHTERNAAM
    private void validatieAchternaam(HashMap values,   HashMap errors, String achternaam) {
        values.put(Gebruiker.ACHTERNAAM, achternaam);
        if (achternaam.isEmpty()) {
            errors.put(Gebruiker.ACHTERNAAM, "Gelieve de achternaam in te vullen.");
        }
    }


    //VALIDATIE PASWOORD
    private void validatiePaswoord(HashMap values,   HashMap errors, String paswoord) {
        values.put(Gebruiker.PASWOORD, paswoord);
        if (paswoord.isEmpty()) {
            errors.put(Gebruiker.PASWOORD, "Gelieve het wachtwoord in te vullen.");
        }
    }

    //VALIDATIE WOONPLAATS
    private void validatieWoonplaats(HashMap values,   HashMap errors, String woonplaats) {
        values.put(Gebruiker.WOONPLAATS, woonplaats);
        if (woonplaats.isEmpty()) {
            errors.put(Gebruiker.WOONPLAATS, "Gelieve de woonplaats in te vullen.");
        }
    }

    //VALIDATIE STRAAT
    private void validatieStraat(HashMap values,   HashMap errors, String straat) {
        values.put(Gebruiker.STRAAT, straat);
        if (straat.isEmpty()) {
            errors.put(Gebruiker.STRAAT, "Gelieve de straat in te vullen.");
        }
    }


    //VALIDATIE HUISNUMMER
    private void validatieHuisnummer(HashMap values,   HashMap errors, String huisnummer) {
        values.put(Gebruiker.HUISNUMMER, huisnummer);
        if (huisnummer.isEmpty()) {
            errors.put(Gebruiker.HUISNUMMER, "Gelieve het huisnummer in te vullen.");
        }
    }


    //VALIDATIE POSTCODE
    private void validatiePostcode(HashMap values,   HashMap errors, String postcode) {
        values.put(Gebruiker.POSTCODE, postcode);
        if (postcode.isEmpty()) {
            errors.put(Gebruiker.POSTCODE, "Gelieve de postcode in te vullen.");
        }
    }


    //VALIDATIE TELEFOON
    private void validatieTelefoon(HashMap values,   HashMap errors, String telefoon) {
        values.put(Gebruiker.TELEFOON, telefoon);
        if (telefoon.isEmpty()) {
            errors.put(Gebruiker.TELEFOON, "Gelieve het telefoonnummer in te vullen.");
        }
    }


    //VALIDATIE GEBOORTEDATUM
    private void validatieGeboortedatum(HashMap values,   HashMap errors, String geboortedatumString) {
        values.put(Gebruiker.GEBOORTEDATUM, geboortedatumString);
        if (geboortedatumString.isEmpty()) {
            errors.put(Gebruiker.GEBOORTEDATUM, "Gelieve de geboortedatum in te vullen.");
        }
    }






}
