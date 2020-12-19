<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%--
  Created by IntelliJ IDEA.
  User: tomsc
  Date: 16/12/2020
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Gebruiker</title>
</head>
<body>
<%
    Gebruiker gebruiker = (Gebruiker) request.getAttribute(Gebruiker.GEBRUIKER);
    if (gebruiker.getVoornaam()==null){
        gebruiker.setVoornaam("");
        gebruiker.setAchternaam("");
        gebruiker.setEmail("");
        gebruiker.setPaswoord("");
        gebruiker.setStraat("");
        gebruiker.setTelefoon("");
        gebruiker.setWoonplaats("");
    }
%>

<form:form action="saveGebruiker" method="post" modelAttribute="gebruiker">
    <form:hidden path="id"/>

    <label class="form-control-label" for="voornaam">Voornaam</label>
    <input type="text" class="form-control" id="voornaam" name="voornaam" value="<%=gebruiker.getVoornaam()%>">

    <label class="form-control-label" for="achternaam">Achternaam</label>
    <input type="text" class="form-control" id="achternaam" name="achternaam" value="<%=gebruiker.getAchternaam()%>">

    <label class="form-control-label" for="email">Email</label>
    <input type="text" class="form-control" id="email" name="email" value="<%=gebruiker.getEmail()%>">

    <label class="form-control-label" for="straat">Straat</label>
    <input type="text" class="form-control" id="straat" name="straat" value="<%=gebruiker.getStraat()%>">

    <label class="form-control-label" for="huisnummer">Huisnummer</label>
    <input type="text" class="form-control" id="huisnummer" name="huisnummer" value="<%=gebruiker.getHuisnummer()%>">

    <label class="form-control-label" for="woonplaats">Woonplaats</label>
    <input type="text" class="form-control" id="woonplaats" name="woonplaats" value="<%=gebruiker.getWoonplaats()%>">

    <label class="form-control-label" for="postcode">Postcode</label>
    <input type="text" class="form-control" id="postcode" name="postcode" value="<%=gebruiker.getPostcode()%>">

    <label class="form-control-label" for="telefoon">Telefoon</label>
    <input type="text" class="form-control" id="telefoon" name="telefoon" value="<%=gebruiker.getTelefoon()%>">

    <label class="form-control-label" for="paswoord">Paswoord</label>
    <input type="text" class="form-control" id="paswoord" name="paswoord" value="<%=gebruiker.getPaswoord()%>">

    <div  class="form-group col-6" >
        <input type="submit" class="btn btn-primary" value="Registreren">
    </div>

</form:form>
</body>
</html>
