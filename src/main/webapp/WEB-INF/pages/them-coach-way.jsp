<%--
  Created by IntelliJ IDEA.
  User: nhats
  Date: 30/08/2022
  Time: 4:15 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/admin/coach-way/add-or-update" var="action"/>

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
            <%--            <h1 class="text-center dark-color">THÊM HÀNH TRÌNH</h1>--%>

            <c:if test="${coachWay.id==null}">
            <h1 class="text-center dark-color">THÊM HÀNH TRÌNH</h1>
            </c:if>

            <c:if test="${coachWay.id!=null}">
            <h1 class="text-center dark-color">CHỈNH SỬA HÀNH TRÌNH</h1>
            </c:if>


                        <c:if test="${errMsg != null}">
                            <div class="alert alert-danger">
                                    ${errMsg}
                            </div>
                        </c:if>


            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="card card-plain">
                        <form:form action="${action}" method="post" enctype="multipart/form-data"
                                   id="contact-form"
                                   modelAttribute="coachWay">
                            <form:errors path="*" element="div" cssClass="alert alert-danger text-white font-weight-bold"/>

                            <form:hidden path="id"/>
                        <div class="card-body">
                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Điểm đi</label>
                                    <form:input path="departurePoint" class="form-control"/>
                                </div>
                            </div>
                            <div class="mb-4">
                                <div class="input-group input-group-static mb-4">
                                    <label class="">Điểm đến</label>
                                    <form:input path="destinationPoint" class="form-control"/>
                                </div>
<%--                                <div class="row">--%>
<%--                                    <div class="col-md-12">--%>
<%--                                        <button type="submit" class="btn bg-gradient-dark w-100">Đăng ký</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <c:if test="${coachWay.id==null}">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn bg-gradient-dark w-100">Thêm</button>
                                    </div>

                                </c:if>
                                <c:if test="${coachWay.id!=null}">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn bg-gradient-dark w-100">Cập nhật</button>
                                    </div>
                                </c:if>
                            </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>
