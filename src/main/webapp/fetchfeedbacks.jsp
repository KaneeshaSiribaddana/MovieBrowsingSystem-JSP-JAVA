<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.feedback.Feedback" %>
<%@ page import="com.feedback.FeedbackDBUtil" %>
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
                    <li><a href="#">Celebrities</a></li>
                </ul>

            </div>


            <div class="movie-list">
                <div class="title-bar col-12">
                    <div class="left">
                        <p class="bold">Feedbacks</p>
                    </div>
                </div>
                <div>
                <%
List<Feedback> feedbacks = FeedbackDBUtil.getAllFeedback();
    request.setAttribute("feedbacks", feedbacks); // Set payments as a request attribute
%>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Message</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="feedbackTableBody">
                    <c:forEach var="feedback" items="${feedbacks}">
                        <tr>
                            <td>${feedback.id}</td>
                            <td>${feedback.firstName}</td>
                            <td>${feedback.lastName}</td>
                            <td>${feedback.email}</td>
                            <td>${feedback.message}</td>
                            <td>
                                <!-- Pass the feedback ID to JavaScript function for edit and delete operations -->
                                <button class="btn btn-warning btn-sm mr-1"
                                    onclick="editFeedback(${feedback.id},'${feedback.firstName}', '${feedback.lastName}', '${feedback.email}', '${feedback.message}')">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteFeedback(${feedback.id})">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div> <!-- window -->
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="scripts/scipt.js"></script>
    <script>
    // JavaScript function to handle editing feedback
    function editFeedback(feedbackId,firstName, lastName, email, message) {
    // Redirect to updatefeedback.jsp with feedback data as parameters
    var url = "updatefeedback.jsp?id=" + feedbackId +
              "&firstName=" + encodeURIComponent(firstName) +
              "&lastName=" + encodeURIComponent(lastName) +
              "&email=" + encodeURIComponent(email) +
              "&message=" + encodeURIComponent(message);
    window.location = url;
}


    function deleteFeedback(feedbackId) {
        $.ajax({
            url: 'deletefeedback',
            type: 'POST',
            data: { id: feedbackId },
            success: function(response) {
            	window.location="fetchfeedbacks.jsp"
            },
            error: function(error) {
                console.error(error);
            }
        });
    }
</script>
</body>

</html>