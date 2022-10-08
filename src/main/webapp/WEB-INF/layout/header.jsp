<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar navbar-expand-lg position-absolute top-0 z-index-3 w-100 shadow-none my-3  navbar-transparent ">
    <div class="container">
        <a class="navbar-brand  text-white" href="<c:url value="/" />" rel="tooltip"
           title="Trang bắt đầu" data-placement="bottom">
            <h5 style="color: #fbfdff;">
                <i class="material-icons opacity-6 me-2 text-md">directions_bus</i>
                Car Ticket
            </h5>
        </a>
        <div class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0 ms-lg-12 ps-lg-5" id="navigation">
            <ul class="navbar-nav navbar-nav-hover ms-auto">
                <security:authorize access="hasAuthority('driver')">
                    <li class="nav-item dropdown dropdown-hover mx-2">
                        <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center"
                           id="dropdownMenuBlocks1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="material-icons opacity-6 me-2 text-md">view_day</i>
                            Tiện ích
                        </a>
                        <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3"
                            aria-labelledby="dropdownMenuBlocks">
                            <div class="d-none d-lg-block">
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/chi-tiet-tai-khoan"/>?id=${currentUser.id}" class="view">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Người dùng
                                                </h6>
                                                <span class="text-sm">Thông tin cá nhân</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/dang-ky"/>">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Tạo tài khoản
                                                </h6>
                                                <span class="text-sm">Tạo tài khoản mới</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/driver/chuyen-di-tai-xe"/>?account-id=${currentUser.id}" class="view">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Chuyến đi
                                                </h6>
                                                <span class="text-sm">Chuyến đi của tài xế</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </li>
                </security:authorize>
                <security:authorize access="hasAuthority('customer')">
                    <li class="nav-item dropdown dropdown-hover mx-2 ms-lg-6">
                        <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center"
                           id="dropdownMenuPages8" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="material-icons opacity-6 me-2 text-md">dashboard</i>
                            Tìm hiểu
                        </a>
                        <div class="dropdown-menu dropdown-menu-animation ms-n3 dropdown-md p-3 border-radius-lg mt-0 mt-lg-3"
                             aria-labelledby="dropdownMenuPages8">
                            <div class="d-none d-lg-block">
                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex align-items-center px-1">
                                    Thông tin nhà xe
                                </h6>
                                <a href="<c:url value="/gioi-thieu"/>" class="dropdown-item border-radius-md">
                                    <span>Giới thiệu</span>
                                </a>
                                <a href="<c:url value="/lien-he"/>" class="dropdown-item border-radius-md">
                                    <span>Liên hệ</span>
                                </a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown dropdown-hover mx-2">
                        <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center"
                           id="dropdownMenuBlocks" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="material-icons opacity-6 me-2 text-md">view_day</i>
                            Tiện ích
                        </a>
                        <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3"
                            aria-labelledby="dropdownMenuBlocks">
                            <div class="d-none d-lg-block">
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/trang-chu-dat-ve"/> ">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Trang chủ
                                                </h6>
                                                <span class="text-sm">Trang chủ đặt vé</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/chi-tiet-tai-khoan"/>?id=${currentUser.id}" class="view">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Người dùng
                                                </h6>
                                                <span class="text-sm">Thông tin cá nhân</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/gio-hang/${currentUser.id}"/>">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Giỏ hàng
                                                </h6>
                                                <span class="text-sm">Giỏ hàng của tôi</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/dang-ky"/>">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Tạo tài khoản
                                                </h6>
                                                <span class="text-sm">Tạo tài khoản mới</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="#">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Chăm sóc khách hàng
                                                </h6>
                                                <span class="text-sm">Hỗ trợ khách hàng mọi lúc mọi nơi</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </li>
                </security:authorize>
                <security:authorize access="hasAuthority('admin')">
                    <li class="nav-item dropdown dropdown-hover mx-2">
                        <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="material-icons opacity-6 me-2 text-md">view_day</i>
                            ADMIN
                        </a>
                        <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive p-3 border-radius-lg mt-0 mt-lg-3"
                            aria-labelledby="dropdownMenuBlocks">
                            <div class="d-none d-lg-block">
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/admin"/> ">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Quản lý
                                                </h6>
                                                <span class="text-sm">Trang chủ quản lý</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item opdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/chi-tiet-tai-khoan"/>?id=${currentUser.id}" class="view">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Người dùng
                                                </h6>
                                                <span class="text-sm">Thông tin cá nhân</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="<c:url value="/dang-ky"/>">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Tạo tài khoản
                                                </h6>
                                                <span class="text-sm">Tạo tài khoản mới</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item dropdown dropdown-hover dropdown-subitem">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md" href="#">
                                        <div class="w-100 d-flex align-items-center justify-content-between">
                                            <div>
                                                <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                                    Chăm sóc khách hàng
                                                </h6>
                                                <span class="text-sm">Hỗ trợ khách hàng mọi lúc mọi nơi</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                            </div>
                        </ul>
                    </li>
                </security:authorize>
                <li class="nav-item dropdown dropdown-hover mx-2">
                    <a class="nav-link ps-2 d-flex justify-content-between cursor-pointer align-items-center"
                       id="dropdownMenuDocs" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="material-icons opacity-6 me-2 text-md">article</i>
                        Thông báo
                    </a>
                    <ul class="dropdown-menu dropdown-menu-animation dropdown-menu-end dropdown-md dropdown-md-responsive mt-0 mt-lg-3 p-3 border-radius-lg"
                        aria-labelledby="dropdownMenuDocs">
                        <div class="d-none d-lg-block">
                            <ul class="list-group">
                                <li class="nav-item list-group-item border-0 p-0">
                                    <a class="dropdown-item py-2 ps-3 border-radius-md"
                                       href="">
                                        <h6 class="dropdown-header text-dark font-weight-bolder d-flex justify-content-cente align-items-center p-0">
                                            Chuyến xe
                                        </h6>
                                        <span class="text-sm">Cập nhật tình hình các chuyến xe</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </ul>
                </li>
                <li class="nav-item my-auto ms-3 ms-lg-0">
                    <c:if test="${currentUser == null}">
                        <a href="<c:url value="/login"/>" class="nav-link border-radius-md">
                            <span>Đăng nhập</span>
                        </a>
                    </c:if>

                    <c:if test="${currentUser != null}">
                        <a href="#" class="nav-link border-radius-md">
                            <span>${currentUser.fullname} (${currentUser.username})</span>
                        </a>
                    </c:if>
                </li>
                <c:if test="${currentUser != null}">
                    <li class="nav-item my-auto ms-3 ms-lg-0">
                        <a href="<c:url value="/logout"/>" class="nav-link border-radius-md">
                            <span>Đăng xuất</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>