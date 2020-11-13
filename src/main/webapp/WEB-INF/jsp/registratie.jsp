<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html lang="en">
<head>
    <title>PlayTime - Registreren</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

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




            <form action="${pageContext.request.contextPath}/data-add-gebruiker" method="post">

                <div class="row col-md-12">


                    <div class="form-group col-4">
                        <label class="form-control-label" for="voornaam">Voornaam</label>
                        <input type="text" class="form-control" id="voornaam" name="voornaam">
                    </div>
                    <div class="form-group col-4">
                        <label class="form-control-label" for="achternaam">Familienaam</label>
                        <input type="text" class="form-control" id="achternaam" name="achternaam">
                    </div>
                    <div class="form-group col-4">
                        <label class="form-control-label" for="geboortedatum">Geboortedatum</label>
                        <input type="date" class="form-control" placeholder="dd-mm-yyyy" id="geboortedatum" name="geboortedatum">
                    </div>









                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="straat">Straat</label>
                        <input type="text" class="form-control" id="straat" name="straat">
                    </div>

                    <div class="form-group col-2">
                        <label class="form-control-label" for="huisnummer">Huisnummer</label>
                        <input type="text" class="form-control" id="huisnummer" name="huisnummer">
                    </div>

                </div>

                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="woonplaats">Gemeente</label>
                        <input type="text" class="form-control" id="woonplaats" name="woonplaats">
                    </div>
                    <div class="form-group col-2">
                        <label class="form-control-label" for="postcode">Postcode</label>
                        <input type="text" class="form-control" id="postcode" name="postcode">
                    </div>

                </div>


                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label class="form-control-label" for="telefoon">Telefoon</label>
                        <input type="text" class="form-control" id="telefoon" name="telefoon">
                    </div>

                </div>





                <div class="row col-md-12">

                    <div class="form-group col-6">
                        <label for="email">Email-adres</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email">

                    </div>
                    <div class="form-group col-6">
                        <label class="form-control-label" for="paswoord">Wachtwoord</label>
                        <input type="password" class="form-control" id="paswoord" name="paswoord">
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


<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js'></script>
</body>
</html>