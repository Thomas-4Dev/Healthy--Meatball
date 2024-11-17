<meta charset="UTF-8">
<style>
    /* Định dạng form tìm kiếm */
    .container-search-header {
        position: relative;
        width: 100%;
        max-width: 305px;
        margin: 0 auto;
    }

    .wrap-search-header {
        display: flex;
        align-items: center;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 5px;
        height: 27px;
        width: 100%;
    }

    .wrap-search-header button {
        background: none;
        /*border: none;*/
        padding: 0 5px;
        cursor: pointer;
        font-size: 14px;
        color: #a50a06;
        transition: color 0.3s ease;
    }

    .wrap-search-header button:hover {
        color: #850805;
    }

    .wrap-search-header input,
    .wrap-search-header select {
        border: none;
        outline: none;
        padding: 5px;
        font-size: 12px;
        flex: 1;
        margin: 0 3px;
    }

    .wrap-search-header input::placeholder {
        color: #bbb;
    }

    .wrap-search-header select {
        background-color: white;
        color: #333;
        appearance: none;
    }

    .wrap-search-header .text-center {
        width: 100%;
        margin-top: 5px;
    }

    .wrap-search-header .text-center button {
        margin-top: 2px;
        background-color: #a50a06;
        color: white;
        border: none;
        border-radius: 8px;
        padding: 5px 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        font-size: 12px;
    }

    .wrap-search-header .text-center button:hover {
        background-color: #850805;
    }

    /* Button hide modal search */
    .btn-hide-modal-search {
        position: absolute;
        top: 5px;
        right: 5px;
        background: none;
        border: none;
        font-size: 14px;
        color: #a50a06;
        cursor: pointer;
        transition: color 0.3s ease;
    }

    .btn-hide-modal-search:hover {
        color: #850805;
    }

    .icon-header-item i {
        color: white;
        font-size: 16px;
    }


</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:url var="homeUrl" value="HomeController"></c:url>
<c:url var="shopUrl" value="ViewAllController"></c:url>
<c:url var="blogUrl" value="blog"></c:url>
<c:url var="aboutUrl" value="AboutUsController"></c:url>
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar"style="background-color: #a50a06;">
            <div class="content-topbar flex-sb-m h-full container" >
                <div class="left-top-bar">
                    Giao hàng toàn quốc, Freeship HCM
                </div>
                <div class="right-top-bar flex-w h-full">
                    <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-phone me-2"></i>0704 728 952</a>
                    <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-envelope me-2"></i>healthymeatball@gmail.com</a>
                    <a href="https://www.facebook.com/meoeatclean" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-facebook"></i></a>
                    <a href="http://shopee.vn/healthy_meatball_anngondangdep" class="flex-c-m trans-04 p-lr-25"><img style="width:100%;height: 44%" src="./icons/shopee-svgrepo-com.png"/></a>
                </div>
            </div>
        </div>

        <div class="wrap-menu-desktop" style="background-color: rgba(33, 45, 57, 0.8);">
            <nav class="limiter-menu-desktop container">
                <!-- Logo desktop -->		
                <a href="${homeUrl}" class="logo" style="height: 140%">
                <img  src="./img/logo2.png" alt="IMG-LOGO">
            </a>

            <!-- Menu desktop -->
            <div class="menu-desktop">
                <ul class="main-menu">
                    <li class="${sessionScope.destPage eq "home" ? "active-menu" : ""}">
                        <a style="color: #FFF" href="${homeUrl}" class="text-decoration-none">Trang Chủ</a>
                    </li>

                    <li class="${sessionScope.destPage eq "product" ? "active-menu" : ""}">
                        <a style="color: #FFF" href="${shopUrl}" class="text-decoration-none">Sản Phẩm</a>
                    </li>

                    <li class="${sessionScope.destPage eq "blog" ? "active-menu" : ""}">
                        <a  style="color: #FFF"href="${blogUrl}" class="text-decoration-none">Blog</a>
                    </li>

                    <li class="${sessionScope.destPage eq "about" ? "active-menu" : ""}">
                        <a style="color: #FFF"href="${aboutUrl}" class="text-decoration-none">Giới Thiệu</a>
                    </li>

                    <c:if test="${not empty sessionScope.LOGIN_USER && sessionScope.LOGIN_USER.role eq 0}">
                        <li class="${sessionScope.destPage eq "user" ? "active-menu" : ""}">
                            <a style="color: #FFF" href="UserHomeController" class="text-decoration-none">Tài Khoản</a>
                        </li>
                        <li class="${sessionScope.destPage eq "order" ? "active-menu" : ""}">
                            <a style="color: #FFF" href="UserViewOrderController" class="text-decoration-none">Đặt Hàng</a>
                        </li>
                    </c:if>
                </ul>
            </div>	

            <!-- Icon header -->
            <div class="wrap-icon-header flex-w flex-r-m">
                <div class="container-search-header">
                    <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                    </button>
                    <form action="SearchController" class="wrap-search-header flex-w p-l-15">
                        <button class="flex-c-m trans-04">
                            <i class="zmdi zmdi-search"></i>
                        </button>
                        <input class="plh3" type="text" name="keyword" value="${requestScope.keyword}" placeholder="Search..." required>
                        <select class="plh3" name="searchby">
                            <option value="byname" ${requestScope.searchby eq "byname" ? "selected" : ""}>Name</option>
                            <option value="bycategory" ${requestScope.searchby eq "bycategory" ? "selected" : ""}>Category</option>
                        </select>
<!--                        <div class="text-center w-100">
                            <button type="submit">Search</button>
                        </div>-->
                    </form>
                </div>
                <div id="cartNumPC" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0) ? "0" : sessionScope.carts.size()}">
                    <i class="zmdi zmdi-shopping-cart"></i>
                </div>
                <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-login">
                    <i class="zmdi zmdi-account-o"></i>
                </div>
            </div>

        </nav>
    </div>	
</div>

<!-- Header Mobile -->
<div class="wrap-header-mobile">
    <!-- Logo Moblie -->		
    <div class="logo-mobile">
        <a href="${homeUrl}"><img src="./images/logo-3.png" alt="IMG-LOGO"></a>
    </div>

    <!-- Icon header -->
    <div class="wrap-icon-header flex-w flex-r-m m-r-15">
        <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
        </div>

        <div id="cartNumMB" class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="${(sessionScope.carts == null) || (sessionScope.carts.size() == 0) ? "0" : sessionScope.carts.size()}">
            <i class="zmdi zmdi-shopping-cart"></i>
        </div>

        <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-login">
            <i class="zmdi zmdi-account-o"></i>
        </div>
    </div>

    <!-- Button show menu -->
    <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
        <span class="hamburger-box">
            <span class="hamburger-inner"></span>
        </span>
    </div>
</div>

<!-- Menu Mobile -->
<div class="menu-mobile">
    <ul class="topbar-mobile p-0">
        <li>
            <div class="left-top-bar">
                Free shipping for standard order over $100
            </div>
        </li>

        <li>
            <div class="right-top-bar flex-w h-full">
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-phone me-2"></i>+84 123456789</a>
                <a class="text-decoration-none flex-c-m trans-04 p-lr-25" href="#"><i class="bi bi-envelope me-2"></i>info@myflower.com</a>
            </div>
        </li>
        <li>
            <div class="right-top-bar flex-w h-full">
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-facebook"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-twitter"></i></a>
                <a href="#" class="flex-c-m trans-04 p-lr-25"><i class="bi bi-instagram"></i></a>
            </div>
        </li>
    </ul>
    <ul class="main-menu-m">
        <li><a href="${homeUrl}" class="text-decoration-none">Home</a></li>
        <li><a href="${shopUrl}" class="text-decoration-none">Shop</a></li>
        <li><a href="${blogUrl}" class="text-decoration-none">Blog</a></li>
        <li><a href="${aboutUrl}" class="text-decoration-none">About</a></li>
    </ul>
</div>

<!-- Modal Search -->