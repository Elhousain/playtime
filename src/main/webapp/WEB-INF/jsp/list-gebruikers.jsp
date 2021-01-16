<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Lijst Gebruikers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
    <link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        li{cursor: pointer}
    </style>
</head>
<body>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>

            <!--#region Bordenspel groepen-->
            <div id="crud">
                <h3 class="text-center">Create, Read, Update, Delete Gebruikers</h3>
                <div class="container">

                    <input type="button" value="Add Gebruiker"
                           onclick="window.location.href='showForm'; return false;"
                           class="btn btn-info btn-sm px-4 text-uppercase font-weight-bold shadow-sm" /> <br />
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
        <!--endregion-->
    </div>
</div>
<script>
    var zindex = 10;
    $(document).on('click','#tonen',function()
    {
        zindex++;
        let card =  $(this).closest('.card')
        if(card.hasClass('d-card-show')) card.removeClass('d-card-show')
        else card.addClass('d-card-show').css({zIndex:zindex})
    })
</script><!--details tonen-->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'/>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>



