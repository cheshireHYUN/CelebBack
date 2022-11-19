<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 4.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/favicon.png">
    
		
		<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <!-- row -->
			<div class="container-fluid">
			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>가맹점 상세</strong></h4>
          <span>가맹점의 상세정보를 조회합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">Advanced</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">Nestable</a></li>
      </ol>
  </div>
</div>
                <div class="row">
					<div class="col-xl-3 col-xxl-4 col-lg-12 col-md-12">
								<div class="card">
									<div class="card-header border-0 pb-0">
										<h4 class="card-title">가맹점주 정보</h4>
									</div>
									<div class="card-body">
										<div class="widget-timeline-icon">
											<ul class="timeline">
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹점주명</h4>
														<p class="fs-15 mb-0 ">${fran.owner.ownerName }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">연락처</h4>
														<p class="fs-15 mb-0 ">${fran.owner.ownerName }</p>
													</a>
												
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">생년월일</h4>
														<p class="fs-15 mb-0 ">${fran.owner.ownerBirth }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">집주소</h4>
														<p class="fs-15 mb-0 ">${fran.owner.ownerAdd1 }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹등록일자</h4>
														<p class="fs-15 mb-0 ">${fran.franStdate }</p>
													</a>
												</li>
											</ul>
										</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-xxl-8 col-lg-12 col-md-12">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header border-0 pb-0">
										<h4 class="card-title">가맹점 정보</h4>
									</div>
									<div class="card-body">
									
									<div class="row searchKeword">
									<div class="widget-timeline-icon">
											<ul class="timeline">
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹점명</h4>
														<p class="fs-15 mb-0 ">${fran.franName }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹점 전화번호</h4>
														<p class="fs-15 mb-0 ">${fran.franTel }</p>
													</a>
												
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹점 운영상태</h4>
														<p class="fs-15 mb-0 ">${fran.franState }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">우편번호</h4>
														<p class="fs-15 mb-0 ">${fran.franZip }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">가맹점주소</h4>
														<p class="fs-15 mb-0 ">${fran.franAdd1 }</p>
													</a>
												</li>
<!-- 												<li> -->
<!-- 													<div class="icon bg-primary"></div> -->
<!-- 													<a class="timeline-panel text-muted" href="javascript:void(0);"> -->
<!-- 														<h4 class="mb-2">가맹점계좌번호</h4> -->
<%-- 														<p class="fs-15 mb-0 ">${fran.franAccount }</p> --%>
<!-- 													</a> -->
<!-- 												</li> -->
											</ul>
										</div>
										</div>
										<div class="row searchKeword cb-pl10 cb-vertical-top">
									<div class="widget-timeline-icon cb-vertical-top">
											<ul class="timeline">
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">개점예정일</h4>
														<p class="fs-15 mb-0 ">${fran.franOpdate }</p>
													</a>
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">인테리어시작일</h4>
														<p class="fs-15 mb-0 ">${fran.franInsdate }</p>
													</a>
												
												</li>
												<li>
													<div class="icon bg-primary"></div>
													<a class="timeline-panel text-muted" href="javascript:void(0);">
														<h4 class="mb-2">인테리어 종료일</h4>
														<p class="fs-15 mb-0 ">${fran.franInedate }</p>
													</a>
												</li>
											</ul>
										</div>
										</div>
<!-- 										<div class="row mx-0"> -->
<!-- 											<div class="iconbox col-md-4 col-lg-3 mb-3 mb-md-0"> -->
<!-- 												<i class="las la-phone"></i> -->
<!-- 												<small>Telepon</small> -->
<!-- 												<p>+12 345 5662 66</p> -->
<!-- 											</div> -->
<!-- 											<div class="iconbox col-md-4 col-lg-3 mb-md-0"> -->
<!-- 												<i class="las la-shipping-fast"></i> -->
<!-- 												<small>Delivery Time</small> -->
<!-- 												<p>12:52 AM</p> -->
<!-- 											</div> -->
<!-- 										</div> -->
									</div>
									
								</div>
							</div>
						</div>
					</div>
				 </div>
            </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


    <!--**********************************
        Scripts
    ***********************************-->
	<!-- Counter Up -->
    <script src="${cPath}/resources/dashboard3/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="${cPath}/resources/dashboard3/vendor/jquery.counterup/jquery.counterup.min.js"></script>	
		
	<!-- Chart piety plugin files -->
    <script src="${cPath}/resources/dashboard3/vendor/peity/jquery.peity.min.js"></script>	
		
	<!-- Apex Chart -->
	<script src="${cPath}/resources/dashboard3/vendor/apexchart/apexchart.js"></script>	
</body>
</html>