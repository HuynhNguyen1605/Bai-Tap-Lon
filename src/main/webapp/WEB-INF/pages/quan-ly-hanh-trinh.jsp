<%--
  Created by IntelliJ IDEA.
  User: nhats
  Date: 02/09/2022
  Time: 2:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <section class="py-7">
        <div class="container">
            <h1 class="text-center" style="color: steelblue;">Quản lý hành trình</h1>
            <div class="row">
                <div class="table-responsive table-hover">
                    <div class="table-wrapper">

                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                            <tr>
                                <th class="th-sm">ID hành trình
                                </th>
                                <th class="th-sm">Điểm khởi hành
                                </th>
                                <th class="th-sm">Điểm đến
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${coachWays}" var="coachWay">
                                <tr>
                                    <td>${coachWay.id}</td>
                                    <td>${coachWay.departurePoint}</td>
                                    <td>${coachWay.destinationPoint}</td>

                                    <td>
                                        <a href="<c:url value="/admin/coach-way/add-or-update?id=${coachWay.id}"/>" class="edit" title="Sửa hành trình" data-toggle="tooltip"><i class="material-icons" style="color:#0d376f ;" >&#xE254;</i></a>
                                        <a href="<c:url value="/admin/coach-way/delete"/>?id=${coachWay.id}" class="delete" title="Xoá hành trình" data-toggle="tooltip"><i class="material-icons" style="color:#E34724 ;" >&#xE872;</i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-sm-4">

                                <button type="button" class="btn bg-gradient-light">
                                    <a href="<c:url value="/admin/coach-way/add-or-update"/>">

                                        <i class="fa-solid fa-cars" style="color: forestgreen;"></i>
                                        Thêm hành trình
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END Section with four info areas left & one card right with image and waves -->
    <!-- -------- START Features w/ pattern background & stats & rocket -------- -->

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
                        <img class="max-width-50 w-100 position-relative z-index-2"
                             src="https://chothuexedulich.org/wp-content/uploads/2020/12/thue-xe-giuong-nam-limousine-gia-re-tai-tphcm-6.jpg"
                             alt="image">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- -------- END PRE-FOOTER 1 w/ SUBSCRIBE BUTTON AND IMAGE ------- -->
</div>

