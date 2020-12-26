package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.UserError;
import be.thomasmore.graduaten.playtime.service.GebruikerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import javax.swing.*;

import javax.servlet.http.HttpServletRequest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;

@Controller
@RequestMapping("gebruiker")
public class GebruikerController {

    @Autowired
    GebruikerService gebruikerService;

    @GetMapping("/list")
    //Object principal = SecurityContextHolder.getContext()

    public String lijstgebruikers (Model model){
        List<Gebruiker> gebruikers = gebruikerService.getGebruikers();
        model.addAttribute("gebruikers", gebruikers);
        return "list-gebruikers";
    }





    @GetMapping("showForm")
    public String showFormForAdd(Model model){


        Gebruiker gebruiker = new Gebruiker();
        UserError userError = new UserError();
        //model.addAttribute("gebruiker", gebruiker);

        model.addAttribute(Gebruiker.NAME, gebruiker);
        model.addAttribute(UserError.NAME, userError);



        return "gebruiker-form";
    }



    @PostMapping("/saveGebruiker")
    public String saveGebruiker(HttpServletRequest request, Model model)  {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails)
        {
            String username = ((UserDetails) principal).getUsername();
        }
        else
        {
            String username = principal.toString();
        }


        Gebruiker gebruiker = new Gebruiker();
        UserError userError = new UserError();


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

        validatieRol(gebruiker, userError, request.getParameter(Gebruiker.ROL));









        if (userError.hasErrors) {
            model.addAttribute(Gebruiker.NAME, gebruiker);
            model.addAttribute(UserError.NAME, userError);
            return "gebruiker-form";
        } else {
            gebruikerService.addGebruiker(gebruiker);
            return "redirect:/gebruiker/list";
        }
    }



    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("gebruikerId") int id, Model model){
        Gebruiker gebruiker = gebruikerService.getGebruikerById((long) id);
        UserError userError = new UserError();
        model.addAttribute(Gebruiker.NAME, gebruiker);
        model.addAttribute(UserError.NAME, userError);

        return "gebruiker-form";
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



    //VALIDATIE GEBOORTEDATUM
   /* private void ValidatieGeboortedatum(Gebruiker gebruiker, UserError userError, String geboortedatum) {


        gebruiker.setGeboortedatum(achternaam);
        if (achternaam.isEmpty()) {
            userError.achternaam = "Gelieve een geboortedatum in te vullen";
            userError.hasErrors = true;
        }
    }*/




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
