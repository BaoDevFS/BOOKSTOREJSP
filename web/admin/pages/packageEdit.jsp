<%@ page contentType="text/html;charset=UTF-8" language="java" %>﻿
<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageEdit.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
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
                        <li><a href="../index.html"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                        </li>
                        <li class="active-bre"><a href="#"> Edit Package</a>
                        </li>
                        <li class="page-back"><a href="../index.html"><i class="fa fa-backward" aria-hidden="true"></i> Back</a>
                        </li>
                    </ul>
                </div>
                <div class="sb2-2-add-blog sb2-2-1">
                    <div class="box-inn-sp">
                        <div class="inn-title">
                            <h4>Edit Package</h4>
                            <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>
                        </div>
                        <div class="bor">
                            <form>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="list-title" type="text" value="Blog Package Name" class="validate">
                                        <label for="list-title">Package Name</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <div class="file-field">
                                            <div class="btn">
                                                <span>File</span>
                                                <input type="file">
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text" placeholder="Upload Blog Banner">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea id="textarea1" class="materialize-textarea">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</textarea>
                                        <label for="textarea1">Package Descriptions:</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select multiple>
                                            <option value="" disabled selected>Choose Category</option>
                                            <option value="1">Hotels</option>
                                            <option value="2">Educations</option>
                                            <option value="3">Medical</option>
                                            <option value="3">Health</option>
                                            <option value="3">Fitness</option>
                                            <option value="3">Tution</option>
                                            <option value="3">Software</option>
                                            <option value="3">Wedding</option>
                                            <option value="3">Party</option>
                                            <option value="3">Spa/Club</option>
                                        </select>
                                        <label>Select Category</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <select multiple>
                                            <option value="" disabled selected>Choose Category</option>
                                            <option value="1">Hotels</option>
                                            <option value="2">Educations</option>
                                            <option value="3">Medical</option>
                                            <option value="3">Health</option>
                                            <option value="3">Fitness</option>
                                            <option value="3">Tution</option>
                                            <option value="3">Software</option>
                                            <option value="3">Wedding</option>
                                            <option value="3">Party</option>
                                            <option value="3">Spa/Club</option>
                                        </select>
                                        <label>Select Sub Category</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="Package-auth" type="text" value="David Villiam" class="validate">
                                        <label for="Package-auth">Author Name</label>
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


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageEdit.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
</html>