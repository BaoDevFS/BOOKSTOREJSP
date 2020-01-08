<%@ page import="vn.edu.nlu.fit.model.Cart" %>
<%@ page import="vn.edu.nlu.fit.model.ProductCart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Checkout | BookBGQ Store</title>
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
    <div class="ht__bradcaump__area bg-image--4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Checkout</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Checkout</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- Start Checkout Area -->
    <section class="wn__checkout__area section-padding--lg bg__white">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="wn_checkout_wrap">
                        <div class="checkout_info">
                            <span>Returning customer ?</span>
                            <a class="showlogin" href="#">Click here to login</a>
                        </div>
                        <div class="checkout_login">
                            <form class="wn__checkout__form" action="#">
                                <p>If you have shopped with us before, please enter your details in the boxes below. If
                                    you are a new customer
                                    please proceed to the Billing & Shipping section.</p>

                                <div class="input__box">
                                    <label>Username or email <span>*</span></label>
                                    <input type="text">
                                </div>

                                <div class="input__box">
                                    <label>password <span>*</span></label>
                                    <input type="password">
                                </div>
                                <div class="form__btn">
                                    <button>Login</button>
                                    <label class="label-for-checkbox">
                                        <input id="rememberme" name="rememberme" value="forever" type="checkbox">
                                        <span>Remember me</span>
                                    </label>
                                    <a href="#">Lost your password?</a>
                                </div>
                            </form>
                        </div>
                        <div class="checkout_info">
                            <span>Have a coupon? </span>
                            <a class="showcoupon" href="#">Click here to enter your code</a>
                        </div>
                        <div class="checkout_coupon">
                            <form action="#">
                                <div class="form__coupon">
                                    <input type="text" placeholder="Coupon code">
                                    <button>Apply coupon</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="customer_details">
                        <h3>Billing details</h3>
                        <div class="customar__field">
                            <form action="http://localhost:8080/BookStore/Checkout" method="post">
                                <div class="margin_between">
                                    <div class="input_box space_between">
                                        <label>First name <span>*</span></label>
                                        <input name="firstName" type="text">
                                    </div>
                                    <div class="input_box space_between">
                                        <label>last name <span>*</span></label>
                                        <input name="lastName" type="text">
                                    </div>
                                </div>
                                <div class="input_box">
                                    <label>Address <span>*</span></label>
                                    <input name="address" type="text">
                                </div>
                                <div class="margin_between">
                                    <div class="input_box space_between">
                                        <label>Phone <span>*</span></label>
                                        <input name="phone" type="text">
                                    </div>

                                    <div class="input_box space_between">
                                        <label>Email address <span>*</span></label>
                                        <input name="email" type="email">
                                    </div>
                                </div>
                                <div class="margin_between">
                                    <div class="input_box space-between" style="margin-left: 15px">
                                        <button class="btncheckout" type="submit">Order
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%--                    <div class="customer_details mt--20">--%>
                    <%--                        <div class="differt__address">--%>
                    <%--                            <input name="ship_to_different_address" value="1" type="checkbox">--%>
                    <%--                            <span>Ship to a different address ?</span>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="customar__field differt__form mt--40">--%>
                    <%--                            <div class="margin_between">--%>
                    <%--                                <div class="input_box space_between">--%>
                    <%--                                    <label>First name <span>*</span></label>--%>
                    <%--                                    <input name="firstName" type="text">--%>
                    <%--                                </div>--%>
                    <%--                                <div class="input_box space_between">--%>
                    <%--                                    <label>last name <span>*</span></label>--%>
                    <%--                                    <input name="lastName" type="text">--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="input_box">--%>
                    <%--                                <label>Address <span>*</span></label>--%>
                    <%--                                <input name="address" type="text">--%>
                    <%--                            </div>--%>
                    <%--                            <div class="margin_between">--%>
                    <%--                                <div class="input_box space_between">--%>
                    <%--                                    <label>Phone <span>*</span></label>--%>
                    <%--                                    <input name="phone" type="text">--%>
                    <%--                                </div>--%>

                    <%--                                <div class="input_box space_between">--%>
                    <%--                                    <label>Email address <span>*</span></label>--%>
                    <%--                                    <input name="email" type="email">--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
                <div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
                    <div class="wn__order__box">
                        <h3 class="onder__title">Your order</h3>
                        <ul class="order__total">
                            <li>Product</li>
                            <li>Total</li>
                        </ul>
                        <ul class="order_product">
                            <%
                                Cart cart = (Cart) session.getAttribute("cart");
                                if (cart == null) cart = new Cart();
                                ArrayList<ProductCart> listbook = cart.getProductCart();
                                for (ProductCart p : listbook
                                ) {
                            %>
                            <li><%=p.getBooks().getName()%> × <%=p.getQuantity()%><span>$<%=p.getTotal()%></span></li>
                            <%}%>
                        </ul>
                        <ul class="shipping__method">
                            <li>Cart Subtotal <span>$<%=cart.getTotalCart()%></span></li>
                            <li>Shipping
                                <ul>
                                    <li>
                                        <input name="shipping_method[0]" data-index="0" value="legacy_flat_rate"
                                               checked="checked" type="radio">
                                        <label>Flat Rate: $15.00</label>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="total__amount">
                            <li>Order Total <span>$<%=cart.getTotalCart() + 15%></span></li>
                        </ul>
                    </div>
                    <div id="accordion" class="checkout_accordion mt--30" role="tablist">
                        <div class="payment">
                            <div class="che__header" role="tab" id="headingThree">
                                <a class="collapsed checkout__title" data-toggle="collapse" href="#collapseThree"
                                   aria-expanded="false"
                                   aria-controls="collapseThree">
                                    <span>Cash on Delivery</span>
                                </a>
                            </div>
                            <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree"
                                 data-parent="#accordion">
                                <div class="payment-body">Pay with cash upon delivery.</div>
                            </div>
                        </div>
                        <%--                        <div class="payment">--%>
                        <%--                            <div class="che__header" role="tab" id="headingFour">--%>
                        <%--                                <a class="collapsed checkout__title" data-toggle="collapse" href="#collapseFour"--%>
                        <%--                                   aria-expanded="false"--%>
                        <%--                                   aria-controls="collapseFour">--%>
                        <%--                                    <span>PayPal <img src="Public/images/icons/payment.png"--%>
                        <%--                                                      alt="payment images"> </span>--%>
                        <%--                                </a>--%>
                        <%--                            </div>--%>
                        <%--                            <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour"--%>
                        <%--                                 data-parent="#accordion">--%>
                        <%--                                <div class="payment-body">Pay with cash upon delivery.</div>--%>
                        <%--                            </div>--%>
                        <%--                        </div>--%>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- End Checkout Area -->
    <!-- Footer Area -->
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
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script>
    $(function () {
        drawCart();
        sea();
    });
    function show( id) {
        if(id==1){
            $('#statusWishlist').text("Order fail.");
            $('#success').modal('show');
        }else {
            $('#statusWishlist').text("Order Success.");
            $('#success').modal('show');
        }
    }
    <%! public String show(int id){
        if(id==1){
            return "show(1)";
        }else if(id==0){
            return "show(0)";
        }else return "";
    }%>
    <%=show(Integer.parseInt((String) request.getAttribute("status")))%>
</script>
</body>

</html>
