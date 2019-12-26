<%--
  Created by IntelliJ IDEA.
  User: WATERMELON
  Date: 11/22/2019
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>List Author</title>
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
<%--    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/jquery.dataTables.min.css")%>"/>--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.20/af-2.3.4/datatables.min.css"/>
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/style.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--== MAIN CONTRAINER ==-->
<%@include file="include/header.jsp" %>
<!--== BODY CONTNAINER ==-->
<div class="container-fluid sb2">
    <div class="row">
        <%@ include file="include/inforAndLeftMenu.jsp" %>
        <div class="sb2-2">
            <div class="sb2-2-2">
                <ul>
                    <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> List Author</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-1">
                <div class="inn-title">
                    <h4>All Author</h4>
                    <%--                    <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>--%>
                    <%ResultSet rs = (ResultSet) request.getAttribute("list");%>
                </div>
                <div class="bor">
                    <div class="panel-wrapper collapse in">
                        <div class="panel-body">
                            <div class="table-wrap">
                                <div class="table-responsive">
                                    <table id="datable_1" class="table table-hover display  pb-30">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Author Name</th>
                                            <th>Date</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                        </thead>
                                        <tfoot>
                                        <tr>
                                            <th>#</th>
                                            <th>Author Name</th>
                                            <th>Date</th>
                                            <th>Edit</th>
                                            <th>Delete</th>
                                        </tr>
                                        </tfoot>
                                        <tbody>
                                        <%int i = 0;%>
                                        <%
                                            while (rs.next()) {
                                                i++;
                                        %>

                                        <tr>
                                            <td><%=i%>
                                            </td>
                                            <td><%=rs.getString("name")%>
                                            </td>
                                            <td><%=rs.getString("created_at")%>
                                            </td>
                                            <td>
                                                <a href="<%= PathAbsolute.getPath("Admin/AuthorEdit?id="+rs.getInt("id"))%>"
                                                   class="sb2-2-1-edit"><i class="fa fa-pencil-square-o"
                                                                           aria-hidden="true"></i></a>
                                            </td>
                                            <td>
                                                <a href="<%= PathAbsolute.getPath("Admin/Delete?id="+rs.getInt("id")+"&type=authors")%>"
                                                   class="sb2-2-1-edit"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
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
<script src="<%=PathAbsolute.getPath("admin/js/active.js")%>"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.20/af-2.3.4/datatables.min.js"></script>
<script>
    $(document).ready(function () {
        "use strict";
        $('#datable_1').DataTable({
            'columnDefs': [ {
                'targets': [3,4], // column index (start from 0)
                'orderable': false, // set orderable false for selected columns
            }]});
        $('#datable_2').DataTable({"lengthChange": false});
        activeMenu();
    });
</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageCatAll.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
</html>
