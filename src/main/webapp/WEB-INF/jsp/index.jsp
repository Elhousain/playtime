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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>
        <div class="container-xl">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2 class="mb-0">Spellen in de kijker!</h2>
                <div id="myCarousel" class="carousel slide mt-0" data-ride="carousel">
                    <!-- Carousel indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for carousel items -->
                    <div class="carousel-inner">

                        <div class="carousel-item active">

                            <a href="${pageContext.request.contextPath}/overzichtSpellen"><div class="img-box"><img src="images/catan.jpg" /></div></a>
                        </div>
                        <div class="carousel-item">

                            <a href="${pageContext.request.contextPath}/overzichtSpellen"><div class="img-box"><img src="images/smallworld.jpg" /></div></a>
                        </div>
                        <div class="carousel-item">
                            <div class="img-box">

                                <a href="${pageContext.request.contextPath}/overzichtSpellen"><img src="images/clever.jpg" /></a>
                            </div>
                        </div>
                    </div>
                    <!-- Carousel controls -->
                    <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                    </a>
                    <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                    </a>
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