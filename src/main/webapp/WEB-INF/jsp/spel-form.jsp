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
    <link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">
    <link href="/css/style.css" rel="stylesheet">
</head>
<body>

<%
    Spel spel = (Spel)request.getAttribute(Spel.GAME);
    SpelError spelError = (SpelError) request.getAttribute(SpelError.GAME);
%>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>

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
                        <textarea class="form-control<%out.print(spelError.beschrijving != null ? " is-invalid" : "");%>"
                               maxlength="1000" type="text"
                               id="<%=Spel.BESCHRIJVING%>"
                               name="<%=Spel.BESCHRIJVING%>"><%=spel.getBeschrijving() == null ? "" : spel.getBeschrijving()%></textarea>
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

                            <%
                                List<Categorie> categorien = (List<Categorie>)request.getAttribute("categorien");
                                for (Categorie categorie:categorien){
                                    out.print("<option value=\"" + categorie.getBeschrijving() + "\">" + categorie.getBeschrijving() + "</option>");
                                }
                                if (spel.getCategorie() == null){
                                    out.print("<option hidden selected value = \"fout\"> -- select an option -- </option>");
                                } else {
                                    out.print("<option selected value=\"" + spel.getCategorie().getBeschrijving() + "\">" + spel.getCategorie().getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                        <%out.print(spelError.categorie != null ? "<div class=\"invalid-feedback\">" + spelError.categorie + "</div>" : "");%>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.TAAL%>">Taal</label>
                        <br>
                        <select name="<%=Spel.TAAL%>" id="<%=Spel.TAAL%>">

                            <%
                                List<Taal> talen = (List<Taal>)request.getAttribute("talen");
                                for (Taal taal:talen){
                                    out.print("<option value=\"" + taal.getBeschrijving() + "\">" + taal.getBeschrijving() + "</option>");
                                }
                                if (spel.getTaal() == null){
                                    out.print("<option hidden selected value = \"fout\"> -- select an option -- </option>");
                                } else {
                                    out.print("<option selected value=\"" + spel.getTaal().getBeschrijving() + "\">" + spel.getTaal().getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                        <%out.print(spelError.taal != null ? "<div class=\"invalid-feedback\">" + spelError.taal + "</div>" : "");%>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.UITGEVER%>">Uitgever</label>
                        <br>
                        <select name="<%=Spel.UITGEVER%>" id="<%=Spel.UITGEVER%>">
                            <%
                                List<Uitgever> uitgevers = (List<Uitgever>)request.getAttribute("uitgevers");
                                for (Uitgever uitgever:uitgevers){
                                    out.print("<option value=\"" + uitgever.getBeschrijving() + "\">" + uitgever.getBeschrijving() + "</option>");
                                }
                                if (spel.getUitgever() == null){
                                    out.print("<option hidden selected value = \"fout\"> -- select an option -- </option>");
                                } else {
                                    out.print("<option selected value=\"" + spel.getUitgever().getBeschrijving() + "\">" + spel.getUitgever().getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                        <%out.print(spelError.uitgever != null ? "<div class=\"invalid-feedback\">" + spelError.uitgever + "</div>" : "");%>
                    </div>
                    <div class="form-group col-lg-3 form-group col-md-6 form-group col-sm-12">
                        <label for="<%=Spel.STATUS%>">Status</label>
                        <br>
                        <select name="<%=Spel.STATUS%>" id="<%=Spel.STATUS%>">
                            <%
                                List<Status> statussen = (List<Status>)request.getAttribute("statussen");
                                for (Status status:statussen){
                                    out.print("<option value=\"" + status.getBeschrijving() + "\">" + status.getBeschrijving() + "</option>");
                                }
                                if (spel.getStatus() == null){
                                    out.print("<option hidden selected value = \"fout\"> -- select an option -- </option>");
                                } else {
                                    out.print("<option selected value=\"" + spel.getStatus().getBeschrijving() + "\">" + spel.getStatus().getBeschrijving() + "</option>");
                                }
                            %>
                        </select>
                        <%out.print(spelError.status != null ? "<div class=\"invalid-feedback\">" + spelError.status + "</div>" : "");%>
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
                        <input type="submit" class="btn btn-success btn-sm px-4 text-uppercase font-weight-bold shadow-sm" value="Opslaan">
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
