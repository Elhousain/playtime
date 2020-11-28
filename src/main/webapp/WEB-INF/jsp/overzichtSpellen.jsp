
<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Spel" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Uitgever" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Taal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Overzicht Spellen</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper d-flex align-items-stretch">
    <!--#region Linksepaneel-->
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.png);"></a>
            <ul class="list-unstyled components mb-5">
                <li>
                    <a href="${pageContext.request.contextPath}/overzichtSpellen">Overzicht spellen</a>
                    <a href="${pageContext.request.contextPath}/overzichtGebruikers">Overzicht gebruikers</a>
                </li>
                <li >
                    <a href="#">Dobbelspel (1)</a>
                </li>
                <li>
                    <a href="#">Bordspel (2)</a>
                </li>
                <li>
                    <a href="#">Kaartspel (3)</a>
                </li>
            </ul>

            <div class="footer">
                <p>
                    Playtime
                    <script>
                        document.write(new Date().getFullYear());
                    </script>
                    <br>
                    Elhousain | Tom  | Bulent
                    <i class="icon-heart" aria-hidden="true"></i>
                    <a href="#" target="_blank">
                        www.playtime.be
                    </a>
                </p>
            </div>
        </div>
    </nav>
    <!--#endregion-->

    <div class="container-fluid" style="position: relative">
        <div id="content" class="p-4 p-md-5">
            <!--#region Header-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-primary d-lg-none">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle Menu</span>
                    </button>

                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Contact</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                                        <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
                                    </svg>
                                </a>
                            </li>
                            <li class="nav-item">

                                <a class="nav-link" data-toggle=collapse href="#shopcar" role=button aria-expanded=false aria-controls=collapseExample>
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-cart-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                        <path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                    </svg>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!--#endregion-->
            <!--#region Bordenspel groepen-->
            <h1>
                Overzicht spellen
            </h1>

            <div class="row dashboard-cards">
                <%
                    List<Spel> spellen = (List<Spel>) request.getAttribute("spellen");
                    List<Taal> talen = (List<Taal>)request.getAttribute("talen") ;
                    List<Uitgever> uitgevers = (List<Uitgever>) request.getAttribute("uitgevers");




                    for (Spel spel: spellen) {
                        double huurPrijs=spel.getPrijs()*0.75;
                        out.print
                                (

                                        "<div class=card style=z-index: 10;>"+
                                                "<div class=card-title>"+
                                                    "<h5>"
                                                        +spel.getNaam()+
                                                    "</h5>"+
                                                    "<img class=farah src=" +spel.getFoto()+">" +
                                                "</div>"+

                                                "<div class=achtergrond>" +
                                                    "<div class=row>" +
                                                        "<div class=col-sm-6>" +
                                                            "<p>" +huurPrijs+ " €</p>"+
                                                            "<input type=button  class=btn-primary value=huren onclick=men()>" +
                                                        "</div>" +
                                                        "<div class=col-sm-6>" +
                                                            "<p>" +spel.getPrijs()+ " €</p>"+
                                                            "<input type=button class=btn-info value=kopen onclick=car('"+spel.getId()+"','"+spel.getFoto()+"','"+spel.getNaam()+"','"+spel.getPrijs()+"')>"+
                                                        "</div>" +

                                                "<a id=tonen class=m-auto> details" +
                                                "</a>"+

                                                    "</div>" +
                                                "</div>" +

                                                "<div class=card-flap>"+
                                                    "<div class=card-description>"+
                                                        "<div class=onderlijn>"+spel.getBeschrijving()+"</div>"+
                                                    "<ul class=task-list>"+
                                                        "<li>"+
                                                             "<img class=img-thumbnail src=/images/pngegg.png > Spelers tussen " +spel.getMin_spelers()+" en "+spel.getMax_spelers()+
                                                        "</li>"+
                                                        "<li>"+
                                                            "<div class=minleeftijd>" +spel.getMin_leeftijd()+
                                                        "</li>"+
                                                        "<li>"+

                                                            "<img src=/images/taal.png > <p id=taal></p>"+
                                                        "</li>"+
                                                        "<li>"+
                                                            "<img src=/images/uitgever.png > <p id=uitgever></p>" +
                                                        "</li>"+
                                                        "<li>"+
                                                            "<img src=/images/euro.png >" +spel.getPrijs()+" €"+
                                                        "</li>"+
                                                    "</ul>"+
                                                "</div>"+
                                        "</div>"+
                                "</div>"
                        );
                    }
                %>


            </div>
                <div class="winkelmand collapse" id="shopcar">
                    <div class="p-2 onderlijn">WINKELMANDJE</div>
                    <ul id="webcar" type="none">

                    </ul>
                    <ul type="none">
                        <li>
                            <div class="row onderlijn">
                                <a class="col-sm-7 m-auto" ></a>
                                <a class="col-sm-2 m-auto"   > TOTAAL </a>
                                <a class="col-sm-2 m-auto" id="subtotaal" > 0</a>
                            </div>
                        </li>
                    </ul>
                    <div class="keuze" >
                        <input type=button  class="btn-primary btn-block" value="verder winkelen" onclick="men()">
                        <input type=button class="btn-info btn-block" value="kassa" onclick="kopen()">
                    </div>
                </div>
        </div>
        <!--endregion-->
    </div>
</div>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'>
    </script><script  src="function.js"></script>
    <script>
        function car(id,picture,name,price,language,publisher)
        {
            var _id=document.getElementById("webcar"),
                _li1=document.createElement('li'),
                _div1=document.createElement('div'),
                _a1=document.createElement('a'),
                _img1=document.createElement('img'),
                _span1=document.createElement('span'),
                _btn1=document.createElement('button'),
                _span2=document.createElement('span'),
                _btn2=document.createElement('button'),
                _a2=document.createElement('a');

            var _delete=document.createTextNode("X"),
                _naam=document.createTextNode(name),
                _plus=document.createTextNode("+"),
                _aantal=document.createTextNode("1"),
                _min=document.createTextNode("-"),
                _totaal=document.createTextNode(price),
                _taal=document.createTextNode(language),
                _uitgever=document.createTextNode(publisher);

            _li1.setAttribute("class","kader onderlijn")
            _div1.setAttribute("class","row")

            _a1.appendChild(_delete);
            _a1.setAttribute("class","col-sm-1 m-auto")

            _img1.setAttribute("src",picture);
            _img1.setAttribute("class","afb col-sm-2 m-auto")
            _img1.setAttribute("id",id)

            _span1.setAttribute("class","col-sm-4 m-auto")
            _span1.appendChild(_naam);

            _btn1.setAttribute("class","knop m-auto")
            _btn1.appendChild(_plus);

            _span2.setAttribute("class","m-auto")
            _span2.appendChild(_aantal);

            _btn2.setAttribute("class","knop m-auto")
            _btn2.appendChild(_min);

            _a2.setAttribute("class","col-sm-2 m-auto")
            _a2.appendChild(_totaal);

            _li1.appendChild(_div1);
            _div1.appendChild(_a1);
            _div1.appendChild(_img1);
            _div1.appendChild(_span1);
            _div1.appendChild(_btn1);
            _div1.appendChild(_span2);
            _div1.appendChild(_btn2);
            _div1.appendChild(_a2);
            _id.appendChild(_li1)

        }


        function huur(naam,prijs) {
            var geld;
            geld = prijs*1.15
            alert(naam +" kost "+ geld.toFixed(2)+" €");

        }
        function kopen(naam,prijs) {
            var geld;
            geld = prijs
            alert(naam +" kost "+geld+" €");

        }
        var geld = 0;
        var bedrag = 20;


        function tellen(bereken) {

            if(bereken=="plus")
            {
                geld = geld+1;
            }

            if(bereken=="min"&&geld>0)
            {
                geld = geld-1;

            }
        }

    </script>

<script>
    var zindex = 10;

    $(document).on('click','#tonen',function()
    {
        zindex++;
        let card =  $(this).closest('.card')
        if(card.hasClass('d-card-show')) card.removeClass('d-card-show')
        else card.addClass('d-card-show').css({zIndex:zindex})
    })



</script>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>