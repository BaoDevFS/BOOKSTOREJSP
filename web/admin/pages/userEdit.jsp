<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/userEdit.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
<head>
    <title>User Edit</title>
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
<%@ include file="include/header.jsp" %>
<!--== BODY CONTNAINER ==-->
<div class="container-fluid sb2">
    <div class="row">
        <%@ include file="include/inforAndLeftMenu.jsp" %>
        <div class="sb2-2">
            <div class="sb2-2-2">
                <ul>
                    <li><a href="<%=PathAbsolute.getPath("Admin/Index")%>"><i class="fa fa-home" aria-hidden="true"></i>
                        Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> User Edit</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-3">
                <div class="row">
                    <div class="col-md-12">
                        <div class="box-inn-sp">
                            <div class="inn-title">
                                <h4>Edit User Details</h4>
                            </div>
                            <div class="tab-inn">
                                <form action="<% PathAbsolute.getPath("Admin/UserEdit");%>"
                                      enctype="multipart/form-data" method="post">
                                    <%
                                        ResultSet rs = (ResultSet) request.getAttribute("users");
                                        while (rs.next()) {
                                    %>
                                    <div class="row file-field">
                                        <div class="input-field col s6">
                                            <div class="sb2-12">
                                                <ul>
                                                    <li>
                                                        <img style="width: 100px;height: 100px" id="avatar"
                                                             src="<%=rs.getString("avatar")%>" alt="">
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="input-field col s6">
                                            <div class="btn">
                                                <span>File</span>
                                                <input type="file" id="file" name="avatar" accept="image/*">
                                            </div>
                                            <div class="file-path-wrapper">
                                                <input class="file-path validate" type="text"
                                                       placeholder="Upload avatar">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="first_name" name="firstname" value="<%=rs.getString("name")%>"
                                                   type="text" class="validate">
                                            <label for="first_name">First Name</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="last_name" type="text" value="<%=rs.getString("fullname")%>"
                                                   name="fullname" class="validate">
                                            <label for="last_name">Full Name</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="phone" type="number" value="<%=rs.getString("phone")%>"
                                                   name="mobile" class="validate">
                                            <label for="phone">Mobile</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <select type="select" name="gender">
                                                <option value="<%=rs.getString("gender")%>" selected><%=rs.getString("gender")%>
                                                </option>
                                                <option value="Male">Male</option>
                                                <option value="FeMale">FeMale</option>
                                            </select>
                                            <label for="phone">Gender</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input id="city" type="text" value="<%=rs.getString("address")%>"
                                                   name="address" class="validate">
                                            <label for="city">Address</label>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <select type="select" name="group">
                                                <%!public String getGroup(String a) {
                                                    if (a.equals("0")) {
                                                        return "User";
                                                    } else {
                                                        return "Admin";
                                                    }
                                                }
                                                %>
                                                <%String st = getGroup(rs.getString("group"));%>
                                                <option value="<%=rs.getString("group")%>" selected> <%=st%> </option>
                                                <option value="0">User</option>
                                                <option value="1">Admin</option>
                                            </select>
                                            <label for="phone">Group</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="active" type="text" value="<%=rs.getString("active")%> "
                                                   name="active" class="validate">
                                            <label for="active">Active</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s6">
                                            <input id="password" type="password" value="<%=rs.getString("password")%> "
                                                   name="password" class="validate">
                                            <label for="password">Password</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <input id="password1" type="password" value="<%=rs.getString("password")%>"
                                                   name="confirmpassword"
                                                   class="validate">
                                            <label for="password1">Confirm Password</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input id="email" type="email" value="<%=rs.getString("email")%>"
                                                   name="email" class="validate">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="submit" class="waves-effect waves-light btn-primary " style="padding: 10px">
                                        </div>
                                    </div>
                                    <%}%>
                                </form>
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
<script src="<%=PathAbsolute.getPath("admin/js/show.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/active.js")%>"></script>
<script>
    $(document).ready(function () {
        activeMenu();
    });
</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/userEdit.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
</html>
