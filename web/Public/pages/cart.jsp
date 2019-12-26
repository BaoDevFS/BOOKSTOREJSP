<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.nlu.fit.model.ProductCart" %>
<%@ page import="vn.edu.nlu.fit.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Shopping Cart | BookBGQ Store</title>
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
    <!-- Start Search Popup -->
    <div class="box-search-content search_active block-bg close__top">
        <form id="search_mini_form" class="minisearch" action="#">
            <div class="field__search">
                <input type="text" placeholder="Search entire store here...">
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
    <!-- Start Bradcaump area -->
    <div class="ht__bradcaump__area bg-image--3">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">Shopping Cart</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="Public/index.html">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">Shopping Cart</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Bradcaump area -->
    <!-- cart-main-area start -->
    <div class="cart-main-area section-padding--lg bg--white">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12 ol-lg-12">
                    <form action="#">
                        <div class="table-content wnro__table table-responsive">
                            <table id="table" class="table table-hover display  pb-30">
                                <thead>
                                <tr class="title-top">
                                    <th class="product-remove" style="width: 60px;">#</th>
                                    <th class="product-remove" style="width: 60px;">ID</th>
                                    <th class="product-thumbnail">Image</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                    <th class="product-remove">Remove</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </form>
                    <div class="cartbox__btn">
                        <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                            <li><a href="#">Coupon Code</a></li>
                            <li><a href="http://localhost:8080/BookStore/SingleProduct">Apply Code</a></li>
                            <li><a href="http://localhost:8080/BookStore/ShopGrid">Update Cart</a></li>
                            <li><a href="http://localhost:8080/BookStore/Checkout">Check Out</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-6">
                    <div class="cartbox__total__area">
                        <div class="cartbox-total d-flex justify-content-between">
                            <ul class="cart__total__list">
                                <li>Cart total</li>
                                <li>Sub Total</li>
                            </ul>
                            <ul class="cart__total__tk">
                                <li id="totalli"></li>
                                <li>$0</li>
                            </ul>
                        </div>
                        <div class="cart__total__amount">
                            <span>Grand Total</span>
                            <span id="totalsp"></span>
                        </div>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="Public/js/popper.min.js"></script>
<script src="Public/js/bootstrap.min.js"></script>
<script src="Public/js/plugins.js"></script>
<script src="Public/js/active.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="Public/js/search.js"></script>
<script>
    $(function () {
        let total;
        var table = $('#table').DataTable({
            "searching": false,   // Search Box will Be Disabled
            "ordering": false,    // Ordering (Sorting on Each Column)will Be Disabled
            "info": false,         // Will show "1 to n of n entries" Text at bottom
            "lengthChange": false,
            "ajax": {
                "url": "http://localhost:8080/BookStore/Cart",
                "dataType": "json",
                method:"post",
                'dataSrc': 'productCart',
                complete:function (data) {
                    var json =JSON.parse(data.responseText);
                    $('#totalli').text('$'+json.totalCart);
                    $('#totalsp').text('$'+json.totalCart);

                }
            },
            columns: [
                {   "orderable": false,
                    "className":"null",
                    "render": function(data, typet, row) {
                        return '';
                    }
                },
                {   "orderable": false,
                    "className":"product-id",
                    "data": "id",
                    "render": function(data, typet, row) {
                        return data;
                    }
                },
                {   "orderable": false,
                    "className":"product-thumbnail",
                    "data": "books",
                    "render": function(data, typet, row) {
                        return '<a href="http://localhost:8080/BookStore/SingleProduct?id='+data.id+'"><img width="100px"  height="100px" src='+data.image+' alt="productimg"></a>';
                    }
                },
                {   "orderable": false,
                    "className":"product-name",
                    "data": "books",
                    "render": function(data, typet, row) {
                        return '<a href="http://localhost:8080/BookStore/SingleProduct?id='+data.id+'">'+data.name+'</a>';
                    }
                },
                {
                    "className":"product-price",
                    "data": "books",
                    "render": function(data, typet, row) {
                        return '<span class="amount">$'+data.price+'</span>';
                    }
                },{   "orderable": false,
                    "className":"product-quantity",
                    "data": "quantity",
                    "render": function(data, typet, row) {
                        return '<input type="number" value="'+data+'">';
                    }
                },{   "orderable": false,
                    "className":"product-subtotal",
                    "data": "total",
                    "render": function(data, typet, row) {
                        return '$'+data;
                    }
                }
                ,{   "orderable": false,
                    "className":"product-remove",
                    "data": "total",
                    "render": function(data, typet, row) {
                        return '<a class="delete" style="cursor: pointer">X</a>';
                    }
                }
            ],
            columnDefs:[
                { "targets": [ 1 ],
                    "visible":false
                },
               {
                    "targets": [ 0 ],
                    "searchable": false,
                    "orderable": false,
                }
            ],
            "order": [[ 4, 'asc' ]]
        });
        table.on( 'draw.dt', function () {
                var PageInfo = $('#table').DataTable().page.info();
                table.column(0, { page: 'current' }).nodes().each( function (cell, i) {
                    cell.innerHTML = i + 1 + PageInfo.start;
                } );
        } ).draw();

        $('#table tbody').on('click', 'a.delete', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            row.remove().draw();
            console.log(data.id);
            $.ajax({
                url: "http://localhost:8080/BookStore/Cart",
                type: "post",
                data: {id: data.id},
                complete: function (resultText) {
                    drawCart();
                    table.ajax.reload();
                }
            });
        });
        $('#table tbody').on('change', 'input', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            // get data input
            var quantity=$(this).val();
            if(quantity<=0){
                console.log(quantity);
                $(this).val('1');
                quantity=1;
            }
            $.ajax({
                url: "http://localhost:8080/BookStore/Cart",
                type: "post",
                data: {id: data.id,quantity:quantity},
                complete: function (resultText) {
                    drawCart();
                    table.ajax.reload();
                }
            });
        });
        drawCart();
        sea();
    });
</script>
</body>
</html>
