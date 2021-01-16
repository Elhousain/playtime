
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Overzicht Spellen</title>
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
            <div class="row-col-md-12" >
                <h3 class="text-center">Overzicht GebruikerBordspellen</h3>
                <div class="container">


                    <input type="button" value="Toon Alle Bestellingen"
                           onclick="window.location.href='all'; return false;"
                           class="btn btn-info btn-sm px-4 text-uppercase font-weight-bold shadow-sm" /> <br />
                    <br />

                    <div class="heading-section">Niet Opgehaalde Spellen</div>


                    <table class="table">
                        <tr>
                            <th>Order nummer</th>
                            <th>Naam</th>
                            <th>Spel</th>
                            <th>Afhaaldatum</th>
                            <th>Huur</th>
                            <th>Aantal</th>
                            <th>Verwerkt</th>
                            <th>Action</th>
                        </tr>

                        <c:forEach var="tempGBS" items="${gebruikerBordspellen}">

                            <c:url var="updateLink" value="/gebruikerBordspel/updateForm">
                                <c:param name="gebruikerBordspelId" value="${tempGBS.id}"/>
                            </c:url>

                            <c:url var="deleteLink" value="/gebruikerBordspel/delete">
                                <c:param name="gebruikerBordspelId" value="${tempGBS.id}"/>
                            </c:url>

                            <tr>
                                <td>${tempGBS.ordernr}</td>
                                <td>${tempGBS.gebruiker.toString()}</td>
                                <td>${tempGBS.spel.naam}</td>
                                <td>${tempGBS.afhaaldatum}</td>
                                <td>${tempGBS.ishuur}</td>
                                <td>${tempGBS.aantal}</td>
                                <td>${tempGBS.verwerkt}</td>

                                <td>
                                    <!-- display the update link --> <a href="${updateLink}">Verwerkt</a>
                                    | <a href="${deleteLink}"
                                         onclick="if (!(confirm('Are you sure you want to delete this GBS?'))) return false">Delete</a>
                                </td>
                            </tr>

                        </c:forEach>
                    </table>
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


