<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.UserError" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.MyUserDetails" %>
<%@ page import="javax.sql.RowSet" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>

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



    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/card.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/js/bootstrap-datepicker.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-dateFormat/1.0/jquery.dateFormat.js'>
    </script><script  src="./script.js"></script>
</head>

<body>

<%
    Gebruiker gebruiker = (Gebruiker)request.getAttribute(Gebruiker.NAME);
    UserError userError = (UserError) request.getAttribute(UserError.NAME);
%>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>

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
                               type="text"
                               placeholder="yyyy-mm-dd"
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
                        <%out.print(userError.rol != null ? "<div class=\"invalid-feedback\">" + userError.rol + "</div>" : "");%>
                        <section >
                            <input type="radio"
                                   id="<%=Gebruiker.ROL%>"
                                   name="<%=Gebruiker.ROL%>"
                                   class="design"
                                   value="ROLE_USER">
                            <label class="form-control-label" for="<%=Gebruiker.ROL%>">Klant</label>
                        </section>

                        <section>
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


<script>

    var dateSelect     = $('#<%=Gebruiker.GEBOORTEDATUM%>');
    var dateDepart     = $('#pickedDate');
    var dateReturn     = $('#end-date');
    var spanDepart     = $('.date-depart');
    var spanReturn     = $('.date-return');
    var spanDateFormat = 'ddd, MMMM D yyyy';
    dateSelect.datepicker({
        autoclose: true,
        format: "yyyy-mm-dd",
        maxViewMode: 0,
        endDate: "now"
    }).on('change', function() {
        var start = $.format.date(dateDepart.datepicker('getDate'), spanDateFormat);
        var end = $.format.date(dateReturn.datepicker('getDate'), spanDateFormat);
        spanDepart.text(start);
        spanReturn.text(end);
    });


</script>


<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
</body>
</html>