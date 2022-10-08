<%--
  Created by IntelliJ IDEA.
  User: nhats
  Date: 03/09/2022
  Time: 9:56 CH
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<header class="bg-gradient-dark">
    <div class="page-header min-vh-75"
         style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80')">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center mx-auto my-auto">
                    <h1 class="text-white">Chuyến xe cho mọi nhà</h1>
                    <p class="lead mb-4 text-white opacity-8">Mang đến cho quý khách hàng những trải nghiệm tốt nhất</p>
                    <h6 class="text-white mb-2 mt-5">Find us on</h6>
                    <div class="d-flex justify-content-center">
                        <a href=""><i class="fab fa-facebook text-lg text-white me-4"></i></a>
                        <a href=""><i class="fab fa-instagram text-lg text-white me-4"></i></a>
                        <a href=""><i class="fab fa-google-plus text-lg text-white"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -------- END HEADER 7 w/ text and video ------- -->
<div class="card card-body shadow-xl mx-3 mx-md-4 mt-n6">
    <!-- Section with four info areas left & one card right with image and waves -->
    <section class="py-lg-5">
        <div class="container">
            <div class="row">
                <div class="row">
                    <div class="col-lg-6 mx-auto text-center pb-4">
                        <h4 class="text-gradient text-info">Chất lượng dịch vụ Ticket</h4>
                        <h1 class="text-gradient text-primary"> <span id="state2" countto="24">24</span>/7</h1>
                        <p class="lead">Chúng tôi không ngừng cố gắng nâng cao chất lượng dịch vụ và hiện thực hóa ước mơ của bạn trên mọi chuyến đi</p>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-lg-4 col-md-6">
                        <div class="p-3 text-center">
                            <i class="material-icons text-gradient text-info text-5xl">groups</i>
                            <h5 class="mt-2">+2000 Khách hàng</h5>
                            <p class="mb-0">Số lượng 2000 vé bán ra đồng nghĩa việc an toàn trên mỗi chuyến đi của khách hàng luôn đặt lên hàng đầu</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="p-3 text-center">
                            <i class="material-icons text-gradient text-info text-5xl">support_agent</i>
                            <h5 class="mt-2">Hỗ trợ 24/7</h5>
                            <p class="mb-0">Chúng tôi luôn luôn sẵn sàng phục vụ hỗ trợ cho bạn</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mx-md-auto">
                        <div class="p-3 text-center">
                            <i class="material-icons text-gradient text-info text-5xl">update</i>
                            <h5 class="mt-2">Tìm kiếm mọi nơi</h5>
                            <p class="mb-0">Đội ngũ Car Ticket luôn luôn tìm những chuyến đi mới nhất</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-sm-0 mt-5">
                <div class="col-lg-3 col-md-4 position-relative ms-lg-auto">
                    <div class="p-3 text-center border-right-after">
                        <i class="material-icons text-gradient text-info text-5xl mb-3">email</i>
                        <h6 class="mb-0">Email</h6>
                        <p class="text-dark font-weight-normal">1951012104Sang@ou.edu.vn</p>
                        <p class="text-dark font-weight-normal">1951012083Nguyen@ou.edu.vn</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 position-relative">
                    <div class="p-3 text-center border-right-after">
                        <i class="material-icons text-gradient text-info text-5xl mb-3">call</i>
                        <h6 class="mb-0">Phone</h6>
                        <p class="text-dark font-weight-normal">0921 288 154 </p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 me-lg-auto">
                    <div class="p-3 text-center">
                        <i class="material-icons text-gradient text-info text-5xl mb-3">contacts</i>
                        <h6 class="mb-0">Contact</h6>
                        <p class="text-dark font-weight-normal">Car Ticket</p>
                    </div>
                </div>
            </div>
        </div>
        <section class="py-md-7 py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-8 col-10 mx-auto text-center">
                        <div class="mb-md-5">
                            <h3>Contact us</h3>
                            <p>
                                Đối với các yêu cầu phản hồi từ khách hàng, chúng tôi sẽ ghi nhận và sẽ giải quyết,
                                vui lòng gửi email hoặc điền vào biểu mẫu liên hệ của chúng tôi
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <div class="card card-plain">
                            <form id="contact-form" method="post" autocomplete="off">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="input-group input-group-static mb-4">
                                                <label>Tên của bạn</label>
                                                <input type="text" class="form-control" placeholder="Tên của bạn">
                                                <span class="input-group-text"><i class="material-icons">person</i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-6 ps-md-2">
                                            <div class="input-group input-group-static mb-4">
                                                <label>Email</label>
                                                <input type="email" class="form-control" placeholder="Email">
                                                <span class="input-group-text"><i class="material-icons">email</i></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-4 mt-md-0 mt-4">
                                        <div class="input-group input-group-static mb-4">
                                            <label>Chúng tôi có thể giúp gì cho bạn</label>
                                            <textarea name="message" class="form-control" id="message" rows="6" placeholder="Mô tả vấn đề của bạn trong ít nhất 250 ký tự"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <button type="submit" class="btn bg-gradient-info mt-4">Gửi yêu cầu</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
    </section>
    </section>
</div>




