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
                    <h6 class="text-white mb-2 mt-5">Find us on</h6>
                    <div class="d-flex justify-content-center">
                        <a href="https://www.facebook.com/huynhnguyennnnnn/" target="_blank"><i class="fab fa-facebook text-lg text-white me-4"></i></a>
                        <a href="https://www.instagram.com/huyhnguyenn_165/" target="_blank"><i class="fab fa-instagram text-lg text-white me-4"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-google-plus text-lg text-white"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- -------- END HEADER 7 w/ text and video ------- -->
<div class="card card-body shadow-xl mx-3 mx-md-4 mt-n6">
    <!-- Section with four info areas left  & one card right with image and waves -->
    <section class="py-7">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="row justify-content-start">
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
                <div class="col-lg-4 ms-auto me-auto p-lg-4 mt-lg-0 mt-4">
                    <div class="rotating-card-container">
                        <div class="card card-rotate card-background card-background-mask-primary shadow-primary mt-md-0 mt-5">
                            <div class="front front-background" style="background-image: url(https://images.unsplash.com/photo-1569683795645-b62e50fbf103?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=987&amp;q=80); background-size: cover;">
                                <div class="card-body py-7 text-center">
                                    <i class="material-icons text-white text-4xl my-3">touch_app</i>
                                    <h3 class="text-white">Chạm để tìm<br>kiếm chuyến đi của bạn</h3>
                                    <p class="text-white opacity-8">Xem các tuyến đường được nhà xe cung cấp tại đây</p>
                                </div>
                            </div>
                            <div class="back back-background" style="background-image: url(https://images.unsplash.com/photo-1498889444388-e67ea62c464b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;ixlib=rb-1.2.1&amp;auto=format&amp;fit=crop&amp;w=1365&amp;q=80); background-size: cover;">
                                <div class="card-body pt-7 text-center">
                                    <h3 class="text-white">Car Ticket</h3>
                                    <p>Chuyên phục vụ các tuyến đường từ Sài Gòn đến các địa điểm du lịch như (Nha Trang, Đà Nẵng, Đà Lạt, Quy Nhơn, Vũng Tàu, Phan Thiết, Bình Định, ...) và một số tuyến đi các tỉnh khác.</p>
                                    <a href="<c:url value="/dat-ve"/> " class="btn btn-white btn-sm w-70 h-40 mx-auto mt-3" style="font-size: large">Tìm kiếm ngay</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END Section with four info areas left & one card right with image and waves -->
    <!-- -------- START Features w/ pattern background & stats & rocket -------- -->
    <section class="pb-5 position-relative bg-gradient-dark mx-n3">
        <div class="container">
            <div class="row">
                <div class="col-md-8 text-start mb-5 mt-5">
                    <h3 class="text-white z-index-1 position-relative">Tuyến đường phổ biến</h3>
                    <p class="text-white opacity-8 mb-0">Những tuyến đi chính của nhà xe</p>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-12">
                    <div class="card card-profile mt-4">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12 mt-n5">
                                <a href="">
                                    <div class="p-3 pe-md-0">
                                        <img class="w-100 border-radius-md shadow-lg"
                                             src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/3/img_hero.png" width="160" height="160" alt="image">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8 col-md-6 col-12 my-auto">
                                <div class="card-body ps-lg-0">
                                    <h5 class="mb-0">Sài Gòn - Đà Lạt</h5>
                                    <h6 class="text-info">Từ 150.000đ</h6>
                                    <p class="mb-0">Artist is a term applied to a person who engages in an activity
                                        deemed to be an art.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="card card-profile mt-lg-4 mt-5">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12 mt-n5">
                                <a href="">
                                    <div class="p-3 pe-md-0">
                                        <img class="w-100 border-radius-md shadow-lg" src="https://storage.googleapis.com/vex-config/cms-tool/destination/images/25/img_hero.png"
                                             width="160" height="160" alt="image">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8 col-md-6 col-12 my-auto">
                                <div class="card-body ps-lg-0">
                                    <h5 class="mb-0">Sài Gòn - Nha Trang</h5>
                                    <h6 class="text-info">Từ 231.000đ</h6>
                                    <p class="mb-0">Artist is a term applied to a person who engages in an activity
                                        deemed to be an art.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-lg-6 col-12">
                    <div class="card card-profile mt-4 z-index-2">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12 mt-n5">
                                <a href="">
                                    <div class="p-3 pe-md-0">
                                        <img class="w-100 border-radius-md shadow-lg"
                                             src="https://amthucvadulich.net/wp-content/uploads/xe-giuong-nam-doi-di-da-lat.jpg" width="160" height="160" alt="image">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8 col-md-6 col-12 my-auto">
                                <div class="card-body ps-lg-0">
                                    <h5 class="mb-0">Sài Gòn - Phan Thiết </h5>
                                    <h6 class="text-info">Từ 170.000đ</h6>
                                    <p class="mb-0">Artist is a term applied to a person who engages in an activity
                                        deemed to be an art.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-12">
                    <div class="card card-profile mt-lg-4 mt-5 z-index-2">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-12 mt-n5">
                                <a href="">
                                    <div class="p-3 pe-md-0">
                                        <img class="w-100 border-radius-md shadow-lg"
                                             src="https://saigonstartravel.com/wp-content/uploads/2021/04/thue-xe-giuong-nam-2.jpg" width="160" height="160" alt="image">
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-8 col-md-6 col-12 my-auto">
                                <div class="card-body ps-lg-0">
                                    <h5 class="mb-0">Nha Trang - Sài Gòn</h5>
                                    <h6 class="text-info">Từ 250.000đ</h6>
                                    <p class="mb-0">Artist is a term applied to a person who engages in an activity
                                        deemed to be an art.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- -------- END Features w/ pattern background & stats & rocket -------- -->
    <section class="pt-4 pb-6" id="count-stats">
        <div class="row justify-content-center text-center">
            <div class="col-md-3">
                <h1 class="text-gradient text-primary"> <span id="state2" countto="24">24</span>/7</h1>
                <h5>Support</h5>
                <p>Actively engage team members that finishes on time</p>
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