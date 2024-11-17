<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.LOGIN_USER}">

    <div class="subcribe-receive-email text-black">
        <div class="layer">
            <div class="container">
                <form style="margin-left: 100px;" id="form-subscribe" class="text-center pt-5 pb-5" onsubmit="return false">
                    <div class="text-uppercase title default-cursor mb-4">
                        <hr class="d-inline-block me-3" width="10%" />
                        Theo dõi ngay!
                        <hr class="d-inline-block me-3" width="10%" />
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mt-4 mb-4 label default-cursor">Nhận thông tin cập nhật qua email về các ưu đãi đặc biệt của chúng tôi:</div>
                            <div class="mb-3">
                                <input id="emailSubscribe" name="email" type="email" placeholder="Email của bạn..." value="" required/>
                            </div>
                            <button style="background-color:#a50a06; " onclick="subscribeNewsLetter()" id="subscribeEmail" class="btn-subs" type="submit" value="subscribeEmail" >Đăng Ký</button>
                        </div>

                        <div class="col-md-6" style="text-align: left;">
                            <h4><img style ="width: 4%;"src="./icons/clock-two-svgrepo-com.png"/>Giờ Hoạt Động</h3>
                            <h5 style ="margin-bottom: 8px;"style="color: green;">Luôn mở cửa</h4>

                            <h4><img style ="width: 3%;margin-bottom: 3px;"src="./icons/location-pin-svgrepo-com.png"/>Địa Chỉ</h3>
                            <p style ="margin-bottom: 8px;" >87 Nguyễn Đình Chính, P15, Phú Nhuận, HCM, Ho Chi Minh City, Vietnam.</p>
                            
                            <h4><img style ="width: 3%;margin-bottom: 3px;"src="./icons/home-svgrepo-com.png"/>Nhà Máy Sản Xuất</h3>
                            <p style ="margin-bottom: 8px;" >Tổ 2, Ấp Tân Quang, Hiếu Phụng, Vũng Liêm, Vĩnh Long.</p>

                            <h4><img style ="width: 3%;margin-bottom: 3px;"src="./icons/star-alt-3-svgrepo-com.png"/>Tiêu Chí</h3>
                            <p style ="margin-bottom: 2px;">🌟Nhà Máy Sản Xuất đạt chuẩn ATVSTP.</p>
                            <p style ="margin-bottom: 2px;">🌟Tin dùng bởi Gymer VĐV chuyên nghiệp.</p>
                            <p style ="margin-bottom: 2px;">🌟Giao hàng nhanh chóng.</p>
                            <p style ="margin-bottom: 2px;">🌟Hương vị chuẩn đầu bếp 5 sao.</p>
                            <p style ="margin-bottom: 2px;">🌟Hoàn toàn từ thịt và gia vị Eat Clean.</p>
                            
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</c:if>