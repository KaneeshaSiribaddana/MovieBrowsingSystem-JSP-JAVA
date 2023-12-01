<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.payment.Payment" %>
<%@ page import="com.payment.PaymentDBUtil" %>

<%
    List<Payment> payments = PaymentDBUtil.getAllPayments(); // Retrieve payments from the database
    request.setAttribute("payments", payments); // Set payments as a request attribute
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
                    <li><a href="#">Movies & Films</a></li>
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
                <div class="title-bar col-12">
                    <div class="left">
                        <p class="bold">Payment Details</p>
                    </div>
                </div>
                <div>
                    <div class="mt-3">
                        <table class="table text-dark">
                            <thead>
                                <tr>
                                    <th scope="col">Movie ID</th>
                                    <th scope="col">User ID</th>
                                    <th scope="col">Payment Amount</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="paymentTableBody">
                                <c:forEach var="payment" items="${payments}">
                                    <tr>
                                        <td>${payment.movieId}</td>
                                        <td>${payment.userId}</td>
                                        <td>${payment.amount}</td>
                                        <td>${payment.date}</td>
                                        <td>  
                                       <button class="btn btn-warning btn-sm" onclick="navigateUpdatePayment(${payment.id}, ${payment.movieId}, ${payment.userId}, ${payment.amount}, '${payment.date}')">Update</button>
                                          <button class="btn btn-danger btn-sm" onclick="confirmDeleteMovie(${payment.id})">Delete</button>                
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- window -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="scripts/scipt.js"></script>
<script>
function confirmDeleteMovie(paymentt) {
    // Perform the delete action using AJAX
    $.ajax({
        url: 'deletepayment',
        type: 'POST',
        data: { id: paymentt },
        success: function(response) {
            window.location = "payments.jsp";
        },
        error: function(error) {
            console.error(error);
        }
    });
}
function navigateUpdatePayment(id,movieId, userId, amount, date) {
    var updatePaymentUrl = 'updatePayment.jsp'; // Specify the URL of updatePayment.jsp
    updatePaymentUrl += '?id=' + id;
    updatePaymentUrl += '&movieId=' + movieId;
    updatePaymentUrl += '&userId=' + userId; 
    updatePaymentUrl += '&amount=' + amount; 
    updatePaymentUrl += '&date=' + date;

    window.location.href = updatePaymentUrl;
}
</script>
</body>

</html>
