<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 2.      황단비      최초작성
* 2022. 9. 1.      서재원      대시보드 수정
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="content-body">
	<div class="container-fluid">
			<div class="row page-titles">

			<div class="col-sm-6 form-head d-flex align-items-start" style="padding-left:0px">
					<div class="me-auto d-none d-lg-block">
						<h2 class="text-primary font-w600 mb-0">
						<i class="la la-home me-2"></i>CelebBack Steak House</h2>
						<p class="mb-0">Welcome to CelebBack Admin!</p>
					</div>
				</div>
				
			<div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item">관리자</li>
			          <li class="breadcrumb-item active">대시보드</li>
			      </ol>
			  </div>
			</div>
				<!-- 최상단 텍스트 시작 -->
<!-- 				<div class="form-head d-flex mb-3 align-items-start">
					<div class="me-auto d-none d-lg-block">
						<h2 class="text-primary font-w600 mb-0">
						<i class="la la-home me-2"></i>CelebBack Steak House</h2>
						<p class="mb-0">Welcome to CelebBack Admin!</p>
					</div>
				</div> -->
				<!-- 최상단 텍스트 끝 -->
			<!-- admin 왼쪽카드 시작 가장 바깥 row -->
			<div class="row">
			
				<div class="col-xl-3"> <!-- 일단 첫번쨰 col -->
			
					<div class=""> <!-- 이거 지우니까 넓어짐ㅎㅎ.. -->
						
							<div class="col-xl-12 col-lg-6 ">
								<div class="card h-auto">
									<div class="card-body text-center">
										<img src="${cPath}/resources/dashboard3/images/damgom.png" width="150" class="rounded-circle mb-4" alt=""/>
										<security:authentication property="principal" var="authMember"/>
										<h4 class="mb-3 text-black font-w600">
										<i class="la la-user"></i>${authMember.realMember.adminId}
										</h4>
										<p class="badge light badge-primary" style="border-radius: 10px;
										text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
										">최고관리자</p>
									</div>
									<div class="card bg-secondary sticky mb-0">
										<div class="card-header border-0 pb-0">
											<h5 class="card-title text-white mt-2">Dashboard</h5>
										</div>
										<div class="card-body pt-3">
											<p class="fs-14 op7 text-white" style="margin: 0px 0px 0px 0px;">셀럽백의 관리자 대시보드입니다.<br>
											이 페이지에서는 자주 찾는 메뉴로 빠르게 이동할 수 있으며,<br>신규 주문과 가맹점 미납건을 각각 최대 5건까지 한눈에 조회할 수 있습니다.
											</p>
										</div>
										<div class="card-footer border-0 py-4 bg-primary rounded-xl">
											<div class="media align-items-center">
											<!-- 	<img class="me-3 img-fluid rounded-circle" width="50" src="./images/delivery.png" alt="DexignZone"> -->
												<div class="media-body" align="center">
													<h5 class="my-0 text-white">
													CelebBack Steak House © 2022 <br>All Rights Reserved
													</h5>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
					</div>
			</div> <!-- 첫번쨰 col -->
			
			<div class="col-xl-9"> <!-- 두번쨰 col -->	
				<div class="row"> <!-- 카드첫번째 노랑row -->
					<div class="col-xl-3">
						<div class="widget-stat card" style="height:133px;">
							<div class="card-body p-4" style="height:133px;">
								<div class="media ai-icon d-flex">	
									<div class="media-body" style="text-align:center;">
										<h3 class="mb-0 text-black"><span class="counter ms-0" style="font-size: 24px;"><a href="${cPath}/head/fr" style="color:#2f4cdd;" onmouseover="this.style.color='#a2b0f7'" onmouseout="this.style.color='#2f4cdd'">가맹점관리</a></span></h3>
										<p class="mb-0">가맹점 목록 조회, 상세조회</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3">
						<div class="widget-stat card" style="height:133px;">
							<div class="card-body p-4" style="height:133px;">
								<div class="media ai-icon d-flex">
									<div class="media-body" style="text-align:center;">
										<h3 class="mb-0 text-black"><span class="counter ms-0" style="font-size: 24px;"><a href="${cPath}/head/buyerPurchase" style="color:#2f4cdd;" onmouseover="this.style.color='#a2b0f7'" onmouseout="this.style.color='#2f4cdd'">매입내역관리</a></span></h3>
										<p class="mb-0">거래처 매입내역 조회, 추가</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3">
						<div class="widget-stat card" style="height:133px;">
							<div class="card-body p-4" style="height:133px;">
								<div class="media ai-icon d-flex">
									<div class="media-body" style="text-align:center;">
										<h3 class="mb-0 text-black"><span class="counter ms-0" style="font-size: 24px;"><a href="${cPath}/head/netProfit" style="color:#2f4cdd;" onmouseover="this.style.color='#a2b0f7'" onmouseout="this.style.color='#2f4cdd'">손익계산서</a></span></h3>
										<p class="mb-0">영업이익, 당기순이익 조회</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3">
						<div class="widget-stat card" style="height:133px;">
							<div class="card-body p-4" style="height:133px;">
								<div class="media ai-icon d-flex">
									<div class="media-body" style="text-align:center;">
										<h3 class="mb-0 text-black"><span class="counter ms-0" style="font-size: 24px;"><a href="${cPath}/head/prodStock" style="color:#2f4cdd;" onmouseover="this.style.color='#a2b0f7'" onmouseout="this.style.color='#2f4cdd'">제품재고현황</a></span></h3>
										<p class="mb-0">제품별 재고현황 조회</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
					
				<div class="row"> <!-- 두번째row -->
				
					<!-- 위젯 첫번째카드!!!! -->
					<div class="col-xl-6 col-xxl-6 col-lg-12 col-md-12">
						<div class="card">
							<div class="card-header border-0 pb-0 flex-wrap d-block">
								<div> <!-- mb-3 빼니까 여백 사라짐 -->
									
								<div class="row">

									<div class="col">
									<h4 class="card-title mb-1"><i class='fa fa-exclamation-circle'></i><strong> 신규 주문 <font color='#2bc155'>${orderCnt}</font>건</strong></h4>
									</div>

									<div class="col" align="right">
									<a href="${cPath}/head/frOrder" class="btn btn-primary light btn-xs">더보기</a>
									</div>

								</div>
								
									<small class="mb-0">신규 데이터 최대 5건만 조회되며, 모두 보려면 <strong>더보기</strong>를 클릭하세요.</small>
								</div>

							</div>
								<div class="card-body tab-content orders-summary pt-3">
									<c:set var="orderList" value="${orderList}"/>
										<c:choose>
											<c:when test="${not empty orderList}">
												<c:forEach items="${orderList}" var="order">
													<div class="d-flex flex-wrap order-manage p-3 align-items-center mb-1">
														<h4 class="mb-0" style="font-size: 16px;"><i class="fa fa-circle text-success ms-1 fs-15"></i> ${order.franName}</h4>
														<a href="javascript:void(0);" class="ms-auto text-success font-w500">￦${order.frOrderPrice}<i class="ti-angle-right ms-1"></i></a>
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
													<div class="d-flex flex-wrap order-manage p-3 align-items-center mb-1">
														<h4 class="mb-0"><i class="fa fa-circle text-success ms-1 fs-15"></i> 데이터 없음</h4>
													</div>
											</c:otherwise>
										</c:choose>

								</div>
						</div>
					</div>
					<!-- 위젯 첫번째카드 끝!!!! -->
					<!-- 위젯 두번째카드!!!! -->
					<div class="col-xl-6 col-xxl-6 col-lg-12 col-md-12">
						<div class="card">
							<div class="card-header border-0 pb-0 flex-wrap d-block">
								<div> <!-- mb-3 빼니까 여백 사라짐 -->
									
								<div class="row">

									<div class="col">
									<h4 class="card-title mb-1"><i class='fa fa-exclamation-circle'></i><strong> 가맹점 미납 <font color='#f72b50'>${notPaymentCnt}</font>건</strong></h4>
									</div>

									<div class="col" align="right">
									<a href="${cPath}/head/frPayment" class="btn btn-primary light btn-xs">더보기</a>
									</div>

								</div>
								
									<small class="mb-0">신규 데이터 최대 5건만 조회되며, 모두 보려면 <strong>더보기</strong>를 클릭하세요.</small>
								</div>

							</div>
								<div class="card-body tab-content orders-summary pt-3">
									<c:set var="npList" value="${notPaymentList}"/>
										<c:choose>
											<c:when test="${not empty npList}">
												<c:forEach items="${npList}" var="np">
													<div class="d-flex flex-wrap badge-danger light p-3 align-items-center mb-1" style="border-radius: 12px;">
														<h4 class="mb-0" style="font-size: 16px;"><i class="fa fa-circle text-danger ms-1 fs-15"></i> ${np.franName}</h4>
														<a href="javascript:void(0);" class="ms-auto text-danger font-w500">
														￦ <fmt:formatNumber value="${np.feeCost}" pattern="#,###,###"/>
														<i class="ti-angle-right ms-1"></i></a>
													</div>
												</c:forEach>
											</c:when>
											<c:otherwise>
													<div class="d-flex flex-wrap badge-danger light p-3 align-items-center mb-1" style="border-radius: 12px;">
														<h4 class="mb-0"><i class="fa fa-circle text-danger ms-1 fs-15"></i> 데이터 없음</h4>
													</div>
											</c:otherwise>
										</c:choose>

								</div>
						</div>
					</div>
					
					</div><!-- 두번째 row) -->
				</div> <!-- 두번째 col -->	
			</div>
			<!-- admin 왼쪽카드 끝 (row) : 첫번쨰 카드 끝.-->
	</div>
	<!-- container-fluid 끝 -->
</div>
<!-- content-body 끝 -->