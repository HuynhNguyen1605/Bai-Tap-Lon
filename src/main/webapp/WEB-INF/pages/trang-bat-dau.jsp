<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/08/2022
  Time: 5:03 CH
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<header class="bg-gradient-dark">
    <div class="page-header min-vh-75" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80')">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center mx-auto my-auto">
                    <h1 class="text-white">Chuyến xe cho mọi nhà</h1>
                    <p class="lead mb-4 text-white opacity-8">Mang đến cho quý khách hàng những trải nghiệm tốt nhất</p>
                    <a href="<c:url value="/dang-ky"></c:url> ">
                        <button type="submit" class="btn bg-white text-dark">Tạo tài khoản</button>
                    </a>
                    <h6 class="text-white mb-2 mt-5">Find us on</h6>
                    <div class="d-flex justify-content-center">
                        <a href="" target="_blank"><i class="fab fa-facebook text-lg text-white me-4"></i></a>
                        <a href="" target="_blank"><i class="fab fa-instagram text-lg text-white me-4"></i></a>
                        <a href="" target="_blank"><i class="fab fa-google-plus text-lg text-white"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -------- END HEADER 7 w/ text and video ------- -->


<div class="card card-body shadow-xl mx-3 mx-md-4 mt-n6">
    <section class="py-7">
        <div class="container">
            <h1 class="text-center" style="color: steelblue;">Chào mừng bạn đến với Car Ticket</h1>
            <div class="row justify-content-start" >
                <div class="col-md-6">
                    <div class="info">
                        <i class="material-icons text-3xl text-gradient text-info mb-3">public</i>
                        <h5>2000+ nhà xe chất lượng cao</h5>
                        <p>5000+ tuyến đường trên toàn quốc, chủ động và đa dạng lựa chọn.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="info">
                        <i class="material-icons text-3xl text-gradient text-info mb-3">payments</i>
                        <h5>Đặt vé dễ dàng</h5>
                        <p>Đặt vé chỉ với 60s. Chọn xe yêu thích cực nhanh và thuận tiện.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-start mt-4">
                <div class="col-md-6">
                    <div class="info">
                        <i class="material-icons text-3xl text-gradient text-info mb-3">apps</i>
                        <h5>Nhiều ưu đãi</h5>
                        <p>Hàng ngàn ưu đãi cực chất độc quyền tại VeXeRe.</p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="info">
                        <i class="material-icons text-3xl text-gradient text-info mb-3">3p</i>
                        <h5>Hỗ trợ mọi lúc mọi nơi</h5>
                        <p>Có đội ngũ hoạt động 24/24 phục vụ mọi lúc cho khách hàng.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="pt-4 pb-6" id="count-stats">
        <div class="row justify-content-center text-center">
            <div class="col-md-3">
                <h1 class="text-gradient text-primary"> <span id="state2" countto="24">24</span>/7</h1>
                <h5>Hỗ trợ</h5>
                <p>Đội ngũ hỗ trợ khách hàng mọi lúc</p>
            </div>
        </div>
    </section>
    <!-- -------- START PRE-FOOTER 1 w/ SUBSCRIBE BUTTON AND IMAGE ------- -->
    <section class="my-5 pt-5">
        <div class="container">
            <div class="row">
                <div class="col-md-6 m-auto">
                    <h4>Be the first to see the news</h4>
                    <p class="mb-4">
                        Your company may not be in the software business,
                        but eventually, a software company will be in your business.
                    </p>
                    <div class="row">
                        <div class="col-8">
                            <div class="input-group input-group-outline">
                                <label class="form-label">Email Here...</label>
                                <input type="text" class="form-control mb-sm-0">
                            </div>
                        </div>
                        <div class="col-4 ps-0">
                            <button type="button" class="btn bg-gradient-info mb-0 h-100 position-relative z-index-2">
                                Subscribe
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 ms-auto">
                    <div class="position-relative">
                        <img class="max-width-50 w-100 position-relative z-index-2" src="https://chothuexedulich.org/wp-content/uploads/2020/12/thue-xe-giuong-nam-limousine-gia-re-tai-tphcm-6.jpg"
                             alt="image">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- -------- END PRE-FOOTER 1 w/ SUBSCRIBE BUTTON AND IMAGE ------- -->
</div>

