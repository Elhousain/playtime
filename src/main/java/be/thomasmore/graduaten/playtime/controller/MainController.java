package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.*;
import be.thomasmore.graduaten.playtime.service.*;
import org.apache.logging.log4j.status.StatusLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;


@Controller
public class MainController {


    private static final StatusLogger LOGGER = StatusLogger.getLogger();


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

    @Autowired
    PasswordEncoder passwordEncoder;


    @RequestMapping("/overzichtGebruikers")
    public String overzichtGebruikers(Model model) {
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "overzichtGebruikers";
    }


    @RequestMapping("/")
    public String index() {

        return "index";

    }

    @RequestMapping("/contact")
    public String contact() {
        return "/contact";

    }


    @RequestMapping("/overzichtSpellen")
    public String overzichtSpellen(Model model, @Param("keyword") String keyword) {
        List<Spel> spellen = spelService.getSpellenActief(keyword);
        model.addAttribute("spellen", spellen);
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);
        return "overzichtSpellen";
    }


    @RequestMapping("/eigenspellen")
    public String overzichtEigenSpellen(@AuthenticationPrincipal MyUserDetails userDetails, Model model) {
        String mail = userDetails.getUsername();
        Gebruiker gebruiker = gebruikerService.getGebruikerByEmail(mail);


        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        List<GebruikerBordspel> eigenGebruikerBordspellen = new ArrayList<GebruikerBordspel>();


        for (GebruikerBordspel gebruikerBordspel : gebruikerBordspellen) {
            if (gebruikerBordspel.getGebruiker().equals(gebruiker)) {
                eigenGebruikerBordspellen.add(gebruikerBordspel);
            }
        }


        model.addAttribute("eigenGebruikerBordspellen", eigenGebruikerBordspellen);
        return "gebruikerbordspel-eigendata";
    }

    @RequestMapping("/registratie")
    public String navigateForm(@AuthenticationPrincipal MyUserDetails userDetails,Model model) {

        String  mail="";

        try {
            mail= userDetails.getUsername();
        } catch (Exception e) {
            //LOGGER.error("", e);
        }



        if (!mail.equals("")) {
            return "/error/403";
        }
        else  {
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


    }

    @RequestMapping("/data-add-gebruiker")
    public String dataAddGebruiker(HttpServletRequest request, Model model) {
        //Initializing maps of values and errors
        HashMap<String, String> values = new HashMap<>();
        HashMap<String, String> errors = new HashMap<>();


        String voornaam = request.getParameter(Gebruiker.VOORNAAM);
        validatieVoornaam(values, errors, voornaam);

        //Validatie Achternaam

        String achternaam = request.getParameter(Gebruiker.ACHTERNAAM);
        validatieAchternaam(values, errors, achternaam);

        //set role as Klant bij registratie
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

            int count = 0;
            for (Gebruiker item : lijstGebruikers) {
                String itemString = item.getEmail();
                String gebruikerString = request.getParameter(Gebruiker.EMAIL);

                if (itemString.equals(gebruikerString)) {
                    count++;
                }
            }
            if (count > 0) {
                errors.put(Gebruiker.EMAIL, "Dit e-mailadres heeft al een PlayTime-account");
            }
        }


        String paswoord = request.getParameter(Gebruiker.PASWOORD);
        validatiePaswoord(values, errors, paswoord);
        String hashedPassword = passwordEncoder.encode(paswoord);


        String telefoon = request.getParameter(Gebruiker.TELEFOON);
        validatieTelefoon(values, errors, telefoon);


        String woonplaats = request.getParameter(Gebruiker.WOONPLAATS);
        validatieWoonplaats(values, errors, woonplaats);


        String postcode = request.getParameter(Gebruiker.POSTCODE);
        validatiePostcode(values, errors, postcode);


        String straat = request.getParameter(Gebruiker.STRAAT);
        validatieStraat(values, errors, straat);


        String huisnummer = request.getParameter(Gebruiker.HUISNUMMER);
        validatieHuisnummer(values, errors, huisnummer);


        String geboortedatumString = request.getParameter(Gebruiker.GEBOORTEDATUM);
        validatieGeboortedatum(values, errors, geboortedatumString);


        //Navigate to correct page with correct actions
        if (errors.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd", Locale.ENGLISH);
            LocalDate date = LocalDate.parse(geboortedatumString, formatter);

            gebruikerService.addGebruiker(new Gebruiker(voornaam, achternaam, rol, date, email, hashedPassword, telefoon, woonplaats, postcode, straat, huisnummer));


            try {
                request.login(email, paswoord);
            } catch (ServletException e) {
                LOGGER.error("Error while login ", e);
            }


            //Hier code toevoegen om in te loggen
            return "redirect:/overzichtSpellen";
        } else {
            values.put(Gebruiker.PASWOORD, "");
            model.addAttribute("values", values);
            model.addAttribute("errors", errors);
            return "registratie";
        }
    }


    //VALIDATIE VOORNAAM
    private void validatieVoornaam(HashMap values, HashMap errors, String voornaam) {
        values.put(Gebruiker.VOORNAAM, voornaam);
        if (voornaam.isEmpty()) {
            errors.put(Gebruiker.VOORNAAM, "Gelieve de voornaam in te vullen.");
        }
    }

    //VALIDATIE ACHTERNAAM
    private void validatieAchternaam(HashMap values, HashMap errors, String achternaam) {
        values.put(Gebruiker.ACHTERNAAM, achternaam);
        if (achternaam.isEmpty()) {
            errors.put(Gebruiker.ACHTERNAAM, "Gelieve de achternaam in te vullen.");
        }
    }


    //VALIDATIE PASWOORD
    private void validatiePaswoord(HashMap values, HashMap errors, String paswoord) {
        values.put(Gebruiker.PASWOORD, paswoord);
        if (paswoord.isEmpty()) {
            errors.put(Gebruiker.PASWOORD, "Gelieve het wachtwoord in te vullen.");
        }
    }

    //VALIDATIE WOONPLAATS
    private void validatieWoonplaats(HashMap values, HashMap errors, String woonplaats) {
        values.put(Gebruiker.WOONPLAATS, woonplaats);
        if (woonplaats.isEmpty()) {
            errors.put(Gebruiker.WOONPLAATS, "Gelieve de woonplaats in te vullen.");
        }
    }

    //VALIDATIE STRAAT
    private void validatieStraat(HashMap values, HashMap errors, String straat) {
        values.put(Gebruiker.STRAAT, straat);
        if (straat.isEmpty()) {
            errors.put(Gebruiker.STRAAT, "Gelieve de straat in te vullen.");
        }
    }


    //VALIDATIE HUISNUMMER
    private void validatieHuisnummer(HashMap values, HashMap errors, String huisnummer) {
        values.put(Gebruiker.HUISNUMMER, huisnummer);
        if (huisnummer.isEmpty()) {
            errors.put(Gebruiker.HUISNUMMER, "Gelieve het huisnummer in te vullen.");
        }
    }


    //VALIDATIE POSTCODE
    private void validatiePostcode(HashMap values, HashMap errors, String postcode) {
        values.put(Gebruiker.POSTCODE, postcode);
        if (postcode.isEmpty()) {
            errors.put(Gebruiker.POSTCODE, "Gelieve de postcode in te vullen.");
        }
    }


    //VALIDATIE TELEFOON
    private void validatieTelefoon(HashMap values, HashMap errors, String telefoon) {
        values.put(Gebruiker.TELEFOON, telefoon);
        if (telefoon.isEmpty()) {
            errors.put(Gebruiker.TELEFOON, "Gelieve het telefoonnummer in te vullen.");
        } else {
            int n = telefoon.length();
            int aantalNietNummers = 0;

            for (int i = 0; i < n; i++) {

                // Check if the sepecified
                // character is a digit then
                // return true,
                // else return false
                if (!Character.isDigit(telefoon.charAt(i))) {
                    aantalNietNummers++;
                }
            }
            if (aantalNietNummers > 0) {
                errors.put(Gebruiker.TELEFOON, "Het telefoonnummer mag enkel getallen bevatten [0-1-2-3-4-5-6-7-8-9]");
            }

        }


    }


    //VALIDATIE GEBOORTEDATUM
    private void validatieGeboortedatum(HashMap values, HashMap errors, String geboortedatumString) {
        values.put(Gebruiker.GEBOORTEDATUM, geboortedatumString);
        if (geboortedatumString.isEmpty()) {
            errors.put(Gebruiker.GEBOORTEDATUM, "Gelieve de geboortedatum in te vullen.");
        }
    }


}
