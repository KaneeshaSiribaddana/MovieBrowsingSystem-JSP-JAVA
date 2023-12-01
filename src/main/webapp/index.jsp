<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.movie.Movie" %>
            <%@ page import="com.movie.MovieDBUtil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MOVIE GO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="styles/style.css"/>
    </head>
    <body>
            <div class="window">
        
                <aside class="sidebar">
                    <div class="top-bar">
                        <p class="logo">MOVIE GO</p>
                    </div>
        
                    <div class="search-box">
                        <input type="text" placeholder="Search..."/>
                        <p class="fa fa-search"></p>
                    </div>
        
                    <menu class="menu">
                        <p class="menu-name">Movie trailers</p>
                        <ul>
                            <li class="active">
                                <a href="#">Action / Adventure</a>
                                <ul>
                                    <li><a href="#">Latest</a></li>
                                    <li class="active"><a href="#">Popular</a></li>
                                    <li><a href="#">Coming soon</a></li>
                                    <li><a href="#">Staff picks</a></li>
                                </ul>
                            </li>
                            <li><a href="#">Animation</a></li>
                            <li><a href="#">Comedy</a></li>
                            <li><a href="#">Documentaries</a></li>
                            <li><a href="#">Drama</a></li>
                            <li><a href="#">Horror</a></li>
                            <li><a href="#">Sci-Fi  / Fantasy</a></li>
                            <li><a href="#">List A-Z</a></li>
                        </ul>
        
                        <div class="separator"></div>
        
                        <ul class="no-bullets">
                            <li><a href="#">Latest news</a></li>
                            <li><a href="#">Critic reviews</a></li>
                            <li><a href="#">Box office</a></li>
                            <li><a href="#">Top 250</a></li>
                        </ul>
        
                        <div class="separator"></div>
                    </menu>
                </aside>
        
        
                <div class="main" role="main">
        
                    <div class="top-bar">
        
                        <div class="profile-box">
                        <a href="signinsignup.jsp"> 
                   <div class="circle">
                        <img src="https://ca.slack-edge.com/T0266FRGM-UQ46QH94Z-gc24d346e359-512"/>
                    </div>
                   </a>
                            <span class="arrow fa fa-angle-down"></span>
                        </div>
        
                        <ul class="top-menu">
                            <li class="menu-icon trigger-sidebar-toggle">
                                <div class="line"></div>
                                <div class="line"></div>
                                <div class="line"></div>
                            </li>
                            <li><a href="#">Headlines</a></li>
                            <li><a href="#">Articles</a></li>
                            <li class="active"><a href="#">Movies & Films</a></li>
                            <li><a href="#">Television</a></li>
                            <li><a href="#">Music</a></li>
                            <li><a href="addMovies.jsp">Add Movies</a></li>
                            <li><a href="feedback.jsp">Give us a feedback</a></li>
                        </ul>
        
                    </div> 
        
        
                    <div class="featured-movie">
                        <img class="cover" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/22043/backdrop_ggwxvq_1.jpg" alt="" class="cover" />
                        <p class="corner-title">Staff pick</p>
        
                        <div class="bottom-bar">
                            <div class="title-container">
                                <span class="fa fa-play-circle"></span>
                                <b>Non-stop</b> Trailer #1
                            </div>
        
                            <div class="right">
                                <div class="stars">
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star-half-o"></span>
                                    <span class="fa fa-star-o"></span>
                                </div>
                                <div class="share">
                                    <icon class="fa fa-share-square"></icon> Share
                                </div>
                            </div> <!-- right -->
                        </div> 
                    </div>
        
        
                    <div class="movie-list">
                        <div class="title-bar">
                            <div class="left">
                                <p class="bold">Popular Trailers</p>
                                <p class="grey">Action / Adventure</p>
                            </div>
                            <div class="right">
                                <a class="blue" href="#">Rating <i class="fa fa-angle-down"></i></a>
                                <a href="#">Newest</a>
                                <a href="#">Oldest</a>
                            </div>
                        </div>
        
                        <ul class="list">
                        <% List<Movie> movies = MovieDBUtil.getAllMovies();
                                                for (Movie movie : movies) {
                                                %>
                                                 <%
    String id = String.valueOf(movie.getId());
%>
                                                        <c:url value="/previewMovie.jsp" var="previewMovie">
    <c:param name="id" value="<%= id %>" />
</c:url>
                                                <li>
                                                <a href="${previewMovie}">
                                				 <img  src="<%= movie.getUrl() %>"  alt="" class="cover" />
                              					 <p class="title"><%= movie.getName() %></p>
                               					 <p class="genre"><%= movie.getRating() %></p>
                             				   </a>
                           					 </li>
                                                <% } %>
                            
                           
                        </ul>
        
                        <a href="#" class="load-more">Show more movies <span class="fa fa-plus"></span></a>
        
                    </div>
        
        
                </div> 
        
            </div> <!-- window -->
        <script src="scripts/scipt.js"></script>
    </body>
</html>