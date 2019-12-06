<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.edu.nlu.dao.GetListProductType" %>
<%@ page import="vn.edu.nlu.fit.model.Products" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.nlu.tools.Pagination" %>
<%@ page import="vn.edu.nlu.fit.model.Booktypes" %>
<%@ page import="vn.edu.nlu.dao.BookDAO" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shop-Grid | BookBGQ Store</title>
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
    <link rel="stylesheet" href="Public/css/plugins/font-awesome.min.css">
    <!-- Modernizer js -->
    <script src="Public/js/vendor/modernizr-3.5.0.min.js"></script>
</head>
<style>
    .wn__pagination li .active {
        /*text-decoration: underline;*/
        color: brown;
        border: 1px solid #d4d0d0;
    }

</style>
<body>
<%
    BookDAO bd = new BookDAO();
    GetListProductType getListProductType = new GetListProductType();
    int type = 1;
    if (request.getParameter("type") != null) {
        try {
            type = Integer.parseInt(request.getParameter("type"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
    int paramPage = 1;
    if (request.getParameter("page") != null) {
        try {
            paramPage = Integer.parseInt(request.getParameter("page"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }
    String link;
    int amountItem;
    if (request.getParameter("type") != null) {
        link = "ShopGrid?type=" + type + "&";
        amountItem = bd.countProductByType(type);
    } else {
        link = "ShopGrid?";
        amountItem = getListProductType.getList().size();
    }
    //phan trang
    Pagination pagination = new Pagination(amountItem, 9, 3, paramPage);
    String showPagination = pagination.showPagination(link);

    ArrayList<Products> listProducts;
    if (request.getParameter("type") != null) {
        link = "ShopGrid?type=" + type + "&";
        amountItem = bd.countProductByType(type);
        listProducts = bd.getListCategoriesAndPage(type, pagination.getCurrentPage(), pagination.getTotalItemPerPage());
    } else {
        link = "ShopGrid?";
        amountItem = getListProductType.getList().size();
        listProducts = bd.sort(bd.getListCategoriesAndPage(0, pagination.getCurrentPage(), pagination.getTotalItemPerPage()));
    }

%>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a
        href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper">

    <!-- Header -->
    <%@ include file="include/header.jsp" %>
    <!-- //Header -->
    <!-- Start Search Popup -->
<%--    <div class="box-search-content search_active block-bg close__top">--%>
<%--        <form id="search_mini_form" class="minisearch" action="#">--%>
<%--            <div class="field__search">--%>
<%--                <input type="text" id="key" placeholder="Search entire store here...">--%>
<%--                <div class="action">--%>
<%--                    <a onclick="changes()"><i class="zmdi zmdi-search"></i></a>--%>
<%--                </div>--%>
<%--                <div class="single__items">--%>
<%--                    <table id="search" class="table table-hover display  pb-30">--%>
<%--                        <thead>--%>
<%--                        <tr class="title-top">--%>
<%--                            <th class="product-thumbnail">Image</th>--%>
<%--                            <th class="product-name">Product</th>--%>
<%--                            <th class="product-price">Price</th>--%>
<%--                            <th class="product-remove">Author</th>--%>
<%--                        </tr>--%>
<%--                        </thead>--%>
<%--                        <tbody id="tbodysearch">--%>
<%--                        </tbody>--%>
<%--                    </table>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--        <div class="close__wrap">--%>
<%--            <span>close</span>--%>
<%--        </div>--%>
<%--    </div>--%>
    <!-- End Search Popup -->
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Shop Grid</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Shop Grid</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Shop Page -->
    <div class="page-shop-sidebar left--sidebar bg--white section-padding--lg">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-12 order-2 order-lg-1 md-mt-40 sm-mt-40">
                    <div class="shop__sidebar">
                        <aside class="wedget__categories poroduct--cat">
                            <h3 class="wedget__title">Product Categories</h3>
                            <ul>
                                <% ResultSet rs = (ResultSet) request.getAttribute("rs");
                                    ResultSet rs1 = (ResultSet) request.getAttribute("rsCount");
                                    while (rs.next() && rs1.next()) {
                                %>
                                <li><a href="<%=PathAbsolute.getPath("ShopGrid?type="+rs.getInt(1))%>">
                                    <%=rs.getString(2) %>
                                    <span>(<%=rs1.getInt(3) %>)</span>
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
                        <aside class="wedget__categories poroduct--tag">
                            <h3 class="wedget__title">Product Tags</h3>
                            <ul>
                                <% ResultSet rsTag = (ResultSet) request.getAttribute("rsTag");
//                                    rsTag.first();

                                    while (rsTag.next()) {
                                %>

                                <li><a href="<%=PathAbsolute.getPath("ShopGrid?type="+rsTag.getInt(1))%>">
                                    <%=(rsTag.getString(2).length() < 30) ? rsTag.getString(2) : rsTag.getString(2).substring(0, 28) %>
                                </a></li>
                                <%--                                <li><a href="#">Business</a></li>--%>
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
                <div class="col-lg-9 col-12 order-1 order-lg-2">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="shop__list__wrapper d-flex flex-wrap flex-md-nowrap justify-content-between">
                                <div class="shop__list nav justify-content-center" role="tablist">
                                    <a class="nav-item nav-link active" data-toggle="tab" href="#nav-grid" role="tab"><i
                                            class="fa fa-th"></i></a>
                                    <a class="nav-item nav-link" data-toggle="tab" href="#nav-list" role="tab"><i
                                            class="fa fa-list"></i></a>
                                </div>
                                <p>Showing 1–9 of <%=getListProductType.getList().size() %> results</p>
                                <div class="orderby__wrapper">
                                    <span>Sort By</span>
                                    <select class="shot__byselect">
                                        <option>Default sorting</option>
                                        <option>HeadPhone</option>
                                        <option>Furniture</option>
                                        <option>Jewellery</option>
                                        <option>Handmade</option>
                                        <option>Kids</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab__container">
                        <div class="shop-grid tab-pane fade show active" id="nav-grid" role="tabpanel">

                            <div class="row">

                                <%
                                    for (Products pd : listProducts) {
                                %>

                                <!-- Start Single Product -->
                                <div class="product product__style--3 col-lg-4 col-md-4 col-sm-6 col-12">
                                    <div class="product__thumb">
                                        <a class="first__img" href="singleProduct.html">
                                            <img src="<%=pd.getImage()%>" class="abc" alt="product image"></a>
                                        <a class="second__img animation1" href="singleProduct.html">
                                            <img src="<%=pd.getImage_hover()%>" class="abc" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALLER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4><a href="singleProduct.html"><%= pd.getName()%>
                                        </a></h4>
                                        <ul class="prize d-flex">
                                            <li>$<%=pd.getPrice()%>
                                            </li>
                                            <li class="old_prize">$<%=pd.getPrice_old()%>
                                            </li>
                                        </ul>
                                        <div class="action">
                                            <div class="actions_inner">
                                                <ul class="add_to_links">
                                                    <li><a class="cart" href="cart.html"><i
                                                            class="fa fa-shopping-bag"></i></a></li>
                                                    <li><a class="wishlist" href="wishList.html"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           href="#productmodal"><i class="fa fa-search"></i></a></li>
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
                                <!-- End Single Product -->

                                <% } %>
                            </div>

                        </div>
                        <div class="shop-grid tab-pane fade" id="nav-list" role="tabpanel">
                            <div class="list__view__wrapper">
                                <%
                                    for (Products pd : bd.sort(listProducts)) {
                                %>
                                <!-- Start Single Product -->
                                <div class="list__view">
                                    <div class="thumb">
                                        <a class="first__img" href="singleProduct.html"><img
                                                src="<%=pd.getImage()%>" alt="product images"></a>
                                        <a class="second__img animation1" href="singleProduct.html"><img
                                                src="<%=pd.getImage_hover()%>" alt="product images"></a>
                                    </div>
                                    <div class="content">
                                        <h2><a href="singleProduct.html"><%=pd.getName()%></a></h2>
                                        <ul class="rating d-flex">
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                        </ul>
                                        <ul class="prize__box">
                                            <li>$<%=pd.getPrice()%></li>
                                            <li class="old__prize">$<%=pd.getPrice_old()%></li>
                                        </ul>

                                        <p><%=pd.getDescription()%></p>

                                        <ul class="cart__action d-flex">
                                            <li class="cart"><a href="cart.html">Add to cart</a></li>
                                            <li class="wishlist"><a href="cart.html"></a></li>
                                            <li class="compare"><a href="cart.html"></a></li>
                                        </ul>

                                    </div>
                                </div>
                                <!-- End Single Product -->
                                <% } %>
                            </div>
                        </div>
                        <br>
                        <%= showPagination%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->
    <!-- Footer Area -->
    <%@ include file="include/footer.jsp" %>
    <!-- //Footer Area -->
    <!-- QUICKVIEW PRODUCT -->
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="productmodal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal__container" role="document">
                <div class="modal-content">
                    <div class="modal-header modal__header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-product">
                            <!-- Start product images -->
                            <div class="product-images">
                                <div class="main-image images">
                                    <img alt="big images" src="Public/images/product/big-img/1.jpg">
                                </div>
                            </div>
                            <!-- end product images -->
                            <div class="product-info">
                                <h1>Simple Fabric Bags</h1>
                                <div class="rating__and__review">
                                    <ul class="rating">
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                    </ul>
                                    <div class="review">
                                        <a href="#">4 customer reviews</a>
                                    </div>
                                </div>
                                <div class="price-box-3">
                                    <div class="s-price-box">
                                        <span class="new-price">$17.20</span>
                                        <span class="old-price">$45.00</span>
                                    </div>
                                </div>
                                <div class="quick-desc">
                                    Designed for simplicity and made from high quality materials. Its sleek geometry and
                                    material combinations creates a modern look.
                                </div>
                                <div class="select__color">
                                    <h2>Select color</h2>
                                    <ul class="color__list">
                                        <li class="red"><a title="Red" href="#">Red</a></li>
                                        <li class="gold"><a title="Gold" href="#">Gold</a></li>
                                        <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                        <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                    </ul>
                                </div>
                                <div class="select__size">
                                    <h2>Select size</h2>
                                    <ul class="color__list">
                                        <li class="l__size"><a title="L" href="#">L</a></li>
                                        <li class="m__size"><a title="M" href="#">M</a></li>
                                        <li class="s__size"><a title="S" href="#">S</a></li>
                                        <li class="xl__size"><a title="XL" href="#">XL</a></li>
                                        <li class="xxl__size"><a title="XXL" href="#">XXL</a></li>
                                    </ul>
                                </div>
                                <div class="social-sharing">
                                    <div class="widget widget_socialsharing_widget">
                                        <h3 class="widget-title-modal">Share this product</h3>
                                        <ul class="social__net social__net--2 d-flex justify-content-start">
                                            <li class="facebook"><a href="#" class="rss social-icon"><i
                                                    class="zmdi zmdi-rss"></i></a></li>
                                            <li class="linkedin"><a href="#" class="linkedin social-icon"><i
                                                    class="zmdi zmdi-linkedin"></i></a></li>
                                            <li class="pinterest"><a href="#" class="pinterest social-icon"><i
                                                    class="zmdi zmdi-pinterest"></i></a></li>
                                            <li class="tumblr"><a href="#" class="tumblr social-icon"><i
                                                    class="zmdi zmdi-tumblr"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="addtocart-btn">
                                    <a href="#">Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- END QUICKVIEW PRODUCT -->
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

</html>
