<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@include file="components/adminHeadComponent.jsp" %>
        <title>Admin - Mail</title>
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

            /* Alerts */
            .alert-success {
                background-color: #d4edda;
                color: #155724;
                border-color: #c3e6cb;
            }

            .alert-danger {
                background-color: #f8d7da;
                color: #721c24;
                border-color: #f5c6cb;
            }

            /* Forms */
            .form-group h4 {
                font-weight: bold;
                margin-bottom: 10px;
            }

            .form-control {
                border-radius: 8px;
                padding: 10px;
                border: 1px solid #ddd;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            /* Button */
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
            #layoutSidenav .container {
                margin-top: 50px;
                margin-bottom: 50px;
            }

            #layoutSidenav_content main {
                padding: 20px;
                background-color: #f8f9fa;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        <div id="layoutSidenav_content">
            <main>
                <div class="container mt-5 mb-5">
                    <h2>Gửi Mail</h2>
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
                    <form action="SendEmailController">
                        <div class="form-group pt-3">
                            <h4 for="exampleFormControlInput1">Gửi đến: </h4>
                            <input name="email" type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" required>
                        </div>
                        <div class="form-group pt-3">
                            <h4 for="subjectFormControlInput1">Tiêu đề: </h4>
                            <input name="subject" type="text" class="form-control" id="subjectFormControlInput1" placeholder="......" required>
                        </div>
                        <div class="form-group pt-3">
                            <h4 for="exampleFormControlTextarea1">Tin nhắn: </h4>
                            <textarea name="message" class="form-control" id="exampleFormControlTextarea1" rows="10" required>
Gửi ....,
                                
...
Cảm ơn!
                            </textarea>
                        </div>
                        <button type="submit" name="action" value="sendEmailToCust" class="btn btn-primary mt-4" style="width: 100px;">Send</button>
                    </form>
                </div>
            </main>
            <!-- Footer -->
            <jsp:include page="components/adminFooter.jsp"></jsp:include>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/scripts.js"></script>
</body>

</html>
