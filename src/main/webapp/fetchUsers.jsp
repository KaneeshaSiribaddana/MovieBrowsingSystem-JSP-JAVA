<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.UserDBUtil" %>
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
                    <li>
                        <a href="#">Action / Adventure</a>
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
                        <p class="bold">Users</p>
                    </div>
                </div>
                <div>
                    <table class="table text-dark">
                        <thead>
                            <tr>
                                <th scope="col">Email</th>
                                <th scope="col">Name</th>
                                <th scope="col">Birth Date</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="userTableBody">
                         <c:catch var="error">
        <c:set var="userList" value="<%= UserDBUtil.getAllUsers() %>" scope="request"/>
    </c:catch>
                            <c:forEach var="user" items="${userList}">
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.name}</td>
                                    <td>${user.birthdate}</td>
                                    <td>
                                    <c:url value="/updateUser.jsp" var="userupdate">
    <c:param name="id" value="${user.id}" />
    <c:param name="name" value="${user.name}" />
    <c:param name="email" value="${user.email}" />
    <c:param name="birthdate" value="${user.birthdate}" />
</c:url>
<button class="btn btn-warning btn-sm mr-1"onclick="navigateToUserUpdate('${userupdate}')">Edit</button>
                                        <button class="btn btn-danger btn-sm" onclick="confirmDelete(${user.id})">Delete</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>

    </div> <!-- window -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this user?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
                </div>
            </div>
        </div>
    </div>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="scripts/scipt.js"></script>
    <script>
        var userIdToDelete;

        function confirmDelete(userId) {
            userIdToDelete = userId;
            $('#deleteModal').modal('show');
        }

        $('#confirmDeleteBtn').click(function() {
            // Perform the delete action using AJAX
            $.ajax({
                url: 'deleteuser',
                type: 'POST',
                data: { id: userIdToDelete },
                success: function(response) {
                    window.location="fetchUsers.jsp";
                },
                error: function(error) {
                    console.error(error);
                }
            });

            $('#deleteModal').modal('hide');
        });
        function navigateToUserUpdate(url) {
            window.location.href = url;
        }
    </script>
</body>

</html>