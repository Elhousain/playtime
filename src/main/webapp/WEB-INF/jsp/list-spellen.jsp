
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.*" %>


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
                <h3 class="text-center">Create, Read, Update, Delete Spellen</h3>
                <div class="container">

                    <input type="button" value="Add Spel"
                           onclick="window.location.href='showForm'; return false;"
                           class="btn btn-info btn-sm px-4 text-uppercase font-weight-bold shadow-sm"/> <br />
                    <br />
                    <form th:action="@{/}">
                        Search: <input type="text" name="keyword" id="keyword" size="50" th:value="${keyword}" required />
                        &nbsp;
                        <input type="submit" value="Search" class="btn btn-primary btn-sm px-4 text-uppercase font-weight-bold shadow-sm" />
                        &nbsp;
                        <input type="button" value="Clear" id="btnClear" class="btn btn-info btn-sm px-4 text-uppercase font-weight-bold shadow-sm" onclick="clearSearch()" />
                    </form>
                    <div class="heading-section">Spel List</div>


                    <table class="table">
                        <tr>
                            <th>Naam</th>
                            <th>Prijs</th>
                            <th>Categorie</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>

                        <c:forEach var="tempSpel" items="${spellen}">

                            <c:url var="updateLink" value="/spel/updateForm">
                                <c:param name="spelId" value="${tempSpel.id}"/>
                            </c:url>

                            <c:url var="deleteLink" value="/spel/delete">
                                <c:param name="spelId" value="${tempSpel.id}"/>
                            </c:url>

                            <tr>
                                <td>${tempSpel.naam}</td>
                                <td>${tempSpel.prijs}</td>
                                <td>${tempSpel.categorie.beschrijving}</td>
                                <td>${tempSpel.status.beschrijving}</td>

                                <td>
                                    <!-- display the update link --> <a href="${updateLink}">Update</a>
                                    | <a href="${deleteLink}"
                                         onclick="if (!(confirm('LET OP, eventueel gelinkte bestellingen zullen ook verwijderd worden, bent u zeker dat u dit spel wil verwijderen?'))) return false">Delete</a>
                                </td>
                            </tr>

                        </c:forEach>
                    </table>
                </div>
            </div>


<div class="row-col-md-12"style="display: flex">

<%
    Uitgever uitgever = (Uitgever) request.getAttribute(Uitgever.EDITOR);
    UitgeverError uitgeverError = (UitgeverError)request.getAttribute(UitgeverError.EDITOR);
%>
    <div class="form-group col-4">
<form  class="needs-validation" action="/spel/saveUitgever" method="post" novalidate>
    <input type="hidden" id="<%=Uitgever.ID%>" name="<%=Uitgever.ID%>" value="<%=uitgever.getId()%>"/>



            <label class="form-control-label" for="<%=Uitgever.BESCHRIJVING%>">Nieuwe Uitgever</label>
            <input class="form-control<%out.print(uitgeverError.beschrijving != null ? " is-invalid" : "");%>"
                   maxlength="20" type="text"
                   id="<%=Uitgever.BESCHRIJVING%>"
                   name="<%=Uitgever.BESCHRIJVING%>"
                   value="<%=uitgever.getBeschrijving() == null ? "" : uitgever.getBeschrijving()%>">
            <%out.print(uitgeverError.beschrijving != null ? "<div class=\"invalid-feedback\">" + uitgeverError.beschrijving + "</div>" : "");%>

                <input type="submit" class="btn btn-success btn-sm px-4 text-uppercase font-weight-bold shadow-sm mt-2" value="Opslaan">

</form>
    </div>

<%
    Categorie categorie = (Categorie) request.getAttribute(Categorie.CATEGORIE);
    CategorieError categorieError = (CategorieError) request.getAttribute(CategorieError.CATEGORIE);
%>
    <div class="form-group col-4">
<form  class="needs-validation" action="/spel/saveCategorie" method="post" novalidate>
    <input type="hidden" id="<%=Categorie.ID%>" name="<%=Categorie.ID%>" value="<%=categorie.getId()%>"/>

            <label class="form-control-label" for="<%=Categorie.BESCHRIJVING%>">Nieuwe Categorie</label>
            <input class="form-control<%out.print(categorieError.beschrijving != null ? " is-invalid" : "");%>"
                   maxlength="20" type="text"
                   id="<%=Categorie.BESCHRIJVING%>"
                   name="<%=Categorie.BESCHRIJVING%>"
                   value="<%=categorie.getBeschrijving() == null ? "" : categorie.getBeschrijving()%>">
            <%out.print(categorieError.beschrijving != null ? "<div class=\"invalid-feedback\">" + categorieError.beschrijving + "</div>" : "");%>

                <input type="submit" class="btn btn-success btn-sm px-4 text-uppercase font-weight-bold shadow-sm mt-2" value="Opslaan">

</form>
    </div>

<%
    Taal taal = (Taal) request.getAttribute(Taal.TAAL);
    TaalError taalError = (TaalError) request.getAttribute(TaalError.TAAL);
%>
    <div class="form-group col-4">
<form  class="needs-validation" action="/spel/saveTaal" method="post" novalidate>
    <input type="hidden" id="<%=Taal.ID%>" name="<%=Taal.ID%>" value="<%=taal.getId()%>"/>

            <label class="form-control-label" for="<%=Taal.BESCHRIJVING%>">Nieuwe Taal</label>
            <input class="form-control<%out.print(categorieError.beschrijving != null ? " is-invalid" : "");%>"
                   maxlength="20" type="text"
                   id="<%=Taal.BESCHRIJVING%>"
                   name="<%=Taal.BESCHRIJVING%>"
                   value="<%=taal.getBeschrijving() == null ? "" : taal.getBeschrijving()%>">
            <%out.print(taalError.beschrijving != null ? "<div class=\"invalid-feedback\">" + taalError.beschrijving + "</div>" : "");%>

                <input type="submit" class="btn btn-success btn-sm px-4 text-uppercase font-weight-bold shadow-sm mt-2" value="Opslaan">


</form>
    </div>
</div>

</div>   <!--endregion-->
    </div>
</div>
<script type="text/javascript">
    function clearSearch() {
        window.location = "/spel/list";
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


