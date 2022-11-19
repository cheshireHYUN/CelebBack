<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 6.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<link href="${cPath}/resources/css/headnfrSweet.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<head>
<style>
.table td{
padding: 6px 8px;
}

a:hover {
  text-decoration: underline;
}
</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js">
// 다운 받아서 넣지 말고 CDN을 쓰는 것을 권장함.
</script>

<div class="content-body">
 	<div class="container-fluid">
			<!-- 제목 템플릿 -->
			<div class="row page-titles" style="margin-bottom: 0px;">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>공과금 등록</strong></h4>
			          <span>납부한 공과금내역을 기록할 수 있습니다. 기록한 내역은 매출통계에 반영됩니다.</span>
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">납부</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">공과금</a></li>
			      </ol>
			  </div>
			</div> 
			<!-- 제목 템플릿 끝 -->
			
			<p>
	</div> <!-- 이거 추가하니까 테이블 꽉채워짐 -->


	<div class="container-fluid" style="padding-top: 15px;">
		<div class="row" style="display:flex; justify-content: center;">
					<div class="col-xl-5">
                        <div class="card">
                            <div class="card-header">
                                <a class="page-link" href="javascript:void(0)" onclick="goPrev()">
	                                <i class="la la-angle-left"></i></a>
                                <h4 id="inputMonth" class="card-title">n월</h4>
                                 <a class="page-link" href="javascript:void(0)" onclick="goNext()">
	                                 <i class="la la-angle-right"></i></a>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table" style="min-width: 300px;">
                                         <thead>
                                            <tr>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">비용</th>
                                                <th style="text-align: center; font-size: 16px; padding: 0px 10px 10px 10px;">금액</th>
                                            </tr>
                                        </thead>
                                            <col width="50%" />
   											<col width="50%" />
                                        <tbody>



                                        </tbody>
                                    </table>
                                    <div id="prevData"></div>
                                   <!--  <div id="dateDiv"></div> -->
                                    <div id="btnDiv" style="display:flex; justify-content: flex-end;">
                                    	
                                    </div>	

                                    
                                </div> 
                            </div>
                        </div>
					</div>
					
					
					<div class="col-xl-7 col-lg-12 col-sm-12">
                                <div class="card">
	                                <div class="card-header">
		                                <a class="page-link" href="javascript:void(0)" onclick="prevYear()">
			                                <i class="la la-angle-left"></i></a>
		                                <h4 id="chartYear" class="card-title">n년</h4>
		                                 <a class="page-link" href="javascript:void(0)" onclick="nextYear()">
			                                 <i class="la la-angle-right"></i></a>
	                            	</div>
                                    <div class="card-body">
										<canvas id="myChart" width="400" height="400"></canvas>
									</div>
                                </div>
                    </div>
					

                    

       </div> <!-- row -->
	</div> <!-- 두번째 container-fluid -->
</div>

<!-- Apex Chart -->
<script src="${cPath }/resources/dashboard3/vendor/apexchart/apexchart.js"></script>

<!-- Chart ChartJS plugin files -->
<script src="${cPath }/resources/dashboard3/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="${cPath }/resources/dashboard3/js/plugins-init/chartjs-init.js"></script>

<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$( document ).ready(function() {
	firstLoad();
	updateChartList();
	
});

function firstLoad(){
	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = nowDate.getMonth();
	if(parseInt(nowMonth) == 0){
		nowYear = nowYear-1;
		nowMonth = 12;
	}
	
	var v_date = nowYear+'/'+(nowMonth)+'/'+'01';
	
	getPage(v_date);
	
}


function getPage(v_date){
	datas = {
			selectedDate : v_date
	};
	
 	$.ajax({
		  type : 'post',
		  url : '${cPath}/fr/pay/bill/list',
		  contentType: 'application/json',
		  data : JSON.stringify(datas),
		  dataType : 'json',
		  
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  
		  success : function(result){
			  if(result.billNo == "0"){
				  drawNoBill(v_date);
			  }else{
				  drawYesBill(result,v_date);
			  }
		  },
		  error : function(data){
		    alert("납부내역 불러오기 실패!");
		  }
	});
}


// 차트 년도 선택
var date = new Date();
var chartYear = date.getFullYear();
document.getElementById("chartYear").innerHTML = chartYear+"년";

// 이전년도 선택
function prevYear(){ 
	
	var chartYear = document.getElementById("chartYear").innerHTML
	var parChartYear = chartYear.substring(0, 4);
	console.log(parChartYear)
	var selectYear = parChartYear - 1;
	document.getElementById("chartYear").innerHTML = selectYear+"년";
	
	if(selectYear == '2022'){
		$.ajax({
			  type : 'post',
			  url : '${cPath}/fr/pay/bill/chartList',
			  data : JSON.stringify(datas),
			  contentType: 'application/json',
			  dataType : "json",
			  
			  beforeSend : function(xhr)
			  {
			     xhr.setRequestHeader(header,token);
			  },
			  success : function(result){
				  
	 			    var month1 = result[0].month1;
	 			    var month2 = result[0].month2;
	 			    var month3 = result[0].month3;
	 			    var month4 = result[0].month4;
	 			    var month5 = result[0].month5;
	 				var month6 = result[0].month6;
	 				var month7 = result[0].month7;
	 				var month8 = result[0].month8;
	 				var month9 = result[0].month9;
	 				var month10 = result[0].month10;
	 				var month11 = result[0].month11;
	 				var month12 = result[0].month12;
					
					var valueList=[]; 
					valueList.push(month1);
					valueList.push(month2);
					valueList.push(month3);
					valueList.push(month4);
					valueList.push(month5);
					valueList.push(month6);
					valueList.push(month7);
					valueList.push(month8);
					valueList.push(month9);
					valueList.push(month10);
					valueList.push(month11);
					valueList.push(month12);
					console.log(valueList)
					
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
										max : 1000000,
										stepSize : 250000,
										fontSize : 14,
									}
								} ]
							}
						}
					});
			  },
			  error : function(data){
			    console.log("실패!");
			  }
		});
	} else{
	
		myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        datasets: [{
		            label: '# (단위:만원)',
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
							max : 1000000,
							stepSize : 250000,
							fontSize : 14,
						}
					} ]
				}
			}
		});
	}
	
}

// 다음년도 선택
function nextYear(){ 
	
	var chartYear = document.getElementById("chartYear").innerHTML
	var parChartYear = chartYear.substring(0, 4);
	console.log(parChartYear)
	var selectYear = (parChartYear*1) + 1;
	document.getElementById("chartYear").innerHTML = selectYear+"년";
	
	if(selectYear == '2022'){
		$.ajax({
			  type : 'post',
			  url : '${cPath}/fr/pay/bill/chartList',
			  data : JSON.stringify(datas),
			  contentType: 'application/json',
			  dataType : "json",
			  
			  beforeSend : function(xhr)
			  {
			     xhr.setRequestHeader(header,token);
			  },
			  success : function(result){
				    var month1 = result[0].month1;
	 			    var month2 = result[0].month2;
	 			    var month3 = result[0].month3;
					var month4 = result[0].month4;
					var month5 = result[0].month5;
					var month6 = result[0].month6;
					var month7 = result[0].month7;
					var month8 = result[0].month8;
					var month9 = result[0].month9;
					var month10 = result[0].month10;
					var month11 = result[0].month11;
					var month12 = result[0].month12;
					
					var valueList=[]; 
					valueList.push(month1);
					valueList.push(month2);
					valueList.push(month3);
					valueList.push(month4);
					valueList.push(month5);
					valueList.push(month6);
					valueList.push(month7);
					valueList.push(month8);
					valueList.push(month9);
					valueList.push(month10);
					valueList.push(month11);
					valueList.push(month12);
					console.log(valueList)
					
					myChart = new Chart(ctx, {
					    type: 'bar',
					    data: {
					        labels: ['1월', '2월','3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
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
										max : 1000000,
										stepSize : 250000,
										fontSize : 14,
									}
								} ]
							}
						}
					});
			  },
			  error : function(data){
			    console.log("실패!");
			  }
		});
	} else{
	
		myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        datasets: [{
		            label: '# (단위:만원)',
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
							max : 1000000,
							stepSize : 250000,
							fontSize : 14,
						}
					} ]
				}
			}
		});
	}
	
}

// 차트조회
const ctx = document.getElementById('myChart').getContext('2d');
function updateChartList(){
	
		$.ajax({
		  type : 'post',
		  url : '${cPath}/fr/pay/bill/chartList',
		  data : JSON.stringify(datas),
		  contentType: 'application/json',
		  dataType : "json",
		  
		  beforeSend : function(xhr)
		  {
		     xhr.setRequestHeader(header,token);
		  },
		  success : function(result){
			    var month1 = result[0].month1;
			    var month2 = result[0].month2;
			    var month3 = result[0].month3;
				var month4 = result[0].month4;
				var month5 = result[0].month5;
				var month6 = result[0].month6;
				var month7 = result[0].month7;
				var month8 = result[0].month8;
				var month9 = result[0].month9;
				var month10 = result[0].month10;
				var month11 = result[0].month11;
				var month12 = result[0].month12;
				
				var valueList=[]; 
				valueList.push(month1);
				valueList.push(month2);
				valueList.push(month3);
				valueList.push(month4);
				valueList.push(month5);
				valueList.push(month6);
				valueList.push(month7);
				valueList.push(month8);
				valueList.push(month9);
				valueList.push(month10);
				valueList.push(month11);
				valueList.push(month12);
				console.log(valueList)
				
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
									max : 1000000,
									stepSize : 250000,
									fontSize : 14,
								}
							} ]
						}
					}
				});
		  },
		  error : function(data){
			    console.log("실패!");
			  }
		});
	}
	




// 이미 냈던 이력이 있을때
function drawYesBill(data,v_date){
	console.log("drawYesBill")
	$('#preCost').remove();
	$('tbody').empty();
	$('#dateDiv').empty();
	$('#btnDiv').empty();
	var sumBill = data.billCost;
	var billDate = data.billDate;

	
	$('tbody').append(
       ' <tr id="sumBill">'+
           ' <td style="background-color:#ffff;">합계</td>'+
            '<td style="background-color:rgba(235, 29, 54,0.3); text-align: right; color:rgb(0,0,0);">'+sumBill.toLocaleString()+
            '</td> '+
       ' </tr>'
	)
	
	$('#btnDiv').append(
			'<input type="button" id="changeBtn" class="btn btn-primary btn-sm" value="수정하기" style="disabled:false"/>'
	)
	
	//$('#dateDiv').html( (data.billDate).substring(0,4)+"년 "+(data.billDate).substring(5,7)+'월의 사용내역에 대한 납부입니다.');
	let sliceDate = v_date.split("/");
	$("#inputMonth").html(sliceDate[0]+"년 "+sliceDate[1]+"월"); 
	
    $('#changeBtn').on('click',function(){
    	drawNoBill(v_date);
    	$('#saveBtn').remove();
    	$('#btnDiv').append(
    			'<input type="button" id="cancleBtn" class="btn btn-light btn-sm" value="취소하기" style="disabled:false; margin: 0px 3px;"/>'
    	)
    	$('#btnDiv').append(
    			'<input type="button" id="saveBtn" class="btn btn-primary btn-sm" value="변경사항 저장" style="disabled:false; margin: 0px 3px;"/>'
    	)
    	$('#prevData').append(
    			'<p id="preCost" style="font-size:13px; text-align:right; color:red;" >저장된 납부금액 : '+sumBill.toLocaleString()+'</p>'
    	)
    	
    	    
	    $('#cancleBtn').on('click',function(){
	    	getPage(v_date);
	    })
    	
    	$('#saveBtn').on('click',function(){
        	let newCost = ($('#sumBill').text()).replace(/\,/g, "");
        	datas = {
        			billNo :data.billNo,
        			billCost : newCost
        		};
        		
        	 	$.ajax({
        			  type : 'post',
        			  url : '${cPath}/fr/pay/bill/update',
        			  contentType: 'application/json',
        			  data : JSON.stringify(datas),
        			  dataType : 'text',
        			  
        			  beforeSend : function(xhr)
        			  {
        			     xhr.setRequestHeader(header,token);
        			  },
        			  
        			  success : function(result){
        				  swal({
        					  title: "납부내역이 수정되었습니다.",
        					  icon: "success",
        					  button: "닫기",
        					});
        				  getPage(v_date);
        				  updateChartList();
        			  },
        			  error : function(data){
        			    alert("납부내역 수정 실패!");
        			  }
        		});
    	})
    }); 


}


// 낸적없는 항목일때
function drawNoBill(v_date){
	console.log("drawNoBill")
	$('#preCost').remove();
	$('tbody').empty();
	$('#dateDiv').empty();
	$('#btnDiv').empty();
	$('tbody').append(
			
        '<tr>'+
        '<td >Ⅰ. 수도세</td>'+
        '<td style="background-color:#ffff; text-align:right; color:rgb(30,144,255);" >'+
             '<input id="water" type="text" class="form-control input-default " style = "text-align:right;" placeholder="(ex)1000">'+
        '</td>'+
        '</tr>'+
        '<tr>'+
            '<td >Ⅱ. 전기세</td>'+
            '<td style="background-color:#ffff; text-align:right; color:rgb(30,144,255);">'+
            '<input id="elec" type="text" class="form-control input-default " style = "text-align:right;" placeholder="(ex)1000">'+
            '</td>'+
        '</tr> '+
        '<tr>'+
            '<td >Ⅲ. 가스비</td>'+
            '<td style="background-color:#ffff; text-align:right; color:rgb(30,144,255);"> '+
            '<input id="gas" type="text" class="form-control input-default " style = "text-align:right;" placeholder="(ex)1000">'+
            '</td>'+
        '</tr>'+
        '<tr>'+
        '<tr>'+
            '<td style="background-color:#ffff;">합계</td>'+
            '<td id="sumBill" style="background-color:rgba(235, 29, 54,0.3); text-align:right; color:rgb(0,0,0);">'+
            '</td> '+
        '</tr>'
	)
	
	$('#btnDiv').append(
			'<input type="button" id="saveBtn" class="btn btn-primary btn-sm" value="저장하기" style="disabled:false"/>'
	)
	let sliceDate = v_date.split("/"); 
	$("#inputMonth").html(sliceDate[0]+"년 "+sliceDate[1]+"월"); 
	
    $( 'input' ).on( 'focus keyup', function() {
        var water = parseInt($( '#water' ).val());
        var elec = parseInt($( '#elec' ).val());
        var gas = parseInt($( '#gas' ).val());
        if(isNaN(water)){
        	water =0;
        }
        if(isNaN(elec)){
        	elec =0;
        }
        if(isNaN(gas)){
        	gas = 0;
        }
        var sumBill = water+gas+elec;
        $( '#sumBill' ).text( sumBill.toLocaleString() );
      } );
    
    
    $('#saveBtn').on('click',function(){
    	let billCost = ($('#sumBill').text()).replace(/\,/g, "");
    	datas = {
    			billCost : billCost,
    			selectedDate : v_date
    		};
    		
    	 	$.ajax({
    			  type : 'post',
    			  url : '${cPath}/fr/pay/bill/save',
    			  contentType: 'application/json',
    			  data : JSON.stringify(datas),
    			  dataType : 'text',
    			  
    			  beforeSend : function(xhr)
    			  {
    			     xhr.setRequestHeader(header,token);
    			  },
    			  
    			  success : function(result){
    				  getPage(v_date);
    				  updateChartList();
    				  swal({
    					  title: "납부내역이 저장되었습니다.",
    					  icon: "success",
    					  button: "닫기",
    					});
    			  },
    			  error : function(data){
    			    alert("납부내역 저장 실패!");
    			  }
    		});
    	
    });

}
 

function goPrev(){ 
	var selectDate = $('#inputMonth').html();
	let prevYear = parseInt(selectDate.substring(0,4));
	let prevMonth = parseInt(selectDate.substring(6,8))-1;
	if(prevMonth == 0){
		prevMonth = 12;
		prevYear = prevYear-1;
	}
	
	var prevDate = prevYear+'/'+(prevMonth)+'/'+'01';
	
	// 이전달 내역은 그 다음달1일로 조회하니까 걍 지금 .html()을 보내면됨
	getPage(prevDate);
	
}

function goNext(){
	var selectDate = $('#inputMonth').html();
	let prevYear = parseInt(selectDate.substring(0,4));
	let prevMonth = parseInt(selectDate.substring(6,8))+1;
	if(prevMonth == 13){
		prevMonth = 1;
		prevYear = prevYear+1;
	}
	
	var nextDate = prevYear+'/'+(prevMonth)+'/'+'01';
	
	getPage(nextDate);
}

</script>