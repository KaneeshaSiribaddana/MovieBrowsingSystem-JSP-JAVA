<%@ page import="java.sql.Date" %>
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MOVIE GO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css" />
    <link rel="stylesheet" href="styles/signin.css" />
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


            <div class="movie-list">
                <div class="title-bar col-12">
                    <div class="form-modal">

                        <div class="form-toggle">
                            <button id="signup-toggle">Update User</button>
                        </div>

						<%
							String id=request.getParameter("id");
							String name=request.getParameter("name");
							String email=request.getParameter("email");
							String birthdate=request.getParameter("birthdate");

						%>
                        <div id="signup-form-update"class="signup-form-update">
                            <form action="updateuser" method="post">
                                <input type="text" name="id" value="<%=id%>"placeholder="Id"readonly/>
                                <input type="email" name="email" value="<%=email%>"placeholder="Enter your email" />
                                <input type="text" name="name"value="<%=name%>" placeholder="Enter your Full Name" />
                                <input type="date" name="birthdate" value="<%=birthdate%>"placeholder="Enter Your Birthdate" />
                                <button type="submit" class="btn signup">Update User</button>
                                <hr />
                            </form>
                        </div>

                    </div>
                </div>
                <div>

                </div>
            </div>


        </div>

    </div> <!-- window -->
    <script src="scripts/scipt.js"></script>
</body>

</html>