<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login V1</title>
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
    <script src="Public/js/bootstrap.min.js"></script>


    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="Public/images/img-01.png" alt="IMG">
            </div>

            <form class="login100-form validate-form" method="post"
                  action="http://localhost:8080/BookStore/forgotpassword">
        <span class="login100-form-title">
        <img src="Public/images/icons/lock.png" alt="IMG">
        Forgot Password
        </span>
                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="email" placeholder="Email">
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
        <i class="fa fa-envelope" aria-hidden="true"></i>
        </span>
                </div>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" onclick="">
                        Send me new password <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                    </button>
                </div>

                <div class="text-center p-t-12">
        <span class="txt1">
        Back to
        </span>
                    <a class="txt2" href="forgot.jsp">
                         Home?
                    </a>
                </div>

                <div class="text-center p-t-136">

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
<!-- <script src="Public/vendor/select2/select2.min.js"></script>-->
<!--===============================================================================================-->
<!-- <script src="Public/vendor/tilt/tilt.jquery.min.js"></script>-->
<!-- <script >-->
<!-- $('.js-tilt').tilt({-->
<!-- scale: 1.1-->
<!-- })-->
<!-- </script>-->
<!--===============================================================================================-->
<script src="Public/js/main.js"></script>

</body>
</html>
