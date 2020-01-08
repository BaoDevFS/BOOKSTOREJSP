<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"><!-- Mirrored from rn53themes.net/themes/demo/lava-admin/ by HTTrack Website Copier/3.x
        [XR&CO'2014], Wed, 23 Oct 2019 13:20:17 GMT -->
<head>
    <title>Admin BQG</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="<%=PathAbsolute.getPath("admin/images/fav.ico")%>">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">

    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("admin/css/font-awesome.min.css")%>">

    <!--== ALL CSS FILES ==-->
    <link rel="stylesheet"  href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>
    <link rel="stylesheet" type="text/css" href="<%=PathAbsolute.getPath("admin/css/style.css")%>">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="admin/js/html5shiv.js"></script>
    <script src="admin/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!--== MAIN CONTRAINER ==-->
<div class="container-fluid sb1">
    <div class="row">
        <!--== LOGO ==-->
        <div class="col-md-2 col-sm-3 col-xs-6 sb1-1">
            <a href="#" class="btn-close-menu"><i class="fa fa-times" aria-hidden="true"></i></a>
            <a href="#" class="atab-menu"><i class="fa fa-bars tab-menu" aria-hidden="true"></i></a>
            <a href="<%= PathAbsolute.getPath("Admin/Index")%>" class="logo"><img
                    src="<%=PathAbsolute.getPath("admin/images/logo1.png")%>" alt=""/>
            </a>
        </div>
        <!--== SEARCH ==-->
        <div class="col-md-6 col-sm-6 mob-hide">
            <form class="app-search">
                <input type="text" placeholder="Search..." class="form-control">
                <a href="#"><i class="fa fa-search"></i></a>
            </form>
        </div>
        <!--== NOTIFICATION ==-->
        <div class="col-md-2 tab-hide">
        </div>
        <!--== MY ACCCOUNT ==-->
        <div class="col-md-2 col-sm-3 col-xs-6 ">
            <!-- Dropdown Trigger -->
            <a class='waves-effect dropdown-button top-user-pro' href='<%=PathAbsolute.getPath("Admin/Index")%>'
               data-activates='top-menu'>
                <img src="<%=GetUser.getUser(request.getSession()).getAvatar()%>" alt=""/>My Account<i
                    class="fa fa-angle-down" aria-hidden="true"></i>
            </a>
            <!-- Dropdown Structure -->
            <ul id='top-menu' class='dropdown-content top-menu-sty'>
                <li><a href="setting.html" class="waves-effect"><i class="fa fa-cogs" aria-hidden="true"></i>Admin
                    Setting</a>
                </li>

                <li><a href="<%=PathAbsolute.getPath("Admin/PackageAll")%>" class="waves-effect"><i class="fa fa-book"
                                                                                                    aria-hidden="true"></i>Book</a>
                </li>
                <li><a href="<%=PathAbsolute.getPath("Admin/UserAll")%>" class="waves-effect"><i class="fa fa-user"
                                                                                                 aria-hidden="true"></i>
                    User</a>
                </li>
                <li><a href="#" class="waves-effect"><i class="fa fa-undo" aria-hidden="true"></i> Backup Data</a>
                </li>
                <li class="divider"></li>
                <li><a href="<%=PathAbsolute.getPath("Admin/Logout")%>" class="ho-dr-con-last waves-effect"><i
                        class="fa fa-sign-in" aria-hidden="true"></i>Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--== BODY CONTNAINER ==-->
<div class="container-fluid sb2">
    <div class="row">
        <%@ include file="include/inforAndLeftMenu.jsp" %>
        <!--== BODY INNER CONTAINER ==-->
        <div class="sb2-2">
            <!--== breadcrumbs ==-->
            <div class="sb2-2-2">
                <ul>
                    <li><a href="<%= PathAbsolute.getPath("Admin/Index")%>"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> Dashboard</a>
                    </li>
                    <li class="page-back"><a href="<%= PathAbsolute.getPath("Admin/Index")%>"><i class="fa fa-backward"
                                                                                           aria-hidden="true"></i>
                        Back</a>
                    </li>
                </ul>
            </div>
            <!--== DASHBOARD INFO ==-->
            <div class="ad-v2-hom-info">
                <div class="ad-v2-hom-info-inn">
                    <ul>
                        <li>
                            <div class="ad-hom-box ad-hom-box-1">
                                <span class="ad-hom-col-com ad-hom-col-1"><i class="fa fa-bar-chart"></i></span>
                                <div class="ad-hom-view-com">
                                    <p><i class="fa fa-arrow-up up"></i> Today Views</p>
                                    <h3>22,520</h3>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="ad-hom-box ad-hom-box-2">
                                <span class="ad-hom-col-com ad-hom-col-2"><i class="fa fa-book"></i></span>
                                <div class="ad-hom-view-com">
                                    <p><i class="fa fa-arrow-up up"></i> Tootal Book</p>
                                    <%int countBook= (int) request.getAttribute("countBook");%>
                                    <h3><%=countBook%></h3>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="ad-hom-box ad-hom-box-3">
                                <span class="ad-hom-col-com ad-hom-col-3"><i class="fa fa-address-card-o"></i></span>
                                <div class="ad-hom-view-com">
                                    <p><i class="fa fa-arrow-up up"></i> Users</p>
                                    <%int countUser= (int) request.getAttribute("countUser");%>
                                    <h3><%=countUser%></h3>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="ad-hom-box ad-hom-box-4">
                                <span class="ad-hom-col-com ad-hom-col-4"><i class="fa fa-envelope-open-o"></i></span>
                                <div class="ad-hom-view-com">
                                    <p><i class="fa fa-arrow-up up"></i> Booking</p>
                                    <%int countBooking= (int) request.getAttribute("countBooking");%>
                                    <h3><%=countBooking%></h3>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--== User Details ==-->
            <div class="sb2-2-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box-inn-sp">
                            <div class="inn-title">
                                <h4>User Details</h4>
                                <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>
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
                                    <li><a href="#!"><i class="material-icons">play_for_work</i>Download</a>
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
                                                        <th>User ID</th>
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>View</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                    </thead>
                                                    <tfoot>
                                                    <tr>
                                                        <th>User ID</th>
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
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
<script src="<%=PathAbsolute.getPath("admin/js/active.js")%>"></script>
<script>
    $(document).ready(function () {
        var table = $('#datable_1').DataTable({
            "ajax": {
                "url": "http://localhost:8080/BookStore/Admin/AjaxUser",
                "dataType": "json",
                "contentType": "application/json; charset=utf-8",
                'dataSrc': 'users'
            },
            columns: [
                {'mData': 'id'},
                {'mData': 'name'},
                {'mData': 'phone'},
                {'mData': 'email'},
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
                data: {id: data.id,type:'users'},
                success: function (resultText) {
                    table.ajax.reload();
                }
            });
        });
        $('#datable_1 tbody').on('click', 'a.view', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            window.location.href = "http://localhost:8080/BookStore/Admin/UserView?id="+data.id;
        });
        $('#datable_1 tbody').on('click', 'a.edit', function () {
            var row = table.row($(this).parents('tr'));
            var data = row.data();
            window.location.href = "http://localhost:8080/BookStore/Admin/UserEdit?id="+data.id;
        });
        activeMenu();
    });

</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/ by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 23
Oct 2019 13:20:51 GMT -->
</html>
