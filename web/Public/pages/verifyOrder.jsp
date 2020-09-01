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
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6 col-12">
                    <div class="d-flex flex-column">
                        <label class="justify-content-start">Please download bill and signature then paste singnature to form.</label>
                        <a class="mt--20 inline" href="/GenerateBillFile">Download: <h5>Bill</h5></a>
                    </div>
                    <form class="wn__checkout__form" action="/VerifyOrder" method="post">
                        <div class="input_box space_between d-flex">
                            <label class="col-3">Signature bill<span>*</span></label>
                            <input name="signature" class="col-9" type="signature">
                        </div>
                        <div class="margin_between mt--20">
                            <div class="input_box space-between d-flex justify-content-end" >
                                <button class="btncheckout" type="submit">Submit
                                </button>
                            </div>
                        </div>
                    </form>
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
