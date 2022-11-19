<%--
* [[개정이력(Modification Information)]]
* 수정일                       수정자                        수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.   황단비           최초작성
* 2022. 8. 4.   서재원           메뉴텍스트수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--     <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse cb-pl0"> -->
       <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="deznav">
            <div class="deznav-scroll">
				<ul class="metismenu" id="menu">
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-television"></i>
							<span class="nav-text">매장관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath }/head/fr">가맹점관리</a></li>
							<li><a href="${cPath }/head/frSales">매출분석</a></li>
                            <li><a href="${cPath }/head/paper">공문발송관리</a></li>
                            <li><a href="${cPath }/head/frPayment">가맹비미납관리</a></li>
                            <li><a href="${cPath }/head/frCheck">가맹점점검관리</a></li>
							
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="${cPath}/head/netProfit" aria-expanded="false">
							<i class="flaticon-381-calculator"></i>
							<span class="nav-text">손익계산서</span>
						</a>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-notepad-2"></i>
							<span class="nav-text">주문거래관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath}/head/frOrder">가맹점주문</a></li>
                            <li><a href="${cPath}/head/buyerPurchase">매입내역관리</a></li>
                            <li><a href="${cPath}/head/buyerInfo">거래처조회</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="${cPath}/head/prodStock" aria-expanded="false">
							<i class="flaticon-381-network"></i>
							<span class="nav-text">제품재고현황</span>
						</a>
                    </li>
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-app"></i>
							<span class="nav-text">메뉴관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="/CelebBack/head/menu">메뉴조회</a></li>
                            <li><a href="/CelebBack/head/menu/form">메뉴등록</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="${cPath }/head/coupon" aria-expanded="false">
							<i class="flaticon-381-gift"></i>
							<span class="nav-text" >쿠폰관리</span>
						</a>
                    </li>
                    
                    <li><a class="has-arrow ai-icon" href="javascript:void()" aria-expanded="false">
							<i class="flaticon-381-edit"></i>
							<span class="nav-text">게시판관리</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="${cPath}/head/Notice">공지사항</a></li>
                            <li><a href="${cPath}/head/frNotice">가맹점 공지사항</a></li>
                        </ul>
                    </li>
                    <li><a class="has-arrow ai-icon" href="${cPath }/head/frRepair" aria-expanded="false">
							<i class="flaticon-381-sync"></i>
							<span class="nav-text">BACKUP</span>
						</a>
                    </li>


                </ul>
            
<!-- 				<div class="add-menu-sidebar"> -->
<!-- 					<img src="images/icon1.png" alt=""/> -->
<!-- 					<p>Organize your menus through button bellow</p> -->
<!-- 					<a href="javascript:void(0);" class="btn btn-primary btn-block light">+ Add Menus</a> -->
<!-- 				</div> -->
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
    
    
    
    
    
    
    
    
    
    