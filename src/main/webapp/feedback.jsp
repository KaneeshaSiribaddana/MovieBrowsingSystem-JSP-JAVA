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
    <link rel="stylesheet" href="styles/feedback.css" />
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
                    <li class=""><a href="#">Movies & Films</a></li>
                    <li><a href="#">Television</a></li>
                    <li><a href="#">Music</a></li>
                            <li><a href="addMovies.jsp">Add Movies</a></li>
                            <li><a href="feedback.jsp">Give us a feedback</a></li>
                </ul>

            </div>


            <div class="movie-list">
                <div class="title-bar">
                    <div class="left col-12">
                        <p class="bold">Give Us your Feedack</p>
                    </div>
                    <div>
                        <div class="content">
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-md-10">
                                        <div class="row align-items-center">
                                            <div class="col-lg-7 mb-5 mb-lg-0">
                                                <h2 class="mb-5">Fill this Form <br> It's easy.</h2>
                                                <form action="feedback" class="border-right pr-5 mb-5" method="post"
                                                    id="contactForm" name="contactForm" onsubmit="return validateForm()">
                                                    <div class="row my-2">
                                                        <div class="col-md-6 form-group">
                                                            <input type="text" class="form-control" name="fname"
                                                                id="fname" placeholder="First name">
                                                            <span id="fnameError" class="error-message"></span>
                                                        </div>
                                                        <div class="col-md-6 form-group">
                                                            <input type="text" class="form-control" name="lname"
                                                                id="lname" placeholder="Last name">
                                                            <span id="lnameError" class="error-message"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col-md-12 form-group">
                                                            <input type="text" class="form-control" name="email"
                                                                id="email" placeholder="Email">
                                                            <span id="emailError" class="error-message"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col-md-12 form-group">
                                                            <textarea class="form-control" name="message" id="message"
                                                                cols="30" rows="7"
                                                                placeholder="Write your message"></textarea>
                                                            <span id="messageError" class="error-message"></span>
                                                        </div>
                                                    </div>
                                                    <div class="row my-2">
                                                        <div class="col-md-12">
                                                            <input type="submit" value="Send Message"
                                                                class="btn btn-primary rounded-0 py-2 px-4">
                                                            <span class="submitting"></span>
                                                        </div>
                                                    </div>
                                                </form>
                                                                                            </div>
                                            <div class="col-lg-4 ml-auto">
                                                <h3 class="mb-4">Welcome to our Discussion Space!</h3>
                                                <p>
                                                    Let's talk about everything. Share your thoughts, ideas, and
                                                    opinions in this open forum. Whether it's about movies, technology,
                                                    science, or any topic under the sun, this space is yours to explore.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
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
        function validateForm() {
            var fname = document.getElementById("fname").value;
            var lname = document.getElementById("lname").value;
            var email = document.getElementById("email").value;
            var message = document.getElementById("message").value;
            var isValid = true;

            // Reset error messages
            document.getElementById("fnameError").textContent = "";
            document.getElementById("lnameError").textContent = "";
            document.getElementById("emailError").textContent = "";
            document.getElementById("messageError").textContent = "";

            // Validate First Name
            if (fname === "") {
                document.getElementById("fnameError").textContent = "First name is required.";
                isValid = false;
            }

            // Validate Last Name
            if (lname === "") {
                document.getElementById("lnameError").textContent = "Last name is required.";
                isValid = false;
            }

            // Validate Email
            if (email === "") {
                document.getElementById("emailError").textContent = "Email is required.";
                isValid = false;
            } else if (!isValidEmail(email)) {
                document.getElementById("emailError").textContent = "Invalid email format.";
                isValid = false;
            }

            // Validate Message
            if (message === "") {
                document.getElementById("messageError").textContent = "Message is required.";
                isValid = false;
            }

            return isValid;
        }

        function isValidEmail(email) {
            // Basic email validation regex
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return emailRegex.test(email);
        }
    </script>
</body>

</html>