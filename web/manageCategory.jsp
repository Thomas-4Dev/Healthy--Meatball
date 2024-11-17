<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Manage Category</title>
        <style>
            /* Tổng quan cho thẻ card */
            .card {
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            /* Header của card */
            .card-header {
                background-color: #f8f9fa;
                border-bottom: 1px solid #ddd;
                font-weight: bold;
                padding: 10px 15px;
                font-size: 1.1em;
            }

            /* Bảng */
            #productsTable {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            /* Đầu bảng */
            #productsTable thead th {
                background-color: #a50a06;
                color: white;
                text-align: left;
                padding: 10px;
                border-bottom: 2px solid #ddd;
            }

            /* Các ô trong bảng */
            #productsTable tbody td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            /* Các dòng chẵn trong bảng */
            #productsTable tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Hiệu ứng khi hover trên dòng */
            #productsTable tbody tr:hover {
                background-color: #e9ecef;
            }

            /* Style cho các trạng thái */
            td[style*="color: blue;"] {
                color: #a50a06;
                font-weight: bold;
            }

            td[style*="color: red;"] {
                color: #a50a06;
                font-weight: bold;
            }

            td[style*="color: purple;"] {
                color: #a50a06;
                font-weight: bold;
            }
            
            .btn-primary {
                background-color: #a50a06;
                border-color: #a50a06;
            }

            .btn-primary:hover,
            .btn-primary:focus,
            .btn-primary:active {
                background-color: #850805;
                border-color: #850805;
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content" class="row">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Quản Lý Phân Loại Sản Phẩm</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Tất cả danh mục hiện tại trong hệ thống</li>
                        </ol>
                        <c:choose>
                            <c:when test="${not empty requestScope.MSG_SUCCESS}">
                                <div class="alert alert-success fs-3" role="alert">
                                    ${requestScope.MSG_SUCCESS}
                                </div>
                            </c:when>
                            <c:when test="${not empty requestScope.MSG_ERROR}">
                                <div class="alert alert-danger fs-3" role="alert">
                                    ${requestScope.MSG_ERROR}
                                </div>
                            </c:when>
                        </c:choose>
                        <!-- Category table -->
                        <div class="card mb-4 col-12 col-md-8">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Tất cả danh mục
                                <!-- Block btn -->
                                <span class="float-end">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#blockBtnXYZC">
                                        <i class="bi bi-plus-square"></i> Thêm loại mới
                                    </button>
                                    <!-- Modal -->
                                    <div class="modal fade" id="blockBtnXYZC" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Loại mới</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="UpdateCategoryController" method="POST">
                                                    <div class="modal-body">
                                                        <div class="form-outline mb-3">
                                                            <label class="form-label" for="name3Example">Tên <span style="color: red; font-weight: bold">*</span></label>
                                                            <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                   required name="cateName"/>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                                        <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="createCategory">Tạo</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </span>
                            </div>
                            <div class="card-body">
                                <table id="productsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sessionScope.listCategories}" var="LC">
                                            <tr>
                                                <td>${LC.key}</td>
                                                <td>${LC.value}</td>
                                                <td>
                                                    <!-- Block btn -->
                                                    <span>
                                                        <!-- Button trigger modal -->
                                                        <button type="button" class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${LC.key}">
                                                            Cập nhật
                                                        </button>
                                                        <!-- Modal -->
                                                        <div class="modal fade" id="blockBtn${LC.key}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">Category Information</h5>
                                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                    </div>
                                                                    <form action="UpdateCategoryController" method="POST">
                                                                        <div class="modal-body">
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="id3Example">Id</label>
                                                                                <input type="text" id="id3Example" class="form-control form-control-lg" name="cateId" value="${LC.key}" readonly/>
                                                                            </div>
                                                                            <div class="form-outline mb-3">
                                                                                <label class="form-label" for="name3Example">Name <span style="color: red; font-weight: bold">*</span></label>
                                                                                <input type="text" id="name3Example" class="form-control form-control-lg"
                                                                                       required name="cateName" value="${LC.value}"/>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                            <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="updateCategory">Update</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!-- Footer -->
                <jsp:include page="components/adminFooter.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
