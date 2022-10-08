<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/08/2022
  Time: 1:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:url value="/admin/add-or-update" var="action"/>


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
    <section>
        <div class="container">
            <c:if test="${accounts.id==0}">
                <h1 class="text-center" style="color: steelblue;">Thêm tài khoản</h1>
            </c:if>

            <c:if test="${accounts.id>0}">
                <h1 class="text-center" style="color: steelblue;">Chỉnh sửa thông tin tài khoản</h1>
            </c:if>


            <div class="row">
                <div class="col-lg-7 mx-auto d-flex justify-content-center flex-column">
                    <form:form action="${action}" method="post" enctype="multipart/form-data"
                               id="contact-form"
                               modelAttribute="accounts">
                        <form:errors path="*" element="div" cssClass="alert alert-danger text-white font-weight-bold"/>
                        <form:hidden path="id"/>
                        <div class="card-body">

                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Họ và tên</label>
                                    <form:input path="fullname" class="form-control"/>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Địa chỉ</label>
                                    <form:input path="address" class="form-control"/>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Email</label>
                                    <form:input path="email" class="form-control"/>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Số điện thoại</label>
                                    <form:input path="phone" class="form-control"/>
                                </div>
                            </div>


                            <div class="mb-4">
                                <div class="d-flex flex-column dinput-group input-group-dynamic mb-4">
                                    <label class="m-0">Ảnh đại diện</label>
                                    <form:input type="file" path="file"
                                                class="form-control" accept="image/*"/>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="d-flex flex-column input-group input-group-dynamic mb-4">
                                    <label class="m-0">Giới tính</label>
                                    <form:select path="gender"
                                                 class="form-control w-100">
                                        <form:option value="0" label="Nam"
                                                     selected="${newAccount.gender == 0 ? true : ''}"/>
                                        <form:option value="1" label="Nữ"
                                                     selected="${newAccount.gender == 1 ? true : ''}"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Tên đăng nhập</label>
                                    <form:input path="username" class="form-control" required="required"/>
                                </div>
                            </div>

                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Mật khẩu</label>
                                    <form:input path="password" class="form-control" type="password"
                                                required="required"/>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="d-flex flex-column input-group input-group-dynamic mb-4">
                                    <label class="m-0">Loại tài khoản</label>
                                    <form:select path="userRole"
                                                 class="form-control w-100">
                                        <form:option value="admin" label="Admin"
                                                     selected="${newAccount.userRole.equals('admin') ? true : ''}"/>
                                        <form:option value="customer" label="Khách hàng"
                                                     selected="${newAccount.userRole.equals('customer') ? true : ''}"/>
                                        <form:option value="driver" label="Tài xế"
                                                     selected="${newAccount.userRole.equals('driver') ? true : ''}"/>
                                        <form:option value="staff" label="Nhân viên"
                                                     selected="${newAccount.userRole.equals('staff') ? true : ''}"/>
                                    </form:select>
                                </div>
                            </div>
                            <c:if test="${accounts.id==0}">
                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary">Thêm</button>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${accounts.id>0}">
                                <div class="row">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>
</div>
