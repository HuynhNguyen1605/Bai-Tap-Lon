<%-- 
    Document   : login
    Created on : Apr 6, 2022, 8:52:21 PM
    Author     : Lightning
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');" loading="lazy">
  <span class="mask bg-gradient-dark opacity-6"></span>
  <div class="container my-auto">

    <div class="row">
      <div class="col-lg-4 col-md-8 col-12 mx-auto">
        <div class="card z-index-0 fadeIn3 fadeInBottom">
          <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
            <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
              <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Đăng nhập</h4>
            </div>
          </div>

          <div class="card-body">
            <form role="form" class="text-start" method="post" action="<c:url value="/login"/>">
              <div class="input-group input-group-outline my-3">
                <label class="form-label">UserName</label>
                <input name="username" class="form-control">
              </div>
              <div class="input-group input-group-outline mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control">
              </div>
              <c:if test="${param.error != null}">
                <div class="alert alert-danger text-white font-weight-bold">
                  <strong>THẤT BẠI!</strong> Vui lòng thử lại.
                </div>
              </c:if>
              <div class="form-check form-switch d-flex align-items-center mb-3">
                <input class="form-check-input" type="checkbox" id="rememberMe" checked>
                <label class="form-check-label mb-0 ms-3" for="rememberMe">Lưu tài Khoản</label>
              </div>
              <div class="text-center">
                <button type="submit" class="btn bg-gradient-primary w-100 my-4 mb-2">Đăng nhập</button>
              </div>
              <p class="mt-4 text-sm text-center">
                <a href="<c:url value="/dang-ky"/>">Bạn chưa có tài khoản?Đăng ký ngay.</a>
              </p>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>