package be.thomasmore.graduaten.playtime.controller;
import be.thomasmore.graduaten.playtime.entity.*;
import be.thomasmore.graduaten.playtime.service.GebruikerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;



@Controller
@RequestMapping("gebruiker")
public class GebruikerController {

    @Autowired
    GebruikerService gebruikerService;

    String oorspronkelijkeMail;
    String oorspronkelijkeRol;


    @GetMapping("/list")
        public String lijstgebruikers (@AuthenticationPrincipal MyUserDetails userDetails,Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);

        String mail= userDetails.getUsername();
        Gebruiker ingelogdeGebruiker = gebruikerService.getGebruikerByEmail(mail);
        model.addAttribute("ingelogdeGebruiker", ingelogdeGebruiker);
        return "list-gebruikers";
    }




    @GetMapping("/eigendata")
    public String eigenGebruiker (@AuthenticationPrincipal MyUserDetails userDetails,Model model){
        String mail= userDetails.getUsername();
        Gebruiker gebruiker = gebruikerService.getGebruikerByEmail(mail);
        model.addAttribute("gebruiker", gebruiker);
        return "gebruiker-eigendata";
    }




    @GetMapping("showForm")
    public String showFormForAdd(@AuthenticationPrincipal MyUserDetails userDetails,Model model, HttpServletRequest request){
        Gebruiker gebruiker = new Gebruiker();
        UserError userError = new UserError();

        model.addAttribute(Gebruiker.NAME, gebruiker);
        model.addAttribute(UserError.NAME, userError);

        oorspronkelijkeMail = "";
        oorspronkelijkeRol = "";
        return "gebruiker-form";
    }





    @PostMapping("/saveGebruiker")
    public String saveGebruiker(@AuthenticationPrincipal MyUserDetails userDetails,HttpServletRequest request, Model model)  {
        Gebruiker gebruiker = new Gebruiker();
        UserError userError = new UserError();
        String mail= userDetails.getUsername();
        Gebruiker ingelogdeGebruiker = gebruikerService.getGebruikerByEmail(mail);

        validatieId(gebruiker, request.getParameter(Gebruiker.ID));
        validatieVoornaam(gebruiker, userError, request.getParameter(Gebruiker.VOORNAAM));
        validatieAchternaam(gebruiker, userError, request.getParameter(Gebruiker.ACHTERNAAM));
        validatieGeboortedatum(gebruiker, userError, request.getParameter(Gebruiker.GEBOORTEDATUM));
        validatieWoonplaats(gebruiker, userError, request.getParameter(Gebruiker.WOONPLAATS));
        validatieStraat(gebruiker, userError, request.getParameter(Gebruiker.STRAAT));
        validatieHuisnummer(gebruiker, userError, request.getParameter(Gebruiker.HUISNUMMER));
        validatiePostcode(gebruiker, userError, request.getParameter(Gebruiker.POSTCODE));
        validatieTelefoon(gebruiker, userError, request.getParameter(Gebruiker.TELEFOON));
        validatieEmail(gebruiker, userError, request.getParameter(Gebruiker.EMAIL));
        validatiePaswoord(gebruiker, userError, request.getParameter(Gebruiker.PASWOORD));

        if (ingelogdeGebruiker.getRol().equals("ROLE_ADMIN"))
        {
            validatieRol(gebruiker, userError, request.getParameter(Gebruiker.ROL));
        }
        else
        {
            gebruiker.setRol("ROLE_USER");
        }

        if (userError.hasErrors) {

            model.addAttribute("ingelogdeGebruiker", ingelogdeGebruiker);
            model.addAttribute(Gebruiker.NAME, gebruiker);
            model.addAttribute(UserError.NAME, userError);
            return "gebruiker-form";
        } else {
            gebruikerService.addGebruiker(gebruiker);
            String nieuweMail=gebruiker.getEmail();
            String nieuweRol=gebruiker.getRol();
            //CHECK 1: e-mailadres gewijzigd
            if (!oorspronkelijkeMail.equals(nieuweMail) || !oorspronkelijkeRol.equals(nieuweRol))
            {
                //CHECK 2: is ingelogde user zelfde als gewizjigde user
                if (gebruiker.equals(ingelogdeGebruiker))
                {
                    return "redirect:/logout";
                }
                else
                {
                    return "redirect:/gebruiker/list";
                }
            }
            else
            {
                //Hier nog if toevoegen of user admin is
                if (ingelogdeGebruiker.getRol().equals("ROLE_ADMIN"))
                {
                    return "redirect:/gebruiker/list";
                }
                else
                {
                    return "redirect:/gebruiker/eigendata";
                }

            }
        }
    }







    @GetMapping("/updateForm")
    public String showFormForUpdate(@AuthenticationPrincipal MyUserDetails userDetails,@RequestParam("gebruikerId") int id, Model model,HttpServletRequest request){
        //check of ik  admin ben,
        String mail= userDetails.getUsername();
        Gebruiker ingelogdeGebruiker = gebruikerService.getGebruikerByEmail(mail);

        if (ingelogdeGebruiker.getRol().equals("ROLE_ADMIN"))
        {
            Gebruiker gebruiker = gebruikerService.getGebruikerById((long) id);
            UserError userError = new UserError();
            model.addAttribute(Gebruiker.NAME, gebruiker);
            model.addAttribute(UserError.NAME, userError);
            oorspronkelijkeMail = gebruiker.getEmail();
            oorspronkelijkeRol=gebruiker.getRol();
            return "gebruiker-form";
        }
        else
        {
            String idvaningelogdegebruiker=ingelogdeGebruiker.getId().toString();
            String idvanaangepastegebruiker=String.valueOf(id);

            if (idvaningelogdegebruiker.equals(idvanaangepastegebruiker))
            {
                Gebruiker gebruiker = gebruikerService.getGebruikerById((long) id);
                UserError userError = new UserError();
                model.addAttribute(Gebruiker.NAME, gebruiker);
                model.addAttribute(UserError.NAME, userError);
                oorspronkelijkeMail = gebruiker.getEmail();
                oorspronkelijkeRol = gebruiker.getRol();
                return "gebruiker-form";
            }
            else
            {
                return "/error/403";
            }
        }
    }





    @GetMapping("/delete")
    public String deleteGebruiker(@RequestParam("gebruikerId") long id){
        gebruikerService.deleteGebruiker(id);
        return "redirect:/gebruiker/list";
    }





    //VALIDATIE ID
    private void validatieId(Gebruiker gebruiker, String id) {

        if (!id.equals("null"))
        {
            gebruiker.setId(Long.parseLong(id));
        }
    }






    //VALIDATIE GEBOORTEDATUM
    private void validatieGeboortedatum(Gebruiker gebruiker, UserError userError, String geboortedatumstring) {

        if (geboortedatumstring.equals(""))
        {
            userError.geboortedatum = "Gelieve een geboortedatum in te vullen";
            userError.hasErrors = true;
        }
        else
        {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate mijnDatum = LocalDate.parse(geboortedatumstring, formatter);
            gebruiker.setGeboortedatum(mijnDatum);
        }
    }




    //VALIDATIE ROL
    private void validatieRol(Gebruiker gebruiker, UserError userError, String rolString) {
            gebruiker.setRol(rolString);

        if (rolString==null) {
            userError.rol = "Gelieve het type user aan te duiden";
            userError.hasErrors = true;
        }
    }





    //VALIDATIE VOORNAAM
    private void validatieVoornaam(Gebruiker gebruiker, UserError userError, String voornaam) {
        gebruiker.setVoornaam(voornaam);
        if (voornaam.isEmpty()) {
            userError.voornaam = "Gelieve een voornaam in te vullen";
            userError.hasErrors = true;
        }
    }



    //VALIDATIE ACHTERNAAM
    private void validatieAchternaam(Gebruiker gebruiker, UserError userError, String achternaam) {
        gebruiker.setAchternaam(achternaam);
        if (achternaam.isEmpty()) {
            userError.achternaam = "Gelieve een achternaam in te vullen";
            userError.hasErrors = true;
        }
    }




    //VALIDATIE WOONPLAATS
    private void validatieWoonplaats(Gebruiker gebruiker, UserError userError, String woonplaats) {
        gebruiker.setWoonplaats(woonplaats);
        if (woonplaats.isEmpty()) {
            userError.woonplaats = "Gelieve een woonplaats in te vullen";
            userError.hasErrors = true;
        }
    }




    //VALIDATIE HUISNUMMER
    private void validatieHuisnummer(Gebruiker gebruiker, UserError userError, String huisnummer) {
        gebruiker.setHuisnummer(huisnummer);
        if (huisnummer.isEmpty()) {
            userError.huisnummer = "Gelieve een huisnummer in te vullen";
            userError.hasErrors = true;
        }
    }




    //VALIDATIE STRAAT
    private void validatieStraat(Gebruiker gebruiker, UserError userError, String straat) {
        gebruiker.setStraat(straat);
        if (straat.isEmpty()) {
            userError.straat = "Gelieve een straatnaam in te vullen";
            userError.hasErrors = true;
        }
    }




    //VALIDATIE POSTCODE
    private void validatiePostcode(Gebruiker gebruiker, UserError userError, String postcode) {
        gebruiker.setPostcode(postcode);
        if (postcode.isEmpty()) {
            userError.postcode = "Gelieve een postcode in te vullen";
            userError.hasErrors = true;
        }
    }




    //VALIDATIE TELEFOON
    private void validatieTelefoon(Gebruiker gebruiker, UserError userError, String telefoon) {
        gebruiker.setTelefoon(telefoon);
        if (telefoon.isEmpty()) {
            userError.telefoon = "Gelieve een telefoonnummer in te vullen";
            userError.hasErrors = true;
        }
        else  {

            int n = telefoon.length();
            int aantalNietNummers=0;

            for (int i = 0; i < n; i++) {

                // Check if the sepecified
                // character is a digit then
                // return true,
                // else return false
                if (!Character.isDigit(telefoon.charAt(i))) {
                    aantalNietNummers++;
                }
            }
            if (aantalNietNummers>0) {
                 userError.telefoon = "Het telefoonnummer mag enkel getallen bevatten [0-1-2-3-4-5-6-7-8-9]";
                userError.hasErrors = true;
            }
        }
    }





    //VALIDATIE EMAIL
    private void validatieEmail(Gebruiker gebruiker, UserError userError, String email) {
        gebruiker.setEmail(email);
        if (email.isEmpty()) {
            userError.email = "Gelieve een e-mailadres in te vullen";
            userError.hasErrors = true;
        } else{
                int posAt = email.indexOf("@");
                int posDot = (posAt != -1) ? email.substring(posAt).indexOf(".") : -1;
                if (posAt == -1 || posDot == -1) {
                    userError.email = "Dit is een ongeldig e-mailadres";
                    userError.hasErrors = true;
            }
                else{
                    List<Gebruiker> lijstGebruikers = gebruikerService.getGebruikers();
                    int count=0;
                    for (Gebruiker item : lijstGebruikers)
                    {
                        if (!item.getId().equals(gebruiker.getId()))
                        {
                            String itemString =item.getEmail();
                            String gebruikerString = gebruiker.getEmail();

                            if (itemString.equals(gebruikerString))
                            {
                                count++;
                            }
                        }
                    }
                    if (count>0)
                    {
                        userError.email = "Dit e-mailadres heeft al een PlayTime-account";
                        userError.hasErrors = true;
                    }
            }
        }
    }




    //VALIDATIE PASWOORD
    private void validatiePaswoord(Gebruiker gebruiker, UserError userError, String paswoord) {
        gebruiker.setPaswoord(paswoord);
        if (paswoord.isEmpty()) {
            userError.paswoord = "Gelieve een wachtwoord in te vullen";
            userError.hasErrors = true;
        }
    }
}
