<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/discountEdit.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
<head>
    <title>Discount Edit</title>
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
                    <li><a href="index2.html"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> Discount Edit</a>
                    </li>
                    <li class="page-back"><a href="index2.html"><i class="fa fa-backward" aria-hidden="true"></i>
                        Back</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-add-blog sb2-2-1">
                <div class="box-inn-sp">
                    <div class="inn-title">
                        <h4>Discount Edit</h4>
                        <%ResultSet rs = (ResultSet) request.getAttribute("rs");
                        %>
                    </div>
                    <div class="bor">
                        <%if (rs.next()){%>
                        <form action="http://localhost:8080/BookStore/Admin/DiscountEdit" method="post">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="list-title" name="name" type="text" value="<%=rs.getString("name")%>" class="validate">
                                    <label for="list-title">Discount Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input id="list-title1" name="code" type="text" value="<%=rs.getString("code")%>" class="validate">
                                    <label for="list-title1">Discount Code</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="post-auth1" type="text" value="<%=rs.getString("value")%>"name="value" class="validate">
                                    <label for="post-auth1">Discount Value</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input id="list-title2" type="text" value="<%=rs.getString("date_start")%>" name="startday" class="validate">
                                    <label for="list-title2">Discount StartDay(21/05/1999)</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="post-auth3" type="text" value="<%=rs.getString("date_end")%>" name="endday" class="validate">
                                    <label for="post-auth3">Discount EndDate(21/05/1999)</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input type="submit" class="waves-effect waves-light btn-large" value="Submit">
                                </div>
                            </div>
                        </form>
                        <%}%>
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
<script>
    $(document).ready(function () {
        activeMenu();
    });
</script>
</body>



<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/discountEdit.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
</html>
