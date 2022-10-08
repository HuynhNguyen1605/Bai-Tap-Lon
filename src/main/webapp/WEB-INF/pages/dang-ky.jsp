<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01/08/2022
  Time: 10:09 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url value="/dang-ky" var="action"/>


<header class="bg-gradient-dark">
    <div class="page-header min-vh-75"
         style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80')">
        <span class="mask bg-gradient-dark opacity-6"></span>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center mx-auto my-auto">
                    <h1 class="text-white">Đăng ký tài khoản</h1>
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
        <div class="container py-4">
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger">
                        ${errMsg}
                </div>
            </c:if>
            <div class="row">
                <div class="col-lg-7 mx-auto d-flex justify-content-center flex-column">
                    <form:form action="${action}" method="post" enctype="multipart/form-data"
                               id="contact-form"
                               modelAttribute="account">
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
                                    <label >Tên đăng nhập</label>
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

                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" class="btn bg-gradient-dark w-100">Đăng ký</button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </section>

    <%--    <section class="py-7">--%>
    <%--        <div class="container">--%>
    <%--            <div class="u-clearfix u-sheet u-sheet-1">--%>
    <%--                <div class="u-form u-form-1">--%>
    <%--                    <form:form action="${action}" method="post" enctype="multipart/form-data"--%>
    <%--                               class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                               modelAttribute="newAccount">--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="username"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="Tên đăng nhập" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="password"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="Mat khau" type="password" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input type="file" path="file"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        accept="image/*"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="email"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="Email" type="email" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="phone"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="SDT" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="fullname"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="Ho va ten" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <form:input path="address"--%>
    <%--                                        class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"--%>
    <%--                                        placeholder="Dia chi" required="required"/>--%>
    <%--                        </div>--%>
    <%--                        <div class="u-form-group u-form-name u-label-top">--%>
    <%--                            <label>Giới tính</label>--%>
    <%--                            <form:select path="gender"--%>
    <%--                                         class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form">--%>
    <%--                                <form:option value="0" label="Nam" selected="${newAccount.gender == 0 ? true : ''}"/>--%>
    <%--                                <form:option value="1" label="Nữ" selected="${newAccount.gender == 1 ? true : ''}"/>--%>
    <%--                            </form:select>--%>
    <%--                        </div>--%>
    <%--                    </form:form>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </section>--%>
    <!-- END Section with four info areas left & one card right with image and waves -->
    <!-- -------- START Features w/ pattern background & stats & rocket -------- -->

    <!-- -------- END Features w/ pattern background & stats & rocket -------- -->
    <!-- -------- START PRE-FOOTER 1 w/ SUBSCRIBE BUTTON AND IMAGE ------- -->
<%--    <section class="my-5 pt-5">--%>
<%--        <div class="container">--%>
<%--            <div class="row">--%>
<%--                <div class="col-md-6 m-auto">--%>
<%--                    <h4>Be the first to see the news</h4>--%>
<%--                    <p class="mb-4">--%>
<%--                        Your company may not be in the software business,--%>
<%--                        but eventually, a software company will be in your business.--%>
<%--                    </p>--%>
<%--                    <div class="row">--%>
<%--                        <div class="col-8">--%>
<%--                            <div class="input-group input-group-outline">--%>
<%--                                <label class="form-label">Email Here...</label>--%>
<%--                                <input type="text" class="form-control mb-sm-0">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-4 ps-0">--%>
<%--                            <button type="button" class="btn bg-gradient-info mb-0 h-100 position-relative z-index-2">--%>
<%--                                Subscribe--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-md-5 ms-auto">--%>
<%--                    <div class="position-relative">--%>
<%--                        <img class="max-width-50 w-100 position-relative z-index-2"--%>
<%--                             src="https://chothuexedulich.org/wp-content/uploads/2020/12/thue-xe-giuong-nam-limousine-gia-re-tai-tphcm-6.jpg"--%>
<%--                             alt="image">--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
    <!-- -------- END PRE-FOOTER 1 w/ SUBSCRIBE BUTTON AND IMAGE ------- -->
</div>
