<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      최서현      최초작성
* 2022. 9. 6.      황단비	   기능추가
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
          <li class="breadcrumb-item"><a href="javascript:void(0)">분석</a></li>
          <li class="breadcrumb-item active"><a href="javascript:void(0)">손익분석</a></li>
      </ol>
  </div>
</div>
 <div class="row">
                                <div id="searchUI">
<!--                                 <div class="mb-3 col-md-7 searchKeword" > -->
<!--                                	  <label class="col-sm-2 col-form-label" style="padding-left:5rem;">년도</label> -->
<!--                                 				<div class="form-check form-check-inline "> -->
<!-- 	                                                <label class="form-check-label"> -->
<!-- 					                                  <input type="text" name="searchStartDate" list="choise2" class="form-control col-md-2 searchKeword" placeholder="년도"> -->
<!-- 					                                        <datalist id="choise2"> -->
<%-- 					                                        	<c:forEach items="1"> --%>
<!-- 					                                        		<option value="2022" label="2022년"/> -->
<!-- 					                                        		<option value="2021" label="2021년"/> -->
<!-- 					                                        		<option value="2020" label="2020년"/> -->
<!-- 					                                        		<option value="2019" label="2019년"/> -->
<!-- 					                                        		<option value="2018" label="2018년"/> -->
<%-- 					                                        	</c:forEach> --%>
<!-- 					                                        </datalist> -->
<!-- 	                                				</label> -->
<!--                                 				</div> -->
<!--                                   </div> -->
								<div class=" cb-float-right">
								<div class="searchKeword" >
                               	  <label class="col-form-label" >년도</label>
                                 <div class="form-check form-check-inline">
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
                                				</div>
                                	<div class="searchKeword" >
                               	 	 <label class="col-form-label" >월</label>
                               	 	 
                                	<div class="searchKeword cb-ml20" >
										<div class="input-group search-area">
											<input type="text" name="searchEndDate" list="choise3" class="form-control searchKeowrd" value="08" />
															<datalist id="choise3">
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
						                                        </datalist>
											<input id="searchBtn" type="button" value="검색" class="btn light btn-primary"/>
										</div>
									</div>
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
	
		
</div>
</div>
<form id="searchForm" method="post" action="${cPath }/fr/analysis/sales/list" >
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
    <script src="${cPath }/resources/dashboard3/js/plugins-init/chartjs-init.js"></script>
    
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

	  		console.log(valueList);
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