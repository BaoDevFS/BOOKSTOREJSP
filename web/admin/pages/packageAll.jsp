<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageAll.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:49 GMT -->
<head>
    <title>ListProduct</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="<%=PathAbsolute.getPath("admin/images/fav.ico")%>">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/font-awesome.min.css")%>">

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/jquery.dataTables.min.css")%>"/>
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/style.css")%>">
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
        <%@ include file="include/inforAndLeftMenu.jsp" %>
        <div class="sb2-2">
            <div class="sb2-2-2">
                <ul>
                    <li><a href="<%=PathAbsolute.getPath("Admin/Index")%>"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#">All Product</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box-inn-sp">
                            <div class="inn-title">
                                <h4>All Product</h4>
                                <a class="dropdown-button drop-down-meta" href="#" data-activates="dr-users"><i
                                        class="material-icons">more_vert</i></a>
                                <ul id="dr-users" class="dropdown-content">
                                    <li><a href="#!">Add New</a>
                                    </li>
                                    <li><a href="#!">Edit</a>
                                    </li>
                                    <li><a href="#!">Update</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="#!"><i class="material-icons">delete</i>Delete</a>
                                    </li>
                                    <li><a href="#!"><i class="material-icons">subject</i>View All</a>
                                    </li>
                                </ul>

                                <!-- Dropdown Structure -->

                            </div>
                            <div class="tab-inn">
                                <div class="panel-wrapper collapse in">
                                    <div class="panel-body">
                                        <div class="table-wrap">
                                            <div class="table-responsive">
                                                <table id="datable_1" class="table table-hover display  pb-30">
                                                    <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Img</th>
                                                        <th>ProductName</th>
                                                        <th>Price</th>
                                                        <th>Author</th>
                                                        <th>View</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                    </thead>
                                                    <tfoot>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Img</th>
                                                        <th>ProductName</th>
                                                        <th>Price</th>
                                                        <th>Author</th>
                                                        <th>View</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                    </tfoot>
                                                    <tbody>

                                                    </tbody>
                                                </table>
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
<script src="<%=PathAbsolute.getPath("admin/js/jquery.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/bootstrap.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/materialize.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/custom.js")%>"></script>
<%--<script src="<%=PathAbsolute.getPath("admin/js/jquery.dataTables.min.js")%>"></script>--%>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#datable_1').DataTable({
            "ajax": {
                "url": "http://localhost:8080/BookStore/Admin/AjaxProduct",
                "dataType": "json",
                "contentType": "application/json; charset=utf-8",
                'dataSrc': 'products'
            },
            columns: [
                {'mData': 'id'},
                {   "orderable": false,
                    "data": "image",
                    "render": function(data, typet, row) {
                        return '<img style="width: 100px;height: 100px" src='+data+' >';
                    }
                },
                {'mData': 'name'},
                {'mData': 'price'},
                {'mData': 'author'},
                {
                    "orderable": false,
                    "data": null,
                    "defaultContent": "<a class='view' style='cursor: pointer'><i class=\"fa fa-eye\" aria-hidden=\"true\"></i></a>"
                },
                {
                    "orderable": false,
                    "data": null,
                    "defaultContent": "<a class='edit' style='cursor: pointer'><i class=\"fa fa-pencil-square-o\" aria-hidden=\"true\"></i></a>"
                },
                {
                    "orderable": false,
                    "data": null,
                    "defaultContent": "<a class='delete' style='cursor: pointer'><i class=\"fa fa-trash-o\" aria-hidden=\"true\"></i></a>"
                }
            ]
        });
        $('#datable_1 tbody').on('click', 'a.delete', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            row.remove().draw();
            $.ajax({
                url: "http://localhost:8080/BookStore/Admin/Delete",
                type: "get",
                data: {id: data.id,type:'products'},
                success: function (resultText) {
                    table.ajax.reload();
                }
            });
        });
        $('#datable_1 tbody').on('click', 'a.view', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            window.location.href = "http://localhost:8080/BookStore/SingleProduct?id="+data.id;
        });
        $('#datable_1 tbody').on('click', 'a.edit', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            window.location.href = "http://localhost:8080/BookStore/Admin/PackageEdit?id="+data.id;
        });
    });

</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageAll.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:49 GMT -->
</html>
