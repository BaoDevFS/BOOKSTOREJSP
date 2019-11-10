<%@ page contentType="text/html;charset=UTF-8" language="java" %>﻿
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/socialMedia.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:54 GMT -->
<head>
    <title>Lava Material - Web Application and Website Multipurpose Admin Panel Template</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="admin/images/fav.ico">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="admin/css/font-awesome.min.css">

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet" href="admin/css/style.css">
    <link rel="stylesheet" href="admin/css/mob.css">
    <link rel="stylesheet" href="admin/css/bootstrap.css">
    <link rel="stylesheet" href="admin/css/materialize.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
    <!--== MAIN CONTRAINER ==-->
<%@ include file="include/header.jsp" %>
    <!--== BODY CONTNAINER ==-->
    <div class="container-fluid sb2">
        <div class="row">
            <%@ include file="include/inforAndLeftMenu.jsp" %>
            <div class="sb2-2">
                <div class="sb2-2-2">
                    <ul>
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                        </li>
                        <li class="active"><a href="#"> Social Media</a>
                        </li>
                    </ul>
                </div>
                <div class="sb2-2-add-blog sb2-2-1">
                    <div class="inn-title">
                        <h4>Social Media and Share</h4>
                        <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>
                    </div>
                    <div class="bor">
                        <form>
                            <div class="form-group">
                                <label for="email1">Facebook:</label>
                                <input type="text" class="form-control" id="email1" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="email2">Twitter:</label>
                                <input type="text" class="form-control" id="email2" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="email3">Google Plus:</label>
                                <input type="text" class="form-control" id="email3" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="email4">Linked In:</label>
                                <input type="text" class="form-control" id="email4" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="email5">Whats App:</label>
                                <input type="text" class="form-control" id="email5" placeholder="">
                            </div>
                            <button type="submit" class="btn btn-default">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--== BOTTOM FLOAT ICON ==-->
    <section>
        <div class="fixed-action-btn vertical">
            <a class="btn-floating btn-large red pulse">
                <i class="large material-icons">mode_edit</i>
            </a>
            <ul>
                <li><a class="btn-floating red"><i class="material-icons">insert_chart</i></a>
                </li>
                <li><a class="btn-floating yellow darken-1"><i class="material-icons">format_quote</i></a>
                </li>
                <li><a class="btn-floating green"><i class="material-icons">publish</i></a>
                </li>
                <li><a class="btn-floating blue"><i class="material-icons">attach_file</i></a>
                </li>
            </ul>
        </div>
    </section>

    <!--======== SCRIPT FILES =========-->
    <script src="admin/js/jquery.min.js"></script>
    <script src="admin/js/bootstrap.min.js"></script>
    <script src="admin/js/materialize.min.js"></script>
    <script src="admin/js/custom.js"></script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/socialMedia.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:54 GMT -->
</html>
