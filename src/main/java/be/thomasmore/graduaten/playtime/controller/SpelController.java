package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.entity.*;
import be.thomasmore.graduaten.playtime.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Id;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("spel")
public class SpelController {

    @Autowired SpelService spelService;
    @Autowired TaalService taalService;
    @Autowired UitgeverService uitgeverService;
    @Autowired CategorieService categorieService;
    @Autowired StatusService statusService;

    @GetMapping ("/list")
    public String lijstSpellen (Model model, @Param("keyword") String keyword){
        List<Spel> spellen = spelService.getSpellen(keyword);
        model.addAttribute("spellen",spellen);
        model.addAttribute("keyword", keyword);
        return "list-spellen";
    }

    @GetMapping ("showForm")
    public String showFormForAdd(Model model){
        Spel spel = new Spel();
        model.addAttribute(Spel.SPEL, spel);
        SpelError spelError = new SpelError();
        model.addAttribute(SpelError.SPEL, spelError);
        List<Taal> talen = taalService.getTalen();
        model.addAttribute("talen", talen);
        List<Categorie> categorien = categorieService.getCategorien();
        model.addAttribute("categorien", categorien);
        List<Uitgever> uitgevers = uitgeverService.getUitgevers();
        model.addAttribute("uitgevers", uitgevers);
        List<Status> statussen = statusService.getStatussen();
        model.addAttribute("statussen", statussen);
        return "spel-form";
    }

    @PostMapping("/saveSpel")
    public String saveSpel(HttpServletRequest request, Model model){
        Spel spel = new Spel();
        SpelError spelError = new SpelError();

        validatieId(spel, request.getParameter(Spel.ID));

        validatieNaam(spel, spelError, request.getParameter(Spel.NAAM));
        validatieBeschrijving(spel, spelError, request.getParameter(Spel.BESCHRIJVING));
        validatiePrijs(spel, spelError, request.getParameter(Spel.PRIJS));
        validatieMin_spelers(spel, spelError, request.getParameter(Spel.MIN_SPELERS));
        validatieMax_spelers(spel, spelError, request.getParameter(Spel.MAX_SPELERS));
        validatieMin_leeftijd(spel, spelError, request.getParameter(Spel.MIN_LEEFTIJD));
        validatieVoorraad_huur(spel, spelError, request.getParameter(Spel.VOORRAAD_HUUR));
        validatieVoorraad_koop(spel, spelError, request.getParameter(Spel.VOORRAAD_KOOP));
        validatieCategorie(spel, spelError, request.getParameter(Spel.CATEGORIE));
        validatieStatus(spel, spelError, request.getParameter(Spel.STATUS));
        validatieTaal(spel, spelError, request.getParameter(Spel.TAAL));
        validatieUitgever(spel, spelError, request.getParameter(Spel.UITGEVER));


        if (spelError.hasErrors){
            model.addAttribute(Spel.SPEL, spel);
            model.addAttribute(SpelError.SPEL, spelError);
            return "spel-form";
        } else {
            spelService.addSpel(spel);
            return "redirect:/spel/list";
        }
    }



    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("spelId") int id, Model model) {
        Spel spel = spelService.getSpelById((long) id);
        SpelError spelError = new SpelError();
        model.addAttribute(Spel.SPEL, spel);
        model.addAttribute(SpelError.SPEL, spelError);
        List<Taal> talen = taalService.getTalen();
        model.addAttribute("talen", talen);
        List<Categorie> categorien = categorieService.getCategorien();
        model.addAttribute("categorien", categorien);
        List<Uitgever> uitgevers = uitgeverService.getUitgevers();
        model.addAttribute("uitgevers", uitgevers);
        List<Status> statussen = statusService.getStatussen();
        model.addAttribute("statussen", statussen);
        return "spel-form";
    }


    @GetMapping("/delete")
    public String deleteSpel(@RequestParam("spelId") Long id)  {
        spelService.deleteSpel(id);
        return "redirect:/spel/list";
    }


    //VALIDATIE ID
    private void validatieId(Spel spel, String id) {

        if (!id.equals("null"))
        {
            spel.setId(Long.parseLong(id));
        }
    }

    //VALIDATIE NAAM
    private void validatieNaam(Spel spel, SpelError spelError, String naam) {
        spel.setNaam(naam);
        if (naam.isEmpty()) {
            spelError.naam = "Gelieve een naam in te vullen";
            spelError.hasErrors = true;
        }
    }

    //VALIDATIE PRIJS
    private void validatiePrijs(Spel spel, SpelError spelError, String prijs) {
        if (prijs.equals("")){
            spelError.prijs = "Gelieve een prijs in te vullen";
            spelError.hasErrors = true;
        } else {
            Double mijnPrijs = Double.parseDouble(prijs);
            spel.setPrijs(mijnPrijs);
        }
    }


    //VALIDATIE BESCHRIJVING
    private void validatieBeschrijving(Spel spel, SpelError spelError, String beschrijving) {
        spel.setBeschrijving(beschrijving);
        if (beschrijving.isEmpty()) {
            spelError.beschrijving = "Gelieve een beschrijving in te vullen";
            spelError.hasErrors = true;
        }
    }

    //VALIDATIE MIN_SPELERS
    private void validatieMin_spelers(Spel spel, SpelError spelError, String min_spelers){
        if (min_spelers.equals("")){
            spelError.min_spelers = "Gelieve een minimum aantal spelers in te vullen";
            spelError.hasErrors = true;
        } else {
            int mijnMin_spelers = Integer.parseInt(min_spelers);
            spel.setMin_spelers(mijnMin_spelers);
        }
    }

    //VALIDATIE MAX_SPELERS
    private void validatieMax_spelers(Spel spel, SpelError spelError, String max_spelers){
        if (max_spelers.equals("")){
            spelError.max_spelers = "Gelieve een maximum aantal spelers in te vullen";
            spelError.hasErrors = true;
        } else {
            int mijnMax_spelers = Integer.parseInt(max_spelers);
            spel.setMax_spelers(mijnMax_spelers);
        }
    }

    //VALIDATIE MIN_LEEFTIJD
    private void validatieMin_leeftijd(Spel spel, SpelError spelError, String min_leeftijd){
        if (min_leeftijd.equals("")){
            spelError.min_leeftijd = "Gelieve een minimum leeftijd in te vullen";
            spelError.hasErrors = true;
        } else {
            int mijnMin_leeftijd = Integer.parseInt(min_leeftijd);
            spel.setMin_leeftijd(mijnMin_leeftijd);
        }
    }

    //VALIDATIE VOORRAAD_HUUR
    private void validatieVoorraad_huur(Spel spel, SpelError spelError, String voorraad_huur) {
        if (voorraad_huur.equals("")){
            spelError.voorraad_huur = "Gelieve de voorraad voor verkoop in te vullen";
            spelError.hasErrors = true;
        } else {
            int mijnVoorraad_koop = Integer.parseInt(voorraad_huur);
            spel.setVoorraad_huur(mijnVoorraad_koop);
        }
    }

    //VALIDATIE VOORRAAD_KOOP
    private void validatieVoorraad_koop(Spel spel, SpelError spelError, String voorraad_koop){
        if (voorraad_koop.equals("")){
            spelError.voorraad_koop = "Gelieve de voorraad voor verkoop in te vullen";
            spelError.hasErrors = true;
        } else {
            int mijnVoorraad_koop = Integer.parseInt(voorraad_koop);
            spel.setVoorraad_koop(mijnVoorraad_koop);
        }
    }

    //VALIDATIE CATEGORIE
    private void validatieCategorie(Spel spel, SpelError spelError, String categorie){
        if (categorie.equals("")){
            spelError.voorraad_koop = "Gelieve een categorie te selecteren";
            spelError.hasErrors = true;
        } else {
            List<Categorie> categorien = categorieService.getCategorien();
            for (Categorie item : categorien)
            {
                if (item.getBeschrijving().equals(categorie))
                {
                    spel.setCategorie(item);
                }
            }
        }
    }

    //VALIDATIE STATUS
    private void validatieStatus(Spel spel, SpelError spelError, String status){
        if (status.equals("")){
            spelError.voorraad_koop = "Gelieve een status te selecteren";
            spelError.hasErrors = true;
        } else {
            List<Status> statussen = statusService.getStatussen();
            for (Status item : statussen)
            {
                if (item.getBeschrijving().equals(status))
                {
                    spel.setStatus(item);
                }
            }
        }
    }

    //VALIDATIE TAAL
    private void validatieTaal(Spel spel, SpelError spelError, String taal){
        if (taal.equals("")){
            spelError.voorraad_koop = "Gelieve een taal te selecteren";
            spelError.hasErrors = true;
        } else {
            List<Taal> talen = taalService.getTalen();
            for (Taal item : talen)
            {
                if (item.getBeschrijving().equals(taal))
                {
                    spel.setTaal(item);
                }
            }
        }
    }

    //VALIDATIE UITGEVER
    private void validatieUitgever(Spel spel, SpelError spelError, String uitgever){
        if (uitgever.equals("")){
            spelError.voorraad_koop = "Gelieve een categorie te selecteren";
            spelError.hasErrors = true;
        } else {
            List<Uitgever> uitgevers = uitgeverService.getUitgevers();
            for (Uitgever item : uitgevers)
            {
                if (item.getBeschrijving().equals(uitgever))
                {
                    spel.setUitgever(item);
                }
            }
        }
    }


    /*private void validatieCategorie(Spel spel, SpelError spelError, String categorie){
        if (categorie.equals("")){
            spelError.categorie = "Gelieve een categorie aan te duiden";
            spelError.hasErrors = true;
        } else {
            Categorie mijnCategorie = Categorie(categorie);
        }
    }*/



}
