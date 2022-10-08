<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/08/2022
  Time: 2:23 CH
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" %>
<c:set var="seatIndex" value="0"/>
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
            <h1 class="text-center" style="color: steelblue;">THÔNG TIN CHI TIẾT CHUYẾN ĐI</h1>
            <div class="container mt-4">
                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th style="width: 30%" scope="row">Tên chuyến đi</th>
                        <td class="border-left">${coachLine.name}</td>
                    </tr>
                    <tr>
                        <th style="width: 30%" scope="row">Giá</th>
                        <td class="border-left">
                            <fmt:setLocale value = "vi_VN"/>
                            <fmt:formatNumber value = "${coachLine.price}" type = "currency"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 30%" scope="row">Thời gian đi</th>
                        <td class="border-left">
                            <fmt:formatDate value="${coachLine.departureDate}" pattern="HH:mm:ss - dd/MM/yyyy"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 30%" scope="row">Thời gian đến</th>
                        <td class="border-left">
                            <fmt:formatDate value="${coachLine.arrivalDate}" pattern="HH:mm:ss - dd/MM/yyyy"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 30%" scope="row">Số chỗ còn trống</th>
                        <td class="border-left">${coachLine.remainingSeats}</td>
                    </tr>
                    </tbody>
                </table>
                <style>
                    .train {
                        margin: 20px auto;
                        max-width: 250px;
                    }
                    .exit {
                        display: flex;
                        flex-direction: row;
                        padding: 1rem 0;
                    }
                    .exit div {
                        flex: 1;
                        background: #d8d8d8;
                        text-align: center;
                        justify-content: center;
                        height: 50px;
                        line-height: 50px;
                    }
                    .exit div:nth-child(2) {
                        flex: 0 1 20%;
                        background: #fff;
                    }
                    .exit.back {
                        flex-direction: row-reverse;
                    }
                    .train-body {
                        border-right: 5px solid #d8d8d8;
                        border-left: 5px solid #d8d8d8;
                    }
                    ol {
                        list-style: none;
                        padding: 0;
                        margin: 0;
                    }
                    .seats {
                        display: flex;
                        flex-direction: row;
                        flex-wrap: nowrap;
                        justify-content: flex-start;
                    }
                    .seat {
                        display: flex;
                        flex: 0 0 21%;
                        padding: 5px;
                        position: relative;
                    }
                    .seat:nth-child(2) {
                        margin-right: 15%;
                    }
                    .seat input[type=checkbox] {
                        position: absolute;
                        opacity: 0;
                    }
                    .seat input[type=checkbox]:checked + label {
                        background: rgb(158, 198, 40);
                        -webkit-animation-name: rubberBand;
                        animation-name: rubberBand;
                        animation-duration: 300ms;
                        animation-fill-mode: both;
                    }
                    .seat input[type=checkbox]:disabled + label {
                        background: rgb(124, 43, 43);
                        text-indent: -9999px;
                        overflow: hidden;
                    }
                    .seat input[type=checkbox]:disabled + label:after {
                        content: "X";
                        color: white;
                        text-indent: 0;
                        position: absolute;
                        top: 4px;
                        left: 50%;
                        transform: translate(-50%, 0%);
                    }
                    .seat input[type=checkbox]:disabled + label:hover {
                        box-shadow: none;
                        cursor: not-allowed;
                    }
                    .seat label {
                        display: block;
                        position: relative;
                        width: 100%;
                        text-align: center;
                        font-size: 14px;
                        font-weight: bold;
                        line-height: 1.5rem;

                        padding: 4px 0;
                        background: #0C2B31;
                        border-radius: 5px;
                        animation-duration: 300ms;
                        animation-fill-mode: both;
                    }
                    .seat label:before {
                        content: "";
                        position: absolute;
                        width: 75%;
                        height: 75%;
                        top: 1px;
                        left: 50%;
                        transform: translate(-50%, 0%);
                        background: rgba(255, 255, 255, 0.31);
                        border-radius: 3px;
                    }
                    .seat label:hover {
                        cursor: pointer;
                        box-shadow: 0 0 0px 2px #676fc5;
                    }
                    @-webkit-keyframes rubberBand {
                        0% {
                            -webkit-transform: scale3d(1, 1, 1);
                            transform: scale3d(1, 1, 1);
                        }
                        30% {
                            -webkit-transform: scale3d(1.25, 0.75, 1);
                            transform: scale3d(1.25, 0.75, 1);
                        }
                        40% {
                            -webkit-transform: scale3d(0.75, 1.25, 1);
                            transform: scale3d(0.75, 1.25, 1);
                        }
                        50% {
                            -webkit-transform: scale3d(1.15, 0.85, 1);
                            transform: scale3d(1.15, 0.85, 1);
                        }
                        65% {
                            -webkit-transform: scale3d(0.95, 1.05, 1);
                            transform: scale3d(0.95, 1.05, 1);
                        }
                        75% {
                            -webkit-transform: scale3d(1.05, 0.95, 1);
                            transform: scale3d(1.05, 0.95, 1);
                        }
                        100% {
                            -webkit-transform: scale3d(1, 1, 1);
                            transform: scale3d(1, 1, 1);
                        }
                    }
                    @keyframes rubberBand {
                        0% {
                            -webkit-transform: scale3d(1, 1, 1);
                            transform: scale3d(1, 1, 1);
                        }
                        30% {
                            -webkit-transform: scale3d(1.25, 0.75, 1);
                            transform: scale3d(1.25, 0.75, 1);
                        }
                        40% {
                            -webkit-transform: scale3d(0.75, 1.25, 1);
                            transform: scale3d(0.75, 1.25, 1);
                        }
                        50% {
                            -webkit-transform: scale3d(1.15, 0.85, 1);
                            transform: scale3d(1.15, 0.85, 1);
                        }
                        65% {
                            -webkit-transform: scale3d(0.95, 1.05, 1);
                            transform: scale3d(0.95, 1.05, 1);
                        }
                        75% {
                            -webkit-transform: scale3d(1.05, 0.95, 1);
                            transform: scale3d(1.05, 0.95, 1);
                        }
                        100% {
                            -webkit-transform: scale3d(1, 1, 1);
                            transform: scale3d(1, 1, 1);
                        }
                    }
                    .rubberBand {
                        -webkit-animation-name: rubberBand;
                        animation-name: rubberBand;
                    }

                </style>
                <div class="col row-cols-lg-4">
                    <div class="exit front train-body">
                        <div>Driver</div>
                        <div></div>
                        <div>In/Out</div>
                    </div>
                    <ol class="wagon train-body">
                        <c:forEach var="i" begin="0" end="9">
                            <li class="row row--1">
                                <ol class="seats">
                                    <c:forEach items="${seats}" var="seat" begin="${i*4}" end="${i*4+3}">

                                        <c:if test="${bookedSeat.contains(seat)}">
                                            <c:set var="disable" value="true"/>
                                        </c:if>
                                        <li class="seat">
                                            <input class="seat-index" type="checkbox" name="seat" id="${seat}" value="${seat}"
                                                    <c:if test="${bookedSeat.contains(seat)}">
                                                        disabled
                                                    </c:if>/>
                                            <label for="${seat}">${seat}</label>
                                        </li>
                                    </c:forEach>
                                </ol>
                            </li>
                        </c:forEach>
                    </ol>
                </div>
            </div>
        </div>
        <div class="card-body text-center">
            <button type="button" class="btn bg-gradient-light">
                <a href="<c:url value="/dat-ve"/> ">
                    <i class="fas fa-reply"> Quay lại</i>
                </a>
            </button>
            <button type="button" class="btn bg-gradient-light"
                    onclick="clickDatVe(${currentUser.id}, ${coachLine.id},getSeat())">
                <a href="<c:url value="/gio-hang/${currentUser.id}"/>">
                    <i class="fas fa-shopping-cart"> Thêm vé vào giỏ hàng</i>
                </a>
            </button>
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
<script type="text/javascript">

    function getSeat() {
        var seatIndex = null;
        var inputElements = document.getElementsByClassName('seat-index');
        for(var i=0; inputElements[i]; ++i){
            if(inputElements[i].checked){
                seatIndex = inputElements[i].value;
                break;
            }
        }
        return seatIndex;
    }

</script>
<script src="<c:url value="/resources/js/dat-ve/datve.js"/>"></script>
