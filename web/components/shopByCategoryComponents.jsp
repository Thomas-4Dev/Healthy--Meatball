<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section class="pt-4 shop-by-category text-black">
    <div class="d-flex align-items-center justify-content-center default-cursor fs-1 section-title">
        <hr class="d-inline-block me-3" width="20%" />
        Các Loại Sản Phẩm
        <hr class="d-inline-block ms-3" width="20%" />
    </div>
    <div class="container px-4 px-lg-5 mt-4">
        <div class="row content d-flex align-items-center justify-content-center">
            <c:forEach items="${sessionScope.listCategories}" var="cate" begin="0" end="3" step="1" varStatus="count">
                <c:url var="mylink" value="ViewAllController">
                    <c:param name="category" value="${cate.key}"></c:param>
                </c:url>
                <a href="${mylink}" class="col-6 col-lg-3 d-flex align-items-center justify-content-end position-relative">
                    <div class="title position-absolute">${cate.value}</div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
