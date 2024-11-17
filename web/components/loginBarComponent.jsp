<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrap-header-cart js-panel-login">
    <div class="s-full js-hide-cart"></div>
    <c:choose>
        <c:when test="${not empty sessionScope.LOGIN_USER}">
            <!-- Logged in -->
            <div class="header-cart flex-col-l p-l-35 p-r-25">
                <div class="header-login-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Người Dùng
                    </span>
                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>
                <h1 class="text-black">Xin Chào,</h1>
                <h1>
                    <span class="nametxt text-warning">${sessionScope.LOGIN_USER.fullName}</span>!
                </h1>
                <div class="dropdown-divider"></div>
                <div class="header-login-title pt-4" style="height: 400px;">
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2" href="UserHomeController"><i class="bi bi-gear-fill"></i> Thông Tin</a>
                    </span>
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2 mt-3 mb-3" href="UserViewOrderController"><i class="bi bi-kanban"></i> Đặt Hàng</a>
                    </span>
                    <span class="mtext-103 cl2 w-full">
                        <a class="dropdown-item p-0 pt-2 pb-2 ps-2" href="LogoutController"><i class="bi bi-box-arrow-right"></i> Đăng Xuất</a>
                    </span>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <!-- UnLogin -->
            <div class="header-cart flex-col-l p-l-35 p-r-25">
                <div class="header-login-title flex-w flex-sb-m p-b-8">
                    <span class="mtext-103 cl2">
                        Đăng Nhập
                    </span>

                    <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                        <i class="zmdi zmdi-close"></i>
                    </div>
                </div>

                <div class="header-login-content js-pscroll">
                    <!-- Unlog in -->
                    <form action="LoginController" method="POST" class="w-100 p-l-10 p-r-30">
                        <div class="mb-3">
                            <label for="exampleDropdownFormEmail1" class="form-label">Email Của bạn</label>
                            <input name="email" type="email" class="form-control" id="exampleDropdownFormEmail1"
                                   placeholder="Nhập email">
                        </div>
                        <div class="mb-3">
                            <label for="exampleDropdownFormPassword1" class="form-label">Mật Khẩu</label>
                            <input name="password" type="password" class="form-control" id="exampleDropdownFormPassword1"
                                   placeholder="Nhập mật khẩu">
                        </div>
                        <div class="mb-3">
                            <input name="remember" value="true" type="checkbox" class="d-inline"> Remember me
                        </div>
                        <button type="submit" class="btn btn-primary">Đăng nhập</button>
                    </form>
                    <!-- Login Google Button -->
                    <div class="mt-3">
                        Hoặc đăng nhập bằng
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/FlowerShop/LoginGoogleController&response_type=code
                           &client_id=1063985034301-03cecevenstd13h2o75brk09j5qj1u0i.apps.googleusercontent.com&approval_prompt=force"
                           class="btn btn-danger text-white ms-4"><i class="bi bi-google"></i> Google</a>
                    </div>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="RegistrationController">Bạn chưa có tài khoản? Đăng ký</a>
                    <a class="dropdown-item" href="#">Quên mật khẩu?</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>