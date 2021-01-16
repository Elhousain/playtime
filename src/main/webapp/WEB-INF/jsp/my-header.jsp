<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.springframework.security.core.userdetails.UserDetails" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.authority.SimpleGrantedAuthority" %>
<%@ page import="be.thomasmore.graduaten.playtime.entity.Gebruiker" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: tomsc
  Date: 1/01/2021
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
    <!--#region Linksepaneel-->
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <img class="img logo rounded-circle mb-5" src="${pageContext.request.contextPath}/images/logo.png">
            <ul class="list-unstyled components mb-5">
                <li>
            <%
                if (request.getRemoteUser()==null){
                    out.print("<a href=/overzichtSpellen>Overzicht Spellen</a>");
                    out.print("<br>");
                   // out.print("<a href=/login>Login</a>");
                    out.print("<br>");
                    out.print("<a href=/registratie>Registreren</a>");
                } else {
                    out.print("<a href=/overzichtSpellen>Overzicht Spellen</a>");
                    out.print("<br>");
                    out.print("<a href=/gebruiker/eigendata>Overzicht Profiel</a>");
                    out.print("<a href=/eigenspellen>Overzicht Bestellingen</a>");
                    out.print("<br>");
                    //out.print("<a href=/logout>Logout</a>");

                    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
                    if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))){
                        out.print("<br>");
                        out.print("<a href=/gebruiker/list>Beheer Gebruikers</a>");
                        out.print("<a href=/gebruikerBordspel/list>Beheer Reservaties</a>");
                        out.print("<a href=/spel/list>Beheer Spellen</a>");
                    }
                }

            %>
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

    <div class="container-fluid" style="position: relative">
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
                        <%
                            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
                            if (principal instanceof UserDetails){
                                String username = ((UserDetails)principal).getUsername();

                                out.print("<a href=\"/gebruiker/eigendata\" ><svg xmlns=\"http://www.w3.org/2000/svg\" width=\"30\" height=\"30\" fill=\"currentColor\" class=\"bi bi-person-square\" viewBox=\"0 0 16 16\">\n" +
                                        "  <path d=\"M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z\"/>\n" +
                                        "  <path d=\"M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z\"/>\n" +
                                        "</svg> " + username + " </a>");
                            }

                        %>
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="/">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/contact">Contact</a>
                            </li>


                            <li class="nav-item">
                                <%
                                    if (request.getRemoteUser()==null)
                                    {
                                %>
                                    <a class="nav-link" title="login" href="/login" role=button aria-expanded=false aria-controls=collapseExample>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
                                            <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
                                        </svg>
                                    </a>
                                <%
                                    }
                                %>

                            </li>
                            <li class="nav-item">
                                <%
                                    if (request.getRemoteUser()!=null)
                                    {
                                %>
                                <a class="nav-link"  title="logout" href="/logout" role=button aria-expanded=false aria-controls=collapseExample>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-box-arrow-left" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M6 12.5a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v2a.5.5 0 0 1-1 0v-2A1.5 1.5 0 0 1 6.5 2h8A1.5 1.5 0 0 1 16 3.5v9a1.5 1.5 0 0 1-1.5 1.5h-8A1.5 1.5 0 0 1 5 12.5v-2a.5.5 0 0 1 1 0v2z"/>
                                        <path fill-rule="evenodd" d="M.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L1.707 7.5H10.5a.5.5 0 0 1 0 1H1.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3z"/>
                                    </svg>
                                </a>
                                <%
                                    }
                                %>

                            </li>

                            <li class="nav-item">
                                <%
                                    if (session.getAttribute("cart")!=null)
                                    {
                                %>
                                        <a style="background-color: #0b2e13" class="nav-link" href="${pageContext.request.contextPath}/gebruikerBordspel/shoppingCart" role=button aria-expanded=false aria-controls=collapseExample>
                                            <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-cart-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"></path>
                                                <path fill-rule="evenodd" d="M11.354 5.646a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L8 8.293l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                            </svg>
                                        </a>
                                <%
                                    }
                                %>




                            </li>

                        </ul>
                    </div>
                </div>
            </nav>
