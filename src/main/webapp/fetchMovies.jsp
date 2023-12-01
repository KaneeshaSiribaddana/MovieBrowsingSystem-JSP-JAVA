<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
                        crossorigin="anonymous">
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

                            <div class="navigation-container my-3">
                                
                                <a href="fetchMovies.jsp" class="navigation-button">Movies</a>
                                <a href="fetchUsers.jsp" class="navigation-button">Users</a>
                                <a href="payments.jsp" class="navigation-button">Payments</a>
                                <a href="fetchfeedbacks.jsp" class="navigation-button">Feedbacks</a>
                            </div>

                            <div class="movie-list">
                                <div class="title-bar">
                                    <div class="left">
                                        <p class="bold">Fetch Movies | Admin</p>
                                    </div>
                                </div>
                                            <a href="addMovies.jsp" class="btn btn-primary mt-3 ">Add Movie + </a>
                                <div>
                                    <table class="table text-dark">
                                        <thead>
                                            <tr>
                                                <th scope="col">Movie Name</th>
                                                <th scope="col">Rating</th>
                                                <th scope="col">Time</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Cast</th>
                                                <th scope="col">Description</th>
                                                <th scope="col">Image</th>
                                                <th scope="col">Approval</th>
                                                <th scope="col">User ID</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody id="movieTableBody">
                                            <% List<Movie> movies = MovieDBUtil.getAllMovies();
                                                for (Movie movie : movies) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <%= movie.getName() %>
                                                    </td>
                                                    <td>
                                                        <%= movie.getRating() %>
                                                    </td>
                                                    <td>
                                                        <%= movie.getTime() %>
                                                    </td>
                                                    <td>Rs <%= movie.getPrice() %>
                                                    </td>
                                                    <td>
                                                        <%= movie.getCast() %>
                                                    </td>
                                                    <td>
                                                        <%= movie.getDescription() %>
                                                    </td>
                                                    <td><img src="<%= movie.getUrl() %>" alt="Movie Poster"
                                                            style="width: 100px; height: auto;"></td>
                                                    <td>
                                                        <% if (movie.getApproval()==0) { %>
                                                            <button class="btn btn-primary">Pending</button>
                                                            <% } else { %>
                                                                <button class="btn btn-success">Approved</button>
                                                                <% } %>
                                                    </td>
                                                    <td>
                                                        <%= movie.getUser_id() %>
                                                    </td>
                                                    <td>
                                                    <%
    String id = String.valueOf(movie.getId());
    String name = movie.getName();
    String time = String.valueOf(movie.getTime());
    String price = String.valueOf(movie.getPrice());
    String cast = movie.getCast();
    String rating = String.valueOf(movie.getRating());
    String description = movie.getDescription();
    String url = movie.getUrl();
%>
                                                        <c:url value="/updateMovie.jsp" var="updateData">
    <c:param name="id" value="<%= id %>" />
    <c:param name="name" value="<%= name %>" />
    <c:param name="time" value="<%= time %>" />
    <c:param name="rating" value="<%= rating %>" />
    <c:param name="price" value="<%= price %>" />
    <c:param name="cast" value="<%= cast %>" />
    <c:param name="description" value="<%= description %>" />
    <c:param name="url" value="<%= url %>" />
</c:url>
                                                        <button onclick="navigateToMovieUpdate('${updateData}')" class="btn btn-warning btn-sm mr-1"
                                                            >Edit</button>
                                                        <button class="btn btn-danger btn-sm" onclick="confirmDeleteMovie(<%= movie.getId() %>)">Delete</button>
                                                    </td>
                                                </tr>
                                                <% } %>
                                        </tbody>
                                    </table>

                                </div>
                            </div>


                        </div>

                    </div> <!-- window -->
                    <div class="modal fade" id="deleteMovieModal" tabindex="-1" role="dialog" aria-labelledby="deleteMovieModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteMovieModalLabel">Confirm Movie Deletion</h5>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this movie?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="confirmDeleteMovieBtn">Delete</button>
            </div>
        </div>
    </div>
</div>
                    <script src="scripts/scipt.js"></script>
                    <script>
                        function navigateToMovieUpdate(url) {
                            window.location.href = url;
                        }
                    </script>
                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<script>
    var movieIdToDelete;

    function confirmDeleteMovie(movieId) {
        movieIdToDelete = movieId;
        $('#deleteMovieModal').modal('show');
    }

    $('#confirmDeleteMovieBtn').click(function() {
        // Perform the delete action using AJAX
        $.ajax({
            url: 'deletemovie',
            type: 'POST',
            data: { id: movieIdToDelete },
            success: function(response) {
                window.location = "fetchMovies.jsp";
            },
            error: function(error) {
                console.error(error);
            }
        });

        $('#deleteMovieModal').modal('hide');
    });
</script>
                </body>

                </html>