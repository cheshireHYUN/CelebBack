<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 5.      황단비      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css"> -->
<link rel="stylesheet" href="${cPath }/resources/dashboard3/vendor/chartist/css/chartist.min.css">
<link href="https://cdn.lineicons.com/2.0/LineIcons.css" rel="stylesheet">
<style>
img { 
 width : 100%;
 height: 100%; 
}
</style>

<div class="content-body">
	<div class="container-fluid">
	                    <div >
                    			<!-- 파란카드 템플릿 -->
<div class="row page-titles">
  <div class="col-sm-6 p-md-0">
      <div class="welcome-text">
          <h4><strong>매출분석</strong></h4>
          <span>가맹점별 이번달 손익계산서를 조회합니다.</span>
      </div>
  </div>
  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
      <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="javascript:void(0)">매장관리</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">매출분석</a></li>
      </ol>
  </div>
</div>
 <div class="row">
                                <div id="searchUI">
                                <div class="mb-3 col-md-7 searchKeword" >
                               	  <label class="col-sm-2 col-form-label" style="padding-left:5rem;">년도</label>
                                				<div class="form-check form-check-inline ">
	                                                <label class="form-check-label">
					                                  <input type="text" name="searchStartDate" list="choise2" class="form-control col-md-2 searchKeword" value="2022">
					                                        <datalist id="choise2">
					                                        	<c:forEach items="1">
					                                        		<option value="2022" label="2022년"/>
					                                        		<option value="2021" label="2021년"/>
					                                        		<option value="2020" label="2020년"/>
					                                        		<option value="2019" label="2019년"/>
					                                        		<option value="2018" label="2018년"/>
					                                        	</c:forEach>
					                                        </datalist>
	                                				</label>
                                				</div>
                                				<label class="col-sm-2 col-form-label" style="padding-left:5rem;">월</label>
                                				<div class="form-check form-check-inline ">
	                                                <label class="form-check-label">
					                                  <input type="text" name="searchEndDate" list="choise3" class="form-control col-md-2 searchKeword" value="07">
					                                        <datalist id="choise3">
					                                        	<c:forEach items="1">
					                                        		<option value="01" label="1월"/>
					                                        		<option value="02" label="2월"/>
					                                        		<option value="03" label="3월"/>
					                                        		<option value="04" label="4월"/>
					                                        		<option value="05" label="5월"/>
					                                        		<option value="06" label="6월"/>
					                                        		<option value="07" label="7월"/>
					                                        		<option value="08" label="8월"/>
					                                        		<option value="09" label="9월"/>
					                                        		<option value="10" label="10월"/>
					                                        		<option value="11" label="11월"/>
					                                        		<option value="12" label="12월"/>
					                                        	</c:forEach>
					                                        </datalist>
	                                				</label>
                                				</div>
                                  </div>
                                 <div class="mb-3 col-md-2 searchKeword cb-wp30 cb-float-right" >
									<div class="input-group search-area">
												<select name="searchType" class="dropdown bootstrap-select default-select form-control wide">
													<option value>전체</option>											
												<option value="franName">가맹점명</option>											
												<option value="franId">가맹점아이디</option>											
												<option value="ownerId">가맹점주아이디</option>												
												</select>
										<input type="text" name="searchWord" list="choise" class="form-control" value="대전오류점">
                                        <datalist id="choise">
                                        	<c:forEach items="${franNameList }" var="fr">
                                        		<option value="${fr.franName }" ></option>
                                        	</c:forEach>
                                        </datalist>
										<!-- <span class="input-group-text"><a href=""><i class="flaticon-381-search-2"></i></a></span> -->
										<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
									</div>
                                 </div>
                            </div>
                            </div>
                        <div class="card">
                            <div class="card-body">
                               
                                <div class="row">
			<div class="col-12">
				<div class="row">	
					<div class="col-xl-5">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" id="title">손익계산</h4>
							</div>
							<div class="card-body">
							 <div class="table-responsive">
                                    <table class="table" style="min-width: 300px;">
                                         <thead>
                                            <tr>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">과목</th>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">금액(원)</th>
                                            </tr>
                                        </thead>
                                            <col width="50%" />
   											<col width="50%" />
                                        <tbody>
                                            <tr>
                                                <td class="table-active">Ⅰ. 매출액</td>
                                                <td class="table-active" style="text-align:right;" id="salesRevenue">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제품판매액</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="totalSale">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">Ⅱ. 판매비와관리비</td>
                                                <td class="table-active" style="text-align:right;" id="sna">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가맹비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="franCost">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익쉐어비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="shareCost">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인건비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="empCost">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">Ⅲ. 매출원가</td>
                                                <td class="table-active" style="text-align:right;" id="buyerprodPrice">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입가</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="totalPrime">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-danger">Ⅴ. 영업이익</td>
                                                <td style="background-color:#ffeff3; text-align: right; color:#f72b50;" id="busiProf">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-danger">Ⅵ. 당기순이익</td>
                                                <td style="background-color:#ffeff3; text-align: right; color:#f72b50;" id="currentProf">
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
							</div>
						</div>
					</div>
<!-- 				<div class="col-lg-6 col-sm-6"> -->
				<div class="col-xl-7">
					<div class="col-xl-12 col-lg-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">매출추이</h4>
							</div>
							<div class="card-body" id="chartDiv">
								<canvas id="myChart" width="400" height="400"></canvas>
							</div>
						</div>
					</div>
					</div>
					
					</div>
			</div>
		</div>
                                
                                
                            </div>
                        </div>
                    </div>
	
		
<!-- 		<div class="form-head d-flex mb-3 align-items-start"> -->
<!-- 					<div class="me-auto d-none d-lg-block"> -->
<!-- 						<h2 class="text-primary font-w600 mb-0">Analytics</h2> -->
<!-- 						<p class="mb-0">Here is your restaurant summary with graph view</p> -->
<!-- 					</div> -->
					
<!-- 					<div class="dropdown custom-dropdown"> -->
<!-- 						<div class="btn btn-sm btn-primary light d-flex align-items-center svg-btn" data-bs-toggle="dropdown"> -->
<!-- 							<svg width="28" height="28" viewBox="0 0 28 28" fill="none" xmlns="http://www.w3.org/2000/svg"><g><path d="M22.4281 2.856H21.8681V1.428C21.8681 0.56 21.2801 0 20.4401 0C19.6001 0 19.0121 0.56 19.0121 1.428V2.856H9.71606V1.428C9.71606 0.56 9.15606 0 8.28806 0C7.42006 0 6.86006 0.56 6.86006 1.428V2.856H5.57206C2.85606 2.856 0.560059 5.152 0.560059 7.868V23.016C0.560059 25.732 2.85606 28.028 5.57206 28.028H22.4281C25.1441 28.028 27.4401 25.732 27.4401 23.016V7.868C27.4401 5.152 25.1441 2.856 22.4281 2.856ZM5.57206 5.712H22.4281C23.5761 5.712 24.5841 6.72 24.5841 7.868V9.856H3.41606V7.868C3.41606 6.72 4.42406 5.712 5.57206 5.712ZM22.4281 25.144H5.57206C4.42406 25.144 3.41606 24.136 3.41606 22.988V12.712H24.5561V22.988C24.5841 24.136 23.5761 25.144 22.4281 25.144Z" fill="#2F4CDD"></path></g></svg> -->
<!-- 							<div class="text-start ms-3"> -->
<!-- 								<span class="d-block fs-16">Filter Periode</span> -->
<!-- 								<small class="d-block fs-13">4 June 2020 - 4 July 2020</small> -->
<!-- 							</div> -->
<!-- 							<i class="fa fa-angle-down scale5 ms-3"></i> -->
<!-- 						</div> -->
<!-- 						<div class="dropdown-menu dropdown-menu-right"> -->
<!-- 							<a class="dropdown-item" href="#">4 June 2020 - 4 July 2020</a> -->
<!-- 							<a class="dropdown-item" href="#">5 july 2020 - 4 Aug 2020</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!--                         <div class="card"> -->
<!--                             <div class="card-body"> -->
                <div class="row">
					<div class="col-xl-6 col-xxl-6 col-lg-12 col-lg-9 col-md-12">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header border-0 pb-0 d-sm-flex d-block">
										<div class="me-3">
											<h4 class="card-title mb-1">월 트렌드</h4>
											<small class="mb-0">월별 메뉴 트렌드를 확인할 수 있습니다.</small>
										</div>
									</div>
									<div class="card-body revenue-chart px-3">
										<div class="custom-tab-1">
<!--                                     <ul class="nav nav-tabs"> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-1" class="nav-link active" data-bs-toggle="tab" aria-expanded="false"><strong>1월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-2" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>2월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-3" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>3월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-4" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>4월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-5" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>5월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-6" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>6월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-7" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>7월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-8" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>8월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-9" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>9월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-10" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>10월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-11" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>11월</strong></a> -->
<!--                                         </li> -->
<!--                                         <li class="nav-item"> -->
<!-- 											<a href="#navpills-12" class="nav-link" data-bs-toggle="tab" aria-expanded="false"><strong>12월</strong></a> -->
<!--                                         </li> -->
<!--                                     </ul> -->

									<div class="tab-content">
										<div id="navpills-1" class="tab-pane active">
											<div class="content-wrapper">

												<div class="tab-pane fade show active" id="home1"
													role="tabpanel">
													<div id="myfirstchart" class="morris_chart_height mAuto"></div>
												</div>
											</div>
										</div>

									</div>
								</div>
									</div>
									
								</div>
							</div>
							
						</div>
					</div>
					<div class="col-xl-6 col-xxl-6 col-lg-12  col-lg-9 col-md-12">
						<div class="row">
							<div class="col-xl-12">
								<div class="card">
									<div class="card-header border-0 pb-0 d-sm-flex d-block">
										<div class="me-3">
											<h4 class="card-title mb-1">전체 음식 판매 순위</h4>
<!-- 											<small class="mb-0">Lorem ipsum dolor sit amet, consectetur</small> -->
										</div>
									</div>
									<div class="card-body p-0 pt-3">
										<c:forEach items="${chart2 }" var="chart2" >
											<div class="media items-list-1">
												<span class="col-1 px-0 align-self-center">${chart2.RNK }</span>
												<div class="media-body col-sm-4 col-6 px-0">
													<h4 class="mt-0 mb-3">${chart2.MENU_NAME } </h4>
<%-- 													<small class="font-w500"><strong class="text-secondary me-2">￦ ${chart2.SUM_QTY }</strong></small> --%>
												</div>
											</div>
										
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				 </div>
					<div class="col-xl-12 col-xxl-6 col-lg-12  col-lg-9 col-md-12">
						<div class="col-xl-12">
								<div class="card">
									<div class="card-header border-0 pb-0 d-sm-flex flex-wrap d-block">
										<div class="mb-3">
											<h4 class="card-title mb-1">시즌별 음식 매출 순위</h4>
<!-- 											<small class="mb-0">Lorem ipsum dolor sit amet, consectetur</small> -->
										</div>
										<div class="card-action card-tabs mb-3">
											<ul class="nav nav-tabs" >
												<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#firstQuarter" role="tab">1분기</a></li>
												<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#secondQuarter" role="tab">2분기</a></li>
												<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab" href="#thirdQuarter" role="tab">3분기</a></li>
												<li class="nav-item"><a class="nav-link" data-bs-toggle="tab" href="#fourthQuarter" role="tab">4분기</a></li>
											</ul>
										</div>
									</div>
									<div class="card-body tab-content cb-tAlign-center">
										<div class="tab-pane fade show active" id="firstQuarter">
												<c:forEach items="${fLank1 }" var="fLank1">
													<div class="searchKeword col-md-2 col-xl-2 col-xxl-6 col-sm-6 mb-5">
														<div class="media mb-4">
															<img src="${cPath }${fLank1.THUMB_IMG}" style="width:100%;" class="rounded" alt=""/>
														</div>
														<div class="info">
												<span class="col-1 px-0 align-self-center">${fLank1.RNK }</span>
															<h5 class="text-black mb-3"><a class="text-black" href="ecom-product-detail.html">${fLank1.MENUNAME }</a></h5>
<!-- 															<i class="fa fa-heart-o me-2 scale5 "></i> <strong>256k</strong> Like it -->
														</div>
													</div>
												</c:forEach>
										</div>
										<div class="tab-pane fade show active" id="secondQuarter">
												<c:forEach items="${fLank2}" var="fLank2">
<!-- 													<div class="searchKeword col-md-2 col-xl-2 col-xxl-6 col-sm-6 mb-5"> -->
<!-- 														<div class="media mb-4"> -->
<%-- 															<img src="${cPath }${fLank2.THUMB_IMG}" style="width:100%;" class="rounded" alt=""/> --%>
<!-- 														</div> -->
<!-- 														<div class="info"> -->
<%-- 												<span class="col-1 px-0 align-self-center">${fLank2.RNK }</span> --%>
<%-- 															<h5 class="text-black mb-3"><a class="text-black" href="ecom-product-detail.html">${fLank2.MENUNAME }</a></h5> --%>
<!-- 														</div> -->
<!-- 													</div> -->
												</c:forEach>
										</div>
										<div class="tab-pane fade show active" id="thirdQuarter">
												<c:forEach items="${fLank3 }" var="fLank3">
													<div class="searchKeword col-md-2 col-xl-2 col-xxl-6 col-sm-6 mb-5">
														<div class="media mb-4">
															<img src="${cPath }${fLank3.THUMB_IMG}" style="width:100%;" class="rounded" alt=""/>
														</div>
														<div class="info">
												<span class="col-1 px-0 align-self-center">${fLank3.RNK }</span>
															<h5 class="text-black mb-3"><a class="text-black" href="ecom-product-detail.html">${fLank3.MENUNAME }</a></h5>
<!-- 															<i class="fa fa-heart-o me-2 scale5 "></i> <strong>256k</strong> Like it -->
														</div>
													</div>
												</c:forEach>
										</div>
										<div class="tab-pane fade show active" id="fourthQuarter">
												<c:forEach items="${fLank4 }" var="fLank4">
													<div class="searchKeword col-md-2 col-xl-2 col-xxl-6 col-sm-6 mb-5">
														<div class="media mb-4">
															<img src="${cPath }${fLank4.THUMB_IMG}" style="width:100%;" class="rounded" alt=""/>
														</div>
														<div class="info">
												<span class="col-1 px-0 align-self-center">${fLank4.RNK }</span>
															<h5 class="text-black mb-3"><a class="text-black" href="ecom-product-detail.html">${fLank4.MENUNAME }</a></h5>
<!-- 															<i class="fa fa-heart-o me-2 scale5 "></i> <strong>256k</strong> Like it -->
														</div>
													</div>
												</c:forEach>
										</div>
									</div>
								</div>
							</div>
					</div>
</div>
</div>
<form id="searchForm" method="post" action="${cPath }/head/frSales/search" >
<sec:csrfInput/>
	<input type="hidden"  name="searchType"/> 
	<input type="hidden"  name="searchWord"/>
	<input type="hidden"  name="searchStartDate"/>
	<input type="hidden"  name="searchEndDate"/>
</form>

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${cPath }/resources/dashboard3/vendor/flot/jquery.flot.js"></script>
    <script src="${cPath }/resources/dashboard3/js/plugins-init/flot-init.js"></script>
    
	<!-- Apex Chart -->
	<script src="${cPath }/resources/dashboard3/vendor/apexchart/apexchart.js"></script>
    
    <!-- Chart ChartJS plugin files -->
    <script src="${cPath }/resources/dashboard3/vendor/chart.js/Chart.bundle.min.js"></script>
<%--     <script src="${cPath }/resources/dashboard3/js/plugins-init/chartjs-init.js"></script> --%>
    
	
    <!-- Chart Morris plugin files -->
<%--     <script src="${cPath }/resources/dashboard3/vendor/raphael/raphael.min.js"></script> --%>
<%--     <script src="${cPath }/resources/dashboard3/vendor/morris/morris.min.js"></script> --%>

<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    <script src="${cPath }/resources/dashboard3/js/plugins-init/morris-init.js"></script>
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

let listBody=$('#listBody');
let searchUI = $("#searchUI");
let totalSale = $('#totalSale');
let franCost = $('#franCost');
let shareCost = $('#shareCost');
let empCost = $('#empCost');
let totalPrime = $('#totalPrime');
let busiProf = $('#busiProf');
let currentProf = $('#currentProf');
let title = $('#title');
let chartDiv = document.getElementById('chartDiv');
let canvas = document.getElementById('myChart');
let myChart=null;
let myfirstchart=null;
let searchForm = $("#searchForm").on("submit",function(event){
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();
//		console.log("this.name: ",this.name);
//		console.log("data: ",data);
//		console.log("this: ",this);

	$.ajax({ // 폼태그의 동기요청을 비동기로 바꾸려고한다~
		url : url,
		data : data,
		method : method,
		dataType : "json" // text, html, json, xml, script (공통점 >> main type: text),  파일 업로드 처리를 비동기로?(FormData)
		,
		beforeSend : function(xhr)
		{
			   xhr.setRequestHeader(header,token);
			},
		success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
			totalSale.empty();
			franCost.empty();
			shareCost.empty();
			empCost.empty();
			totalPrime.empty();
			busiProf.empty();
			currentProf.empty();

// 			if(myChart!=null){
// 				document.getElementById('myChart').remove();
// 				chartDiv.append(
// 					$('<canvas>').attr({
// 						"id" : "myChart"
// 						,"width": "400"
// 						,"height" : "400"
// 					})
// 				);
				
// // 				ctx = document.getElementById('myChart');
// 			}
// 			<canvas id="myChart" width="400" height="400"></canvas>
			
			title.html("손익계산서");
			
			let profList;
			console.log(resp);
			var valueList=[];
			var valueList2=[];
// 			valueList2.push({ y: '1월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '2월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '3월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '4월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '5월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '6월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '7월', a: 0, b: 0, d:0 });
	  		for(var i=0; i<resp.chart5.length;i++){
	  			valueList2.push(resp.chart5[i]);
	  		}
// 			valueList2.push({ y: '10월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '11월', a: 0, b: 0, d:0 });
// 			valueList2.push({ y: '12월', a: 0, b: 0, d:0 });
			console.log("valueList2",valueList2);
	  		
	  		valueList.push(resp.chart.month1);
	  		valueList.push(resp.chart.month2);
	  		valueList.push(resp.chart.month3);
	  		valueList.push(resp.chart.month4);
	  		valueList.push(resp.chart.month5);
	  		valueList.push(resp.chart.month6);
	  		valueList.push(resp.chart.month7);
	  		valueList.push(resp.chart.month8);
	  		valueList.push(resp.chart.month9);
	  		valueList.push(resp.chart.month10);
	  		valueList.push(resp.chart.month11);
	  		valueList.push(resp.chart.month12);
	  		console.log("valueList", valueList);
	  		
	  		

			title.html("손익계산");
			if(resp.profitVO.totalSale==null){
				profList = resp.prof;
				title.html(profList.franName +" 손익계산");
				totalSale.html(profList.totalSale.toLocaleString('ko-KR'));
				franCost.html(profList.franCost.toLocaleString('ko-KR'));
				shareCost.html(profList.shareCost.toLocaleString('ko-KR'));
				// 아직 더미데이터가 완벽하지 않아서 두번째 검색부터 오류날거임. 확인하고싶으면 이 줄 포함 밑으로 3줄 주석하면 됨
				currentProf.html(profList.currentProf.toLocaleString('ko-KR')); 
				busiProf.html(profList.busiProf.toLocaleString('ko-KR'));
				totalPrime.html(profList.totalPrime.toLocaleString('ko-KR'));
				empCost.html(profList.empCost.toLocaleString('ko-KR'));
				
			}else{
				profList = resp.profitVO;
				title.html("손익계산");
				totalSale.html("데이터 없음");
				franCost.html("데이터 없음");
				shareCost.html("데이터 없음");
				currentProf.html("데이터 없음");
				busiProf.html("데이터 없음");
				totalPrime.html("데이터 없음");
				empCost.html("데이터 없음");
			}

			<%--morris.js --%>
			new Morris.Bar({
				  element: 'myfirstchart',
				   data: valueList2,
// 				   data:[
// 					   { MON: '1월', ONE: 1, TWO: 0, THREE:0 },
// 					   { MON: '2월', ONE: 2, TWO: 0, THREE:6 },
// 					   { MON: '3월', ONE: 3, TWO: 0, THREE:0 },
// 					   { MON: '4월', ONE: 4, TWO: 2, THREE:0 },
// 					   { MON: '5월', ONE: 5, TWO: 0, THREE:0 },
// 					   { MON: '6월', ONE: 6, TWO: 2, THREE:0 },
// 					   { MON: '7월', ONE: 0, TWO: 0, THREE:0 },
// 					   { MON: '8월', ONE: 0, TWO: 0, THREE:0 },
// 					   { MON: '9월', ONE: 0, TWO: 0, THREE:0 },
// 					   { MON: '10월', ONE: 0, TWO: 0, THREE:0 },
// 					   { MON: '11월', ONE: 0, TWO: 0, THREE:0 },
// 					   { MON: '12월', ONE: 0, TWO: 0, THREE:0 }
					   
// 				   ],
			        hoverCallback: function(index, options, content, row) {
			        	console.log(index);
			        	console.log(options);
			        	console.log(content);
			        	console.log(row);
			        	var a =
			        		'<div class="morris-hover-row-label">'+row.MON+'</div><div class="morris-hover-point" style="color: #3D8361">'
							+'ONE: '
							+row.ONE
							+'</div><div class="morris-hover-point" style="color: #FF7F3F">'
							+'TWO: '
							+row.TWO
							+'</div><div class="morris-hover-point" style="color: #FBDF07">'
							+'THREE: '
							+row.THREE
							+'</div>'
			        		;
			        	return a;
			        },
			        xkey: 'MON',
					labels: ['ONE', 'TWO', 'THREE'],
			        ykeys: ['ONE', 'TWO', 'THREE'],
			        barColors: function (row, series, type) {
			        	if(series.key == "ONE") return "#3D8361";
			        	else if(series.key == "TWO") return "#FF7F3F";
			        	else if(series.key == "THREE") return "#FBDF07";
// 			        	else if(series.key == "d") return "#123123";
			        },
					hideHover: 'auto',
					gridLineColor: 'transparent',
					resize: true,
					barSizeRatio: 1
				});

			<%-- chart.js --%>
			if(myChart != null){
				myChart.data.datasets[0].data = valueList;
		        myChart.update();
			}
			
			myChart = new Chart(ctx, {
			    type: 'bar',
			    data: {
			        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			        datasets: [{
			            label: '# (단위:만원)',
			            data: valueList,
			            backgroundColor: [
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)'
			            ],
			            borderColor: [
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)',
			                'rgba(0,  153,  76, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options : {
					maintainAspectRatio : false, // 부모 안에서 동적으로 크기 맞춤
					scales : {
						yAxes : [ {
							ticks : {
								min : 0,
								max : 5000,
								stepSize : 500,
								fontSize : 14,
							}
						} ]
					}
				}
			});
			
			myChart.data.datasets[0].data = valueList;
	        myChart.update();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return false;
}).submit();


$("#searchBtn").on("click",function(){
	// name을 가진 입력태그(:input 입력용 input태그들 선택)
	console.log("눌렸다!");
	searchForm.get(0).reset(); // 클리어
	let inputs = searchUI.find(":input[name]"); 
	$(inputs).each(function(idx, input){ // each : jquery 반복문
		let name = $(this).attr('name'); // input
		let value = $(this).val();
		searchForm.find("[name="+name+"]").val(value);
	});
	searchForm.submit();
});


const ctx = document.getElementById('myChart').getContext('2d');


</script>