    <%@ page contentType="text/html;charset=UTF-8" language="java" %>﻿
        <%@ page import="vn.edu.nlu.control.PathAbsolute" %>
        <!DOCTYPE html>
        <html lang="en">
        <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="Public/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" href="Public/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">-->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">-->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">-->
        <!--===============================================================================================-->
        <!-- <link rel="stylesheet" type="text/css" href="css/util.css">-->
        <link rel="stylesheet" type="text/css" href="Public/css/main.css">
        <!-- <link rel="stylesheet" href="Public/font-awesome-4.7.0/css/font-awesome.css">-->
        <link rel="stylesheet" href="Public/css/plugins/font-awesome.min.css">

        <!--===============================================================================================-->
        </head>
        <body>
            <%! public String getStatus(int i) {
	System.out.println(i);
	if(i!=0){
		return "gelet();";
	}else{
		return "";
	}
}%>

        <div class="limiter">
        <div class="container-login100">
        <div class="wrap-login100">
        <div class="login100-pic js-tilt" data-tilt>
        <img src="Public/images/img-01.png" alt="IMG">
        </div>
        <form class="login100-form validate-form" method="post" action="http://localhost:8080/BookStore/Login">
        <span class="login100-form-title">
        Member Login
        </span>
        <p class="invalid" id="invalid" >Email or password invalid!</p>

        <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz" >
        <input class="input100" type="text" name="email" placeholder="Email" >
        <span class="focus-input100"></span>
        <span class="symbol-input100">
        <i class="fa fa-envelope" aria-hidden="true" ></i>
        </span>
        </div>

        <div class="wrap-input100 validate-input" data-validate = "Password is required">
        <input class="input100" type="password" name="pass" placeholder="Password">
        <span class="focus-input100"></span>
        <span class="symbol-input100">
        <i class="fa fa-lock" aria-hidden="true"></i>
        </span>
        </div>

        <div class="container-login100-form-btn">
        <button class="login100-form-btn">
        Login
        </button>
        </div>

        <div class="text-center p-t-12">
        <span class="txt1">
        Forgot
        </span>
        <a class="txt2" href="http://localhost:8080/BookStore/ForgotPassword">
        Username / Password?
        </a>
        </div>

        <div class="text-center p-t-136">
        <a class="txt2" href="<%= PathAbsolute.getPath("Register")%>">
        Create your Account
        <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
        </a>
        </div>
        </form>
        </div>
        </div>
        </div>


        <!--===============================================================================================-->
        <script src="Public/js/vendor/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="Public/js/popper.min.js"></script>
        <script src="Public/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="Public/vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="Public/vendor/tilt/tilt.jquery.min.js"></script>

        <!--===============================================================================================-->
        <script src="Public/js/main.js"></script>
        <script src="Public/js/show.js"></script>
        <script >
            <%= getStatus((int)request.getAttribute("status"))%>

        </script>
        </body>
        </html>
