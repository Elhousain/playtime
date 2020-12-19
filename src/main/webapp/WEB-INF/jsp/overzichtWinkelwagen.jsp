
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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        li{cursor: pointer}
    </style>
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
                                <a class="nav-link" href="index.jsp">
                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-person-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"></path>
                                        <path fill-rule="evenodd" d="M2 15v-1c0-1 1-4 6-4s6 3 6 4v1H2zm6-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"></path>
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
                Overzicht
            </h1>

            <div class="containerMand" >
                <div>
                    <h2>Winkelwagen</h2>

                    <table width="100%" >
                        <tr bgcolor="#CCCCCC">
                            <td>Wissen</td>
                            <td>Afbeelding</td>
                            <td>Bestelling </td>
                            <td>Total</td>

                        </tr>
                        <jsp:useBean id="cart" scope="session" type="be.thomasmore.graduaten.playtime.entity.CartBean"/>

                        <c:if test="${cart.lineItemCount == 0}">
                            <tr> <td colspan="4">- Winkel wagen is leeg -</td></tr>
                        </c:if>

                        <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
                            <form name="item" method="POST" action="/overzichtWinkelwagen">
                                <tr>
                                    <td>
                                        <input class="delete cirkel wissenRow m-auto" type="submit" name="action" value="X">
                                    </td>
                                    <td>
                                        <img class="afb "src="${cartItem.afbeelding}">
                                    </td>
                                    <td class="langsElkaar">
                                        <div class="blocks" >
                                            <p>${cartItem.titel}</p>
                                            €<c:out value="${(cartItem.prijs)}"/>
                                            <input style="width: 20%" type='number' name="aantal" value='<c:out value="${cartItem.aantal}"/>'>
                                        </div>
                                    </td>
                                    <td>€<c:out value="${cartItem.totaal}"/></td>
                                    <td>
                                        <input type='hidden' name='stt' value='<c:out value="${counter.count}"/>'>
                                        <input type="submit" name="action" value="Update">
                                    </td>

                                </tr>
                            </form>
                        </c:forEach>
                        <!--Total-->
                        <tr>

                            <td colspan="3"> </td>
                            <td>Subtotal: €<c:out value="${cart.total}"/></td>
                        </tr>

                    </table><div class="keuze mt-5" >
                    <a   class="btn-primary btn-block" href="${pageContext.request.contextPath }/overzichtSpellen" >Verder winkelen</a>
                    <a   class="btn-info btn-block" href="${pageContext.request.contextPath }/overzichtSpellen" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample" >Doorgaan bestelling</a>


                    <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                        </div>
                    </div>

                </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var getal=0;
    function car(id,picture,name,price)
    {

        var _id=document.getElementById("webkar"),
            _li1=document.createElement('li'),
            _div1=document.createElement('div'),
            _a1=document.createElement('a'),
            _img1=document.createElement('img'),
            _span1=document.createElement('span'),
            _btn1=document.createElement('button'),
            _span2=document.createElement('span'),
            _btn2=document.createElement('button'),
            _p1=document.createElement('p');

        var _delete=document.createTextNode("X"),
            _naam=document.createTextNode(name),
            _plus=document.createTextNode("+"),
            _aantal=document.createTextNode("1"),
            _min=document.createTextNode("-"),
            _totaal=document.createTextNode(price);


        _li1.setAttribute("class","kader onderlijn");
        _div1.setAttribute("class","row");

        _a1.appendChild(_delete);
        _a1.setAttribute("class","col-sm-1 m-auto");

        _img1.setAttribute("src",picture);
        _img1.setAttribute("class","afb col-sm-2 m-auto");
        _img1.setAttribute("id",id)

        _span1.setAttribute("class","col-sm-4 m-auto");
        _span1.appendChild(_naam);

        _btn1.setAttribute("class","knop m-auto");
        _btn1.setAttribute("id",id+"_kopenPlus");
        _btn1.setAttribute("onclick","reken("+id+",'Kplus')");
        _btn1.appendChild(_plus);

        _span2.setAttribute("id",id+"_aantal");
        _span2.setAttribute("class","m-auto");
        _span2.appendChild(_aantal);

        _btn2.setAttribute("class","knop m-auto");
        _btn2.setAttribute("id",id+"_kopenMin");
        _btn2.setAttribute("onclick","reken("+id+",'Kmin')");
        _btn2.appendChild(_min);

        _p1.setAttribute("class","col-sm-2 m-auto");
        _p1.appendChild(_totaal);

        _li1.appendChild(_div1);
        _div1.appendChild(_a1);
        _div1.appendChild(_img1);
        _div1.appendChild(_span1);
        _div1.appendChild(_btn1);
        _div1.appendChild(_span2);
        _div1.appendChild(_btn2);
        _div1.appendChild(_p1);
        var sw=0;
        if (getal===0)
        {
            _id.appendChild(_li1);
            getal=1
        }
        else
        {

            var  items = document.querySelectorAll("#webcar li"),
                tab = [], index;
            kab = [], index;


            for(var i = 0; i < items.length; i++){
                tab.push(items[i].innerHTML);
                //alert("Er bestaat al "+items.length+" product bulent");
                //hele string
                var split1 = items[i].innerHTML;
                //var split1 = _li1.innerHTML;
                //haal ID uit string
                var id_pm1=split1.split('id="').pop().split('">')[0];
                //haal Aantal uit string
                var aantal_pr1=split1.split('class="m-auto">').pop().split('<')[0];
                //alert("Product id="+id_pm1+"en aantal="+aantal_pr1);

                //alert(items[i].innerHTML +" tabPush voor");
                for(var a = 0; a < items.length; a++){
                    kab.push(items[a].innerHTML);

                    //hele string
                    var split3 = items[i].innerHTML;
                    var split2 = _li1.innerHTML;
                    //alert(split2);
                    //haal ID uit string
                    var id_pm2=split2.split('id="').pop().split('">')[0];
                    //haal Aantal uit string
                    var IDaantal_pm2=split2.split('<span id="').pop().split('" class="m-auto">')[0];
                    var aantal_pm3=split3.split('class="m-auto">').pop().split('<')[0];

                    //alert("Product id="+id_pm2+"en aantal="+aantal_pr2);


                    if (id_pm1===id_pm2)
                    {
                        sw=1;
                        var x=parseInt(aantal_pm3);
                        x=x+1;
                        document.getElementById(IDaantal_pm2).innerHTML = x;
                        refreshArray();
                    }
                }
            }
        }
        if (sw===0)
        {
            //alert("nieuw product is toegevoed");
            _id.appendChild(_li1);
        }
        else
        {
            //alert("deze product bestaat al en word niet toegevoegd");
        }


        function refreshArray()
        {
            // clear array
            tab.length = 0;
            items = document.querySelectorAll("#list li");
            // fill array
            for(var i = 0; i < items.length; i++){
                tab.push(items[i].innerHTML);
            }
        }

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
    var aantal = 0;
    var bedrag = 20;


    function reken(a,b)
    {
        var  items = document.querySelectorAll("#webcar li");
        var split3 = items[a-1].innerHTML;
        var IDaantal_pm2=split3.split('<span id="').pop().split('" class="m-auto">')[0];
        var aantal_pm3=split3.split('class="m-auto">').pop().split('<')[0];

        var x=parseInt(aantal_pm3);

        if(b==="Kplus")
        {
            x=x+1;
            // alert("2");

        }

        if(b==="Kmin"&&x>0)
        {
            x=x-1;
            // alert("3");
        }

        document.getElementById(IDaantal_pm2).innerHTML = x;
        refreshArray();


    }

</script>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>