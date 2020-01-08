<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page import="vn.edu.nlu.dao.BookDAO" %>
<%@ page import="vn.edu.nlu.dao.GetListProductType" %>
<%@ page import="vn.edu.nlu.fit.model.Products" %>
<%@ page import="vn.edu.nlu.tools.Pagination" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.nlu.servlet.ShopGrid" %>
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

    <!-- Google font (font-family: 'Roboto', sans-serif; Popp ins ; Satisfy) -->
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
    ShopGrid shop = new ShopGrid();
    Pagination pagination;
    System.out.println("session + " + session.getAttribute("navType"));
    System.out.println("command + " + shop.getCommand());
    if ("list".equals(session.getAttribute("navType"))) {
        shop.setCommand("list");
    }
    System.out.println("setcommand + " + shop.getCommand());
    pagination = new Pagination(amountItem, 9, 3, paramPage);
    String showPagination = pagination.showPagination(link);
    ArrayList<Products> listProducts;
    String paramSort = request.getParameter("name");
    if (request.getParameter("type") != null) {
        link = "ShopGrid?type=" + type + "&";
        amountItem = bd.countProductByType(type);
        listProducts = bd.getListCategoriesAndPage(type, pagination.getCurrentPage(), pagination.getTotalItemPerPage(), paramSort);
    } else {
        link = "ShopGrid?";
        amountItem = getListProductType.getList().size();
//        listProducts = bd.sort(bd.getListCategoriesAndPage(0, pagination.getCurrentPage(), pagination.getTotalItemPerPage()));
        listProducts = bd.getListCategoriesAndPage(0, pagination.getCurrentPage(), pagination.getTotalItemPerPage(), paramSort);
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
                                    while (rsTag.next()) {
                                %>

                                <li><a href="<%=PathAbsolute.getPath("ShopGrid?type="+rsTag.getInt(1))%>">
                                    <%=rsTag.getString("name")%>
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
                                    <a class="active" href="#nav-grid" onclick="setNavType('gird')" name="nav-grid"><i
                                            class="fa fa-th"></i></a>

                                    <a class="tab" href="#nav-list" onclick="setNavType('list')" name="nav-list"><i
                                            class="fa fa-list"></i></a>
                                </div>
                                <p>Showing 1–<%=(shop.getCommand().equals("gird") ? 9 : 4) %>
                                    of <%=getListProductType.getList().size() %> results</p>
                                <div class="orderby__wrapper">
                                    <span>Sort By</span>
                                    <select class="shot__byselect" name="sort" id="sort" onchange="getSort()">
                                        <option name="sortName" value="name">Default</option>
                                        <option name="sortName" value="name">Sort by name</option>
                                        <option type="submit" name="sortPrice1" value="price">Sort by price
                                        </option>
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
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>">
                                            <img src="<%=pd.getImage()%>" class="abc" alt="product image"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>">
                                            <img src="<%=pd.getImage_hover()%>" class="abc" alt="product image"></a>
                                        <div class="hot__box">
                                            <span class="hot-label">BEST SALLER</span>
                                        </div>
                                    </div>
                                    <div class="product__content content--center">
                                        <h4>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>"><%= pd.getName()%>
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
                                                    <li><a class="cart" onclick="addToCart(<%=pd.getId()%>)"><i
                                                            class="fa fa-shopping-cart"></i></a></li>
                                                    <li><a class="wishlist"
                                                           onclick="addToWishList(<%=pd.getId()%>)"><i
                                                            class="fa fa-heart"></i></a></li>
                                                    <li><a data-toggle="modal" title="Quick View"
                                                           class="quickview modal-view detail-link"
                                                           onclick="propupbook(<%=pd.getId()%>)"
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
                                <!-- End Single Product -->

                                <% } %>
                            </div>

                        </div>
                        <div class="shop-grid tab-pane fade" id="nav-list" role="tabpanel">
                            <div class="list__view__wrapper">
                                <%
                                    //                                    for (Products pd : bd.sort(listProducts)) {
                                    for (int i = 0; i < (listProducts.size() > 4 ? 4 : listProducts.size()); i++) {
                                        Products pd = listProducts.get(i);
                                %>
                                <!-- Start Single Product -->
                                <div class="list__view mb-3">
                                    <div class="thumb">
                                        <a class="first__img"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>"><img
                                                src="<%=pd.getImage()%>" alt="product images"></a>
                                        <a class="second__img animation1"
                                           href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>"><img
                                                src="<%=pd.getImage_hover()%>" alt="product images"></a>
                                    </div>
                                    <div class="content">
                                        <h2>
                                            <a href="http://localhost:8080/BookStore/SingleProduct?id=<%=pd.getId()%>"><%=pd.getName()%>
                                            </a></h2>
                                        <ul class="rating d-flex">
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li class="on"><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                        </ul>
                                        <ul class="prize__box">
                                            <li>$<%=pd.getPrice()%>
                                            </li>
                                            <li class="old__prize">$<%=pd.getPrice_old()%>
                                            </li>
                                        </ul>
                                        <%
                                            String a = pd.getDescription();
                                            if (a == null)
                                                a = "";
                                        %>
                                        <p><%=(a.length() > 200) ? pd.getDescription().substring(0, 200) : pd.getDescription()%>
                                        </p>

                                        <ul class="cart__action d-flex">
                                            <li class="cart"><a onclick="addToCart(<%=pd.getId()%>)">Add to cart</a>
                                            </li>
                                            <li class="wishlist"><a onclick="addToWishList(<%=pd.getId()%>)"></a></li>
                                            <%--                                            <li class="compare"><a href="cart.html"></a></li>--%>
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
                    <div id="statusWishlist" class="modal-body" style="margin: auto;font-size: 20px">
                        Added to cart
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
<script src="Public/js/addToCart.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script>
    $(function () {
        drawCart();
        sea();
    });
    $(document).ready(function () {
        $(".nav a").click(function () {
            $(this).tab('show');
        });
    });
</script>
<script>
    <%
    String navType=(String) session.getAttribute("navType");
    if(navType==null) navType="";
    %>
    setActive();

    function setActive() {
        if ('<%=navType%>' == 'list') {
            console.log("active List")
            $('a[name="nav-grid"]').removeClass('active');
            $('a[name="nav-list"]').addClass('active');
            $('#nav-grid').removeClass("show active");
            $('#nav-list').addClass("show active");

        }
    }

    function setNavType(type) {
        if (type == "list") {
            console.log("list");
            $.ajax({
                url: "http://localhost:8080/BookStore/ShopGrid",
                method: "POST",
                data: {
                    navType: "list"
                }
            });
        } else {
            console.log("gird");
            $.ajax({
                url: "http://localhost:8080/BookStore/ShopGrid",
                method: "POST",
            });
        }
    }

    function getSort() {

        var getHref = window.location.href.replace("&name=name","");
        getHref=getHref.replace("&name=price","");
        getHref=getHref.replace("?name=price","");
        getHref=getHref.replace("?name=name","");
        var temp = document.getElementById("sort").value;

        // trường hợp chứa name
            if (getHref.includes("type") || getHref.includes("page")) {
                window.location.replace(getHref + "&name=" + document.getElementById("sort").value);
            }else {
                window.location.replace(getHref + "?name=" + document.getElementById("sort").value);
            // }
           //trường hợp chưa chứa name
           //      window.location.
        }
    }
</script>
</body>

</html>
