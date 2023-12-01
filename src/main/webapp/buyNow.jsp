<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.Movie" %>
<%@ page import="com.movie.MovieDBUtil" %>
<%
    int movieId = Integer.parseInt(request.getParameter("id"));
    Movie movies = MovieDBUtil.getMovie(movieId);
    System.out.println("Movie URL: " + movies.getUrl());
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
    <script>
        function validate() {
            const cardNumber = document.getElementById('cardNumber').value;
            const expiryDate = document.getElementById('expiryDate').value;
            const cvv = document.getElementById('cvv').value;
            const cardNumberError = document.getElementById('cardNumberError');
            const expiryDateError = document.getElementById('expiryDateError');
            const cvvError = document.getElementById('cvvError');

            var isValid = true;

            // Basic validation for card number (16 digits)
            if (!/^\d{16}$/.test(cardNumber)) {
                cardNumberError.textContent = "Invalid card number (must be 16 digits)";
                isValid = false;
            } else {
                cardNumberError.textContent = "";
            }

            // Basic validation for expiry date (MM/YY format)
            if (!/^(0[1-9]|1[0-2])\/\d{2}$/.test(expiryDate)) {
                expiryDateError.textContent = "Invalid expiry date (must be MM/YY)";
                isValid = false;
            } else {
                expiryDateError.textContent = "";
            }

            // Basic validation for CVV (3 digits)
            if (!/^\d{3}$/.test(cvv)) {
                cvvError.textContent = "Invalid CVV (must be 3 digits)";
                isValid = false;
            } else {
                cvvError.textContent = "";
            }

            return isValid;
        }
    </script>
</head>

<body>
    <div class="window container-fluid">


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
                        <p class="bold">Movie Name</p>
                        <p class="grey">Action / Adventure</p>
                    </div>
                </div>
                <div>
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-md-4">
                                <img src="<%= movies.getUrl() %>"
                                    alt="Movie Poster" class="img-fluid">
                            </div>
                            <div class="col-md-8">
                                <h1><%= movies.getName() %></h1>
                                <p><em>Higher. Further. Faster.</em></p>
                                <p><strong>Rating:</strong> <%= movies.getRating() %></p>
                                <p><strong>Duration:</strong> <%= movies.getTime() %> minutes</p>
                                <p><strong>Cast:</strong> <%= movies.getCast() %></p>
                                <div class="mt-4">
                                    <h4>Payment Details</h4>
                                    <form action="addpayment" method="post"id="paymentForm" onsubmit="return validate();"class="col-8">
                                    <div class="form-group">
                                            <label for="cardNumber">Movie Id:</label>
                                            <input type="text" class="form-control" value="<%= movies.getId() %>" name="movieId" readonly>
                                            <span class="text-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="cardNumber">Price:</label>
                                            <input type="text" class="form-control" value="<%= movies.getPrice() %>" name="amount" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="cardNumber">Card Number:</label>
                                            <input type="text" class="form-control" id="cardNumber" required>
                                            <span id="cardNumberError" class="text-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="expiryDate">Expiry Date:</label>
                                            <input type="text" class="form-control" id="expiryDate" placeholder="MM/YY" required>
                                            <span id="expiryDateError" class="text-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="cvv">CVV:</label>
                                            <input type="text" class="form-control" id="cvv" required>
                                            <span id="cvvError" class="text-danger"></span>
                                        </div>
                                        <button type="submit" class="btn btn-primary col-12 my-2">Pay Now</button>
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
</body>

</html>