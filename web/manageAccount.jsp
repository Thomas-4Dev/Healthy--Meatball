<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tlds/mytaglib.tld"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Manage Account</title>
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
            #adminAccountTable,
            #activeUserAccountTable,
            #inactiveUserAccountTable {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            /* Đầu bảng */
            #adminAccountTable thead th,
            #activeUserAccountTable thead th,
            #inactiveUserAccountTable thead th {
                background-color: #a50a06;
                color: white;
                text-align: left;
                padding: 10px;
                border-bottom: 2px solid #ddd;
            }

            /* Các ô trong bảng */
            #adminAccountTable tbody td,
            #activeUserAccountTable tbody td,
            #inactiveUserAccountTable tbody td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            /* Các dòng chẵn trong bảng */
            #adminAccountTable tbody tr:nth-child(even),
            #activeUserAccountTable tbody tr:nth-child(even),
            #inactiveUserAccountTable tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            /* Hiệu ứng khi hover trên dòng */
            #adminAccountTable tbody tr:hover,
            #activeUserAccountTable tbody tr:hover,
            #inactiveUserAccountTable tbody tr:hover {
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
                        <h1 class="mt-4">Quản Lý Tài Khoản</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Tất cả tài khoản trong hệ thống</li>
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
                        <!-- Admin Account Table -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Tài khoản ADMIN
                            </div>
                            <div class="card-body">
                                <table id="adminAccountTable">
                                    <thead>
                                        <tr>
                                            <tag:thAccountTable/>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="LA">
                                            <c:if test="${LA.role eq 1}">
                                                <tr>
                                                    <td>${LA.accId}</td>
                                                    <td>${LA.email}</td>
                                                    <td>${LA.fullName}</td>
                                                    <td>${LA.password}</td>
                                                    <td>${not empty LA.phone ? LA.phone : "Null"}</td>
                                                    <td><span style="color: blue;">Active</span></td>
                                                    <td>Admin</td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Active User Account Table -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Tài khoản USER
                            </div>
                            <div class="card-body">
                                <table id="activeUserAccountTable">
                                    <thead>
                                        <tr>
                                            <tag:thAccountTable/>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                   
                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="LA">
                                            <c:if test="${LA.status eq 1 and LA.role eq 0}">
                                                <tr>
                                                    <td>${LA.accId}</td>
                                                    <td>${LA.email}</td>
                                                    <td>${LA.fullName}</td>
                                                    <td>${LA.password}</td>
                                                    <td>${LA.phone}</td>
                                                    <td><span style="color: blue;">Active</span></td>
                                                    <td>User</td>
                                                    <td>
                                                        <!-- Block btn -->
                                                        <span>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-outline-danger w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${LA.accId}">
                                                                Block
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="blockBtn${LA.accId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Cảnh báo</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="p-4 text-center fs-3"
                                                                             style="color: red;">
                                                                            Bạn đang chặn người dùng có tên "<span class="text-dark">${LA.fullName}</span>" có email là "<span class="text-dark">${LA.email}</span>"
                                                                        </div>
                                                                        <form action="UpdateAccountController" method="POST">
                                                                            <input type="hidden" name="email" value="${LA.email}"/>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                                                <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="blockAccount">Yes</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- Inactive User Account Table -->
                        <div class="card mb-4">
                            <div class="card-header fw-bold">
                                <i class="bi bi-table"></i>
                                Tài khoản USER đã chặn
                            </div>
                            <div class="card-body">
                                <table id="inactiveUserAccountTable">
                                    <thead>
                                        <tr>
                                            <tag:thAccountTable/>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                        <c:forEach items="${requestScope.listAccounts}" var="LA">
                                            <c:if test="${LA.status eq 0 and LA.role eq 0}">
                                                <tr>
                                                    <td>${LA.accId}</td>
                                                    <td>${LA.email}</td>
                                                    <td>${LA.fullName}</td>
                                                    <td>${LA.password}</td>
                                                    <td>${LA.phone}</td>
                                                    <td><span style="color: blue;">Active</span></td>
                                                    <td>User</td>
                                                    <td>
                                                        <!-- Block btn -->
                                                        <span>
                                                            <!-- Button trigger modal -->
                                                            <button type="button" class="btn btn-outline-success w-100" data-bs-toggle="modal" data-bs-target="#blockBtn${LA.accId}">
                                                                Unblock
                                                            </button>
                                                            <!-- Modal -->
                                                            <div class="modal fade" id="blockBtn${LA.accId}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Alert</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="p-4 text-center fs-3"
                                                                             style="color: red;">
                                                                            You are doing unblocking a user named "<span class="text-dark">${LA.fullName}</span>" with email as "<span class="text-dark">${LA.email}</span>"
                                                                        </div>
                                                                        <form action="UpdateAccount" method="POST">
                                                                            <input type="hidden" name="email" value="${LA.email}"/>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                                                                <button id="update-profile-btn" type="submit" class="btn btn-danger" name="action" value="unblockAccount">Yes</button>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </c:if>
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
