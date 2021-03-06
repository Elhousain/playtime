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
    <h1>
        Overzicht spellen
    </h1>


    <form th:action="@{/}">
        <div style="display: inline-flex">
            Search: <input type="text" name="keyword" id="keyword" size="50" th:value="${keyword}" required />
            &nbsp;
            <input  class="btn btn-primary btn-sm px-4  text-uppercase font-weight-bold shadow-sm"  type="submit" value="Search" />
            &nbsp;
            <input class="btn btn-info btn-sm px-4  text-uppercase font-weight-bold shadow-sm"  type="button" value="Clear" id="btnClear" onclick="clearSearch()" />
        </div>

    </form>

    <div class="row dashboard-cards">
        <c:forEach  items="${spellen}" var="spel">
            <div class=card>
                <div class=card-title>
                    <h5> ${spel.naam}</h5>
                    <img class=farah src="${spel.foto}">
                </div>
                <div class=achtergrond>
                    <div class=row>
                        <div class=col-sm-6>
                            <form   style=z-index:10 method="POST" action="${pageContext.request.contextPath}/gebruikerBordspel/shoppingCart">
                                <input type="hidden" name="id" value="${spel.id}"><br/>
                                <input type="hidden" name="afbeelding" value="${spel.foto}"><br/>
                                <input type="hidden" name="titel" value="kopen"><br/>
                                <input type="hidden" name="aantal" value="1"><br/>
                                <input type="hidden" name="prijs" value="${spel.prijs}"><p>${spel.prijs} €</p>
                                <input type="submit" name="action" id="k${spel.id}" value="Kopen" class="btn btn-info btn-sm px-4  text-uppercase font-weight-bold shadow-sm">
                            </form>
                        </div>


                        <div class=col-sm-6>
                            <form   style=z-index:10 method="POST" action="${pageContext.request.contextPath}/gebruikerBordspel/shoppingCart">
                                <input type="hidden" name="id" value="${spel.id}"><br/>
                                <input type="hidden" name="afbeelding" value="${spel.foto}"><br/>
                                <input type="hidden" name="titel" value="huren"><br/>
                                <input type="hidden" name="aantal" value="1"><br/>
                                <input type="hidden" name="prijs" value="${spel.prijs/5}"><p>${spel.prijs/5} €</p>
                                <input type="submit" name="action" id="h${spel.id}" value="Huren" class="btn btn-info btn-sm px-4 text-uppercase font-weight-bold shadow-sm">
                            </form>
                        </div>
                        <a id=tonen class=m-auto> details</a>
                    </div>
                </div>

                <div class=card-flap>
                    <div class=card-description>
                        <div class=onderlijn>${spel.beschrijving}</div>
                        <ul class=task-list>
                            <li>
                                <img class=img-thumbnail src=${pageContext.request.contextPath}/images/pngegg.png > Spelers tussen ${spel.min_spelers} en ${spel.max_spelers}
                            </li>
                            <li>
                                <img src=${pageContext.request.contextPath}/images/age.png>${spel.min_leeftijd}
                            </li>
                            <li>
                                <img src=${pageContext.request.contextPath}/images/taal.png >
                                <p> ${spel.getTaal().getBeschrijving() }</p>
                            </li>
                            <li>
                                <img src=${pageContext.request.contextPath}/images/uitgever.png >
                                <p>${ spel.getUitgever().getBeschrijving()} </p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>


</form>
</div>
<!--endregion-->
</div>
</div>

<script type="text/javascript">
    function clearSearch() {
        window.location = "/overzichtSpellen";
    }
</script>
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