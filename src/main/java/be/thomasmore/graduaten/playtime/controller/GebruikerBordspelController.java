package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.config.JavaMailUtil;
import be.thomasmore.graduaten.playtime.entity.Gebruiker;
import be.thomasmore.graduaten.playtime.entity.GebruikerBordspel;
import be.thomasmore.graduaten.playtime.entity.MyUserDetails;
import be.thomasmore.graduaten.playtime.repository.GebruikerBordspelRepository;
import be.thomasmore.graduaten.playtime.service.GebruikerBordspelService;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.Id;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

@Controller
@RequestMapping("gebruikerBordspel")

public class GebruikerBordspelController {

    @Autowired GebruikerBordspelService gebruikerBordspelService;


    @GetMapping ("/list")
        public String lijstGebruikerBordspellen (Model model)
        {
        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen",gebruikerBordspellen);
        return "list-gebruikerBordspellen";
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
    public String showFormForUpdate(@RequestParam("gebruikerBordspelId") int id, Model model) {
        GebruikerBordspel gebruikerBordspel = gebruikerBordspelService.getGebruikerBordspelById((long) id);
        model.addAttribute("gebruikerBordspel", gebruikerBordspel);
        return "gebruikerBordspel-form";
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
    public String sendEmail(@AuthenticationPrincipal MyUserDetails userDetails) throws MessagingException {
        String mail= userDetails.getUsername();
        JavaMailUtil.sendMail(mail,"01/01/2020","14h00");
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
