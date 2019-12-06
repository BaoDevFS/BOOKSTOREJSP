<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/wishList.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>My Wishlist</title>
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
    <link rel="stylesheet" href="Public/css/bootstrap.min.css">
    <link rel="stylesheet" href="Public/css/plugins.css">
    <link rel="stylesheet" href="Public/css/style.css">

    <!-- Cusom css -->
    <link rel="stylesheet" href="Public/css/custom.css">

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
    <div class="ht__bradcaump__area bg-image--5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Wishlist</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Wishlist</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->
    <div class="wishlist-area section-padding--lg bg__white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="wishlist-content">
                        <form action="#">
                            <div class="wishlist-table wnro__table table-responsive">
                                <table>
                                    <thead>
                                    <tr>
                                        <th class="product-remove"></th>
                                        <th class="product-thumbnail"></th>
                                        <th class="product-name"><span class="nobr">Product Name</span></th>
                                        <th class="product-price"><span class="nobr"> Unit Price </span></th>
                                        <th class="product-stock-stauts"><span class="nobr"> Stock Status </span></th>
                                        <th class="product-add-to-cart"></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td class="product-remove"><a href="#">×</a></td>
                                        <td class="product-thumbnail"><a href="#"><img
                                                src="Public/images/product/sm-3/1.jpg" alt=""></a></td>
                                        <td class="product-name"><a href="#">Natoque penatibus</a></td>
                                        <td class="product-price"><span class="amount">$165.00</span></td>
                                        <td class="product-stock-status"><span class="wishlist-in-stock">In Stock</span>
                                        </td>
                                        <td class="product-add-to-cart"><a href="#"> Add to Cart</a></td>
                                    </tr>
                                    <tr>
                                        <td class="product-remove"><a href="#">×</a></td>
                                        <td class="product-thumbnail"><a href="#"><img
                                                src="Public/images/product/sm-3/2.jpg" alt=""></a></td>
                                        <td class="product-name"><a href="#">Quisque fringilla</a></td>
                                        <td class="product-price"><span class="amount">$50.00</span></td>
                                        <td class="product-stock-status"><span class="wishlist-in-stock">In Stock</span>
                                        </td>
                                        <td class="product-add-to-cart"><a href="#"> Add to Cart</a></td>
                                    </tr>
                                    <tr>
                                        <td class="product-remove"><a href="#">×</a></td>
                                        <td class="product-thumbnail"><a href="#"><img
                                                src="Public/images/product/sm-3/3.jpg" alt=""></a></td>
                                        <td class="product-name"><a href="#">Quisque fringilla</a></td>
                                        <td class="product-price"><span class="amount">$65.00</span></td>
                                        <td class="product-stock-status"><span class="wishlist-in-stock">In Stock</span>
                                        </td>
                                        <td class="product-add-to-cart"><a href="#"> Add to Cart</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- cart-main-area end -->
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
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/wishList.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
</html>
