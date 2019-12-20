<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User All </title>
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
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/jquery.dataTables.min.css")%>"/>
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>
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
                    <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> Ui Form</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box-inn-sp">
                            <div class="inn-title">
                                <h4>User Details</h4>
                                <a class="dropdown-button drop-down-meta" href="#" data-activates="dr-users"><i
                                        class="material-icons">more_vert</i></a>
                                <ul id="dr-users" class="dropdown-content">
                                    <li><a href="userAdd.html">Add New</a>
                                    </li>
                                    <li><a href="userEdit.html">Edit</a>
                                    </li>
                                    <li><a href="#!">Update</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li><a href="#!"><i class="material-icons">delete</i>Delete</a>
                                    </li>
                                    <li><a href="userView.html"><i class="material-icons">subject</i>View All</a>
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
                                                        <th>User</th>
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
                                                        <th>User</th>
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Email</th>
                                                        <th>View</th>
                                                        <th>Edit</th>
                                                        <th>Delete</th>
                                                    </tr>
                                                    </tfoot>
                                                    <tbody>
                                                    <% ResultSet resultSet = (ResultSet) request.getAttribute("list");
                                                        while (resultSet.next()) {
                                                    %>
                                                    <tr>
                                                        <td><span class="list-img"><img
                                                                src="<%= resultSet.getString("avatar")%>"
                                                                alt=""></span>
                                                        </td>
                                                        <td><a href="#"><span
                                                                class="list-enq-name"><%= resultSet.getString("name")%></span><span
                                                                class="list-enq-city"><%= resultSet.getString("address")%></span></a>
                                                        </td>
                                                        <td><%= resultSet.getString("phone")%>
                                                        </td>
                                                        <td><%= resultSet.getString("email")%>
                                                        </td>
                                                        <td>
                                                            <a href="<%= PathAbsolute.getPath("Admin/UserView?id="+resultSet.getString("id"))%>">
                                                                <i class="fa fa-eye" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                            <a href="<%= PathAbsolute.getPath("Admin/UserEdit?id="+resultSet.getString("id"))%>">
                                                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                            </a>
                                                        </td>
                                                        <td>
                                                                <a href="<%= PathAbsolute.getPath("Admin/Delete?id="+resultSet.getString("id")+"&type=users")%>">
                                                                    <i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                        </td>
                                                    </tr>
                                                    <%}%>
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
<script src="<%=PathAbsolute.getPath("admin/js/jquery.dataTables.min.js")%>"></script>
<script>
    $(document).ready(function () {
        "use strict";
        $('#datable_1').DataTable({
            'columnDefs': [ {
                'targets': [4,5,6], // column index (start from 0)
                'orderable': false, // set orderable false for selected columns
            }]});
        $('#datable_2').DataTable({"lengthChange": false});
    });
</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/userAll.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
</html>
