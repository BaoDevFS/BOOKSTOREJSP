<%--
  Created by IntelliJ IDEA.
  User: GiangOggy
  Date: 10/11/2019
  Time: 15:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sb2-1">
    <!--== USER INFO ==-->
    <div class="sb2-12">
        <ul>
            <li><img src="admin/images/placeholder.jpg" alt="">
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
            <li><a href="admin/index.html" class="menu-active"><i class="fa fa-bar-chart" aria-hidden="true"></i> Dashboard</a>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-user" aria-hidden="true"></i> Users</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="userAll.html">All Users</a>
                        </li>
                        <li><a href="userAdd.html">Add New user</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-umbrella" aria-hidden="true"></i> Productss</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="packageAll.html">All Products</a>
                        </li>
                        <li><a href="packageAdd.html">Add New Product</a>
                        </li>
                        <li><a href="packageCatAll.html">All Product Categories</a>
                        </li>
                        <li><a href="packageCatAdd.html">Add Product Categories</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-usd" aria-hidden="true"></i> Discounts</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="admin/pages/discount.html">All Discounts</a>
                        </li>
                        <li><a href="discountAdd.html">Add New Discounts</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="javascript:void(0)" class="collapsible-header"><i class="fa fa-ticket" aria-hidden="true"></i> Booking & Enquiry</a>
                <div class="collapsible-body left-sub-menu">
                    <ul>
                        <li><a href="admin/pages/hotel-booking-all.html">Book</a>
                        </li>
                        <li><a href="packageBookingAll.html">Product</a>
                        </li>
                        <li><a href="admin/pages/sight-see-booking-all.html">Sight Seeings</a>
                        </li>
                        <li><a href="admin/pages/event-booking-all.html">Events</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li><a href="admin/pages/login.html" target="_blank"><i class="fa fa-sign-in" aria-hidden="true"></i>Login</a>
            </li>
        </ul>
    </div>
</div>
