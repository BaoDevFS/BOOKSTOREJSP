<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/wishList.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>My Wishlist | BookBGQ Store</title>
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
<style>
    .row th {
        padding-left: 35px;
    }

    .row td {
        padding-left: 37px;
    }

    div#wishlist_paginate {
        display: none;
    }
</style>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a
        href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
<![endif]-->

<!-- Main wrapper -->
<div class="wrapper" id="wrapper ">

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
                                <table id="wishlist">
                                    <thead>
                                    <tr>
                                        <th class="product-id">#</th>
                                        <th class="product-id">ID</th>
                                        <th class="product-thumbnail">IMG</th>
                                        <th class="product-name"><span class="nobr">Product Name</span></th>
                                        <th class="product-price"><span class="nobr"> Unit Price </span></th>
                                        <th class="product-stock-status"><span class="nobr"> Stock Status </span></th>
                                        <th class="product-remove"></th>
                                        <th class="product-add-to-cart"></th>
                                    </tr>
                                    </thead>
                                    <tbody>

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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="Public/js/popper.min.js"></script>
<script src="Public/js/bootstrap.min.js"></script>
<script src="Public/js/plugins.js"></script>
<script src="Public/js/active.js"></script>
<script src="Public/js/carttoheader.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script>
    $(document).ready(function () {
        let total;
        var table = $('#wishlist').DataTable({
            "searching": false,   // Search Box will Be Disabled
            "ordering": false,    // Ordering (Sorting on Each Column)will Be Disabled
            "info": false,         // Will show "1 to n of n entries" Text at bottom
            "lengthChange": false,
            "ajax": {
                "url": "http://localhost:8080/BookStore/WishList",
                "dataType": "json",
                method: "post",
                'dataSrc': 'productWishlist',
                complete: function (data) {
                    console.log(data.id);
                    // var json = JSON.parse(data[0]);
                    // $('#totalli').text('$' + json.totalCart);
                    // $('#totalsp').text('$' + json.totalCart);

                }
            },
            columns: [
                {
                    "orderable": false,
                    "className": "null",
                    "render": function (data, typet, row) {
                        return '';
                    }
                },
                {
                    "orderable": false,
                    "className": "product-id",
                    "data": "id",
                    "render": function (data, typet, row) {
                        return data;
                    }
                },
                {
                    "orderable": false,
                    "className": "product-thumbnail",
                    "data": "books",
                    "render": function (data, typet, row) {
                        return '<a href="http://localhost:8080/BookStore/SingleProduct?id=' + data.id + '"><img width="100px"  height="100px" src=' + data.image + ' alt="productimg"></a>';
                    }
                },
                {
                    "orderable": false,
                    "className": "product-name",
                    "data": "books",
                    "render": function (data, typet, row) {
                        return '<a href="http://localhost:8080/BookStore/SingleProduct?id=' + data.id + '">' + data.name + '</a>';
                    }
                },
                {
                    "className": "product-price",
                    "data": "books",
                    "render": function (data, typet, row) {
                        return '<span class="amount">$' + data.price + '</span>';
                    }
                }, {
                    "orderable": false,
                    "className": "product-stock-status",
                    "data": "books",
                    "render": function (data, typet, row) {
                        if (data.active == 1) {
                            return "In stock"
                        } else {
                            return "Out stock"
                        }
                    }
                }
                , {
                    "orderable": false,
                    // "className": "product-remove",
                    "render": function (data, typet, row) {
                        return '<a class="delete" style="cursor: pointer"><i class="fa fa-trash fa-2x"></i></a>';
                    }
                },
                {
                    "orderable": false,
                    /*"className": "product-add-to-cart",*/
                    "render": function (data, typet, row) {
                        return '<a class="addtocard"><i class="fa fa-shopping-cart fa-2x"></i></a>';
                        // <i class="fas fa-shopping-cart"></i>
                        // <i class="fas fa-trash-alt"></i>
                    }
                }
            ], columnDefs: [
                {
                    "targets": [1],
                    "visible": false
                },
                {
                    "targets": [0],
                    "searchable": false,
                    "orderable": false,
                }
            ],
            "order": [[4, 'asc']]
        });
        table.on('draw.dt', function () {
            var PageInfo = $('#wishlist').DataTable().page.info();
            table.column(0, {page: 'current'}).nodes().each(function (cell, i) {
                cell.innerHTML = i + 1 + PageInfo.start;
            });
        }).draw();
        $('#wishlist tbody').on('click', 'a.delete', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            row.remove().draw();
            console.log(data.id);
            $.ajax({
                url: "http://localhost:8080/BookStore/WishList",
                type: "post",
                data: {id: data.id},
                complete: function (resultText) {
                    table.ajax.reload();
                }
            });
        });
        drawCart();
        sea();
    });

</script>
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/wishList.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
</html>
