<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/myAccount.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>My Account | Bookshop Responsive Bootstrap4 Template</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="Public/images/favicon.ico">
    <link rel="apple-touch-icon" href="Public/images/icon.png">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Satisfy" rel="stylesheet">

    <!-- Stylesheets -->
<%--    <link rel="stylesheet" type="text/css" href="Public/css/main.css">--%>
    <link rel="stylesheet" href="Public/css/plugins/font-awesome.min.css">
    <link rel="stylesheet" href="Public/css/bootstrap.min.css">
    <link rel="stylesheet" href="Public/css/plugins.css">
    <link rel="stylesheet" href="Public/css/style.css">
    <!-- Cusom css -->
    <link rel="stylesheet" href="Public/css/custom.css">
    <link rel="stylesheet" href="Public/css/form.css">

    <!-- Modernizer js -->
    <script src="Public/js/vendor/modernizr-3.5.0.min.js"></script>

</head>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a
        href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <%@ include file="include/header.jsp" %>
    <!-- //Header -->
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">My Account</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">My Account</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start My Account Area -->
    <section class="my_account_area pt--30 pb--55 bg--white">
        <div class="container">
            <div class="row">
                <div class="m-auto col-lg-6 col-12">
                    <div class="my__account__wrapper">
                        <h3 class="account__title" style="text-align: center; padding-bottom: 42px;">New password</h3>
                        <form action="http://localhost:8080/BookStore/ResetPassword" method="post">
                            <%!
                                public String getMessage(String s){
                                    if(s==null){
                                        return "";
                                    }else {
                                        return s;
                                    }
                                }
                            %>
                            <span><%=getMessage((String) request.getAttribute("message"))%></span>
                            <div class="wrap-input100 validate-input"
                                 data-validate="Password is required">
                                <input class="input100" id="pass" type="password" name="password" placeholder="Password">
                                <span class="focus-input100 eye"  style="cursor: pointer">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </span>
                                <a class="symbol-input100">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                </a>
                            </div>

                            <div class="wrap-input100 validate-input" data-validate="Password is required">
                                <input class="input100" id="repass" name="abc" type="password" placeholder="RePassword">
                                <span class="focus-input100 eye" style="cursor: pointer">
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                </span>
                                <a class="symbol-input100">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                </a>
                            </div>
                            <div class="container-login100-form-btn">
                                <button style="width: 30%" id="save" class="login100-form-btn">
                                    Save
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End My Account Area -->
    <!-- Footer Area -->
    <%@ include file="include/footer.jsp" %>
    <!-- //Footer Area -->

</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="Public/js/vendor/jquery-3.2.1.min.js"></script>
<script src="Public/js/popper.min.js"></script>
<script src="Public/js/bootstrap.min.js"></script>
<script src="Public/js/plugins.js"></script>
<script src="Public/js/active.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script src="Public/js/validate.js"></script>
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/myAccount.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
</html>
