<%@ page import="vn.edu.nlu.control.GetUser" %>
<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sb2-1">
    <!--== USER INFO ==-->
    <div class="sb2-12">
        <ul>
            <li><img src="<%=GetUser.getUser(session).getAvatar()%>" alt="">
            </li>

            <li>
                <h5><%=GetUser.getUser(session).getFullname()%><span> <%=GetUser.getUser(session).getEmail()%></span>
                </h5>
            </li>
            <li></li>
        </ul>
    </div>
    <!--== LEFT MENU ==-->
    <div class="sb2-13">
        <ul class="collapsible" data-collapsible="accordion">

            <li><a href="<%= PathAbsolute.getPath("Admin/Index")%>" class="dashboard">
                <i class="fa fa-bar-chart" aria-hidden="true"></i>
                Dashboard</a>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header users"><i class="fa fa-user" aria-hidden="true"></i>
                Users</a>
                <div class="collapsible-body left-sub-menu contentuser">
                    <ul>
                        <li class="userall"><a href="<%= PathAbsolute.getPath("Admin/UserAll")%>">All Users</a>
                        </li>
                        <li class="useradd"><a href="<%= PathAbsolute.getPath("Admin/UserAdd")%>">Add New user</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header products">
                <i class="fa fa-umbrella" aria-hidden="true"></i>
                Products</a>
                <div class="collapsible-body left-sub-menu contentproduct">
                    <ul>
                        <li class="allproducts"><a href="<%= PathAbsolute.getPath("Admin/PackageAll")%>">All Products</a>
                        </li>
                        <li class="addproducts"><a href="<%= PathAbsolute.getPath("Admin/PackageAdd")%>">Add New Product</a>
                        </li>
                        <li class="allcategories"><a href="<%= PathAbsolute.getPath("Admin/PackageCartAll")%>">All Product Categories</a>
                        </li>
                        <li class="addcategories" ><a href="<%= PathAbsolute.getPath("Admin/PackageCartAdd")%>">Add Product Categories</a>
                        </li>
                        <li class="allauthor"><a href="<%= PathAbsolute.getPath("Admin/AuthorAll")%>">All Author</a>
                        </li>
                        <li class="addauthor"><a href="<%= PathAbsolute.getPath("Admin/AuthorAdd")%>">Add New Author</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header discounts"><i class="fa fa-usd" aria-hidden="true"></i>
                Discounts</a>
                <div class="collapsible-body left-sub-menu contentdiscount">
                    <ul>
                        <li class="alldiscounts"><a href="<%= PathAbsolute.getPath("Admin/Discount")%>">All Discounts</a>
                        </li>
                        <li class="adddiscounts"><a href="<%= PathAbsolute.getPath("Admin/DiscountAdd")%>">Add New Discounts</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header booking"><i class="fa fa-ticket" aria-hidden="true"></i>
                Booking & Enquiry</a>
                <div class="collapsible-body left-sub-menu contentbooking">
                    <ul>
                        <li class="bookingproduct" ><a href="<%= PathAbsolute.getPath("Admin/PackageBookingAll")%>">Product</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="<%= PathAbsolute.getPath("Admin/Login")%>" target="_blank">
                <i class="fa fa-sign-in" aria-hidden="true"></i>
                Logout</a>
            </li>
        </ul>
    </div>
</div>
