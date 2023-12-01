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
<div class="navigation-container my-3">
                                <a href="fetchMovies.jsp" class="navigation-button">Movies</a>
                                <a href="fetchUsers.jsp" class="navigation-button">Users</a>
                                <a href="payments.jsp" class="navigation-button">Payments</a>
                                <a href="fetchfeedbacks.jsp" class="navigation-button">Feedbacks</a>
                            </div>

            <div class="movie-list">
                <div class="title-bar">
                    <div class="left">
                        <p class="bold">Add Movies</p>
                    </div>
                </div>
            </div>
            <div>
                <form action="addmovie" method="post" class="container" onsubmit="return validateForm()">
    <div class="row my-2">
        <div class="col-6">
            <div class="form-group">
                <label for="movieName" class="text-bold">Movie Name</label>
                <input type="text" class="form-control" id="movieName" placeholder="Movie" name="movie">
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <label for="rating" class="text-bold">Rating (Max: 10)</label>
                <input type="number" step="0.1" class="form-control" id="rating" name="rating"
                    placeholder="Enter rating (e.g., 7.4)" max="10">
                <span id="ratingError" style="color: red;"></span>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-6">
            <div class="form-group">
                <label for="movieTime" class="text-bold">Movie Time in Minutes</label>
                <input type="number" name="time" class="form-control" id="movieTime" placeholder="Minutes">
            </div>
        </div>
        <div class="col-6">
            <div class="col-auto">
                <label class="sr-only" for="moviePrice">Price</label>
                <div class="input-group mb-2">
                    <div class="input-group-prepend">
                        <div class="input-group-text">Rs</div>
                    </div>
                    <input type="number" class="form-control" name="price" id="moviePrice" placeholder="Price">
                </div>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-6">
            <div class="form-group">
                <label for="cast" class="text-bold">Cast</label>
                <input type="text" class="form-control" id="cast" name="cast" placeholder="Enter using Commas( , )">
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12">
            <div class="form-group">
                <label for="description" class="text-bold">Description</label>
                <textarea class="form-control" name="description" id="description" rows="3"></textarea>
            </div>
        </div>
    </div>
    <div class="row my-2">
        <div class="col-12">
            <div class="form-group">
                <label for="imageUrl" class="text-bold">Image Poster URL</label>
                <input type="text" class="form-control" id="imageUrl" name="url" placeholder="URL">
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
        function validateForm() {
            var movieName = document.getElementById("movieName").value;
            var rating = document.getElementById("rating").value;
            var time = document.getElementById("movieTime").value;
            var price = document.getElementById("moviePrice").value;
            var cast = document.getElementById("cast").value;
            var description = document.getElementById("description").value;
            var imageUrl = document.getElementById("imageUrl").value;

            if (movieName === "" || rating === "" || time === "" || price === "" || cast === "" || description === "" || imageUrl === "") {
                alert("All fields are required");
                return false;
            }

            // Validate rating (must be a valid floating-point number up to 10)
            if (!/^\d+(\.\d+)?$/.test(rating) || parseFloat(rating) > 10) {
                alert("Rating must be a valid floating-point number up to 10.");
                return false;
            }

            // Validate time (must be a positive integer)
            if (!/^\d+$/.test(time) || parseInt(time) <= 0) {
                alert("Time must be a positive integer.");
                return false;
            }

            // Validate price (must be a positive number)
            if (!/^\d+(\.\d+)?$/.test(price) || parseFloat(price) <= 0) {
                alert("Price must be a positive number.");
                return false;
            }

            // Additional validations for other fields can be added here

            return true; // Form will be submitted if all validations pass
        }
    </script>
</body>

</html>