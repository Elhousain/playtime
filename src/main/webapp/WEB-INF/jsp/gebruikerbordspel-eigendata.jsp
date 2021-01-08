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
    <title>PLAYTIME - Overzicht eigen gehuurde/gekochte spellen</title>
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

    <!--#region Bordenspel groepen-->
    <h1>
        Overzicht eigen gehuurde en gekochte spellen
    </h1>



    <div class="row dashboard-cards">
        <c:forEach  items="${eigenGebruikerBordspellen}" var="eigenGebruikerBordspel">
            <div class=card>

                <div class=card-title>
                    <h5> Ordernummer ${eigenGebruikerBordspel.ordernr} - ${eigenGebruikerBordspel.spel.naam}  </h5>
                    </br>
                    <img class=farah src="${eigenGebruikerBordspel.spel.foto}">
                </div>
                <div class=achtergrond>
                    <div class=row>




                        <a id=tonen class=m-auto> details</a>
                    </div>
                </div>

                <div class=card-flap>
                    <div class=card-description>
                        <ul class=task-list>
                            <li>
                                <img title="Afhaaldatum" src=${pageContext.request.contextPath}/images/datum.png>${eigenGebruikerBordspel.afhaaldatum}
                            </li>
                            <li>

                               <c:if test="${eigenGebruikerBordspel.ishuur==true}">
                                   <img title="Gehuurd of gekocht spel" src=${pageContext.request.contextPath}/images/rent.svg>Gehuurd

                               </c:if>

                                <c:if test="${eigenGebruikerBordspel.ishuur==false}">
                                    <img title="Gehuurd of gekocht spel" src=${pageContext.request.contextPath}/images/sale.svg>Gekocht

                                </c:if>


                            </li>
                            <li>

                                <img title="Aantal spelletjes gehuurd of gekocht" src=${pageContext.request.contextPath}/images/number.svg>${eigenGebruikerBordspel.aantal}



                            </li>




                        </ul>
                    </div>
                </div>
            </div>

        </c:forEach>
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

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'/>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>