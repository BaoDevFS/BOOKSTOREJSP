<%@ page contentType="text/html;charset=UTF-8" language="java" %>﻿
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageCatAdd.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
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
            <div class="sb2-1">
                <!--== USER INFO ==-->
                <div class="sb2-12">
                    <ul>
                        <li><img src="admin/images/placeholder.jpg" alt="">
                        </li>
                        <li>
                            <h5>Victoria Baker <span> Santa Ana, CA</span></h5>
                        </li>
                        <li></li>
                    </ul>
                </div>
                <!--== LEFT MENU ==-->
                <div class="sb2-13">
                    <ul class="collapsible" data-collapsible="accordion">
                        <li><a href="admin/index.html" class="menu-active"><i class="fa fa-bar-chart" aria-hidden="true"></i> Dashboard</a>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-user" aria-hidden="true"></i> Users</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="userAll.html">All Users</a>
                                    </li>
                                    <li><a href="userAdd.html">Add New user</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-umbrella" aria-hidden="true"></i> Tour Packages</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="packageAll.html">All Packages</a>
                                    </li>
                                    <li><a href="packageAdd.html">Add New Package</a>
                                    </li>
                                    <li><a href="packageCatAll.html">All Package Categories</a>
                                    </li>
                                    <li><a href="admin/pages/packageCatAdd.html">Add Package Categories</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-usd" aria-hidden="true"></i> Discounts</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="admin/pages/discount.html">All Discounts</a>
                                    </li>
                                    <li><a href="discountAdd.html">Add New Discounts</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-ticket" aria-hidden="true"></i> Booking & Enquiry</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="admin/pages/hotel-booking-all.html">Hotel</a>
                                    </li>
                                    <li><a href="packageBookingAll.html">Package</a>
                                    </li>
                                    <li><a href="admin/pages/sight-see-booking-all.html">Sight Seeings</a>
                                    </li>
                                    <li><a href="admin/pages/event-booking-all.html">Events</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="admin/pages/login.html" target="_blank"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sb2-2">
                <div class="sb2-2-2">
                    <ul>
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                        </li>
                        <li class="active-bre"><a href="#"> Add New Package Categories</a>
                        </li>
                    </ul>
                </div>
                <div class="sb2-2-add-blog sb2-2-1">
                    <h2>Add New Package Categories</h2>
                    <p>The .table class adds basic styling (light padding and only horizontal dividers) to a table:</p>
                    <form>
                        <div class="row">
                            <div class="input-field col s12">
                                <input id="list-title" type="text" value="" class="validate">
                                <label for="list-title">Enter Package Category</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12">
                                <input type="submit" class="waves-effect waves-light btn-large" value="Submit">
                            </div>
                        </div>
                    </form>
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


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageCatAdd.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
</html>
