<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: WATERMELON
  Date: 10/28/2019
  Time: 10:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BookBQG Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicons -->
    <link rel="shortcut icon" href="Public/images/favicon.ico">
    <link rel="apple-touch-icon" href="Public/images/icon.png">

    <!-- Google font (font-family: 'Roboto', sans-serif; Poppins ; Satisfy) -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,500,600,600i,700,700i,800"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700,900" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" type="text/css" href="Public/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="Public/css/plugins.css">
    <link rel="stylesheet" type="text/css" href="Public/css/style.css">
    <!-- Cusom css -->
    <link rel="stylesheet" type="text/css" href="Public/css/custom.css">

    <!-- Modernizer js -->
    <script src="Public/js/vendor/modernizr-3.5.0.min.js"></script>
    <%--    <script src="Public/js/vendor/jquery-3.2.1.min.js"></script>--%>
</head>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a
        href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">
    <!-- Header -->
    <%--    <%@ include file="include/header.jsp" %>--%>
    <header id="wn__header" class="header__area header__absolute sticky__header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <div class="logo">
                        <a href="../index.html">
                            <img src="Public/images/logo/logo.png" alt="logo Public/images">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8 d-none d-lg-block">
                    <nav class="mainmenu__nav">
                        <ul class="meninmenu d-flex justify-content-start">
                            <li class="drop with--one--item"><a href="../index.html">Home</a>
                            </li>
                            <li class="drop"><a href="http://localhost:8080/BookStore/ShopGrid">Shop</a>

                            </li>
                            <li><a href="http://localhost:8080/BookStore/Contact">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                    <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                        <li class="shop_search"><a class="search__active" href="#"></a></li>
                        <li class="wishlist"><a href="http://localhost:8080/BookStore/WishList"></a></li>
                        <li class="shopcart"><a class="cartbox_active" href="#"><span
                                class="product_qun"><%--3--%></span></a>
                            <!-- Start Shopping Cart -->
                            <div class="block-minicart minicart__active">
                                <div class="minicart-content-wrapper">
                                    <div class="micart__close">
                                        <span>close</span>
                                    </div>
                                    <div class="items-total d-flex justify-content-between">
                                        <span id="quantity"><%--3 items--%></span>
                                        <span>Cart Subtotal</span>
                                    </div>
                                    <div class="total_amount text-right">
                                        <span id="total"><%--$66.00--%></span>
                                    </div>
                                    <div class="mini_action checkout">
                                        <a class="checkout__btn" href="http://localhost:8080/BookStore/Cart">Go to
                                            Checkout</a>
                                    </div>
                                    <div class="single__items">
                                        <div class="miniproduct">
                                        </div>
                                    </div>
                                    <div class="mini_action cart">
                                        <a class="cart__btn" href="http://localhost:8080/BookStore/Cart">View and edit
                                            cart</a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Shopping Cart -->
                        </li>
                        <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                            <div class="searchbar__content setting__block">
                                <div class="content-inner">
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Currency</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">USD - US Dollar</span>
                                                <ul class="switcher-dropdown">
                                                    <li>GBP - British Pound Sterling</li>
                                                    <li>EUR - Euro</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Language</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">English01</span>
                                                <ul class="switcher-dropdown">
                                                    <li>English02</li>
                                                    <li>English03</li>
                                                    <li>English04</li>
                                                    <li>English05</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>Select Store</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <span class="currency-trigger">Fashion Store</span>
                                                <ul class="switcher-dropdown">
                                                    <li>Furniture</li>
                                                    <li>Shoes</li>
                                                    <li>Speaker Store</li>
                                                    <li>Furniture</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="switcher-currency">
                                        <strong class="label switcher-label">
                                            <span>My Account</span>
                                        </strong>
                                        <div class="switcher-options">
                                            <div class="switcher-currency-trigger">
                                                <div class="setting__menu">
                                                    <span><a href="#">Compare Product</a></span>
                                                    <span><a href="#">My Account</a></span>
                                                    <span><a href="#">My Wishlist</a></span>
                                                    <span><a href="Public/pages/login.html">Sign In</a></span>
                                                    <span><a href="#">Create An Account</a></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- Start Mobile Menu -->
            <div class="row d-none">
                <div class="col-lg-12 d-none">
                    <nav class="mobilemenu__nav">
                        <ul class="meninmenu">
                            <li><a href="../index.html">Home</a>
                            </li>
                            <li><a href="http://localhost:8080/BookStore/ShopGrid">Shop</a>
                            </li>
                            <li><a href="http://localhost:8080/BookStore/Contact">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- End Mobile Menu -->
            <div class="mobile-menu d-block d-lg-none">
            </div>
            <!-- Mobile Menu -->
        </div>
    </header>
    <!-- //Header -->


    <!-- End Search Popup -->
    <!-- Start Slider area -->
    <div class="slider-area brown__nav slider--15 slide__activation slide__arrow01 owl-carousel owl-theme">
        <!-- Start Single Slide -->
        <div class="slide animation__style10 bg-image--1 fullscreen align__center--left">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider__content">
                            <div class="contentbox">
                                <h2>Buy <span>your </span></h2>
                                <h2>favourite <span>Book </span></h2>
                                <h2>from <span>Here </span></h2>
                                <a class="shopbtn" href="#">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Single Slide -->
        <!-- Start Single Slide -->
        <div class="slide animation__style10 bg-image--7 fullscreen align__center--left">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="slider__content">
                            <div class="contentbox">
                                <h2>Buy <span>your </span></h2>
                                <h2>favourite <span>Book </span></h2>
                                <h2>from <span>Here </span></h2>
                                <a class="shopbtn" href="#">shop now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Single Slide -->
    </div>
    <!-- End Slider area -->
    <!-- Start BEst Seller Area -->
    <section class="wn__product__area brown--color pt--80 pb--30">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">New <span class="color--theme">Products</span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <!-- Start Single Tab Content -->

            <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
                <!-- Start Single Product -->
                <%
                    ResultSet rsNew = (ResultSet) request.getAttribute("rsNew");
                    while (rsNew.next()) {
                %>
                <div class="product product__style--3">

                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                        <div class="product__thumb">
                            <a class="first__img"
                               href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsNew.getString("id")%>"><img
                                    src="<%=rsNew.getString(3)%>" alt="product image"></a>
                            <a class="second__img animation1"
                               href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsNew.getString("id")%>"><img
                                    src="<%=rsNew.getString(4)%>" alt="product image"></a>
                            <div class="hot__box">
                                <span class="hot-label"><%=rsNew.getString(8)%></span>
                            </div>
                        </div>
                        <div class="product__content content--center">
                            <h4><a href="http://localhost:8080/BookStore/SingleProduct"><%=rsNew.getString(2)%>
                            </a></h4>
                            <ul class="prize d-flex">
                                <li>$<%=rsNew.getFloat(7)%>
                                </li>
                            </ul>

                            <div class="action">

                                <div class="actions_inner">

                                    <ul class="add_to_links">
                                        <li><a class="cart" onclick="addToCart(<%=rsNew.getString("id")%>)"><i
                                                class="fa fa-shopping-cart"></i></a></li>
                                        <li><a class="wishlist"
                                               onclick="addToWishList(<%=rsNew.getString("id")%>)"><i
                                                class="fa fa-heart"></i></a></li>
                                        <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a></li>
                                        <li><a data-toggle="modal" title="Quick View"
                                               class="quickview modal-view detail-link"
                                               onclick="propupbook(<%=rsNew.getString("id")%>)"
                                        <%-- href="#productmodal"--%>><i class="fa fa-search"></i></a></li>
                                    </ul>

                                </div>

                            </div>


                            <div class="product__hover--content">
                                <ul class="rating d-flex">
                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                    <li><i class="fa fa-star-o"></i></li>
                                    <li><i class="fa fa-star-o"></i></li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>
                <%}%>
                <!-- Start Single Product -->
            </div>

        </div>
    </section>
    <!-- Start BEst Seller Area -->
    <!-- Start NEwsletter Area -->
    <section class="wn__newsletter__area bg-image--2">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-5 col-md-12 col-12 ptb--150">
                    <div class="section__title text-center">
                        <h2>Stay With Us</h2>
                    </div>
                    <div class="newsletter__block text-center">
                        <p>Subscribe to our newsletters now and stay up-to-date with new collections, the latest
                            lookbooks and exclusive offers.</p>
                        <form action="#">
                            <div class="newsletter__box">
                                <input type="email" placeholder="Enter your e-mail">
                                <button>Subscribe</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End NEwsletter Area -->
    <!-- Start Best Seller Area -->
    <section class="wn__bestseller__area bg--white pt--80 pb--30">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">All <span class="color--theme">Products</span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <div class="row mt--50">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="product__nav nav justify-content-center" role="tablist">
                        <a class="nav-item nav-link active" data-toggle="tab" href="#nav-all" role="tab">ALL</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-biographic" role="tab">BIOGRAPHIC</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-adventure" role="tab">ADVENTURE</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-children" role="tab">CHILDREN</a>
                        <a class="nav-item nav-link" data-toggle="tab" href="#nav-cook" role="tab">COOK</a>
                    </div>
                </div>
            </div>
            <div class="tab__container mt--60">
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade show active" id="nav-all" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <% ResultSet rsAll = (ResultSet) request.getAttribute("rsAll");
                            for (int i = 0; i < 15; i++) {
                        %>
                        <div class="single__product">
                            <!-- Start Single Product -->
                            <%rsAll.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><img
                                                src="<%=rsAll.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><img
                                                src="<%=rsAll.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><%=rsAll.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsAll.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsAll.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart <%=rsAll.getString("id")%>"
                                                           onclick="addToCart(<%=rsAll.getString("id")%>);"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist <%=rsAll.getString("id")%>"
                                                           onclick="addToWishList(<%=rsAll.getString("id")%>)">
                                                        <i class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsAll.getString("id")%>)"
                                                    <%-- href="#productmodal"--%>><i class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Start Single Product -->
                            <!-- Start Single Product -->
                            <%rsAll.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><img
                                                src="<%=rsAll.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><img
                                                src="<%=rsAll.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsAll.getString("id")%>"><%=rsAll.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsAll.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsAll.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart" onclick="addToCart(<%=rsAll.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist  <%=rsAll.getString("id")%>"
                                                           onclick="addToWishList(<%=rsAll.getString("id")%>)"
                                                    ><i class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsAll.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%}%>

                    </div>
                </div>
                <div class="row single__tab tab-pane fade" id="nav-biographic" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <%
                            ResultSet rsBiographic = (ResultSet) request.getAttribute("rsBiographic");
                            for (int i = 0; i < 15; i++) {


                        %>
                        <div class="single__product">
                            <!-- Start Single Product -->
                            <%rsBiographic.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img" href="http://localhost:8080/BookStore/SingleProduct"><img
                                                src="<%=rsBiographic.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct"><img
                                                src="<%=rsBiographic.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsBiographic.getString("id")%>"><%=rsBiographic.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsBiographic.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsBiographic.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsBiographic.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           onclick="addToWishList(<%=rsBiographic.getString("id")%>)"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsBiographic.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Start Single Product -->
                            <!-- Start Single Product -->
                            <%rsBiographic.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsBiographic.getString("id")%>"><img
                                                src="<%=rsBiographic.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsBiographic.getString("id")%>"><img
                                                src="<%=rsBiographic.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsBiographic.getString("id")%>"><%=rsBiographic.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsBiographic.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsBiographic.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsBiographic.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsBiographic.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%}%>

                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-adventure" role="tabpanel">

                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <%
                            ResultSet rsMystery = (ResultSet) request.getAttribute("rsMystery");
                            for (int i = 0; i < 15; i++) {
                        %>
                        <div class="single__product">
                            <!-- Start Single Product -->
                            <%rsMystery.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><img
                                                src="<%=rsMystery.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><img
                                                src="<%=rsMystery.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><%=rsMystery.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsMystery.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsMystery.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsMystery.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsMystery.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Start Single Product -->
                            <!-- Start Single Product -->
                            <%rsMystery.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><img
                                                src="<%=rsMystery.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><img
                                                src="<%=rsMystery.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsMystery.getString("id")%>"><%=rsMystery.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsMystery.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsMystery.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsMystery.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsMystery.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-children" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <%
                            ResultSet rsChildren = (ResultSet) request.getAttribute("rsChildren");
                            for (int i = 0; i < 10; i++) {
                        %>
                        <div class="single__product">
                            <!-- Start Single Product -->
                            <%rsChildren.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><img
                                                src="<%=rsChildren.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><img
                                                src="<%=rsChildren.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><%=rsChildren.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsChildren.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsChildren.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsChildren.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsChildren.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Start Single Product -->
                            <!-- Start Single Product -->
                            <%rsChildren.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><img
                                                src="<%=rsChildren.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><img
                                                src="<%=rsChildren.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsChildren.getString("id")%>"><%=rsChildren.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsChildren.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsChildren.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsChildren.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsChildren.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%}%>

                    </div>
                </div>
                <!-- End Single Tab Content -->
                <!-- Start Single Tab Content -->
                <div class="row single__tab tab-pane fade" id="nav-cook" role="tabpanel">
                    <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                        <% ResultSet rsCook = (ResultSet) request.getAttribute("rsCook");
                            for (int i = 0; i < 15; i++) {
                        %>
                        <div class="single__product">
                            <!-- Start Single Product -->
                            <%rsCook.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><img
                                                src="<%=rsCook.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><img
                                                src="<%=rsCook.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><%=rsCook.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsCook.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsCook.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsCook.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsCook.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Start Single Product -->
                            <!-- Start Single Product -->
                            <%rsCook.next();%>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                <div class="product product__style--3">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><img
                                                src="<%=rsCook.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><img
                                                src="<%=rsCook.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProducthttp://localhost:8080/BookStore/SingleProduct?id=<%=rsCook.getString("id")%>"><%=rsAll.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsCook.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsCook.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsCook.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           href="http://localhost:8080/BookStore/WishList"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                                    </li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsCook.getString("id")%>)"><i
                                                            class="fa fa-search"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="product__hover--content">
                                            <ul class="rating d-flex">
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li class="on"><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                                <li><i class="fa fa-star-o"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%}%>

                    </div>
                </div>
                <!-- End Single Tab Content -->
            </div>
        </div>
    </section>
    <!-- Start BEst Seller Area -->
    <!-- Start Recent Post Area -->
    <section class="wn__recent__post bg--gray ptb--80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center">
                        <h2 class="title__be--2">Our <span class="color--theme">Blog</span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
            <div class="row mt--50">
                <div class="col-md-6 col-lg-4 col-sm-12">
                    <div class="post__itam">
                        <div class="content">
                            <h3><a href="blog-details.html">International activities of the Frankfurt Book </a></h3>
                            <p>We are proud to announce the very first the edition of the frankfurt news.We are proud to
                                announce the very first of edition of the fault frankfurt news for us.</p>
                            <div class="post__time">
                                <span class="day">Dec 06, 18</span>
                                <div class="post-meta">
                                    <ul>
                                        <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                        <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-sm-12">
                    <div class="post__itam">
                        <div class="content">
                            <h3><a href="blog-details.html">Reading has a signficant info number of benefits</a></h3>
                            <p>Find all the information you need to ensure your experience.Find all the information you
                                need to ensure your experience . Find all the information you of.</p>
                            <div class="post__time">
                                <span class="day">Mar 08, 18</span>
                                <div class="post-meta">
                                    <ul>
                                        <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                        <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-sm-12">
                    <div class="post__itam">
                        <div class="content">
                            <h3><a href="blog-details.html">The London Book Fair is to be packed with exciting </a></h3>
                            <p>The London Book Fair is the global area inon marketplace for rights negotiation.The year
                                London Book Fair is the global area inon forg marketplace for rights.</p>
                            <div class="post__time">
                                <span class="day">Nov 11, 18</span>
                                <div class="post-meta">
                                    <ul>
                                        <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                        <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Recent Post Area -->
    <!-- Best Sale Area -->
    <section class="best-seel-area pt--80 pb--60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section__title text-center pb--50">
                        <h2 class="title__be--2">Best <span class="color--theme">Seller </span></h2>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority have
                            suffered lebmid alteration in some ledmid form</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="slider center">
            <!-- Single product start -->
            <% ResultSet rsSeller = (ResultSet) request.getAttribute("rsSale");
                while (rsSeller.next()) {

            %>
            <div class="product product__style--3">
                <div class="product__thumb">
                    <a class="first__img"
                       href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsSeller.getString("id")%>"><img
                            src="<%=rsSeller.getString(3)%>" alt="product image"></a>
                </div>
                <div class="product__content content--center">
                    <div class="action">
                        <div class="actions_inner">
                            <ul class="add_to_links">
                                <li><a class="cart" onclick="addToCart(<%=rsSeller.getString("id")%>)"><i
                                        class="fa fa-shopping-cart"></i></a></li>
                                <li><a class="wishlist"
                                       href="http://localhost:8080/BookStore/WishList"><i
                                        class="fa fa-heart"></i></a></li>
                                <li><a class="compare" href="#"><i class="fa fa-hashtag"></i></a>
                                </li>
                                <li><a data-toggle="modal" title="Quick View"
                                       class="quickview modal-view detail-link"
                                       onclick="propupbook(<%=rsSeller.getString("id")%>)"><i class="fa fa-search"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="product__hover--content">
                        <ul class="rating d-flex">
                            <li class="on"><i class="fa fa-star-o"></i></li>
                            <li class="on"><i class="fa fa-star-o"></i></li>
                            <li class="on"><i class="fa fa-star-o"></i></li>
                            <li><i class="fa fa-star-o"></i></li>
                            <li><i class="fa fa-star-o"></i></li>
                        </ul>
                    </div>
                </div>
            </div>
            <%}%>


        </div>
    </section>
    <!-- Best Sale Area Area -->
    <!-- Footer Area -->
    <%@ include file="include/footer.jsp" %>
    <!-- //Footer Area -->
    <!-- QUICKVIEW PRODUCT -->
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="productmodal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal__container" role="document">
                <div class="modal-content">
                    <div class="modal-header modal__header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
                    <div id="madal-body" class="modal-body">
                        <div class="modal-product">
                            <div class="maincontent bg--white pb--55">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-lg-12 col-12">
                                            <div class="wn__single__product">
                                                <div class="row">
                                                    <div class="col-lg-6 col-12">
                                                        <div class="wn__fotorama__wrapper">

                                                            <a href="Public/images/1.html" id="imageBook">
                                                            </a>

                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-12">
                                                        <div class="product__info__main">
                                                            <h1 id="nameBook">Chaz Kangeroo Hoodie</h1>
                                                            <div class="product-reviews-summary d-flex">
                                                                <ul class="rating-summary d-flex">
                                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                                    <li><i class="zmdi zmdi-star-outline"></i></li>
                                                                    <li class="off"><i
                                                                            class="zmdi zmdi-star-outline"></i></li>
                                                                    <li class="off"><i
                                                                            class="zmdi zmdi-star-outline"></i></li>
                                                                </ul>
                                                            </div>
                                                            <div class="price-box">
                                                                <span id="priceBook"></span>
                                                            </div>
                                                            <div id="descriptionBook" class="product__overview">
                                                            </div>
                                                            <div class="box-tocart d-flex">
                                                                <span>Qty</span>
                                                                <input id="qty" class="input-text qty" name="qty"
                                                                       value="1" title="Qty" min="1" type="number">
                                                                <div class="addtocart__actions">
                                                                    <button class="tocart" type="submit"
                                                                            title="Add to Cart"><a
                                                                            onclick="addToCartShow(getidshow(),$('#qty').val());">Add
                                                                        to Cart</a>
                                                                    </button>
                                                                </div>
                                                                <div class="product-addto-links clearfix">
                                                                    <a class="wishlist" href="#"></a>
                                                                    <a class="compare" href="#"></a>
                                                                </div>
                                                            </div>
                                                            <div class="product_meta">
                                                             <span class="posted_in">Categories:
                                                                 <a id="typeBook" href="#"></a>,
                                                             </span>
                                                            </div>
                                                            <div class="product-share">
                                                                <ul>
                                                                    <li class="categories-title">Share :</li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <i class="icon-social-twitter icons"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <i class="icon-social-tumblr icons"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <i class="icon-social-facebook icons"></i>
                                                                        </a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="#">
                                                                            <i class="icon-social-linkedin icons"></i>
                                                                        </a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="success" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal__container" role="document">
                <div class="modal-content" style="margin-top: 22%">
                    <%-- <div class="modal-header modal__header">
                         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                 aria-hidden="true">&times;</span></button>
                     </div>--%>
                    <div  id="statusWishlist" class="modal-body" style="margin: auto;font-size: 20px">
                        Thêm thành công.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END QUICKVIEW PRODUCT -->
</div>
<!-- //Main wrapper -->

<!-- JS Files -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="Public/js/popper.min.js"></script>
<script src="Public/js/bootstrap.min.js"></script>
<script src="Public/js/plugins.js"></script>
<script src="Public/js/active.js"></script>
<script src="Public/js/animationforcart.js"></script>
<script src="Public/js/addToCart.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script>
    $(function () {
        drawCart();
        sea();
    });
</script>
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/index.html by HTTrack Website Copier/3.x
        [XR&CO'2014], Thu, 12 Sep 2019 08:49:14 GMT -->
</html>
