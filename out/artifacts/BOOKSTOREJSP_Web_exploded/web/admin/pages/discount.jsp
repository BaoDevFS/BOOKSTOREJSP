<%@ page contentType="text/html;charset=UTF-8" language="java" %>﻿
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/discount.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:53 GMT -->
<head>
    <title>Lava Material - Web Application and Website Multipurpose Admin Panel Template</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="../images/fav.ico">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/mob.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/materialize.css" />

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
                        <li><img src="../images/placeholder.jpg" alt="">
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
                        <li><a href="../index.html" class="menu-active"><i class="fa fa-bar-chart" aria-hidden="true"></i> Dashboard</a>
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
                                    <li><a href="packageCatAdd.html">Add Package Categories</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-usd" aria-hidden="true"></i> Discounts</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="../pages/discount.html">All Discounts</a>
                                    </li>
                                    <li><a href="discountAdd.html">Add New Discounts</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-ticket" aria-hidden="true"></i> Booking & Enquiry</a>
                            <div class="collapsible-body left-sub-menu">
                                <ul>
                                    <li><a href="../pages/hotel-booking-all.html">Hotel</a>
                                    </li>
                                    <li><a href="packageBookingAll.html">Package</a>
                                    </li>
                                    <li><a href="../pages/sight-see-booking-all.html">Sight Seeings</a>
                                    </li>
                                    <li><a href="../pages/event-booking-all.html">Events</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="../pages/login.html" target="_blank"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sb2-2">
                <div class="sb2-2-2">
                    <ul>
                        <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                        </li>
                        <li class="active-bre"><a href="#"> Ui Form</a>
                        </li>
                    </ul>
                </div>
                <div class="sb2-2-3">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="box-inn-sp">
                                <div class="inn-title">
                                    <h4>All Discounts</h4>
                                    <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>
                                    <a class="dropdown-button drop-down-meta" href="#" data-activates="dr-users"><i class="material-icons">more_vert</i></a>
                                    <ul id="dr-users" class="dropdown-content">
                                        <li><a href="#!">Add New</a>
                                        </li>
                                        <li><a href="#!">Edit</a>
                                        </li>
                                        <li><a href="#!">Update</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#!"><i class="material-icons">delete</i>Delete</a>
                                        </li>
                                        <li><a href="#!"><i class="material-icons">subject</i>View All</a>
                                        </li>
                                    </ul>

                                    <!-- Dropdown Structure -->

                                </div>
                                <div class="tab-inn">
                                    <div class="table-responsive table-desi">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>User</th>
                                                    <th>event</th>
                                                    <th>Offers</th>
                                                    <th>Date</th>
                                                    <th>Country</th>
                                                    <th>Edit</th>
                                                    <th>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><span class="list-img"><img src="../images/listing/1.jpg" alt=""></span>
                                                    </td>
                                                    <td><a href="#"><span class="list-enq-name">Domestic Help Services</span><span class="list-enq-city">Illunois, United States</span></a>
                                                    </td>
                                                    <td>50%</td>
                                                    <td>18 may, 2018</td>
                                                    <td>Australia</td>
                                                    <td>
                                                        <a href="discountEdit.html"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>
                                                    </td>
                                                    <td>
                                                        <a href="#"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/materialize.min.js"></script>
    <script src="../js/custom.js"></script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/discount.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:21:53 GMT -->
</html>