<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* 2022. 8. 5.      이혜원      카테고리 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#menu > li > a > i,
#menu > li > a > span {
	color: white;
}
.deznav .metismenu ul a:hover, .deznav .metismenu ul a:focus, .deznav .metismenu ul a.mm-active {
    text-decoration: none;
    background-color: rgba(255, 255, 255, 0.49);
    color: white;
}
.deznav .metismenu a {
    color: #a9b7ff;
}
[data-sidebar-style="full"][data-layout="vertical"] .deznav .metismenu>li.mm-active>a {
	background-color: rgba(235, 238, 255, 0.2);
}
[data-sidebar-style="full"][data-layout="vertical"] .deznav .metismenu>li .has-arrow:after {
	color: white;
}
</style>

<!--     <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse cb-pl0"> -->
       <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="deznav" style="background-color: #16213E;">
            <div class="deznav-scroll">
				<ul class="metismenu" id="menu">
					<li><a class="has-arrow ai-icon" href="${cPath }/fr/paper" aria-expanded="false">
							<i class="flaticon-381-ring-1"></i>
							<span class="nav-text">공문수신함</span>
						</a>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-list"></i>
							<span class="nav-text">납부</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="/CelebBack/fr/pay/bill/list">공과금</a></li>
							<li><a href="/CelebBack/fr/pay/fee/list">본사 청구액</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-calculator"></i>
							<span class="nav-text">매출분석</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/analysis/sales/list">손익분석</a></li>            
                            <li><a href="${cPath }/fr/analysis/popular/list">영업분석</a></li>            
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-home-1"></i>
							<span class="nav-text">가맹점정보관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/info/menu/menuList">메뉴관리</a></li>
                            <li><a href="${cPath }/fr/info/seat/seatList">좌석관리</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-network"></i>
							<span class="nav-text">재고관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/frStock">재고현황</a></li>
                            <li><a href="${cPath }/fr/atOrder">적정재고관리</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-notepad-2"></i>
							<span class="nav-text">발주관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/frOrder/prodOrder">발주하기</a></li>
                            <li><a href="${cPath }/fr/frOrder/orderList">발주내역</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-repeat-1"></i>
							<span class="nav-text">재고트레이딩</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/tradeShop">매장조회</a></li>
                            <li><a href="${cPath }/fr/tradeReq">트레이딩 요청현황</a></li>
                            <li><a href="${cPath }/fr/trade">트레이딩내역</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-calendar-1"></i>
							<span class="nav-text">예약관리</span>
						</a>
                        <ul aria-expanded="false">
                        	<li><a href="${cPath }/fr/reserve/resvReq">예약 요청현황</a></li>
                            <li><a href="${cPath }/fr/reserve/resvList">예약내역</a></li>               
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-edit"></i>
							<span class="nav-text">게시판관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/fr/frNotice">가맹점 공지사항</a></li>
                            <li><a href="${cPath }/fr/Notice">본사 공지사항</a></li>        
                        </ul>
                    </li>
                </ul>
            
<!-- 				<div class="add-menu-sidebar"> -->
<!-- 					<img src="images/icon1.png" alt=""/> -->
<!-- 					<p>Organize your menus through button bellow</p> -->
<!-- 					<a href="javascript:void(0);" class="btn btn-primary btn-block light">+ Add Menus</a> -->
<!-- 				</div> -->
				<br>
				<br>
				<div class="copyright">
					<p><strong>Celebback Steak House</strong> © 2022 All Rights Reserved</p>
					<p>Made with <span class="heart"></span> by DexignZone</p>
				</div>
			</div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->
<!--     </nav> -->
    
    
    
    
    
    
    
    
    
    