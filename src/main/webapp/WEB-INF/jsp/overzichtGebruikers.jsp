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
    <link rel="stylesheet" href="myProjects/webProject/icofont/css/icofont.min.css">
</head>
<body>

<div class="wrapper d-flex align-items-stretch">

    <jsp:include page="my-header.jsp"/>

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
