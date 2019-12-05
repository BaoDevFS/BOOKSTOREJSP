<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="Public/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="Public/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="Public/css/main.css">
    <!-- <link rel="stylesheet" href="Public/font-awesome-4.7.0/css/font-awesome.css">-->
    <link rel="stylesheet" href="Public/css/plugins/font-awesome.min.css">
    <script src="Public/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100 mysignup">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="Public/images/img-01.png" alt="IMG">
            </div>

            <form class="login100-form validate-form" method="post" action="http://localhost:8080/BookStore/Register">
        <span class="login100-form-title">
        Member Register
        </span>
                <div class="wrap-input100 validate-input" data-validate="Valid user is required: Anh">
                    <input class="input100" type="text" name="username" placeholder="UserName">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
        <i class="fa fa-user"></i>
        </span>
                </div>

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="email" placeholder="Email Address">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
        <i class="fa fa-envelope" aria-hidden="true"></i>
        </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Valid phone is required: 10-11 numbers">
                    <input class="input100" type="text" name="phone" placeholder="Phone Number">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
        <i class="fa fa-phone"></i>
        </span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
        <i class="fa fa-lock" aria-hidden="true"></i>
        </span>
                </div>
                <%--                <div class="wrap-input100 validate-input" data-validate="Password is required: same password">--%>
                <%--                    <input class="input100" type="password" name="repassword" placeholder="Retype Password">--%>
                <%--                    <span class="focus-input100"></span>--%>
                <%--                    <span class="symbol-input100">--%>
                <%--							<i class="fa fa-lock" aria-hidden="true"></i>--%>
                <%--						</span>--%>
                <%--                </div>--%>

                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Register
                    </button>
                </div>

                <div class="text-center p-t-12">

                    <a class="txt2" href="#">
                        Have an account ?
                    </a>
                </div>

                <div class="text-center p-t-136">
                    <a class="txt2 txt-login" href="#">
                        Log In
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

<script src="Public/js/main.js"></script>

</body>
</html>

