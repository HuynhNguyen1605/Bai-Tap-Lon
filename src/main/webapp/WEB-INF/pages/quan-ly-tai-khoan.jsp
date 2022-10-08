<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/08/2022
  Time: 12:00 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <h1 class="text-center" style="color: steelblue;">Quản lý tài khoản người dùng</h1>
            <div class="row">
                <div class="table-responsive table-hover">
                    <div class="table-wrapper">
                        <c:url value="/admin/quan-ly-tai-khoan/search" var="action"></c:url>
                        <form action="${action}">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-4">

                                        <div class="input-group input-group-outline my-6">
                                            <label class="form-label">Nhập tên tài khoản cần tìm</label>
                                            <input type="text" name="kw" class="form-control">
                                        </div>
                                        <button type="submit" class="btn bg-gradient-light">
                                            <i class="fas fa-search me-1">Tìm kiếm</i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <c:if test="${accounts.size()>0}">
                            <c:if test="${sucMsg!=null}">
                                <div class="alert alert-success" role="alert">
                                        ${errMsg}</div>
                            </c:if>
                            <c:if test="${errMsg!=null}">
                                <div class="alert alert-danger" role="alert">
                                        ${errMsg}</div>
                            </c:if>
                        </c:if>

                        <table class="table table-striped table-hover table-bordered">
                            <thead>
                            <tr>
                                <th>Tên <i class="fa fa-sort"></i></th>
                                <th>Username<i class="fa fa-sort"></i></th>
                                <th>Email<i class="fa fa-sort"></i></th>
                                <th>Address <i class="fa fa-sort"></i></th>
                                <th>Loại tài khoản</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${accounts}" var="account">
                                <tr>
                                    <td>${account.fullname}</td>
                                    <td>${account.username}</td>
                                    <td>${account.email}</td>
                                    <td>${account.address}</td>
                                    <td>${account.userRole}</td>
                                    <td>
                                        <a href="<c:url value="/chi-tiet-tai-khoan"/>?id=${account.id}" class="view"
                                           color:#03A9F4; title="Xem chi tiết tài khoản" data-toggle="tooltip"><i
                                                style="color:#03A9F4;" class="material-icons">&#xE417;</i></a>
                                        <a href="<c:url value="/admin/add-or-update"/>?id=${account.id}" class="edit"
                                           title="Sửa tài khoản" data-toggle="tooltip"><i class="material-icons"
                                                                                          style="color:#0d376f ;">&#xE254;</i></a>
                                        <a href="<c:url value="/admin/quan-ly-tai-khoan/delete"/>?id=${account.id}"
                                           title="Xoá tài khoản" data-toggle="tooltip"><i class="material-icons"
                                                                                          style="color:#E34724 ;">&#xE872;</i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="row">
                            <div class="col-sm-4">
                                <button type="button" class="btn bg-gradient-light">
                                    <a href="<c:url value="/admin/add-or-update"/>?id=0">
                                        <i class="fas fa-plus-circle" style="color: forestgreen;"></i>
                                        Thêm tài khoản
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
                <h1 class="text-gradient text-primary"><span id="state2" countto="24">24</span>/7</h1>
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