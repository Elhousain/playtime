<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%--
  Created by IntelliJ IDEA.
  User: tomsc
  Date: 28/11/2020
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>
<div class="wrapper d-flex align-items-stretch">
    <!--#region Navigatie-->
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.png);"></a>
            <ul class="list-unstyled components mb-5">
                <li>
                    <a href="${pageContext.request.contextPath}/overzichtSpellen">Overzicht spelletjes</a>
                    <a href="${pageContext.request.contextPath}/overzichtGebruikers">Overzicht gebruikers</a>
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
                    </ul>
                </div>
            </div>
        </nav>
        <!--#endregion -->
        <div class="container">
            <div class="col-md-offset-2 col-md-7">
                <h3 class="text-center">Spel toevoegen</h3>
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Add Spel</div>
                    </div>
                    <div class="panel-body">

                        <%
                            Spel spel = (Spel)request.getAttribute(Spel.SPEL);
                            if (spel.getNaam()==null){
                                spel.setNaam("");
                                spel.setBeschrijving("");
                            }
                        %>

                        <form:form action="saveSpel" method="post" modelAttribute="spel" >
                            <form:hidden path="id"/>

                            <div class="form-group col-4">
                                <label class="form-control-label" for="naam">Naam</label>
                                <input type="text" class="form-control" id="naam" name="naam" value="<%=spel.getNaam()%>">

                                <label class="form-control-label" for="foto">Foto</label>
                                <input type="text" class="form-control" id="foto" name="foto">

                                <label class="form-control-label" for="prijs">Prijs</label>
                                <input type="text" class="form-control" id="prijs" name="prijs" value="<%=spel.getPrijs()%>">

                                <label class="form-control-label" for="beschrijving">Beschrijving</label>
                                <input type="text" class="form-control" id="beschrijving" name="beschrijving" value="<%=spel.getBeschrijving()%>">

                                <label for="categorie">Categorie</label>
                                <select name="categorie" id="categorie">
                                    <option hidden disabled selected value> -- select an option -- </option>
                                    <%
                                        List<Categorie> categorien = (List<Categorie>)request.getAttribute("categorien");
                                        for (Categorie categorie:categorien){
                                            out.print("<option value=" + categorie.getId() + ">" + categorie.getBeschrijving() + "</option>");
                                        }
                                    %>
                                </select>

                                <label class="form-control-label" for="min_spelers">Minimum Spelers</label>
                                <input type="text" class="form-control" id="min_spelers" name="min_spelers" value="<%=spel.getMin_spelers()%>">

                                <label class="form-control-label" for="max_spelers">Maximum Spelers</label>
                                <input type="text" class="form-control" id="max_spelers" name="max_spelers" value="<%=spel.getMax_spelers()%>">

                                <label class="form-control-label" for="min_leeftijd">Minimum leeftijd</label>
                                <input type="text" class="form-control" id="min_leeftijd" name="min_leeftijd" value="<%=spel.getMin_leeftijd()%>">

                                <label for="taal">Taal</label>
                                <select name="taal" id="taal">
                                    <option hidden disabled selected value> -- select an option -- </option>
                                    <%
                                        List<Taal> talen = (List<Taal>)request.getAttribute("talen");
                                        for (Taal taal:talen){
                                            out.print("<option value=" + taal.getId() + ">" + taal.getBeschrijving() + "</option>");
                                        }
                                    %>
                                </select>

                                <label for="uitgever">Uitgever</label>
                                <select name="uitgever" id="uitgever">
                                    <option hidden disabled selected value> -- select an option -- </option>
                                    <%
                                        List<Uitgever> uitgevers = (List<Uitgever>)request.getAttribute("uitgevers");
                                        for (Uitgever uitgever:uitgevers){
                                            out.print("<option value=" + uitgever.getId() + ">" + uitgever.getBeschrijving() + "</option>");
                                        }
                                    %>
                                </select>

                                <label for="status">Status</label>
                                <select name="status" id="status">
                                    <option hidden disabled selected value> -- select an option -- </option>
                                    <%
                                        List<Status> statussen = (List<Status>)request.getAttribute("statussen");
                                        for (Status status:statussen){
                                            out.print("<option value=" + status.getId() + ">" + status.getBeschrijving() + "</option>");
                                        }
                                    %>
                                </select>

                                <label class="form-control-label" for="voorraad_huur">Voorraad huur</label>
                                <input type="text" class="form-control" id="voorraad_huur" name="voorraad_huur" value="<%=spel.getVoorraad_huur()%>">

                                <label class="form-control-label" for="voorraad_koop">Voorraad koop</label>
                                <input type="text" class="form-control" id="voorraad_koop" name="voorraad_koop" value="<%=spel.getVoorraad_koop()%>">

                            </div>

                            <div class="row col-md-12">

                                <div  class="form-group col-6" >
                                    <input type="submit" class="btn btn-primary" value="Registreren">
                                </div>
                            </div>

                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
