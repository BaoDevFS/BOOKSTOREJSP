<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop-Single | BookBQG Store</title>
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
    <link rel="stylesheet" href="Public/css/bootstrap.min.css">
    <link rel="stylesheet" href="Public/css/plugins.css">
    <link rel="stylesheet" href="Public/css/style.css">

    <!-- Cusom css -->
    <link rel="stylesheet" href="Public/css/custom.css">

    <script src="Public/js/vendor/modernizr-3.5.0.min.js"></script>
    <%--    <script src="Public/js/vendor/jquery-3.2.1.min.js"></script>--%>
    <%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <%--    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>--%>
    <!-- Modernizer js -->
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
    <div class="ht__bradcaump__area bg-image--4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Shop Single</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="/Home">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Shop Single</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start main Content -->
    <div class="maincontent bg--white pt--80 pb--55">
        <div class="container">
            <div class="row">
                <% ResultSet rsB = (ResultSet) request.getAttribute("rsB");
                    while (rsB.next()) {
                %>
                <div class="col-lg-9 col-12">

                    <div class="wn__single__product">
                        <div class="row">
                            <div class="col-lg-6 col-12">
                                <div class="wn__fotorama__wrapper">
                                    <div class="fotorama wn__fotorama__action" data-nav="thumbs">
                                        <a href="Public/images/1.html"><img src="<%=rsB.getString(3)%>"
                                                                            alt=""></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-12">
                                <div class="product__info__main">
                                    <h1><%=rsB.getString(2)%>
                                    </h1>
                                    <div class="product-reviews-summary d-flex">
                                        <ul class="rating-summary d-flex">
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li><i class="zmdi zmdi-star-outline"></i></li>
                                            <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                            <li class="off"><i class="zmdi zmdi-star-outline"></i></li>
                                        </ul>
                                    </div>
                                    <div class="price-box">
                                        <span>$<%=rsB.getString(7)%></span>
                                    </div>
                                    <div class="product__overview">
                                        <p>Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises
                                            superior warmth with every wear.
                                            Thick material blocks out the wind as ribbed cuffs and bottom band seal in
                                            body heat.</p>
                                        <p>Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises
                                            superior warmth with every wear.
                                        </p>
                                    </div>
                                    <div class="box-tocart d-flex">
                                        <span>Qty</span>
                                        <input id="qty" class="input-text qty" name="qty" min="1" value="1" title="Qty"
                                               type="number">
                                        <div class="addtocart__actions">
                                            <button class="tocart" type="submit" title="Add to Cart"
                                                    onclick="addToCartShow(<%=rsB.getInt("id")%>,$('#qty').val());"> Add
                                                to Cart
                                            </button>
                                        </div>
                                        <div class="product-addto-links clearfix">
                                            <a class="wishlist" onclick="addToWishList(<%=rsB.getString("id")%>)"></a>
                                        </div>
                                    </div>
                                    <div class="product_meta">
        <span class="posted_in">Categories:
        <a href="#">Adventure</a>,
        <a href="#">Kids' Music</a>
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

                    <div class="product__info__detailed">
                        <div class="pro_details_nav nav justify-content-start" role="tablist">
                            <a class="nav-item nav-link active" data-toggle="tab" href="#nav-details"
                               role="tab">Details</a>
                            <a class="nav-item nav-link" data-toggle="tab" href="#nav-review" role="tab">Reviews</a>
                        </div>
                        <div class="tab__container">
                            <!-- Start Single Tab Content -->
                            <div class="pro__tab_label tab-pane fade show active" id="nav-details" role="tabpanel">
                                <div class="description__attribute">
                                    <p>Ideal for cold-weather training or work outdoors, the Chaz Hoodie promises
                                        superior warmth with every wear.
                                        Thick material blocks out the wind as ribbed cuffs and bottom band seal in body
                                        heat.Ideal for cold-weather
                                        training or work outdoors, the Chaz Hoodie promises superior warmth with every
                                        wear. Thick material blocks out
                                        the wind as ribbed cuffs and bottom band seal in body heat.Ideal for
                                        cold-weather training or work outdoors, the
                                        Chaz Hoodie promises superior warmth with every wear. Thick material blocks out
                                        the wind as ribbed cuffs and
                                        bottom band seal in body heat.Ideal for cold-weather training or work outdoors,
                                        the Chaz Hoodie promises
                                        superior warmth with every wear. Thick material blocks out the wind as ribbed
                                        cuffs and bottom band seal in body
                                        heat.</p>
                                    <ul>
                                        <li>• Two-tone gray heather hoodie.</li>
                                        <li>• Drawstring-adjustable hood.</li>
                                        <li>• Machine wash/dry.</li>
                                    </ul>
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                            <!-- Start Single Tab Content -->
                            <div class="pro__tab_label tab-pane fade" id="nav-review" role="tabpanel">
                                <div class="review__attribute">
                                    <h1>Customer Reviews</h1>
                                    <h2>Hastech</h2>
                                    <div class="review__ratings__type d-flex">
                                        <div class="review-ratings">
                                            <div class="rating-summary d-flex">
                                                <span>Quality</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>

                                            <div class="rating-summary d-flex">
                                                <span>Price</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                            <div class="rating-summary d-flex">
                                                <span>value</span>
                                                <ul class="rating d-flex">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="review-content">
                                            <p>Hastech</p>
                                            <p>Review by Hastech</p>
                                            <p>Posted on 11/6/2018</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="review-fieldset">
                                    <h2>You're reviewing:</h2>
                                    <h3>Chaz Kangeroo Hoodie</h3>
                                    <div class="review-field-ratings">
                                        <div class="product-review-table">
                                            <div class="review-field-rating d-flex">
                                                <span>Quality</span>
                                                <ul class="rating d-flex">
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                            <div class="review-field-rating d-flex">
                                                <span>Price</span>
                                                <ul class="rating d-flex">
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                            <div class="review-field-rating d-flex">
                                                <span>Value</span>
                                                <ul class="rating d-flex">
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                    <li class="off"><i class="zmdi zmdi-star"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="review_form_field">
                                        <div class="input__box">
                                            <span>Nickname</span>
                                            <input id="nickname_field" type="text" name="nickname">
                                        </div>
                                        <div class="input__box">
                                            <span>Summary</span>
                                            <input id="summery_field" type="text" name="summery">
                                        </div>
                                        <div class="input__box">
                                            <span>Review</span>
                                            <textarea name="review"></textarea>
                                        </div>
                                        <div class="review-form-actions">
                                            <button>Submit Review</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Tab Content -->
                        </div>
                    </div>
                    <div class="wn__related__product pt--80 pb--50">
                        <div class="section__title text-center">
                            <h2 class="title__be--2">Related Products</h2>
                        </div>
                        <div class="row mt--60">

                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <!-- Start Single Product -->
                                <% ResultSet rsRe = (ResultSet) request.getAttribute("rsRe");
                                    while (rsRe.next()) {
                                %>
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsRe.getString("id")%>"><img
                                                src="<%=rsRe.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsRe.getString("id")%>"><img
                                                src="<%=rsRe.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALLER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsRe.getString("id")%>"><%=rsRe.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsRe.getString(6)%>
                                            </li>
                                            <li class="old_prize">$<%=rsRe.getString(7)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsRe.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           onclick="addToWishList(<%=rsRe.getString("id")%>)"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsRe.getString("id")%>)"><i
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
                                <!-- Start Single Product -->
                                <%}%>

                            </div>
                        </div>
                    </div>
                    <div class="wn__related__product">
                        <div class="section__title text-center">
                            <h2 class="title__be--2">upsell products</h2>
                        </div>
                        <div class="row mt--60">
                            <div class="productcategory__slide--2 arrows_style owl-carousel owl-theme">
                                <!-- Start Single Product -->
                                <%
                                    ResultSet rsSell = (ResultSet) request.getAttribute("rsSell");
                                    while (rsSell.next()) {
                                %>
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsSell.getString("id")%>"><img
                                                src="<%=rsSell.getString(3)%>" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsSell.getString("id")%>"><img
                                                src="<%=rsSell.getString(4)%>" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALLER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=rsSell.getString("id")%>">
                                                <%=rsSell.getString(2)%>
                                            </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=rsSell.getString(7)%>
                                            </li>
                                            <li class="old_prize">$<%=rsSell.getString(6)%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart"
                                                           onclick="addToCart(<%=rsSell.getString("id")%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"><i
                                                            onclick="addToWishList(<%=rsSell.getString("id")%>)"
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=rsSell.getString("id")%>)"><i
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
                                <!-- Start Single Product -->
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
                <div class="col-lg-3 col-12 md-mt-40 sm-mt-40">
                    <div class="shop__sidebar">
                        <aside class="wedget__categories poroduct--cat">
                            <h3 class="wedget__title">Product Categories</h3>
                            <ul>
                                <% ResultSet rsCategory = (ResultSet) request.getAttribute("rsCategory");
                                    ResultSet rsCount = (ResultSet) request.getAttribute("rsCount");
                                    while (rsCategory.next() && rsCount.next()) {
                                %>
                                <li><a href="<%=PathAbsolute.getPath("ShopGrid?type="+rsCategory.getInt(1))%>">
                                    <%=rsCategory.getString(2) %>
                                    <span>(<%=rsCount.getInt(3) %>)</span>
                                    <% } %>
                                </a></li>

                            </ul>
                        </aside>
                        <aside class="wedget__categories pro--range">
                            <h3 class="wedget__title">Filter by price</h3>
                            <div class="content-shopby">
                                <div class="price_filter s-filter clear">
                                    <form action="#" method="GET">
                                        <div id="slider-range"></div>
                                        <div class="slider__range--output">
                                            <div class="price__output--wrap">
                                                <div class="price--output">
                                                    <span>Price :</span><input type="text" id="amount" readonly="">
                                                </div>
                                                <div class="price--filter">
                                                    <a href="#">Filter</a>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </aside>
                        <aside class="wedget__categories poroduct--compare">
                            <h3 class="wedget__title">Compare</h3>
                            <ul>
                                <li><a href="#">x</a><a href="#">Condimentum posuere</a></li>
                                <li><a href="#">x</a><a href="#">Condimentum posuere</a></li>
                                <li><a href="#">x</a><a href="#">Dignissim venenatis</a></li>
                            </ul>
                        </aside>
                        <aside class="wedget__categories poroduct--tag">
                            <h3 class="wedget__title">Product Tags</h3>
                            <ul>
                                <%
                                    rsCategory.first();
                                    while (rsCategory.next()) {
                                %>

                                <li><a href="<%=PathAbsolute.getPath("ShopGrid?type="+rsCategory.getInt(1))%>">
                                    <%=rsCategory.getString(2) %>
                                </a></li>
                                <% } %>
                            </ul>
                        </aside>
                        <aside class="wedget__categories sidebar--banner">
                            <img src="Public/images/others/banner_left.jpg" alt="banner images">
                            <div class="text">
                                <h2>new products</h2>
                                <h6>save up to <br> <strong>40%</strong>off</h6>
                            </div>
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End main Content -->
    <!-- Start Search Popup -->
    <div class="box-search-content search_active block-bg close__top">
        <form id="search_mini_form--2" class="minisearch" action="#">
            <div class="field__search">
                <input type="text" placeholder="Search entire store herePublic.">
                <div class="action">
                    <a href="#"><i class="zmdi zmdi-search"></i></a>
                </div>
            </div>
        </form>
        <div class="close__wrap">
            <span>close</span>
        </div>
    </div>
    <!-- End Search Popup -->
    <!-- Footer Area -->
    <%@ include file="include/footer.jsp" %>
    <!-- //Footer Area -->
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
                                                                <input id="qty1" class="input-text qty" name="qty"
                                                                       value="1" title="Qty" min="1" type="number">
                                                                <div class="addtocart__actions">
                                                                    <button class="tocart" type="submit"
                                                                            title="Add to Cart"><a
                                                                            onclick="addToCartShow(getidshow(),$('#qty1').val())">Add
                                                                        to Cart</a>
                                                                    </button>
                                                                </div>
                                                                <div class="product-addto-links clearfix">
                                                                    <a class="wishlist"
                                                                       onclick="addToWishList(getidshow())"></a>
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
                    <div id="statusWishlist" class="modal-body" style="margin: auto;font-size: 20px">
                        Added to cart
                    </div>
                </div>
            </div>
        </div>
    </div>

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
</html>
