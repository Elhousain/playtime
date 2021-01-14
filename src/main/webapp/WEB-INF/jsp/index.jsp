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
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>

    <style>
        body {
            font-family: "Open Sans", sans-serif;
        }

        h2 {
            color: #333;
            text-align: center;
            text-transform: uppercase;
            font-family: "Roboto", sans-serif;
            font-weight: bold;
            position: relative;
            margin: 30px 0 60px;
        }

        h2::after {
            content: "";
            width: 100px;
            position: absolute;
            margin: 0 auto;
            height: 3px;
            background: #8fbc54;
            left: 0;
            right: 0;
            bottom: -10px;
        }

        .col-center {
            margin: 0 auto;
            float: none !important;
        }

        .carousel {
            padding: 70px;
        }

        .carousel .carousel-item {
            color: #999;
            font-size: 14px;
            text-align: center;
            overflow: hidden;
            min-height: 200px;
            padding: 100px;
        }

        .carousel .carousel-item .img-box {
            width: 800px;
            height: 600px;
            margin: 0 auto;
            padding: 5px;
            border: 1px solid #ddd;

        }

        .carousel .img-box img {
            width: 100%;
            height: 100%;
            display: block;

        }

        .carousel .testimonial {
            padding: 30px 0 10px;
        }

        .carousel .overview {
            font-style: italic;
        }

        .carousel .overview b {
            text-transform: uppercase;
            color: #7AA641;
        }

        .carousel-control-prev, .carousel-control-next {
            width: 40px;
            height: 40px;
            margin-top: -20px;
            top: 50%;
            background: none;
        }

        .carousel-control-prev i, .carousel-control-next i {
            font-size: 68px;
            line-height: 42px;
            position: absolute;
            display: inline-block;
            color: rgba(0, 0, 0, 0.8);
            text-shadow: 0 3px 3px #e6e6e6, 0 0 0 #000;
        }

        .carousel-indicators {
            bottom: -40px;
        }

        .carousel-indicators li, .carousel-indicators li.active {
            width: 12px;
            height: 12px;
            margin: 1px 3px;
            border-radius: 50%;
            border: none;
        }

        .carousel-indicators li {
            background: #999;
            border-color: transparent;
            box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
        }

        .carousel-indicators li.active {
            background: #555;
            box-shadow: inset 0 2px 1px rgba(0,0,0,0.2);
        }



    </style>

    <div class="container-xl">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2>Spellen in de kijker!</h2>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Carousel indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- Wrapper for carousel items -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div class="img-box"><img src="images/catan.jpg" /></div>
                        </div>
                        <div class="carousel-item">
                            <div class="img-box"><img src="images/smallworld.jpg" /></div>
                        </div>
                        <div class="carousel-item">
                            <div class="img-box">
                                <img src="images/clever.jpg" />
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