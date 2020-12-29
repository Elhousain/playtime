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

<%
    Spel spel = (Spel)request.getAttribute(Spel.SPEL);



    SpelError spelError = (SpelError) request.getAttribute(SpelError.SPEL);


%>

<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <img class="img logo rounded-circle mb-5" src="${pageContext.request.contextPath}/images/logo.png">
            <ul class="list-unstyled components mb5-">
                <li>
                    <a href="${pageContext.request.contextPath}/overzichtSpellen">Overzicht spelletjes</a>
                    <a href="${pageContext.request.contextPath}/overzichtGebruikers">Overzicht gebruikers</a>
                </li>
                <li>
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
                <p>PLAYTIME</p>
            </div>

        </div>
    </nav>






    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <!--
<button type="button" id="sidebarCollapse" class="btn btn-primary">
<i class="fa fa-bars"></i>
<span class="sr-only">Toggle Menu</span>
</button>
<button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<i class="fa fa-bars"></i>
</button>
-->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact</a>

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Inloggen</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container">
            <form  class="needs-validation" action="saveSpel" method="post" novalidate>
                <input type="hidden" id="<%=Spel.ID%>" name="<%=Spel.ID%>" value="<%=spel.getId()%>"/>

                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Spel.NAAM%>"><%=Spel.NAAM%></label>
                        <input class="form-control<%out.print(spelError.naam != null ? " is-invalid" : "");%>"
                               maxlength="50" type="text"
                               id="<%=Spel.NAAM%>"
                               name="<%=Spel.NAAM%>"
                               value="<%=spel.getNaam() == null ? "" : spel.getNaam()%>">
                        <%out.print(spelError.naam != null ? "<div class=\"invalid-feedback\">" + spelError.naam + "</div>" : "");%>
                    </div>

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Spel.PRIJS%>"><%=Spel.PRIJS%></label>
                        <input class="form-control<%out.print(spelError.prijs != null ? " is-invalid" : "");%>"
                               maxlength="10" type="number"
                               id="<%=Spel.PRIJS%>"
                               name="<%=Spel.PRIJS%>"
                               value="<%=spel.getPrijs() == 0 ? "" : spel.getPrijs()%>">
                        <%out.print(spelError.prijs != null ? "<div class=\"invalid-feedback\">" + spelError.prijs + "</div>" : "");%>
                    </div>
                </div>

                <div class="row col-md-12">
                    <div class="form-group col-12">
                        <label class="form-control-label" for="<%=Spel.BESCHRIJVING%>"><%=Spel.BESCHRIJVING%></label>
                        <input class="form-control<%out.print(spelError.beschrijving != null ? " is-invalid" : "");%>"
                               maxlength="1000" type="text"
                               id="<%=Spel.BESCHRIJVING%>"
                               name="<%=Spel.BESCHRIJVING%>"
                               value="<%=spel.getBeschrijving() == null ? "" : spel.getBeschrijving()%>">
                        <%out.print(spelError.beschrijving != null ? "<div class=\"invalid-feedback\">" + spelError.beschrijving + "</div>" : "");%>
                    </div>
                </div>

                <div class="row col-md-12">
                    <div class="form-group col-4">
                        <label class="form-control-label" for="<%=Spel.MIN_SPELERS%>"><%=Spel.MIN_SPELERS%></label>
                        <input class="form-control<%out.print(spelError.min_spelers != null ? " is-invalid" : "");%>"
                               maxlength="3" type="number"
                               id="<%=Spel.MIN_SPELERS%>"
                               name="<%=Spel.MIN_SPELERS%>"
                               value="<%=spel.getMin_spelers() == 0 ? "" : spel.getMin_spelers()%>">
                        <%out.print(spelError.min_spelers != null ? "<div class=\"invalid-feedback\">" + spelError.min_spelers + "</div>" : "");%>
                    </div>

                    <div class="form-group col-4">
                        <label class="form-control-label" for="<%=Spel.MAX_SPELERS%>"><%=Spel.MAX_SPELERS%></label>
                        <input class="form-control<%out.print(spelError.max_spelers != null ? " is-invalid" : "");%>"
                               maxlength="3" type="number"
                               id="<%=Spel.MAX_SPELERS%>"
                               name="<%=Spel.MAX_SPELERS%>"
                               value="<%=spel.getMax_spelers() == 0 ? "" : spel.getMax_spelers()%>">
                        <%out.print(spelError.max_spelers != null ? "<div class=\"invalid-feedback\">" + spelError.max_spelers + "</div>" : "");%>
                    </div>

                    <div class="form-group col-4">
                        <label class="form-control-label" for="<%=Spel.MIN_LEEFTIJD%>"><%=Spel.MIN_LEEFTIJD%></label>
                        <input class="form-control<%out.print(spelError.min_leeftijd != null ? " is-invalid" : "");%>"
                               maxlength="3" type="number"
                               id="<%=Spel.MIN_LEEFTIJD%>"
                               name="<%=Spel.MIN_LEEFTIJD%>"
                               value="<%=spel.getMin_leeftijd() == 0 ? "" : spel.getMin_leeftijd()%>">
                        <%out.print(spelError.min_leeftijd != null ? "<div class=\"invalid-feedback\">" + spelError.min_leeftijd + "</div>" : "");%>
                    </div>
                </div>

                <div class="row col-md-12">
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12" >
                        <label for="<%=Spel.CATEGORIE%>">Categorie</label>
                        <br>
                        <select name="<%=Spel.CATEGORIE%>" id="<%=Spel.CATEGORIE%>">
                            <option hidden disabled selected value> -- select an option -- </option>
                            <%
                                List<Categorie> categorien = (List<Categorie>)request.getAttribute("categorien");
                                for (Categorie categorie:categorien){
                                    out.print("<option value=" + categorie.getBeschrijving() + ">" + categorie.getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.TAAL%>">Taal</label>
                        <br>
                        <select name="<%=Spel.TAAL%>" id="<%=Spel.TAAL%>">
                            <option hidden disabled selected value> -- select an option -- </option>
                            <%
                                List<Taal> talen = (List<Taal>)request.getAttribute("talen");
                                for (Taal taal:talen){
                                    out.print("<option value=" + taal.getBeschrijving() + ">" + taal.getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.UITGEVER%>">Uitgever</label>
                        <br>
                        <select name="<%=Spel.UITGEVER%>" id="<%=Spel.UITGEVER%>">
                            <option hidden disabled selected value> -- select an option -- </option>
                            <%
                                List<Uitgever> uitgevers = (List<Uitgever>)request.getAttribute("uitgevers");
                                for (Uitgever uitgever:uitgevers){
                                    out.print("<option value=" + uitgever.getBeschrijving() + ">" + uitgever.getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.STATUS%>">Status</label>
                        <br>
                        <select name="<%=Spel.STATUS%>" id="<%=Spel.STATUS%>">
                            <option hidden disabled selected value> -- select an option -- </option>
                            <%
                                List<Status> statussen = (List<Status>)request.getAttribute("statussen");
                                for (Status status:statussen){
                                    out.print("<option value=" + status.getBeschrijving() + ">" + status.getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </div>

                <div class="row col-md-12">
                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Spel.VOORRAAD_HUUR%>"><%=Spel.VOORRAAD_HUUR%></label>
                        <input class="form-control<%out.print(spelError.voorraad_huur != null ? " is-invalid" : "");%>"
                               maxlength="4" type="number"
                               id="<%=Spel.VOORRAAD_HUUR%>"
                               name="<%=Spel.VOORRAAD_HUUR%>"
                               value="<%=spel.getVoorraad_huur() == 0 ? "" : spel.getVoorraad_huur()%>">
                        <%out.print(spelError.voorraad_huur != null ? "<div class=\"invalid-feedback\">" + spelError.voorraad_huur + "</div>" : "");%>
                    </div>
                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Spel.VOORRAAD_KOOP%>"><%=Spel.VOORRAAD_KOOP%></label>
                        <input class="form-control<%out.print(spelError.voorraad_koop != null ? " is-invalid" : "");%>"
                               maxlength="4" type="number"
                               id="<%=Spel.VOORRAAD_KOOP%>"
                               name="<%=Spel.VOORRAAD_KOOP%>"
                               value="<%=spel.getVoorraad_koop() == 0 ? "" : spel.getVoorraad_koop()%>">
                        <%out.print(spelError.voorraad_koop != null ? "<div class=\"invalid-feedback\">" + spelError.voorraad_koop + "</div>" : "");%>
                    </div>
                </div>

                <div class="row col-md-12">
                    <div  class="form-group col-6" >
                        <input type="submit" class="btn btn-primary" value="Opslaan">
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>


<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
</body>
</body>
</html>
