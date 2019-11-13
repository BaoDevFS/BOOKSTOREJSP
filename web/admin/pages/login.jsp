<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
﻿
<html lang="en"><!-- Mirrored from rn53themes.net/themes/demo/lava-admin/login.html by HTTrack Website
        Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:54 GMT -->
<head>
    <title>Lava Material - Web Application and Website Multipurpose Admin Panel Template</title>
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
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="blog-login">
    <div class="blog-login-in">
        <form>
            <img src="admin/images/logo.png" alt=""/>
            <div class="row">
                <div class="input-field col s12">
                    <input id="first_name1" type="text" class="validate">
                    <label for="first_name1">User Name</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input id="last_name" type="password" class="validate">
                    <label for="last_name">Password</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <a class="waves-effect waves-light btn-large btn-log-in" href="admin/index.html">Login</a>
                </div>
            </div>
            <a href="<%PathAbsolute.getPath("ForgotPassword");%>" class="for-pass">Forgot Password?</a>
        </form>
    </div>
</div>

<!--======== SCRIPT FILES =========-->
<script src="<%=PathAbsolute.getPath("admin/js/jquery.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/bootstrap.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/materialize.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/custom.js")%>"></script>

</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/login.html by HTTrack Website Copier/3.x [XR&CO'2014],
Wed, 23 Oct 2019 13:21:55 GMT -->
</html>
