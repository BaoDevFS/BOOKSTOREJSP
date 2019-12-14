<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="wn__header" class="oth-page header__area header__absolute sticky__header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-7 col-lg-2">
                <div class="logo">
                    <a href="http://localhost:8080/BookStore/ ">
                        <img src="Public/images/logo/logo.png" alt="logo images">
                    </a>
                </div>
            </div>
            <div class="col-lg-8 d-none d-lg-block">
                <nav class="mainmenu__nav">
                    <ul class="meninmenu d-flex justify-content-start">
                        <li class="drop with--one--item"><a href="http://localhost:8080/BookStore/">Home</a>

                        </li>
                        <li class="drop"><a href="http://localhost:8080/BookStore/ShopGrid">Shop</a>

                        </li>
                        <li><a href="http://localhost:8080/BookStore/Contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-8 col-sm-8 col-5 col-lg-2">
                <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                    <li class="shop_search"><a class="search__active" href="#"></a></li>
                    <li class="wishlist"><a href="http://localhost:8080/BookStore/WishList"></a></li>
                    <li class="shopcart"><a class="cartbox_active" href="#"><span class="product_qun"><%--3--%></span></a>
                        <!-- Start Shopping Cart -->
                        <div class="block-minicart minicart__active">
                            <div class="minicart-content-wrapper">
                                <div class="micart__close">
                                    <span>close</span>
                                </div>
                                <div class="items-total d-flex justify-content-between">
                                    <span id="quantity"><%--3 items--%></span>
                                    <span>Cart Subtotal</span>
                                </div>
                                <div class="total_amount text-right">
                                    <span id="total"><%--$66.00--%></span>
                                </div>
                                <div class="mini_action checkout">
                                    <a class="checkout__btn" href="http://localhost:8080/BookStore/Checkout">Go to Checkout</a>
                                </div>
                                <div class="single__items">
                                    <div class="miniproduct" >
                                    </div>
                                </div>
                                <div class="mini_action cart">
                                    <a class="cart__btn" href="http://localhost:8080/BookStore/Cart">View and edit cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Shopping Cart -->
                    </li>
                    <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                        <div class="searchbar__content setting__block">
                            <div class="content-inner">
                                <div class="switcher-currency">
                                    <strong class="label switcher-label">
                                        <span>My Account</span>
                                    </strong>
                                    <div class="switcher-options">
                                        <div class="switcher-currency-trigger">
                                            <div class="setting__menu">
                                                <span><a href="http://localhost:8080/BookStore/Account">My Account</a></span>
                                                <span><a href="http://localhost:8080/BookStore/Wishlist">My Wishlist</a></span>
                                                <span><a href="http://localhost:8080/BookStore/Login">Sign In</a></span>
                                                <span><a href="http://localhost:8080/BookStore/Register">Create An Account</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Start Mobile Menu -->
        <div class="row d-none">
            <div class="col-lg-12 d-none">
                <nav class="mobilemenu__nav">
                    <ul class="meninmenu">
                        <li><a href="http://localhost:8080/BookStore/">Home</a>

                        </li>
                        <li><a href="http://localhost:8080/BookStore/ShopGrid">Shop</a>

                        </li>
                        <li><a href="http://localhost:8080/BookStore/Contact">Contact</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- End Mobile Menu -->
        <div class="mobile-menu d-block d-lg-none">
        </div>
        <!-- Mobile Menu -->
    </div>
</header>
<div class="box-search-content search_active block-bg close__top">
    <form id="search_mini_form" class="minisearch" action="#">
        <div class="field__search">
            <input type="text" id="key" placeholder="Search entire store here...">
            <div class="action">
                <a onclick="changes()"><i class="zmdi zmdi-search"></i></a>
            </div>
            <div class="single__items">
                <table id="search" class="table table-hover display  pb-30">
                    <thead>
                    <tr class="title-top">
                        <th class="product-thumbnail">Image</th>
                        <th class="product-name">Product</th>
                        <th class="product-price">Price</th>
                        <th class="product-remove">Author</th>
                    </tr>
                    </thead>
                    <tbody id="tbodysearch">
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <div class="close__wrap">
        <span>close</span>
    </div>
</div>

