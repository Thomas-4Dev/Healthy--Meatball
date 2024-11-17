<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content=""/>
        <meta name="author" content=""/>
        <title>Personal</title>
        <!-- Favicon -->
        <link rel="icon" type="image/x-icon" href="./images/favicon.png"/>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/my-styles.css" rel="stylesheet">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <style>
            /* Định dạng cho thông tin tài khoản */
            .container.mb-5 {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .container h1 {
                font-size: 28px;
                font-weight: bold;
            }

            .container h3 {
                font-size: 24px;
                font-weight: bold;
            }

            .container .text-warning {
                color: #d72a14;
            }

            .container .fw-bold {
                font-weight: bold;
            }

            .container .fw-lighter {
                font-weight: lighter;
            }

            .container .btn-outline-info {
                border-color: #d72a14;
                color: #d72a14;
                transition: all 0.3s;
            }

            .container .btn-outline-info:hover {
                background-color: #d72a14;
                color: white;
            }

            .container .btn-outline-secondary {
                border-color: #6c757d;
                color: #6c757d;
                transition: all 0.3s;
            }

            .container .btn-outline-secondary:hover {
                background-color: #6c757d;
                color: white;
            }

            .modal .modal-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #ddd;
            }

            .modal .modal-footer {
                background-color: #f8f9fa;
                border-top: 1px solid #ddd;
            }

            .modal .modal-title {
                font-size: 20px;
                font-weight: bold;
            }

            .modal .form-label {
                font-weight: bold;
            }

            .modal .form-control {
                border-radius: 4px;
                border: 1px solid #ced4da;
            }

            .modal .form-control:focus {
                border-color: #d72a14;
                box-shadow: 0 0 0 0.2rem rgba(215, 42, 20, 0.25);
            }

            .alert {
                font-size: 14px;
            }

            .alert-success {
                background-color: #d4edda;
                border-color: #c3e6cb;
                color: #155724;
            }

            .alert-danger {
                background-color: #f8d7da;
                border-color: #f5c6cb;
                color: #721c24;
            }

        </style>
    </head>

    <body class="animsition">
        <!-- Home Menu -->
        <%@include file="components/headerComponent.jsp" %>
        <!-- Sub-nav personal page -->
        <div id="search-nav" class="d-flex align-items-center">
            <div class="container text-center">
                <span class="body">
                    <a class="home-page text-white text-decoration-none" href="HomeController">Trang Chủ</a>
                    <span class="open-icon txt-m-bold text-white"><i class="bi bi-caret-right-fill"></i></span>
                    <span class="txt-m-bold txt-orange default-cursor text-warning">Tài Khoản</span>
                </span>
            </div>
        </div>
        <!-- Personal Session -->
        <div class="container mb-5">
            <h1 class="pb-3 default-cursor text-black">Xin chào, <span class="text-warning">${sessionScope.LOGIN_USER.fullName}</span>!</h1>
            <section>
                <div class="container">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-9 col-lg-7 col-xl-6 mb-4 text-black">
                            <h3 class="text-uppercase text-center mb-4 default-cursor">
                                Thông Tin Tài Khoản
                            </h3>
                            <div class="mb-3 fw-bold">
                                Tên người dùng: <span class="fw-lighter">${sessionScope.LOGIN_USER.fullName}</span>
                            </div>
                            <div class="mb-3 fw-bold">
                                Email: <span class="fw-lighter">${sessionScope.LOGIN_USER.email}</span>
                            </div>
                            <div class="mb-3 fw-bold">
                                SĐT: <span class="fw-lighter">${sessionScope.LOGIN_USER.phone}</span>
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
                                                <h5 class="modal-title" id="exampleModalLabel">Cập nhật tài khoản</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div id="update-profile-error" class="form-outline mt-3 fst-italic text-center"
                                                 style="color: red; font-size: 18px;"></div>
                                            <form action="UpdateUserController" method="POST" id="update-form">
                                                <div class="modal-body">
                                                    <!-- Email -->
                                                    <div class="form-outline mb-3">
                                                        <label class="form-label" for="register-mail-input">Email của bạn</label>
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
                                                    <button id="update-profile-btn" type="submit" class="btn btn-primary" name="action" value="updateInfo">Lưu thay đổi</button>
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
                                                <h5 class="modal-title" id="exampleModalLabel">Đổi mật khẩu</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div id="change-psw-error" class="form-outline mt-3 fst-italic text-center"
                                                 style="color: red; font-size: 18px;"></div>
                                            <form action="UpdateUserController" method="POST" id="change-psw-form">
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
                                                        <label class="form-label" for="rp-new-psw-input">Nhập lại mật khẩu mới 
                                                            <span style="color: red; font-weight: bold">*</span></label>
                                                        <input id="rp-new-psw-input" class="form-control form-control-lg"
                                                               data-toggle="password" class="form-control" type="password" maxlength="50" placeholder="Nhập lại mật khẩu mới" required>
                                                    </div>
                                                    <div id="rp-new-psw-input-error" class="form-outline mb-2 fst-italic"
                                                         style="margin-top: -10px; color: red; font-size: 14px;">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                    <button id="change-psw-btn" type="submit" class="btn btn-primary" name="action" value="changePassword">Lưu thay đổi</button>
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

        <%@include file="components/footerComponent.jsp" %>
        <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS -->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/my-user.js"></script>
        <!-- Jquery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Home Slider JS -->
        <script src="vendor/slick/slick.min.js"></script>
        <script src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script>
            $('.js-pscroll').each(function () {
                $(this).css('position', 'relative');
                $(this).css('overflow', 'hidden');
                var ps = new PerfectScrollbar(this, {
                    wheelSpeed: 1,
                    scrollingThreshold: 1000,
                    wheelPropagation: false,
                });

                $(window).on('resize', function () {
                    ps.update();
                })
            });
        </script>
        <!-- Main -->
        <script src="js/main.js"></script>
    </body>

</html>
