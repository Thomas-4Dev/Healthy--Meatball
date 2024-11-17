<meta charset="UTF-8">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: rgba(33, 45, 57, 0.8);">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link ${requestScope.destPage eq "dashboard" ? "active" : ""}" href="AdminHomeController">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                </a>
                <div class="sb-sidenav-menu-heading">Manage</div>
                <a class="nav-link ${requestScope.destPage eq "manageOrder" ? "active" : ""}" href="AdminManageOrderController">
                    <i class="bi bi-basket sb-nav-link-icon"></i>
                    Đơn Hàng
                </a>
                <a class="nav-link ${requestScope.destPage eq "manageAccount" ? "active" : ""}" href="AdminManageAccountController">
                    <i class="bi bi-person-lines-fill sb-nav-link-icon"></i>
                    Tài Khoản
                </a>
                <a class="nav-link ${requestScope.destPage eq "manageProduct" ? "active" : ""}" href="AdminManageProductController">
                    <i class="bi bi-tree sb-nav-link-icon"></i>
                    Sản Phẩm
                </a>
                <a class="nav-link ${requestScope.destPage eq "manageCategory" ? "active" : ""}" href="AdminManageCategoryController">
                    <i class="bi bi-tags sb-nav-link-icon"></i>
                    Phân Loại
                </a>
            </div>
        </div>
        <div class="sb-sidenav-footer">
            <div class="small">Đăng nhập bằng: </div>
            Admin
        </div>
    </nav>
</div>