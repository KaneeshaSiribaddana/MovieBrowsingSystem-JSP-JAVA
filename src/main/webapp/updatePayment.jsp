<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.movie.Movie" %>
<%@ page import="com.movie.MovieDBUtil" %>
<%
    int movieId = Integer.parseInt(request.getParameter("movieId"));
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


        <div class="main" role="main" style="min-height: 1000px;">

            <div class="top-bar">

                <div class="profile-box">
                    <div class="circle">
                        <img src="https://ca.slack-edge.com/T0266FRGM-UQ46QH94Z-gc24d346e359-512"/>
                    </div>
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


            <div class="movie-list">
                <div class="title-bar col-12">
                    <div class="left">
                        <p class="bold"><%= movie.getName() %></p>
                        <p class="grey">Action / Adventure</p>
                    </div>
                </div>
                <div>
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="<%= movie.getUrl() %>"
                                    alt="Movie Poster" class="img-fluid">
                            </div>
                            <div class="col-md-8">
                                <h1><%= movie.getName() %></h1>
                                <p><em>Higher. Further. Faster.</em></p>
                                <p><strong>Rating:</strong> <%= movie.getRating() %></p>
                                <p><strong>Duration:</strong> <%= movie.getTime() %> minutes</p>
                                <p><strong>Cast:</strong><%= movie.getCast() %></p>
                                <div class="container mt-4">
        <h1>Update Payment Details</h1>

        <form id="paymentForm" action="updateepayment" method="post">
        <div class="form-group">
                <label for="cardNumber">User Id:</label>
                <input type="number" class="form-control" name="userId" value="<%= request.getParameter("userId") %>" required>
            </div>
            <div class="form-group">
                <label for="cardNumber">Movie Id:</label>
                <input type="number" class="form-control" name="movieId" value="<%= request.getParameter("movieId") %>" required>
            </div>
            <div class="form-group">
                <label for="expiryDate">User Id:</label>
                <input type="date" class="form-control" name="date" value="<%= request.getParameter("date") %>" required>
            </div>
            <div class="form-group">
                <label for="cvv">Amount:</label>
                <input type="number" class="form-control" name="amount" value="<%= request.getParameter("amount") %>" required>
            </div>
            <div class="form-group">
                <label for="cvv">Payment ID:</label>
                <input type="number" class="form-control" name="id" value="<%= request.getParameter("id") %>" readonly>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Update Payment</button>
        </form>
 </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

    </div> <!-- window -->
    <script src="scripts/scipt.js"></script>
    <script>
    </script>
</body>

</html>

