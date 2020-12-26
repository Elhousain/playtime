<%--
  Created by IntelliJ IDEA.
  User: elhousain.farah
  Date: 19/10/2020
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
    <title>PLAYTIME - Overzicht Gebruikers</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/your-path-to-fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper d-flex align-items-stretch">
    <!--#region Navigatie-->
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <img class="img logo rounded-circle mb-5" src="${pageContext.request.contextPath}/images/logo.png">
            <ul class="list-unstyled components mb-5">
                <li>
                    <a href="${pageContext.request.contextPath}/overzichtSpellen">Overzicht spelletjes</a>
                    <a href="${pageContext.request.contextPath}/overzichtGebruikers">Overzicht gebruikers</a>
                </li>
                <li>
                    <a href="#">Dobbelspel (1)</a>
                </li>
                <li>
                    <a href="#">Bordspel (2)</a>
                </li>
                <li>
                    <a href="#">Kaartspel (3)</a>
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

    <div class="container-fluid">
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
            <!--#endregion-->
            <!--#region Gebruikers groepen-->

                <h1>
                    Overzicht gebruikers
                </h1>


            <div class="row dashboard-cards">

                <%
                    List<Gebruiker> gebruikers = (List<Gebruiker>) request.getAttribute("gebruikers");



                    for (Gebruiker gebruiker:gebruikers)
                    {
                        out.print
                                (

                                        "<div class=card style=z-index: 10;>"+
                                                "<div class=card-title>"+
                                                    "<h5>"
                                                        +gebruiker.getVoornaam()+ " " + gebruiker.getAchternaam()+ " - ID: "+gebruiker.getId()+
                                                    "</h5>"+
                                                    "<h7>"
                                                        +gebruiker.getEmail()+
                                                    "</h7>"+
                                                "</div>"+
                                                "<div class=achtergrond>" +

                                                "<a id=tonen class=m-auto> details" +
                                                "</a>"+
                                                "</div>" +

                                                "<div class=card-flap>"+
                                                    "<div class=card-description>"+
                                                        "<div class=onderlijn></div>"+
                                                        "<ul class=task-list>"+
                                                            "<li>"+
                                                                "<img class=img-thumbnail src=/images/telefoon.png > "+gebruiker.getTelefoon()+
                                                            "</li>"+
                                                            "<li>"+
                                                                "<img src=/images/adres.png>" +gebruiker.getWoonplaats()+" "+gebruiker.getPostcode()+"<br>"+gebruiker.getStraat()+" "+gebruiker.getHuisnummer()+
                                                            "</li>"+
                                                            "<li>"+
                                                                "<img src=/images/datum.png >"+

                                                                "<p>"+gebruiker.getGeboortedatum()+"</p>" +
                                                            "</li>"+
                                                        "</ul>"+
                                                    "</div>"+
                                                "</div>"+
                                        "</div>"
                        );
                    }
                %>


            </div>





            <!--endregion-->
        </div>
    </div>

</div>


</div>

<script>
    const submitForm = document.querySelector('.add');
    const addButton = document.querySelector('.add-todo');
    const todoList = document.querySelector('.todos');
    const list = document.querySelectorAll('.todos li');

    let listLenght = list.lenght;

    const generateTempalate = (todo) => {

        const html = `<li>
                  <input type="checkbox" id="todo_${listLenght}">
                  <label for="todo_${listLenght}">
                    <span class="check"></span>
                    ${todo}
                  </label>
                  <i class="far fa-trash-alt delete"></i>
                </li>`
        todoList.innerHTML += html;
    };

    function addTodos(e) {
        e.preventDefault();
        const todo = submitForm.add.value.trim();
        if (todo.length) {
            listLenght = listLenght + 1;
            generateTempalate(todo);
            submitForm.reset();
        }
    }

    submitForm.addEventListener('submit', addTodos);
    addButton.addEventListener('click', addTodos);

    function deleteTodos(e) {
        if (e.target.classList.contains('delete')) {
            e.target.parentElement.remove();
        }
    }

    todoList.addEventListener('click', deleteTodos);

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
</script>



<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>
