<%@ page import="be.thomasmore.graduaten.playtime.entity.Spel" %><%--
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
    <title>PLAYTIME</title>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->

    <meta name="robots" content="noindex,nofollow">
    <meta name="viewport" content="width=device-width,maximum-scale=1,user-scalable=no,minimal-ui">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800&amp;subset=latin,latin-ext">
    <link rel="stylesheet" type="text/css" href="https://cdn.travel.sygic.com/travel.sygic.com_lp/css/404.css?31d555304bfab190a48977797b2a8f39827e3656">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <style>
        li{cursor: pointer}
    </style>


</head>
<body>







<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="../my-header.jsp"/>





    <div class="stars"></div>

    <div class="sun-moon">
        <div class="sun"></div>
        <div class="moon"></div>
    </div>

    <div id="js-hills" class="background hills"></div>
    <div id="js-country" class="background country"></div>
    <div id="js-foreground" class="background foreground"></div>

    <div class="error-content">
        Geen toegang tot de server<br>
        <a href="/">PlayTime</a>.
    </div>

    <a href="/" class="button-home">Home</a>

    <div class="code">
        <span>403</span>

    </div>





</div>
</div>








<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>























