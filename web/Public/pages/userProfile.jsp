<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>User profile |  BookBGQ Store</title>
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
    <link rel="stylesheet" href="Public/css/plugins/font-awesome.min.css">
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
    <div class="ht__bradcaump__area bg-image--6">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="bradcaump__inner text-center">
                        <h2 class="bradcaump-title">My Account</h2>
                        <nav class="bradcaump-content">
                            <a class="breadcrumb_item" href="">Home</a>
                            <span class="brd-separetor">/</span>
                            <span class="breadcrumb_item active">My Account</span>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <% ResultSet rs = (ResultSet) request.getAttribute("rs");
    if(rs.next()){
    %>
    <div class="main">
        <div class="main-inner">
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-lg-3" style="width: 350px">
                        <div class="sidebar">
                            <div class="widget">
                                <div class="user-photo">
                                    <a href="#">
                                        <img style="height: 200px;width: 200px" src="<%=rs.getString("avatar")%>" alt="User Photo">
                                        <span class="user-photo-action">Click here to reupload</span>
                                    </a>
                                </div><!-- /.user-photo -->
                            </div><!-- /.widget -->

                            <div class="widget">

                                <ul class="menu-advanced">
                                    <li class="profile active"><a ><i class="fa fa-user"></i> Edit Profile</a></li>
                                    <li class="password"><a><i class="fa fa-key"></i> Password</a></li>
                                    <li class="logout "><a href="<%=PathAbsolute.getPath("Login")%>"><i class="fa fa-sign-out"></i>
                                        Logout</a></li>
                                </ul>
                            </div><!-- /.widget -->

                        </div><!-- /.sidebar -->
                    </div><!-- /.col-* -->

                    <div class="col-sm-8 col-lg-9">
                        <div class="content editprofle ">
                            <div class="page-title">
                                <h1>Edit Profile</h1>
                            </div><!-- /.page-title -->

                            <div class="background-white p20 mb30">
                                <h3 class="page-title">
                                    Contact Information <i id="contact" class="fa fa-check hidden" style="color: green"></i>
                                    <a onclick="editinfor('contact')" class="btn btn-primary btn-xs pull-right text-white">Save</a>
                                </h3>

                                <div class="row">
                                    <div class="form-group col-sm-6">
                                        <label>Name</label>
                                        <input type="text" class="form-control" name="name" value="<%=rs.getString("name")%>">
                                    </div><!-- /.form-group -->

                                    <div class="form-group col-sm-6">
                                        <label>Full name</label>
                                        <input type="text" class="form-control" name="fullname" value="<%=rs.getString("fullname")%>">
                                    </div><!-- /.form-group -->

                                    <div class="form-group col-sm-6">
                                        <label>E-mail</label>
                                        <input type="text" class="form-control" name="email" disabled value="<%=rs.getString("email")%>">
                                    </div><!-- /.form-group -->

                                    <div class="form-group col-sm-6">
                                        <label>Phone</label>
                                        <input type="text" class="form-control" name="phone" value="<%=rs.getString("phone")%>">
                                    </div>
                                    <div class="form-group col-sm-6">
                                        <label>Gender</label>
                                        <select type="select" class="form-control" name="gender">
                                            <option value="<%=rs.getString("gender")%>" selected><%=rs.getString("gender")%>
                                            </option>
                                            <option value="Male">Male</option>
                                            <option value="FeMale">Female</option>
                                        </select>
                                    </div>
                                </div><!-- /.row -->
                            </div>

                            <div class="background-white p20 mb30">
                                <h3 class="page-title">
                                    Address <i id="address" class="fa fa-check hidden" style="color: green"></i>
                                    <a onclick="editinfor('address')" class="btn btn-primary btn-xs pull-right text-white">Save</a>
                                </h3>

                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label>Address</label>
                                        <input type="text" class="form-control" name="address" value="<%=rs.getString("address")%>">
                                    </div><!-- /.form-group -->
                                </div><!-- /.row -->
                            </div>

                            <div class="background-white p20 mb30">
                                <h3 class="page-title">
                                    Biography
                                    <a  class="btn btn-primary btn-xs pull-right text-white">Save</a>
                                </h3>

                                <textarea class="form-control" rows="7"></textarea>
                            </div>

                        </div>
                        <div class="content ml-md-3 ml-lg-3 ml-sm-3 changpassword hidden">
                            <div class="page-title">
                                <h1>Change Password</h1>
                            </div>
                            <div class="background-white p20 mb30">
                                <h5 id="passwordChange" style="color: red"></h5>
                                <div class="row">
                                    <div class="form-group col-sm-12">
                                        <label for="passwordOld">Old Password</label>
                                        <input type="password" class="form-control" name="passwordOld"
                                               id="passwordOld">
                                    </div>

                                    <div class="form-group col-sm-12">
                                        <label for="newPassword">New password</label>
                                        <input type="password" class="form-control" name="newPassword"
                                               id="newPassword">
                                    </div>
                                    <div class="form-group col-sm-12">
                                        <label for="rePassword">Retype password</label>
                                        <input type="password" class="form-control" name="rePassword"
                                               id="rePassword">
                                    </div>

                                    <button onclick="editinfor('password')"  class="btn btn-primary pull-right m-auto">Change</button>
                                </div>
                            </div>
                        </div><!-- /.content -->
                    </div><!-- /.col-* -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.main-inner -->
    </div>
    <%
    }
    rs.beforeFirst();
    %>
    <!-- Footer Area -->
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
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="Public/js/search.js"></script>
<script src="Public/js/editinforuser.js"></script>
<script>
    $(function () {
        drawCart();
        sea();
    });
</script>
</body>

<!-- Mirrored from demo.hasthemes.com/boighor-preview/boighor-v3/contact.html by HTTrack Website Copier/3.x
[XR&CO'2014], Thu, 12 Sep 2019 08:49:15 GMT -->
</html>