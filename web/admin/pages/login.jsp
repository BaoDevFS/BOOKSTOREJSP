<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"><!-- Mirrored from rn53themes.net/themes/demo/lava-admin/login.html by HTTrack Website
        Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:54 GMT -->
<head>
    <title>Login Admin</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="<%=PathAbsolute.getPath("admin/images/fav.ico")%>">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/font-awesome.min.css")%>">

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/style.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <link rel="icon" type="image/png" href="<%=PathAbsolute.getPath("Public/images/icons/favicon.ico")%>"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("Public/css/bootstrap.min.css")%>">
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("Public/css/main.css")%>">
    <!-- <link rel="stylesheet" href="Public/font-awesome-4.7.0/css/font-awesome.css">-->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("Public/css/plugins/font-awesome.min.css")%>">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<%! public String getStatus(int i) {
    System.out.println(i);
    if (i != 0) {
        return "gelet();";
    } else {
        return "";
    }
}%>
<div class="blog-login">
    <div class="blog-login-in">
        <form class="login100-form validate-form" style="width: 100%" method="post" action="<%=PathAbsolute.getPath("Admin/Login")%>">
            <img src="<%=PathAbsolute.getPath("admin/images/logo.png")%>" alt=""/>
            <p class="invalid" id="invalid">Email or password invalid!</p>

            <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                <input class="input100" type="text" name="email" placeholder="Email">
                <span class="focus-input100"></span>
                <span class="symbol-input100">
                    <i class="fa fa-envelope" aria-hidden="true"></i>
                </span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="Password is required">
                <input class="input100" type="password" name="password" placeholder="Password">
                <span class="focus-input100"></span>
                <span class="symbol-input100">
                <i class="fa fa-lock" aria-hidden="true"></i>
                </span>
            </div>

            <div class="container-login100-form-btn">
                <button style="background-color: #167ee6" class="login100-form-btn">
                    Login
                </button>
            </div>
        </form>
    </div>
</div>

<!--======== SCRIPT FILES =========-->
<script src="<%=PathAbsolute.getPath("Public/js/vendor/jquery-3.2.1.min.js")%>"></script>
<!--===============================================================================================-->
<script src="<%=PathAbsolute.getPath("Public/js/popper.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("Public/js/bootstrap.min.js")%>"></script>
<!--===============================================================================================-->
<script src="<%=PathAbsolute.getPath("Public/vendor/select2/select2.min.js")%>"></script>
<!--===============================================================================================-->
<script src="<%=PathAbsolute.getPath("Public/vendor/tilt/tilt.jquery.min.js")%>"></script>

<!--===============================================================================================-->
<script src="<%=PathAbsolute.getPath("Public/js/main.js")%>"></script>
<script src="<%=PathAbsolute.getPath("Public/js/show.js")%>"></script>
<script>
    <%
    int a;
    try{
        a =(int) request.getAttribute("status");
    }catch (NumberFormatException e){
       a=0;
    }
    %>
    <%= getStatus(a)%>

</script>

</body>
</html>
