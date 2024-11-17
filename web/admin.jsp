<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Dashboard</title>
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
            #accountsTable, #ordersTable, #productsTable {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            /* Đầu bảng */
            #accountsTable thead th, #ordersTable thead th, #productsTable thead th {
                background-color: #a50a06;
                color: white;
                text-align: left;
                padding: 10px;
                border-bottom: 2px solid #ddd;
            }

            /* Các ô trong bảng */
            #accountsTable tbody td, #ordersTable tbody td, #productsTable tbody td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            /* Các dòng chẵn trong bảng */
            #accountsTable tbody tr:nth-child(even), #ordersTable tbody tr:nth-child(even), #productsTable tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Hiệu ứng khi hover trên dòng */
            #accountsTable tbody tr:hover, #ordersTable tbody tr:hover, #productsTable tbody tr:hover {
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

            /* Style cho nút */
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

            /* Layout adjustments */
            #layoutSidenav .container-fluid {
                margin-top: 50px;
                margin-bottom: 50px;
            }

            #layoutSidenav_content main {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .breadcrumb-item.active {
                font-weight: bold;
            }

        </style>
    </head>
    <body class="sb-nav-fixed">
        <!-- Admin navbar -->
        <%@include file="components/adminNavBarComponent.jsp" %>
        <div id="layoutSidenav">
            <!-- Admin Slidenav -->
            <%@include file="components/adminSlideNavComponent.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Tổng Quan</li>
                        </ol>
                        <!-- Account Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Danh sách tài khoản
                            </div>
                            <div class="card-body">
                                <table id="accountsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Email</th>
                                            <th>Name</th>
                                            <th>Password</th>
                                            <th>Phone</th>
                                            <th>Status</th>
                                            <th>Role</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="LA">
                                            <tr>
                                                <td>${LA.accId}</td>
                                                <td>${LA.email}</td>
                                                <td>${LA.fullName}</td>
                                                <td>${LA.password}</td>
                                                <td>${LA.phone}</td>
                                                <c:choose>
                                                    <c:when test="${LA.status == 1}">
                                                        <td style="color: blue;">Active</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">inActive</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <c:choose>
                                                    <c:when test="${LA.role == 1}">
                                                        <td style="color: purple;">Admin</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>User</td>
                                                    </c:otherwise>
                                                </c:choose>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Orders Table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Đơn hàng
                            </div>
                            <div class="card-body">
                                <table id="ordersTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Order Date</th>
                                            <th>Ship Date</th>
                                            <th>SĐT</th>
                                            <th>Note</th>
                                            <th>Total Price</th>
                                            <th>Acc Id</th>
                                            <th>Status</th>
                                            <th>Shipping Id</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listOrders}" var="LO">
                                            <tr>
                                                <td>${LO.orderId}</td>
                                                <td>${LO.orderDate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${not empty LO.shipDate}">
                                                            ${LO.shipDate}
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="fst-italic">Null</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${sessionScope.LOGIN_USER.phone}</td> 
                                                <td>${LO.note}</td>
                                                <td>$${LO.totalPrice}</td>
                                                <td>${LO.accId}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${LO.status == 1}">
                                                            <span class="text-warning">Processing</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 2}">
                                                            <span class="text-primary">Completed</span>
                                                        </c:when>
                                                        <c:when test="${LO.status == 3}">
                                                            <span class="text-danger">Canceled</span>
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${LO.shippingId}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- product table -->
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="bi bi-table"></i>
                                Danh sách sản phẩm
                            </div>
                            <div class="card-body">
                                <table id="productsTable">
                                    <thead>
                                        <tr>
                                            <th>Id</th>
                                            <th>Name</th>
                                            <th style="width: 100px;">Image</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                            <th>Category</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.listProducts}" var="LP">
                                            <tr>
                                                <td>${LP.id}</td>
                                                <td>${LP.name}</td>
                                                <td style="width: 100px;"><img src="${LP.imgPath}" style="width: 50%;"></td>
                                                <td>$${LP.price}</td>
                                                <td>${LP.description}</td>
                                                <c:choose>
                                                    <c:when test="${LP.status == 1}">
                                                        <td style="color: blue;">Available</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td style="color: red;">Unavailable</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>
                                                    ${sessionScope.listCategories.get(LP.categoryId)}
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
        <script src="demo/chart-area-demo.js"></script>
        <script src="demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
