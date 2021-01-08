
<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Overzicht Spellen</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.js'>
    </script><script  src="./script.js"></script>
</head>
<body>
<jsp:useBean id="cart" scope="session" type="be.thomasmore.graduaten.playtime.entity.CartBean"/>

<%
    GebruikerBordspel gebruikerBordspel = (GebruikerBordspel)request.getAttribute(GebruikerBordspel.NAME);

%>
<div class="wrapper d-flex align-items-stretch">
    <!--#region Linksepaneel-->
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <img class="img logo rounded-circle mb-5" src="${pageContext.request.contextPath}/images/logo.png">
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

            <div class="containerMand" >
                <div>
                    <h2>Winkelwagen</h2>
                    <table width="100%" id="inhoud" >
                        <tr bgcolor="#CCCCCC">
                            <td>Wissen</td>
                            <td>Afbeelding</td>
                            <td>Bestelling </td>
                            <td>Totaal</td>
                        </tr>



                        <%
                           // System.out.println(cart);
                        %>

                        <c:if test="${cart.lineItemCount == 0}">
                            <tr> <td colspan="4">- Winkel wagen is leeg -</td></tr>
                        </c:if>
                        <c:forEach var="cartItem" items="${cart.list}" varStatus="counter">
                            <form name="item" method="POST" action="${pageContext.request.contextPath}/gebruikerBordspel/shoppingCart">
                                <tr>
                                    <td>
                                        <input class="delete cirkel wissenRow m-auto" type="submit" name="action" value="X">
                                    </td>
                                    <td>

                                        <img class="afb" src="${pageContext.request.contextPath}/${cartItem.afbeelding}" alt="picture">
                                    </td>
                                    <td class="langsElkaar">
                                        <div class="blocks" >
                                            <p>${cartItem.titel}</p>
                                            €<c:out value="${(cartItem.prijs)}"/>
                                            <input style="width: 20%" type='number'  name="aantal" value='<c:out value="${cartItem.aantal}"/>'>
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
                            <td>Subtotaal: €<c:out value="${cart.total}"/></td>
                        </tr>

                    </table>
                    <div class="keuze mt-5" >
                    <a   class="btn btn-primary btn-sm px-4 rounded-pill text-uppercase font-weight-bold shadow-sm" href="${pageContext.request.contextPath }/overzichtSpellen" >Verder winkelen</a>
                    <a   class="btn btn-info btn-sm px-4 rounded-pill text-uppercase font-weight-bold shadow-sm" href="${pageContext.request.contextPath }/overzichtSpellen" data-toggle="collapse" data-target="#demo" aria-expanded="false" aria-controls="collapseExample" >Doorgaan bestelling</a>
                    <div id="demo" class="collapse">
                        <!-- For Demo Purpose -->
                        <div class="container py-3">
                            <header class="text-center">
                                <h2 class="font-weight-bold">AFHAAL DATUM</h2>
                            </header>
                        </div>
                        <div class="container">
                            <form action="${pageContext.request.contextPath}/gebruikerBordspel/saveOrder" id="form_invoegen"  method="post">
                            <div class="row">

                                    <div class="col-md-6 mx-auto">
                                        <div class="py-4 text-center"><i class="fa fa-calendar fa-5x"></i></div>

                                        <!-- Date Picker Input -->
                                        <!-- Date Picker Input -->
                                        <div class="form-group mb-4">
                                            <div class="datepicker date input-group p-0 shadow-sm">
                                                <!--afhaal datum-->
                                                <label  for="<%=GebruikerBordspel.AFHAALDATUM%> "></label>
                                                <input type="text"
                                                       id="<%=GebruikerBordspel.AFHAALDATUM%>"
                                                       name="<%=GebruikerBordspel.AFHAALDATUM%>"
                                                       placeholder="Afhaal datum"
                                                       class="form-control py-4 px-4"  >

                                                <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                                            </div>
                                        </div><!-<!-- DEnd ate Picker Input -->
                                        <!-- For Demo Purpose -->
                                            <div class="text-center">
                                                <p id="result-1">&nbsp;</p>
                                                <p class="font-italic text-muted mb-0">Uw afhaal datum is</p>
                                            </div>

                                        <%%>
                                            <h4 id="pickedDate" class="font-weight-bold text-uppercase mb-3">Not set yet</h4>
                                            <input type="hidden" id="datetm" name="datum">
                                        <input type="submit"  value="Bevestigen" >
                                        </form>

                                        <a href="${pageContext.request.contextPath}/gebruikerBordspel/send-mail" >shopping car</a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script>

    $(document).ready(function(){
        $('#content').click(function()
        {
            var x = document.getElementById("<%=GebruikerBordspel.AFHAALDATUM%>").value;
            document.getElementById("pickedDate").innerHTML = x;
            document.getElementById("datetm").value =x;
        });

        $('#laden').click(function()
        {
            document.getElementById("form_invoegen").submit();
        });

    });
</script>

<script>
    input.oninput = function() {
        alert("submitten")

    };
</script>


<script>

    var dateSelect     = $('#<%=GebruikerBordspel.AFHAALDATUM%>');
    var dateDepart     = $('#pickedDate');
    var dateReturn     = $('#end-date');
    var spanDepart     = $('.date-depart');
    var spanReturn     = $('.date-return');
    var spanDateFormat = 'ddd, MMMM D yyyy';
    dateSelect.datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        maxViewMode: 0,
        startDate: "now"
    }).on('change', function() {
        var start = $.format.date(dateDepart.datepicker('getDate'), spanDateFormat);
        var end = $.format.date(dateReturn.datepicker('getDate'), spanDateFormat);
        spanDepart.text(start);
        spanReturn.text(end);
    });


</script>



<script src="${pageContext.request.contextPath}/js/script.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>