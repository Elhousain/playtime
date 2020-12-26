<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.UserError" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>PlayTime - Toevoegen/Updaten Gebruiker</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
</head>
<body>

<%
    Gebruiker gebruiker = (Gebruiker)request.getAttribute(Gebruiker.NAME);



    UserError userError = (UserError) request.getAttribute(UserError.NAME);


%>

<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5" style="background-image: url(images/logo.png);"></a>
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






            <form  class="needs-validation" action="saveGebruiker" method="post" novalidate>
                <input type="hidden" id="<%=Gebruiker.ID%>" name="<%=Gebruiker.ID%>" value="<%=gebruiker.getId()%>"/>

                <div class="row col-md-12">


                    <div class="form-group col-4">

                        <label class="form-control-label" for="<%=Gebruiker.VOORNAAM%>"><%=Gebruiker.VOORNAAM%></label>
                        <input class="form-control<%out.print(userError.voornaam != null ? " is-invalid" : "");%>"
                               maxlength="20" type="text"
                               id="<%=Gebruiker.VOORNAAM%>"
                               name="<%=Gebruiker.VOORNAAM%>"
                               value="<%=gebruiker.getVoornaam() == null ? "" : gebruiker.getVoornaam()%>">
                        <%out.print(userError.voornaam != null ? "<div class=\"invalid-feedback\">" + userError.voornaam + "</div>" : "");%>
                    </div>

                    <div class="form-group col-4">
                        <label class="form-control-label" for="<%=Gebruiker.ACHTERNAAM%>"><%=Gebruiker.ACHTERNAAM%></label>
                        <input class="form-control<%out.print(userError.achternaam != null ? " is-invalid" : "");%>"
                               maxlength="30" type="text"
                               id="<%=Gebruiker.ACHTERNAAM%>"
                               name="<%=Gebruiker.ACHTERNAAM%>"
                               value="<%=gebruiker.getAchternaam() == null ? "" : gebruiker.getAchternaam()%>">
                        <%out.print(userError.achternaam != null ? "<div class=\"invalid-feedback\">" + userError.achternaam + "</div>" : "");%>


                    </div>
                    <div class="form-group col-4">



                        <label class="form-control-label" for="<%=Gebruiker.GEBOORTEDATUM%>"><%=Gebruiker.GEBOORTEDATUM%></label>
                        <input class="form-control<%out.print(userError.geboortedatum != null ? " is-invalid" : "");%>"
                               type="date"
                               placeholder="dd-mm-yyyy"
                               id="<%=Gebruiker.GEBOORTEDATUM%>"
                               name="<%=Gebruiker.GEBOORTEDATUM%>"
                               value="<%=gebruiker.getGeboortedatum() == null ? "" : gebruiker.getGeboortedatum()%>">
                        <%out.print(userError.geboortedatum != null ? "<div class=\"invalid-feedback\">" + userError.geboortedatum + "</div>" : "");%>


                    </div>









                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">




                        <label class="form-control-label" for="<%=Gebruiker.STRAAT%>"><%=Gebruiker.STRAAT%></label>
                        <input class="form-control<%out.print(userError.straat != null ? " is-invalid" : "");%>"
                               maxlength="40" type="text"
                               id="<%=Gebruiker.STRAAT%>"
                               name="<%=Gebruiker.STRAAT%>"
                               value="<%=gebruiker.getStraat() == null ? "" : gebruiker.getStraat()%>">
                        <%out.print(userError.straat != null ? "<div class=\"invalid-feedback\">" + userError.straat + "</div>" : "");%>


                    </div>

                    <div class="form-group col-2">



                        <label class="form-control-label" for="<%=Gebruiker.HUISNUMMER%>"><%=Gebruiker.HUISNUMMER%></label>
                        <input class="form-control<%out.print(userError.huisnummer != null ? " is-invalid" : "");%>"
                               maxlength="4" type="number" min="1"
                               id="<%=Gebruiker.HUISNUMMER%>"
                               name="<%=Gebruiker.HUISNUMMER%>"
                               value="<%=gebruiker.getHuisnummer() == null ? "" : gebruiker.getHuisnummer()%>">
                        <%out.print(userError.huisnummer != null ? "<div class=\"invalid-feedback\">" + userError.huisnummer + "</div>" : "");%>


                    </div>

                </div>

                <div class="row col-md-12">

                    <div class="form-group col-6">

                        <label class="form-control-label" for="<%=Gebruiker.WOONPLAATS%>"><%=Gebruiker.WOONPLAATS%></label>
                        <input class="form-control<%out.print(userError.woonplaats != null ? " is-invalid" : "");%>"
                               maxlength="20" type="text"
                               id="<%=Gebruiker.WOONPLAATS%>"
                               name="<%=Gebruiker.WOONPLAATS%>"
                               value="<%=gebruiker.getWoonplaats() == null ? "" : gebruiker.getWoonplaats()%>">
                        <%out.print(userError.woonplaats != null ? "<div class=\"invalid-feedback\">" + userError.woonplaats + "</div>" : "");%>


                    </div>
                    <div class="form-group col-2">


                        <label class="form-control-label" for="<%=Gebruiker.POSTCODE%>"><%=Gebruiker.POSTCODE%></label>
                        <input class="form-control<%out.print(userError.postcode != null ? " is-invalid" : "");%>"
                               min="1000" maxlength="4" type="number"
                               id="<%=Gebruiker.POSTCODE%>"
                               name="<%=Gebruiker.POSTCODE%>"
                               value="<%=gebruiker.getPostcode() == null ? "" : gebruiker.getPostcode()%>">
                        <%out.print(userError.postcode != null ? "<div class=\"invalid-feedback\">" + userError.postcode + "</div>" : "");%>



                    </div>

                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Gebruiker.TELEFOON%>"><%=Gebruiker.TELEFOON%></label>
                        <input class="form-control<%out.print(userError.telefoon != null ? " is-invalid" : "");%>"
                               maxlength="20" type="tel"
                               id="<%=Gebruiker.TELEFOON%>"
                               name="<%=Gebruiker.TELEFOON%>"
                               value="<%=gebruiker.getTelefoon() == null ? "" : gebruiker.getTelefoon()%>">
                        <%out.print(userError.telefoon != null ? "<div class=\"invalid-feedback\">" + userError.telefoon + "</div>" : "");%>

                    </div>

                    <div class="form-group col-2">

                        <%out.print(userError.rol != null ? "<p class=\"invalid-feedback\">" + userError.rol + "</p>" : "");%>

<section >
                        <input type="radio"
                               id="<%=Gebruiker.ROL%>"
                               name="<%=Gebruiker.ROL%>"
                               class="design"
                               value="ROLE_USER">

                        <label class="form-control-label" for="<%=Gebruiker.ROL%>">Klant</label>


</section>

                        <section >
                        <input type="radio"
                               id="<%=Gebruiker.ROL%>"
                               name="<%=Gebruiker.ROL%>"
                               class="design"
                               value="ROLE_ADMIN">
                        <label class="form-control-label" for="<%=Gebruiker.ROL%>">Admin</label>




</section>

                    </div>


                </div>





                <div class="row col-md-12">

                    <div class="form-group col-6">

                        <label class="form-control-label" for="<%=Gebruiker.EMAIL%>"><%=Gebruiker.EMAIL%></label>
                        <input class="form-control<%out.print(userError.email != null ? " is-invalid" : "");%>"
                               maxlength="40" type="text"
                               id="<%=Gebruiker.EMAIL%>"
                               name="<%=Gebruiker.EMAIL%>"
                               value="<%=gebruiker.getEmail() == null ? "" : gebruiker.getEmail()%>">
                        <%out.print(userError.email != null ? "<div class=\"invalid-feedback\">" + userError.email + "</div>" : "");%>



                    </div>
                    <div class="form-group col-6">

                        <label class="form-control-label" for="<%=Gebruiker.PASWOORD%>"><%=Gebruiker.PASWOORD%></label>
                        <input class="form-control<%out.print(userError.paswoord != null ? " is-invalid" : "");%>"
                               maxlength="40" type="password"
                               id="<%=Gebruiker.PASWOORD%>"
                               name="<%=Gebruiker.PASWOORD%>"
                               value="<%=gebruiker.getPaswoord() == null ? "" : gebruiker.getPaswoord()%>">
                        <%out.print(userError.paswoord != null ? "<div class=\"invalid-feedback\">" + userError.paswoord + "</div>" : "");%>

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
</html>