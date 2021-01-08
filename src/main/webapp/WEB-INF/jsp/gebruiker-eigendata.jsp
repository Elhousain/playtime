<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Spel" %>
<%@ page import="java.util.List" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Uitgever" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Taal" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.*" %>


<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Eigen data</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        li{cursor: pointer}
    </style>
</head>
<body>

<div class="wrapper d-flex align-items-stretch">

   <jsp:include page="my-header.jsp"/>

            <div id="crud">
                <h3 class="text-center">Overzicht Profiel</h3>
                <div class="container">


                    <br />
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Jouw data</div>
                        </div>
                        <div class="panel-body">

                            <table class="table table-striped table-bordered">
                                <tr>
                                    <th>Voornaam</th>
                                    <th>Achternaam</th>
                                    <th>E-mailadres</th>
                                    <th>Actie</th>
                                </tr>




                                <c:url var="updateLink" value="/gebruiker/updateForm">
                                    <c:param name="gebruikerId" value="${gebruiker.id}"/>
                                </c:url>




                                    <tr>
                                        <td>${gebruiker.voornaam}</td>
                                        <td>${gebruiker.achternaam}</td>
                                        <td>${gebruiker.email}</td>

                                        <td>
                                            <!-- display the update link --> <a href="${updateLink}">Update</a>
                                        </td>
                                    </tr>

                                </c>






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



