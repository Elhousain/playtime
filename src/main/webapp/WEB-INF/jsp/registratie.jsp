<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Registreren</title>
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

<%
    HashMap<String, String> values = (HashMap<String, String>) request.getAttribute("values");
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
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




            <form action="/data-add-gebruiker" method="post">

                <div class="row col-md-12">


                    <div class="form-group col-4">


                            <label class="form-control-label" for="<%=Gebruiker.VOORNAAM%>"><%=Gebruiker.VOORNAAM%></label>
                            <input class="form-control" maxlength="20" type="text" id="<%=Gebruiker.VOORNAAM%>" name="<%=Gebruiker.VOORNAAM%>" value="<%=values.get(Gebruiker.VOORNAAM)%>">

                            <%
                            if (errors.containsKey(Gebruiker.VOORNAAM)) {
                            out.print("<span style='color: red;'>" + errors.get(Gebruiker.VOORNAAM) + "</span>");
                            }
                            %>



                    </div>

                    <div class="form-group col-4">

                        <label class="form-control-label" for="<%=Gebruiker.ACHTERNAAM%>"><%=Gebruiker.ACHTERNAAM%></label>
                        <input class="form-control" maxlength="30" type="text" id="<%=Gebruiker.ACHTERNAAM%>" name="<%=Gebruiker.ACHTERNAAM%>" value="<%=values.get(Gebruiker.ACHTERNAAM)%>">

                        <%
                            if (errors.containsKey(Gebruiker.ACHTERNAAM)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.ACHTERNAAM) + "</span>");
                            }
                        %>



                    </div>



                        <div class="form-group col-4">
                            <!--afhaal datum-->
                            <label class="form-control-label" for="<%=Gebruiker.GEBOORTEDATUM%>"><%=Gebruiker.GEBOORTEDATUM%></label>


                            <input type="text"
                                   class="form-control"
                                   id="<%=Gebruiker.GEBOORTEDATUM%>"
                                   name="<%=Gebruiker.GEBOORTEDATUM%>"
                                   placeholder="yyyy-MM-dd"
                                   class="form-control py-4 px-4"
                                   value="<%=values.get(Gebruiker.GEBOORTEDATUM)%>"
                            >

                            <%
                                if (errors.containsKey(Gebruiker.GEBOORTEDATUM)) {
                                    out.print("<span style='color: red;'>" + errors.get(Gebruiker.GEBOORTEDATUM) + "</span>");
                                }
                            %>

                            <div class="input-group-append"><span class="input-group-text px-4"><i class="fa fa-clock-o"></i></span></div>
                        </div>

                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Gebruiker.STRAAT%>"><%=Gebruiker.STRAAT%></label>
                        <input class="form-control" maxlength="40" type="text" id="<%=Gebruiker.STRAAT%>" name="<%=Gebruiker.STRAAT%>" value="<%=values.get(Gebruiker.STRAAT)%>">

                        <%
                            if (errors.containsKey(Gebruiker.STRAAT)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.STRAAT) + "</span>");
                            }
                        %>
                    </div>

                    <div class="form-group col-2">
                        <label class="form-control-label" for="<%=Gebruiker.HUISNUMMER%>"><%=Gebruiker.HUISNUMMER%></label>
                        <input class="form-control" maxlength="4" type="number"  min="1" id="<%=Gebruiker.HUISNUMMER%>" name="<%=Gebruiker.HUISNUMMER%>" value="<%=values.get(Gebruiker.HUISNUMMER)%>">

                        <%
                            if (errors.containsKey(Gebruiker.HUISNUMMER)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.HUISNUMMER) + "</span>");
                            }
                        %>
                    </div>

                </div>

                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Gebruiker.WOONPLAATS%>"><%=Gebruiker.WOONPLAATS%></label>
                        <input class="form-control"  maxlength="20" type="text" id="<%=Gebruiker.WOONPLAATS%>" name="<%=Gebruiker.WOONPLAATS%>" value="<%=values.get(Gebruiker.WOONPLAATS)%>">

                        <%
                            if (errors.containsKey(Gebruiker.WOONPLAATS)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.WOONPLAATS) + "</span>");
                            }
                        %>
                    </div>
                    <div class="form-group col-2">
                        <label class="form-control-label" for="<%=Gebruiker.POSTCODE%>"><%=Gebruiker.POSTCODE%></label>
                        <input class="form-control" maxlength="4" type="number" min="1000" id="<%=Gebruiker.POSTCODE%>" name="<%=Gebruiker.POSTCODE%>" value="<%=values.get(Gebruiker.POSTCODE)%>">

                        <%
                            if (errors.containsKey(Gebruiker.POSTCODE)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.POSTCODE) + "</span>");
                            }
                        %>
                    </div>

                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Gebruiker.TELEFOON%>"><%=Gebruiker.TELEFOON%></label>
                        <input class="form-control" maxlength="20" type="tel"  id="<%=Gebruiker.TELEFOON%>" name="<%=Gebruiker.TELEFOON%>" value="<%=values.get(Gebruiker.TELEFOON)%>">

                        <%
                            if (errors.containsKey(Gebruiker.TELEFOON)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.TELEFOON) + "</span>");
                            }
                        %>



                    </div>

                </div>





                <div class="row col-md-12">

                    <div class="form-group col-6">

                        <label class="form-control-label" for="<%=Gebruiker.EMAIL%>"><%=Gebruiker.EMAIL%></label>
                        <input class="form-control" maxlength="40" type="text" id="<%=Gebruiker.EMAIL%>" name="<%=Gebruiker.EMAIL%>" value="<%=values.get(Gebruiker.EMAIL)%>">
                        <%
                            if (errors.containsKey(Gebruiker.EMAIL)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.EMAIL) + "</span>");
                            }
                        %>




                    </div>
                    <div class="form-group col-6">
                        <label class="form-control-label" for="<%=Gebruiker.PASWOORD%>"><%=Gebruiker.PASWOORD%></label>
                        <input class="form-control" maxlength="40" type="password" id="<%=Gebruiker.PASWOORD%>" name="<%=Gebruiker.PASWOORD%>" value="<%=values.get(Gebruiker.PASWOORD)%>">

                        <%
                            if (errors.containsKey(Gebruiker.PASWOORD)) {
                                out.print("<span style='color: red;'>" + errors.get(Gebruiker.PASWOORD) + "</span>");
                            }
                        %>
                    </div>

                </div>

                <div class="row col-md-12">

                    <div  class="form-group col-6" >
                        <input type="submit" class="btn btn-primary" value="Registreren">
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