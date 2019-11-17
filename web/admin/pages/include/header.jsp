<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page import="vn.edu.nlu.fit.model.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container-fluid sb1">
    <div class="row">
        <!--== LOGO ==-->
        <div class="col-md-2 col-sm-3 col-xs-6 sb1-1">
            <a href="#" class="btn-close-menu"><i class="fa fa-times" aria-hidden="true"></i></a>
            <a href="#" class="atab-menu"><i class="fa fa-bars tab-menu" aria-hidden="true"></i></a>
            <a href="<%=PathAbsolute.getPath("Admin/Index")%>" class="logo"><img src="<%=PathAbsolute.getPath("admin/images/logo1.png")%>" alt=""/>
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
        <%Users admin = (Users) session.getAttribute("admin");%>
        <!--== MY ACCCOUNT ==-->
        <div class="col-md-2 col-sm-3 col-xs-6">
            <!-- Dropdown Trigger -->
            <a class='waves-effect dropdown-button top-user-pro' href='#' data-activates='top-menu'><img
                    src="<%=admin.getAvatar()%>" alt=""/>My Account<i class="fa fa-angle-down"
                                                                         aria-hidden="true"></i>
            </a>

            <!-- Dropdown Structure -->
            <ul id='top-menu' class='dropdown-content top-menu-sty'>
                <li><a href="<%=PathAbsolute.getPath("Admin/Setting")%>" class="waves-effect"><i class="fa fa-cogs" aria-hidden="true"></i>Admin Setting</a>
                </li>

                <li><a href="<%=PathAbsolute.getPath("Admin/PackageAll")%>" class="waves-effect"><i class="fa fa-book" aria-hidden="true"></i>Book</a>
                </li>
                <li><a href="<%=PathAbsolute.getPath("Admin/UserAll")%>" class="waves-effect"><i class="fa fa-user"
                                                                     aria-hidden="true"></i> User</a>
                </li>
                <li><a href="#" class="waves-effect"><i class="fa fa-undo" aria-hidden="true"></i> Backup Data</a>
                </li>
                <li class="divider"></li>
                <li><a href="<%=PathAbsolute.getPath("Admin/Logout")%>" class="ho-dr-con-last waves-effect"><i class="fa fa-sign-in" aria-hidden="true"></i>
                    Logout</a>
                </li>
            </ul>
        </div>
    </div>
</div>