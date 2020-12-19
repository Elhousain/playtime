<%--
  Created by IntelliJ IDEA.
  User: tomsc
  Date: 28/11/2020
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
    <title>CRUD Gebruikers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
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

        <div id="crud">
            <h3 class="text-center">Create, Read, Update, Delete Gebruikers</h3>
            <div class="container">

                <input type="button" value="Add Gebruiker"
                       onclick="window.location.href='showForm'; return false;"
                       class="btn btn-info" /> <br />
                <br />
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Lijst Gebruikers</div>
                    </div>
                    <div class="panel-body">

                        <table class="table table-striped table-bordered">
                            <tr>
                                <th>Voornaam</th>
                                <th>Achternaam</th>
                                <th>E-mailadres</th>
                                <th>Actie</th>
                            </tr>

                            <c:forEach var="tempGebruiker" items="${gebruikers}">

                                <c:url var="updateLink" value="/gebruiker/updateForm">
                                    <c:param name="gebruikerId" value="${tempGebruiker.id}"/>
                                </c:url>

                                <c:url var="deleteLink" value="/gebruiker/delete">
                                    <c:param name="gebruikerId" value="${tempGebruiker.id}"/>
                                </c:url>

                                <tr>
                                    <td>${tempGebruiker.voornaam}</td>
                                    <td>${tempGebruiker.achternaam}</td>
                                    <td>${tempGebruiker.email}</td>

                                    <td>
                                        <!-- display the update link --> <a href="${updateLink}">Update</a>
                                        | <a href="${deleteLink}"
                                             onclick="if (!(confirm('Ben je zeker dat je deze gebruiker wilt verwijderen?'))) return false">Delete</a>
                                    </td>
                                </tr>

                            </c:forEach>
                        </table>
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