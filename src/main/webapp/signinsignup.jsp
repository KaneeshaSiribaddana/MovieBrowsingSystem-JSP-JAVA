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
                            <button id="login-toggle" onclick="toggleLogin()">log in</button>
                            <button id="signup-toggle" onclick="toggleSignup()">sign up</button>
                        </div>

                        <div id="login-form">
                            <form action="index" method="post" onsubmit="return validateLoginForm()">
                                <input type="text" name="email" placeholder="Enter email" />
                                <input type="password" name="password" placeholder="Enter password" />
                                <button type="submit" class="btn login">login</button>
                                <p><a href="javascript:void(0)">Forgotten account</a></p>
                                <hr />
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-google fa-lg"
                                        aria-hidden="true"></i> sign in with google</button>
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-linkedin fa-lg"
                                        aria-hidden="true"></i> sign in with linkedin</button>
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-windows fa-lg"
                                        aria-hidden="true"></i> sign in with microsoft</button>
                            </form>
                            <a  href=""></a>
                        </div>


                        <div id="signup-form">
                            <form action="signup" method="post"onsubmit="return validateSignupForm()">
                                <input type="email" name="email" placeholder="Enter your email" />
                                <input type="text" name="name" placeholder="Enter your Full Name" />
                                <input type="date" name="birthdate" placeholder="Enter Your Birthdate" />
                                <input type="password" name="password" placeholder="Create password" />
                                <button type="submit" class="btn signup">create account</button>
                                <p>Clicking <strong>create account</strong> means that you are agree to our <a
                                        href="javascript:void(0)">terms of services</a>.</p>
                                <hr />
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-google fa-lg"
                                        aria-hidden="true"></i> sign up with google</button>
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-linkedin fa-lg"
                                        aria-hidden="true"></i> sign up with linkedin</button>
                                <button type="button" class="btn -box-sd-effect"> <i class="fa fa-windows fa-lg"
                                        aria-hidden="true"></i> sign up with microsoft</button>
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
    <script>
        function toggleSignup() {
            document.getElementById("login-toggle").style.backgroundColor = "#fff";
            document.getElementById("login-toggle").style.color = "#222";
            document.getElementById("signup-toggle").style.backgroundColor = "#2348ff";
            document.getElementById("signup-toggle").style.color = "#fff";
            document.getElementById("login-form").style.display = "none";
            document.getElementById("signup-form").style.display = "block";
        }

        function toggleLogin() {
            document.getElementById("login-toggle").style.backgroundColor = "#2348ff";
            document.getElementById("login-toggle").style.color = "#fff";
            document.getElementById("signup-toggle").style.backgroundColor = "#fff";
            document.getElementById("signup-toggle").style.color = "#222";
            document.getElementById("signup-form").style.display = "none";
            document.getElementById("login-form").style.display = "block";
        }
    </script>
    <script>
        function validateSignupForm() {
            var email = document.forms["signupForm"]["email"].value;
            var name = document.forms["signupForm"]["name"].value;
            var birthdate = document.forms["signupForm"]["birthdate"].value;
            var password = document.forms["signupForm"]["password"].value;

            // Reset error messages
            document.getElementById("emailError").textContent = "";
            document.getElementById("nameError").textContent = "";
            document.getElementById("birthdateError").textContent = "";
            document.getElementById("passwordError").textContent = "";

            var isValid = true;

            // Validate Email
            if (email === "") {
                document.getElementById("emailError").textContent = "Email is required.";
                isValid = false;
            }

            // Validate Name
            if (name === "") {
                document.getElementById("nameError").textContent = "Name is required.";
                isValid = false;
            }

            // Validate Birthdate
            if (birthdate === "") {
                document.getElementById("birthdateError").textContent = "Birthdate is required.";
                isValid = false;
            }

            // Validate Password
            if (password === "") {
                document.getElementById("passwordError").textContent = "Password is required.";
                isValid = false;
            }

            return isValid;
        }

        function validateLoginForm() {
            var email = document.forms["loginForm"]["email"].value;
            var password = document.forms["loginForm"]["password"].value;

            // Reset error messages
            document.getElementById("loginEmailError").textContent = "";
            document.getElementById("loginPasswordError").textContent = "";

            var isValid = true;

            // Validate Email
            if (email === "") {
                document.getElementById("loginEmailError").textContent = "Email is required.";
                isValid = false;
            }

            // Validate Password
            if (password === "") {
                document.getElementById("loginPasswordError").textContent = "Password is required.";
                isValid = false;
            }

            return isValid;
        }
    </script>
</body>

</html>