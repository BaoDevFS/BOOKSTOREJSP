<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageAdd.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
<head>
    <title>Add Book</title>
    <!--== META TAGS ==-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!--== FAV ICON ==-->
    <link rel="shortcut icon" href="<%=PathAbsolute.getPath("admin/images/fav.ico")%>">

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600,700" rel="stylesheet">
    <!-- FONT-AWESOME ICON CSS -->
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/font-awesome.min.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.min.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/materialize.css")%>"/>
    <%--    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/bootstrap.css")%>">--%>
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/mob.css")%>">
    <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/style.css")%>">
    <!--== ALL CSS FILES ==-->
    <script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
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
        <%! public String getStatus(int i) {
            System.out.println(i);
            if (i == 1) {
                return "show(1);";
            } else if (i == 0) {
                return "show(0);";
            } else {
                return "";
            }
        }%>
        <div class="sb2-2">
            <div class="sb2-2-2">
                <ul>
                    <li><a href="http://localhost:8080/BookStore/Admin/Index"><i class="fa fa-home" aria-hidden="true"></i> Home</a>
                    </li>
                    <li class="active-bre"><a href="#"> Add New Package</a>
                    </li>
                    <li class="page-back"><a href="http://localhost:8080/BookStore/Admin/Index"><i class="fa fa-backward" aria-hidden="true"></i>
                        Back</a>
                    </li>
                </ul>
            </div>
            <div class="sb2-2-add-blog sb2-2-1">
                <div class="box-inn-sp">
                    <div class="inn-title">
                        <h4>Add New Product</h4>
                        <%--                        <p>Airtport Hotels The Right Way To Start A Short Break Holiday</p>--%>
                    </div>
                    <div class="bor">
                        <form action="<%PathAbsolute.getPath("Admin/PackageAdd");%>" method="post"
                              enctype="multipart/form-data">
                            <%
                                ResultSet rs = (ResultSet) request.getAttribute("booktype");
                                System.out.println(request.getAttribute("status"));
                            %>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="list-title" type="text" name="name" class="validate">
                                    <label for="list-title">Product Name</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <img style="width: 300px;height: 300px" id="main"
                                         src="<%=PathAbsolute.getPath("admin/images/imgdefault.png")%>" alt="">
                                    <div class="file-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file" id="imgmain" name="image" accept="image/*">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text"
                                                   placeholder="Upload image book">
                                        </div>
                                    </div>
                                </div>
                                <div class="input-field col s6">
                                    <img style="width: 300px;height: 300px" id="hover"
                                         src="<%=PathAbsolute.getPath("admin/images/imgdefault.png")%>" alt="">
                                    <div class="file-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input type="file" id="imghover" name="imagehover" accept="image/*">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text"
                                                   placeholder="Upload image when hover">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <%--                                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/monokai-sublime.min.css'>--%>
                                <%--                                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.css'>--%>
                                <%--                                <link rel='stylesheet' href='https://cdn.quilljs.com/1.3.6/quill.bubble.css'>--%>
                                <%--                                <link rel='stylesheet' href='https://cdn.quilljs.com/1.3.6/quill.snow.css'>--%>
                                <%--                                <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/summernote/0.6.6/summernote.min.css'>--%>
                                <%--                                <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/metisMenu.css")%>">--%>
                                <%--                                <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/default-custom.css")%>" id="color">--%>
                                <%--                                <link rel="stylesheet" href="<%=PathAbsolute.getPath("admin/css/colors.css")%>">--%>

                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h3 class="card-title">Description</h3>
                                            <textarea name="description" id="editor"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <select type="select" name="booktype">
                                        <option disabled selected>Choose Category</option>
                                        <%while (rs.next()) {%>
                                        <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%>
                                        </option>
                                        <%}%>
                                    </select>
                                    <label>Select Category</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s6">
                                    <input id="Package-auth" name="year" type="text" class="validate">
                                    <label for="Package-auth">Public Year</label>
                                </div>
                                <div class="input-field col s6">
                                    <input id="price" type="text" name="price" class="validate">
                                    <label for="Package-auth">Price</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input id="author" name="author" type="text" class="validate">
                                    <label for="Package-auth">Author</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col s12">
                                    <input type="submit" class="waves-effect waves-light btn-primary " style="padding: 10px">
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
<%--<script src="<%=PathAbsolute.getPath("admin/js/jquery.min.js")%>"></script>--%>
<script src="<%=PathAbsolute.getPath("admin/js/jquery-3.2.1.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/bootstrap.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/materialize.min.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/custom.js")%>"></script>
<script src="<%=PathAbsolute.getPath("admin/js/show.js")%>"></script>

<%--<script src="<%=PathAbsolute.getPath("admin/js/popper.min.js")%>"></script>--%>
<%--<script src="<%=PathAbsolute.getPath("admin/js/metisMenu.js")%>"></script>--%>
<%--<script src='https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/highlight.min.js'></script>--%>
<%--<script src='https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.7.1/katex.min.js'></script>--%>
<%--<script src='https://cdn.quilljs.com/1.3.6/quill.js'></script>--%>
<%--<script src="<%=PathAbsolute.getPath("admin/js/jquery.cookie-1.4.1.min.js")%>"></script>--%>
<%--<script src="<%=PathAbsolute.getPath("admin/js/color.js")%>"></script>--%>
<%--<script src="<%=PathAbsolute.getPath("admin/js/main.js")%>"></script>--%>
<%--<script src='https://cdnjs.cloudflare.com/ajax/libs/summernote/0.6.6/summernote.min.js'></script>--%>
<%--<script src="<%=PathAbsolute.getPath("admin/js/text-editor-init.js")%>">--%>
<%--</script>--%>
<script src="<%=PathAbsolute.getPath("admin/js/active.js")%>"></script>
<script>
    $(document).ready(function () {
        activeMenu();
    });
</script>
<script>
    <%= getStatus((int)request.getAttribute("status"))%>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
        console.error( error );
    } );
</script>
</body>


<!-- Mirrored from rn53themes.net/themes/demo/lava-admin/packageAdd.html by HTTrack Website Copier/3.x
[XR&CO'2014], Wed, 23 Oct 2019 13:21:52 GMT -->
</html>
