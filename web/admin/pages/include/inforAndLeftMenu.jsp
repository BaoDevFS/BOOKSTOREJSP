<%@ page import="vn.edu.nlu.control.PathAbsolute" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sb2-1">
    <!--== USER INFO ==-->
    <div class="sb2-12">
        <ul>
            <li><img src="<%=PathAbsolute.getPath("admin/images/placeholder.jpg")%>" alt="">
            </li>
            <li>
                <h5>Victoria Baker <span> Santa Ana, CA</span></h5>
            </li>
            <li></li>
        </ul>
    </div>
    <!--== LEFT MENU ==-->
    <div class="sb2-13">
        <ul class="collapsible" data-collapsible="accordion">

            <li><a href="<%= PathAbsolute.getPath("Index")%>" class="menu-active"><i class="fa fa-bar-chart"
                                                                                          aria-hidden="true"></i>
                Dashboard</a>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-user" aria-hidden="true"></i>
                Users</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="<%= PathAbsolute.getPath("UserAll")%>">All Users</a>
                        </li>
                        <li><a href="<%= PathAbsolute.getPath("UserAdd")%>">Add New user</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-umbrella"
                                                                           aria-hidden="true"></i>
                Productss</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="<%= PathAbsolute.getPath("PackageAll")%>">All Products</a>
                        </li>
                        <li><a href="<%= PathAbsolute.getPath("PackageAdd")%>">Add New Product</a>
                        </li>
                        <li><a href="<%= PathAbsolute.getPath("PackageCartAll")%>">All Product Categories</a>
                        </li>
                        <li><a href="<%= PathAbsolute.getPath("PackageCartAdd")%>">Add Product Categories</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-usd" aria-hidden="true"></i>
                Discounts</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="<%= PathAbsolute.getPath("Discount")%>">All Discounts</a>
                        </li>
                        <li><a href="<%= PathAbsolute.getPath("DiscountAdd")%>">Add New Discounts</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-ticket" aria-hidden="true"></i>
                Booking & Enquiry</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="<%= PathAbsolute.getPath("PackageBookingAll")%>">Product</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="<%= PathAbsolute.getPath("LoginAdmin")%>" target="_blank"><i class="fa fa-sign-in"
                                                                                      aria-hidden="true"></i>Login</a>
            </li>
        </ul>
    </div>
</div>
