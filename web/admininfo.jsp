<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Information</title>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <!-- Personal Session -->
                    <div class="container mt-5 mb-5">
                        <h1 class="pb-3 default-cursor">Xin Chào, <span class="text-warning">${sessionScope.LOGIN_USER.fullName}</span>!</h1>
                        <section>
                            <div class="container">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mb-4">
                                        <h3 class="text-uppercase text-center mb-4 default-cursor">
                                            Thông Tin Của Bạn
                                        </h3>
                                        <div class="mb-3 fw-bold">
                                            Tên: <span class="fw-lighter">${sessionScope.LOGIN_USER.fullName}</span>
                                        </div>
                                        <div class="mb-3 fw-bold">
                                            Email: <span class="fw-lighter">${sessionScope.LOGIN_USER.email}</span>
                                        </div>
                                        <div class="mb-3 fw-bold">
                                            SĐT <span class="fw-lighter">${sessionScope.LOGIN_USER.phone eq null ? "Null" : sessionScope.LOGIN_USER.phone}</span>
                                        </div>
                                        <!-- Change profile btn -->
                                        <span>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#changeProfileBtn">
                                                Cập nhật
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="changeProfileBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Cập nhật thông tin</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div id="update-profile-error" class="form-outline mt-3 fst-italic text-center"
                                                             style="color: red; font-size: 18px;"></div>
                                                        <form action="AdminInfoController" method="POST" id="update-form">
                                                            <div class="modal-body">
                                                                <!-- Email -->
                                                                <div class="form-outline mb-3">
                                                                    <label class="form-label" for="register-mail-input">Email</label>
                                                                    <input id="update-profile-mail-input" type="text"
                                                                           class="form-control form-control-lg" name="email" value="${sessionScope.LOGIN_USER.email}" readonly/>
                                                                </div>
                                                                <!-- Name -->
                                                                <div class="form-outline mb-3">
                                                                    <label class="form-label" for="form3Example1cg">Tên <span
                                                                            style="color: red; font-weight: bold">*</span></label>
                                                                    <input type="text" id="form3Example1cg" class="form-control form-control-lg"
                                                                           required placeholder="Nguyen Van A"
                                                                           name="name" value="${sessionScope.LOGIN_USER.fullName}"/>
                                                                </div>
                                                                <!-- Phone -->
                                                                <div class="form-outline mb-5">
                                                                    <label class="form-label" for="update-profile-input-phone">SĐT <span
                                                                            style="color: red; font-weight: bold">*</span></label>
                                                                    <input type="text" id="update-profile-input-phone" class="form-control form-control-lg"
                                                                           required placeholder="0791234xx"
                                                                           name="phone" value="${sessionScope.LOGIN_USER.phone}"/>
                                                                </div>
                                                                <div id="update-profile-input-phone-error" class="form-outline mb-2 fst-italic"
                                                                     style="margin-top: -35px; color: red; font-size: 14px;">
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                <button id="update-profile-btn" type="submit" class="btn btn-primary" name="action" value="updateInfo">Lưu</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                        <!-- Change password btn -->
                                        <span>
                                            <!-- Button trigger modal -->
                                            <button type="button" class="btn btn-outline-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                                Đổi mật khẩu
                                            </button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-dialog-centered">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Thay đổi mật khẩu</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div id="change-psw-error" class="form-outline mt-3 fst-italic text-center"
                                                             style="color: red; font-size: 18px;"></div>
                                                        <form action="AdminInfo" method="POST" id="change-psw-form">
                                                            <div class="modal-body">
                                                                <!-- Old password -->
                                                                <div class="form-outline mb-3">
                                                                    <label class="form-label" for="old-psw-input">Mật khẩu cũ <span
                                                                            style="color: red; font-weight: bold">*</span></label>
                                                                    <input id="old-psw-input" class="form-control form-control-lg"
                                                                           data-toggle="password" class="form-control" type="password" maxlength="50"
                                                                           placeholder="Mật khẩu cũ" required
                                                                           name="oldPassword">
                                                                </div>
                                                                <!-- New Password -->
                                                                <div class="form-outline mb-4">
                                                                    <label class="form-label" for="new-psw-input">Mật khẩu mới <span
                                                                            style="color: red; font-weight: bold">*</span></label>
                                                                    <input id="new-psw-input" class="form-control form-control-lg"
                                                                           data-toggle="password" class="form-control" type="password" maxlength="50"
                                                                           placeholder="Mật khẩu mới" required
                                                                           name="newPassword">
                                                                </div>
                                                                <div id="new-psw-input-error" class="form-outline mb-2 fst-italic"
                                                                     style="margin-top: -10px; color: red; font-size: 14px;">
                                                                </div>

                                                                <!-- Confirm Password -->
                                                                <div class="form-outline mb-4">
                                                                    <label class="form-label" for="rp-new-psw-input">Nhập lại mật khẩu
                                                                        <span style="color: red; font-weight: bold">*</span></label>
                                                                    <input id="rp-new-psw-input" class="form-control form-control-lg"
                                                                           data-toggle="password" class="form-control" type="password" maxlength="50" placeholder="Nhập lại mật khẩu" required>
                                                                </div>
                                                                <div id="rp-new-psw-input-error" class="form-outline mb-2 fst-italic"
                                                                     style="margin-top: -10px; color: red; font-size: 14px;">
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                                <button id="change-psw-btn" type="submit" class="btn btn-primary" name="action" value="changePassword">Lưu</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </span>
                                        <!-- Alert -->
                                        <c:choose>
                                            <c:when test="${not empty requestScope.MSG_SUCCESS}">
                                                <div class="alert alert-success mt-4" role="alert">
                                                    ${requestScope.MSG_SUCCESS}
                                                </div>
                                            </c:when>
                                            <c:when test="${not empty requestScope.MSG_ERROR}">
                                                <div class="alert alert-danger mt-4" role="alert">
                                                    ${requestScope.MSG_ERROR}
                                                </div>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/my-user.js"></script>
    </body>
</html>
