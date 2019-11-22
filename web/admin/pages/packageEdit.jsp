<%@ page import="java.sql.ResultSet" %>
<%@ page import="vn.edu.nlu.fit.model.Products" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"><!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageEdit.html by HTTrack Website
        Copier/3.x [XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
<head>
    <title>Lava Material - Web Application and Website Multipurpose Admin Panel Template</title>
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
                    <li><a href="admin/index.html"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> Edit Package</a>
                    </li>
                    <li class="page-back"><a href="admin/index.html"><i class="fa fa-backward" aria-hidden="true"></i>
                        Back</a>
                    </li>
                </ul>
            </div>
<%--            <div class="sb2-2-add-blog sb2-2-1">--%>
<%--                <div class="box-inn-sp">--%>
<%--                    <div class="inn-title">--%>
<%--                        <h4>Edit Product</h4>--%>
<%--                        &lt;%&ndash;                        <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>&ndash;%&gt;--%>
<%--                    </div>--%>
<%--                    <div class="bor">--%>
<%--                        <form>--%>
<%--                            <div class="row">--%>
<%--                                <div class="input-field col s12">--%>
<%--                                    <input id="list-title" type="text" value="Blog Package Name" class="validate">--%>
<%--                                    <label for="list-title">Product Name</label>--%>
<%--                                </div>--%>
<%--                                <div class="input-field col s12">--%>
<%--                                    <div class="file-field">--%>
<%--                                        <div class="btn">--%>
<%--                                            <span>File</span>--%>
<%--                                            <input type="file">--%>
<%--                                        </div>--%>
<%--                                        <div class="file-path-wrapper">--%>
<%--                                            <input class="file-path validate" type="text"--%>
<%--                                                   placeholder="Upload Blog Banner">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="input-field col s12">--%>
<%--        <textarea id="textarea1" class="materialize-textarea">It is a long established fact that a reader will be--%>
<%--        distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that--%>
<%--        it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making--%>
<%--        it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as--%>
<%--        their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.--%>
<%--        Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and--%>
<%--        the like).</textarea>--%>
<%--                                    <label for="textarea1">Package Descriptions:</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="input-field col s12">--%>
<%--                                    <select multiple>--%>
<%--                                        <option value="" disabled selected>Choose Category</option>--%>
<%--                                        <option value="1">Hotels</option>--%>
<%--                                        <option value="2">Educations</option>--%>
<%--                                    </select>--%>
<%--                                    <label>Select Category</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="input-field col s12">--%>
<%--                                    <input id="Package-auth" type="text" value="David Villiam" class="validate">--%>
<%--                                    <label for="Package-auth">Author Name</label>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="row">--%>
<%--                                <div class="input-field col s12">--%>
<%--                                    <input type="submit" class="waves-effect waves-light btn-large" value="Submit">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="sb2-2-add-blog sb2-2-1">
                <div class="box-inn-sp">
                    <div class="inn-title">
                        <h4>Edit Product</h4>
                        <%--                        <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>--%>
                    </div>
                    <div class="bor">
                        <form action="<%=PathAbsolute.getPath("Admin/PackageEdit")%>" method="post">
                            <%ResultSet resultSet = (ResultSet) request.getAttribute("rs");%>
                            <%ResultSet resultSet2 = (ResultSet) request.getAttribute("booktype");
                            String typeName = (String) request.getAttribute("nametype");%>
                            <%while (resultSet.next()){%>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="list-title" type="text" name="name" value="<%=resultSet.getString("name")%>" class="validate">
                                    <label for="list-title">Product Name</label>
                                </div>
                                <div class="input-field col s12">
                                    <div class="file-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file" accept="image/*">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text"
                                                   placeholder="Upload image book">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <textarea id="textarea1" name="description" class="materialize-textarea"><%=resultSet.getString("description")%></textarea>
                                    <label for="textarea1">Product Descriptions:</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <select name="id_type" >
                                        <option   value="<%=resultSet.getInt("id_type")%>"  selected><%=typeName%></option>
                                        <%while (resultSet2.next()){%>
                                        <option value="<%=resultSet2.getInt("id")%>"><%=resultSet2.getString("name")%></option>
                                        <%}%>
                                    </select>
                                    <label>Select Category</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input id="Package-auth" name="year" type="text" value="<%=resultSet.getInt("year")%>" class="validate">
                                    <label for="Package-auth">Public Year</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="price" name="price" type="text" value="<%=resultSet.getString("price")%>"class="validate">
                                    <label for="Package-auth">Price</label>
                                </div>
                            </div>
                            <%}%>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input type="submit" class="waves-effect waves-light btn-large" value="Submit">
                                </div>
                            </div>
                        </form>
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

</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageEdit.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:22:03 GMT -->
</html>
