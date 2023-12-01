<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MOVIE GO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/defaultMovies.css" />
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


        <div class="main" style="min-height: 1000px;" role="main">

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


            <div class="movie-list">
                <div class="title-bar">
                    <div class="left">
                        <p class="bold">Edit Movie | <%= request.getParameter("name") %></p>
                    </div>
                </div>
            </div>

            <div>
                <form class="container" action="updatemovie" method="post">
                <div class="row my-2">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="movieNameInput" class="form-label">Movie Id</label>
                                <input type="text" class="form-control" id="movieNameInput" name="id" value="<%= request.getParameter("id") %>" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="movieNameInput" class="form-label">Movie Name</label>
                                <input type="text" class="form-control" id="movieNameInput" name="name" value="<%= request.getParameter("name") %>" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="ratingInput" class="form-label">Rating (Max: 10)</label>
                                <input type="number" step="0.1" class="form-control" id="ratingInput" name="rating" value="<%= request.getParameter("rating") %>"
                                    placeholder="Enter rating (e.g., 7.4)" onchange="validateRating()" max="10" required>
                                <span id="ratingError" style="color: red;"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="timeInput" class="form-label">Movie Time in Minutes</label>
                                <input type="number" class="form-control" id="timeInput" name="time" value="<%= request.getParameter("time") %>" placeholder="Minutes" required>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <label for="priceInput" class="form-label">Price</label>
                                <input type="text" class="form-control" id="priceInput" name="price" value="<%= request.getParameter("price") %>" placeholder="Price" required>
                            </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-6">
                            <div class="form-group">
                                <label for="castInput" class="form-label">Cast</label>
                                <input type="text" class="form-control" id="castInput" name="cast" value="<%= request.getParameter("cast") %>" placeholder="Enter using Commas( , )" required>
                            </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="descriptionTextarea">Description</label>
                                <textarea class="form-control" id="descriptionTextarea" name="description" rows="3"><%= request.getParameter("description") %></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row my-2">
                        <div class="col-12">
                            <div class="form-group">
                                <label for="urlInput" class="form-label">Image Poster URL</label>
                                <input type="text" class="form-control" id="urlInput" name="url" value="<%= request.getParameter("url") %>" placeholder="URL" required>
                            </div>
                        </div>
                    </div>
                
                    <button type="submit" class="btn btn-primary col-12">Submit</button>
                </form>
                
            </div>

        </div>

    </div>
    <script src="scripts/scipt.js"></script>
    <script>
        function validateRating() {
            var ratingInput = document.getElementById("ratingInput").value;
            var ratingError = document.getElementById("ratingError");

            if (ratingInput !== "" && (!/^\d+(\.\d+)?$/.test(ratingInput) || parseFloat(ratingInput) > 10)) {
                ratingError.textContent = "Rating must be a valid floating-point number up to 10.";
                document.getElementById("ratingInput").value = "";
            } else {
                ratingError.textContent = "";
            }
        }
    </script>
</body>

</html>