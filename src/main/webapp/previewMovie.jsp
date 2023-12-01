<%@ page import="java.util.List" %>
<%@ page import="com.movie.Movie" %>
<%@ page import="com.movie.MovieDBUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int movieId = Integer.parseInt(request.getParameter("id"));
    Movie movie = MovieDBUtil.getMovie(movieId);
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MOVIE GO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/preview.css" />
</head>

<body>
    <div class="window container-fluid">

        <aside class="sidebar mh-100">
            <div class="top-bar">
                <p class="logo">MOVIE GO</p>
            </div>

            <div class="search-box">
                <input type="text" placeholder="Search..." />
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
                    <li><a href="#">Sci-Fi / Fantasy</a></li>
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
                    <li><a href="#">Celebrities</a></li>
                </ul>

            </div>


            <div class="movie-list">
                <div class="title-bar">
                    <div class="left">
                        <p class="bold">Movie Name</p>
                        <p class="grey">Action / Adventure</p>
                    </div>
                </div>
                <div>
                    <section id="content">
                        <div class="inner-container">
                            <div class="row">
                                <div class="movie-image col-3" style="max-width: 200px;">
                                    <img src="<%= movie.getUrl() %>" width="200px"
                                        alt="Captain Marvel" class="img-fluid">
                                        <%
										    String id = String.valueOf(movie.getId());
										%>
                                         <c:url value="/buyNow.jsp" var="buyNoww">
  											  <c:param name="id" value="<%= id %>" />
										 </c:url>
                                    <a onclick="buyNow(<%= movie.getId() %>)"><div class="blue" id="buttonposter">
                                        <p><i class="fa fa-play-circle" aria-hidden="true"></i>Buy Now</p>
                                    </div>
                                    </a>
                                </div>
                                <div class="movie-info col-9" style="color: black;">
                                    <h1 class="entry-title"><%= movie.getName() %></h1>
                                    <em class="tagline">Higher. Further. Faster.</em>
                                    <div class="movie-data">
                                        <div class="details">
                                            <i class="hd">HD</i>
                                            <p class="text-info">Rating : <%= movie.getRating() %></p>
                                            <p class="text-black-50">Minutes : <%= movie.getTime() %> minutes</p>
                                            <p class="text-black-50">Cast : <%= movie.getCast() %></p>
                                        </div>
                                    </div>
                                    <p class="movie-description" style="color: black;">
                                        <span class="trama">
                                        <%= movie.getDescription() %>&hellip;</span>
                                    <div class="persons"></div>
                                    </p>
                                </div>
                            </div>
                            
                        </div>
                    </section>
                </div>
                <div class="title-bar">
                    <div class="left">
                        <p class="bold">Related Movies</p>
                    </div>
                </div>
                <ul class="list">
                        <% List<Movie> movies = MovieDBUtil.getAllMovies();
                                                for (Movie moviep : movies) {
                                                %>
                                                 <%
    String mid = String.valueOf(moviep.getId());
%>
                                                        <c:url value="/previewMovie.jsp" var="previewMovie">
    <c:param name="id" value="<%= mid %>" />
</c:url>
                                                <li>
                                                <a href="${previewMovie}">
                                				 <img  src="<%= moviep.getUrl() %>"  alt="" class="cover" />
                              					 <p class="title text-dark"><%= moviep.getName() %></p>
                               					 <p class="genre"><%= moviep.getRating() %></p>
                             				   </a>
                           					 </li>
                                                <% } %>
                            
                           
                        </ul>
            </div>


        </div>

    </div> <!-- window -->
    <script src="scripts/scipt.js"></script>
    <script>
                        function buyNow(id) {
                        	var url = "buyNow.jsp?id=" + id;
                  window.location = url;
                        }
                    </script>
</body>

</html>