<%@ page import="be.thomasmore.graduaten.playtime.entity.Spel" %>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
    <div class="col-md-offset-2 col-md-7">
        <h3 class="text-center">Spring MVC 5 + Spring Data JPA 2 + JSP + MySQL
            Example - Customer Management</h3>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Add Customer</div>
            </div>
            <div class="panel-body">
                <form:form action="saveSpel" cssClass="form-horizontal"
                method="post" modelAttribute="spel">

                <form:hidden path="id"/>

                    <div class="form-group col-4">
                        <label class="form-control-label" for="naam">Naam</label>
                        <input type="text" class="form-control" id="naam" name="naam">

                        <label class="form-control-label" for="foto">Foto</label>
                        <input type="text" class="form-control" id="foto" name="foto">

                        <label class="form-control-label" for="prijs">Prijs</label>
                        <input type="text" class="form-control" id="prijs" name="prijs">

                        <label class="form-control-label" for="beschrijving">Beschrijving</label>
                        <input type="text" class="form-control" id="beschrijving" name="beschrijving">

                        <label class="form-control-label" for="categorie">Categorie</label>
                        <input type="text" class="form-control" id="categorie" name="categorie">

                        <label class="form-control-label" for="min_spelers">Minimum Spelers</label>
                        <input type="text" class="form-control" id="min_spelers" name="min_spelers">

                        <label class="form-control-label" for="max_spelers">Maximum Spelers</label>
                        <input type="text" class="form-control" id="max_spelers" name="max_spelers">

                        <label class="form-control-label" for="min_leeftijd">Minimum leeftijd</label>
                        <input type="text" class="form-control" id="min_leeftijd" name="min_leeftijd">

                        <label class="form-control-label" for="taal">Taal</label>
                        <input type="text" class="form-control" id="taal" name="taal">

                        <label class="form-control-label" for="uitgever">Uitgever</label>
                        <input type="text" class="form-control" id="uitgever" name="uitgever">

                        <label class="form-control-label" for="status">Status</label>
                        <input type="text" class="form-control" id="status" name="status">

                        <label class="form-control-label" for="voorraad_huur">Voorraad huur</label>
                        <input type="text" class="form-control" id="voorraad_huur" name="voorraad_huur">

                        <label class="form-control-label" for="voorraad_koop">Voorraad koop</label>
                        <input type="text" class="form-control" id="voorraad_koop" name="voorraad_koop">

                    </div>

                    <div class="row col-md-12">

                        <div  class="form-group col-6" >
                            <input type="submit" class="btn btn-primary" value="Registreren">

                    </form:form>
</body>
</html>
