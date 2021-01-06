package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.config.JavaMailUtil;
import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import be.thomasmore.graduaten.playtime.entity.MyUserDetails;
import be.thomasmore.graduaten.playtime.service.GebruikerBordspelService;

import be.thomasmore.graduaten.playtime.service.GebruikerService;
import be.thomasmore.graduaten.playtime.service.SpelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

@Controller
@RequestMapping("gebruikerBordspel")

public class GebruikerBordspelController {

    @Autowired
    GebruikerBordspelService gebruikerBordspelService;

    @Autowired
    SpelService spelService;

    @Autowired
    GebruikerService gebruikerService;


    @GetMapping ("/list")
    public String lijstGebruikerBordspellenNietVerwerkt (Model model) {
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellenNietVerwerkt();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);
        return "list-gebruikerBordspellen";
        }

    @GetMapping("/all")
    public String lijstGebruikerBordspellen (Model model){
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen",gebruikerBordspellen);
        return "all-gebruikerBordspellen";
    }

    @GetMapping ("showForm")
    public String showFormForAdd(Model model)
    {
        GebruikerBordspel gebruikerBordspel = new GebruikerBordspel();
        model.addAttribute("gebruikerBordspel",gebruikerBordspel);
        return "gebruikerBordspel-form";
    }

    @PostMapping("/saveGebruikerBordspel")
    public String saveGebruikerBordspel(@ModelAttribute("gebruikerBordspel") GebruikerBordspel gebruikerBordspel)
    {
        gebruikerBordspelService.addGebruikerBordspel(gebruikerBordspel);
        return "redirect:/gebruikerBordspel/list";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("gebruikerBordspelId") int id) {
        GebruikerBordspel gebruikerBordspel = gebruikerBordspelService.getGebruikerBordspelById((long) id);
        boolean x = gebruikerBordspel.isVerwerkt();
        if (x==true){
            gebruikerBordspel.setVerwerkt(false);
        } else {
            gebruikerBordspel.setVerwerkt(true);
        }
        gebruikerBordspelService.addGebruikerBordspel(gebruikerBordspel);
        return "redirect:/gebruikerBordspel/list";
    }

    @GetMapping("/delete")
    public String deleteGebruikerBordspel(@RequestParam("gebruikerBordspelId") Long id)  {
        gebruikerBordspelService.deleteGebruikerBordspel(id);
        return "redirect:/gebruikerBordspel/list";
    }


    @RequestMapping("/success")
    public String success()
    {
        return "success";
    }



    @GetMapping("/send-mail")
    public String sendEmail(@AuthenticationPrincipal MyUserDetails userDetails, HttpServletRequest request) throws MessagingException {
        String datum = request.getParameter("datum");
        String mail= userDetails.getUsername();
        JavaMailUtil.sendMail(mail,datum,"9h00");
        return "success";
    }




   /*

    @GetMapping("/account")
    public String viewUserAccountForm(
            @AuthenticationPrincipal ShopmeUserDetails userDetails,
            Model model) {
        String userEmail = userDetails.getUsername();
        User user = service.getByEmail(userEmail);

        model.addAttribute("user", user);
        model.addAttribute("pageTitle", "Account Details");

        return "users/account_form";
    }

    */


}
