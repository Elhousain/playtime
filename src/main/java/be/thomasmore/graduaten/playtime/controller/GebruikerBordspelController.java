package be.thomasmore.graduaten.playtime.controller;

import be.thomasmore.graduaten.playtime.config.JavaMailUtil;
import be.thomasmore.graduaten.playtime.entity.*;
import be.thomasmore.graduaten.playtime.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.core.annotation.AuthenticationPrincipal;


@Controller
@RequestMapping("gebruikerBordspel")

public class GebruikerBordspelController {

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

    @Autowired//session
    private  CartBean cartBean;


   // @Autowired//session
   // private  CartItemBean cartItemBean;

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


    @RequestMapping("/shoppingCart")
    public String shoppingCart( HttpServletRequest request, HttpServletResponse response,Model model, @Param("keyword") String keyword) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        CartBean cart=(CartBean)session.getAttribute("cart");

        List<Spel> spellen = spelService.getSpellen(keyword);
        model.addAttribute("spellen", spellen);

        List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
        model.addAttribute("gebruikerBordspellen", gebruikerBordspellen);

        GebruikerBordspelError gebruikerBordspelError = new GebruikerBordspelError();
        model.addAttribute(GebruikerBordspelError.GEBRUIKERBORDSPEL, gebruikerBordspelError);

        String iAction = request.getParameter("action");
        if (iAction == null && cart==null)
        {
            return "redirect:/";
        }

            if (iAction != null && !iAction.equals("")) {
                switch (iAction)
                {
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
        return "overzichtWinkelwagen";




    }

    protected void updateCart(HttpServletRequest request) {

        HttpSession session = request.getSession();


        String iQuantity = request.getParameter("aantal");
        int iSTT = Integer.parseInt(request.getParameter("stt"));

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
        System.out.println("Product in het mandje");

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



    protected void clearList(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        Object iObject = session.getAttribute("cart");
            cartBean = (CartBean) iObject;
            cartBean.listClear();
    }

    @PostMapping("/saveOrder")
    public String saveOrder(@AuthenticationPrincipal MyUserDetails userDetails,HttpServletRequest request,HttpServletResponse httpServletResponse, Model model, @Param("keyword") String keyword) throws MessagingException {
        Boolean verwerkt =false ;
        Boolean ishuur = false;
        Integer aantal =0;
        String userName="";
        Spel spel = null;

        HttpSession session = request.getSession();
        CartBean cart=(CartBean)session.getAttribute("cart");//winkelwagen inhoud
        Integer x = cart.getLineItemCount();

        GebruikerBordspelError gebruikerBordspelError = new GebruikerBordspelError();


        if (x==0)
        {

            gebruikerBordspelError.afhaaldatum = "Gelieve tenminste één spel te selecteren";
            gebruikerBordspelError.hasErrors = true;
            System.out.println("winkelwagen is leeg");
        }
        if (gebruikerBordspelError.hasErrors) {

            model.addAttribute(GebruikerBordspelError.GEBRUIKERBORDSPEL, gebruikerBordspelError);
            return "redirect:/gebruikerBordspel/shoppingCart";
        }




        List<Spel> spellen = spelService.getSpellen(keyword);
        model.addAttribute("spellen", spellen);



        List<Gebruiker> gebruikerList = (List<Gebruiker>) request.getAttribute("gebruikerList");
        List<Gebruiker> gebruiker1 = gebruikerService.getGebruikers();

        // afhaaldatum
            String datum = request.getParameter(GebruikerBordspel.AFHAALDATUM);
            LocalDate afhaalDatum = LocalDate.parse(datum);

        // ingelogde gebruiker id (werkt)
            Gebruiker aangelogdeGebruiker=null;
            String ingelogdeUser = userDetails.getUsername();

            for (Gebruiker gebruiker:gebruiker1)
            {
                if (gebruiker.getEmail()==ingelogdeUser)
                {
                    // Long >>> int
                    aangelogdeGebruiker=gebruiker;
                }
            }

        // laatste ordernr(werkt)
            Integer getal=0;
            List<GebruikerBordspel> gebruikerBordspellen = gebruikerBordspelService.getGebruikerBordspellen();
            ArrayList<Integer> lijstOrderNummers = new ArrayList<>();
            lijstOrderNummers.clear();

            for (GebruikerBordspel gebruikerBordspel1:gebruikerBordspellen)
            {
                lijstOrderNummers.add(gebruikerBordspel1.getOrdernr());
            }
            getal=Integer.parseInt(lijstOrderNummers.get(gebruikerBordspellen.size()-1).toString());

            // nieuw ordernr
            Integer nieuwOrderNr =getal+1;
            Integer ordernr = nieuwOrderNr ;

        //winkelmandje data opvragen
            model.addAttribute("cartBean",cartBean.getList());
           // model.addAttribute("cartItemBean",cartItemBean);


            List<CartItemBean> c = cart.getList();
            
            
            for (CartItemBean product:c)
            {
                for (Spel sp:spellen)
                {
                    if (sp.getId().equals(product.getId()))
                    {
                        spel=sp;
                        userName=spel.getNaam();
                    }
                }
                
                    aantal = product.getAantal();
                if (product.getTitel().equals("huren"))
                {
                    ishuur = true;
                    Integer huidigeVoorraad= spel.getVoorraad_huur();
                    spel.setVoorraad_huur(huidigeVoorraad-1);
                }
                else
                    {
                        ishuur = false;
                        Integer huidigeVoorraad= spel.getVoorraad_koop();
                        spel.setVoorraad_koop(huidigeVoorraad-1);
                    }

                GebruikerBordspel gebruikerBordspel = new GebruikerBordspel(ordernr,spel,aangelogdeGebruiker,afhaalDatum,verwerkt,ishuur,aantal);
                gebruikerBordspelService.addGebruikerBordspel(gebruikerBordspel);

            }
        String mail= userDetails.getUsername();
        for (Gebruiker gebruiker:gebruiker1)
        {
            if (gebruiker.getEmail().equals(mail))
            {
                userName=gebruiker.getVoornaam()+" "+gebruiker.getAchternaam();
            }
        }


            System.out.println("Order(s)in databank");
            clearList(request);
            System.out.println("winkelmandje is leeg");



           JavaMailUtil.sendMail(mail,datum,String.valueOf(ordernr),userName);

            return "success";
    }


}
