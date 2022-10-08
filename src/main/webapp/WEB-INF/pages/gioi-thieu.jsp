<%--
  Created by IntelliJ IDEA.
  User: nhats
  Date: 04/09/2022
  Time: 12:58 SA
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
<div class="card card-body shadow-xl mx-3 mx-md-4 mt-n6">
    <!-- Section with four info areas left & one card right with image and waves -->
    <section class="py-lg-5">
        <header class="header-rounded-images">
            <div class="page-header min-vh-90">
                <img class="position-absolute fixed-top ms-auto  z-index-0 d-none d-sm-none d-md-block border-radius-section border-top-end-radius-0 border-top-start-radius-0 border-bottom-end-radius-0"
                     src="https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/1860x1050-volvo-9700-CGI1?qlt=82&wid=1440&ts=1656931444230&dpr=off&fit=constrain"
                     alt="image" loading="lazy">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7 d-flex">
                            <div class="card card-body blur text-md-start text-center px-sm-5 shadow-lg mt-sm-5 py-sm-5">
                                <h2 class="text-dark mb-4">Giới thiệu</h2>

                                <p class="lead text-dark pe-md-5 me-md-5">
                                    Thành lập từ năm 2022 cho đến nay, Car Ticket đã phục vục hơn hàng ngàn tuyến xe trên khắp cả nước. Chúng tôi luôn không ngừng cải thiện, nâng cao chất lượng dịch vụ và mở rộng quy mô công ty của mình mỗi ngày nhằm đem đến cho khách hàng dịch vụ tốt nhất và đa dạng nhất.

                                </p>
                                <div class="buttons">
                                    <button href="<c:url value="/lien-he"/> " type="button" class="btn bg-gradient-primary mt-4">Liên hệ</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </section>
</div>