<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 8.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#cardTurn {
	margin-bottom: 1.875rem;
	background-color: rgba(255, 255, 255, 0);
	transition: all .5s ease-in-out;
	position: relative;
	border: 0rem solid transparent;
	border-radius: 0.5rem;
	box-shadow: 0rem 0.3125rem 0.3125rem 0rem rgb(82 63 105/ 5%);
	height: calc(100% - 30px);
}

</style>

</head>
<body>



	<!--**********************************
            Content body start
        ***********************************-->
	<div class="content-body">
		<div class="container-fluid">
			<div class="row page-titles">
				<div class="col-sm-6 p-md-0">
					<div class="welcome-text">
						<h4>영업분석</h4>
						<span>날짜를 선택해주세요</span>
					</div>
				</div>
				<div
					class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex"> 
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">매출분석</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">영업분석</a></li>
					</ol>
				</div>
			</div>
			<!-- row -->

			<div class="row"> 
			

                                
                 <div id="searchUI" style="display:flex; justify-content: flex-end; margin-bottom:20px;">
						<div style="float: right;">
							<div style="text-align: right; " >
				                <div class="searchKeword">
				                     <input type="date" name="searchStartDate" value="startDate" class="form-control" >
				                </div>
			                   		~
				                <div class="searchKeword">
				                     <input type="date" name="searchEndDate" value="endDate" class="form-control" >
				                </div>
				                <button id="searchBtn" type="button" class="btn light btn-primary" style="margin-left: 20px; height:75%; border: none">검색</button>
				            </div>
	       				</div>
					</div>
			
			
				<div class="col-12">
					<div class="card" id="cardTurn">

						<div style="display:flex;flex-direction: column;">


<div id="flex1" style="display:flex; justify-content: space-between; ">
								<!-- 찜,별점,리뷰 추이 -->
								<div style="width:25%; height:170px;">  
									<div class="widget-stat card">
										<div class="card-body p-4">
											<div class="media ai-icon">
												<span class="me-3 bgl-primary text-primary"> <!-- <i class="ti-user"></i> -->
													<svg id="icon-customers" xmlns="http://www.w3.org/2000/svg"
														width="30" height="30" viewBox="0 0 24 24" fill="none"
														stroke="currentColor" stroke-width="2"
														stroke-linecap="round" stroke-linejoin="round"
														class="feather feather-user">
											<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
											<circle cx="12" cy="7" r="4"></circle>
										</svg>
												</span>
												<div class="media-body">
													<p class="mb-1">찜</p>
													<h4 class="mb-0" id="wishCnt"></h4>
													<span class="badge badge-primary" id="wishCntMonth"></span>
												</div>
											</div> 
										</div> 
									</div> 
								</div>
 
								<div style="width:25%; height:170px;">
									<div class="widget-stat card">
										<div class="card-body p-4">
											<div class="media ai-icon">
												<span class="me-3 bgl-success text-success"> <svg
														id="icon-database-widget"
														xmlns="http://www.w3.org/2000/svg" width="24" height="24"
														viewBox="0 0 24 24" fill="none" stroke="currentColor"
														stroke-width="2" stroke-linecap="round"
														stroke-linejoin="round" class="feather feather-database">
											<ellipse cx="12" cy="5" rx="9" ry="3"></ellipse>
											<path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"></path>
											<path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"></path>
										</svg>
												</span>
												<div class="media-body">
													<p class="mb-1">리뷰</p>
													<h4 class="mb-0" id="reviewCnt"></h4>
													<span class="badge badge-success" id="reviewCntMonth"></span>
												</div>
											</div>
										</div>
									</div>
								</div> 


								<!-- 인기메뉴 -->
									<div style="width:40%;"> 
											<div class="card">
												<div class="card-header">
														<h4 class="card-title">이달의 인기메뉴</h4>
												</div> 
												<div class="card-body p-0 pt-3"></div>
  
											</div> 
									</div>
								<!-- 인기메뉴 --> 
								<c:forEach var='item' items='${dataVO.menuMap}'>
									<input type="hidden" name='menus' value1='${item.key}'
										value2='${item.value}'>
								</c:forEach>
</div>
<div id="flex2" style="display:flex; justify-content: center;">

								<!-- 시간대별 방문인원 -->
								<div style=" width:50%; margin-right:20px;">
									<div class="card">
										<div class="card-header">
											<h4 class="card-title">일별 총 방문자/예약자</h4>
										</div>
										<div class="card-body">
											<canvas id="lineChart_3"></canvas>
										</div>
									</div>
								</div>
								<!-- 방문자관련 데이터 -->
								<c:forEach var='item' items='${dataVO.allDateList}'>
									<input type="hidden" name='allDateList' value='${item}'>
								</c:forEach>
								<c:forEach var='item' items='${dataVO.resvCntList}'>
									<input type="hidden" name='resvCntList' value='${item}'>
								</c:forEach>
								<c:forEach var='item' items='${dataVO.allCntList}'>
									<input type="hidden" name='allCntList' value='${item}'>
								</c:forEach>

								
									<div style="width:50%; ">
										<div class="card">
											<div class="card-header">
												<h4 class="card-title">판매된 메뉴 비율</h4>
											</div> 
										<div class="card-body">
											  <canvas id="myChart"></canvas>
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

	

	<!--**********************************
            Content body end
        ***********************************-->
<script src="${cPath}/resources/dashboard3/vendor/chart.js/Chart.bundle.min.js"></script>


<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

$( document ).ready(function() {
	
	var nowDate = new Date();
	var nowYear = nowDate.getFullYear();
	var nowMonth = nowDate.getMonth()+1;
	var nowDay = nowDate.getDate();
	
	if(String(nowMonth).length == 1){
		nowMonth = "0"+String(nowMonth);
	}
	if(String(nowDay).length == 1){
		nowDay = "0"+String(nowDay);
	}
	
	let searchStartDate =  nowYear+'-'+nowMonth+'-'+'01';
	let searchEndDate = nowYear+'-'+nowMonth+'-'+nowDay;
	
	$('input[name=searchStartDate]').attr('value',searchStartDate);
	$('input[name=searchEndDate]').attr('value',searchEndDate);
	loadChart(searchStartDate, searchEndDate);
});


$('#searchBtn').on('click',function(){
	
	let searchStartDate =  $("input[name=searchStartDate]").val();
	let searchEndDate =  $("input[name=searchEndDate]").val();
	
	loadChart(searchStartDate, searchEndDate);
	
});

function loadChart(searchStartDate, searchEndDate){
 	$.ajax({
		type:'post',
		url:'${cPath}/fr/analysis/popular/list',
		data:{
			stDate:searchStartDate,
			enDate:searchEndDate
		},
		dataType:'json',
		beforeSend : function(xhr)
		{
		   xhr.setRequestHeader(header,token);
		},
		success:function(resp){
			// 찜, 리뷰 바꿔주는 function
			wishAndReview(resp.wishCnt, resp.wishCntMonth, resp.reviewCnt, resp.reviewCntMonth);
			// 인기메뉴순위
			popularMenu(resp.menuMap);
			// 방문자 통계
			visitorChart(resp.allDateList,resp.allCntList,resp.resvCntList);
			// 메뉴판매 통계
			menuChart(resp.menuMap);
		},
		error : function(){
			alert("불러올수 없습니다.");
		}
	});
}

// 찜, 리뷰 바꿔주는 function
function wishAndReview(wishCnt, wishCntMonth, reviewCnt, reviewCntMonth){
	$("#wishCnt").html(wishCnt);
	$("#wishCntMonth").html("+"+wishCntMonth);
	$("#reviewCnt").html(reviewCnt);
	$("#reviewCntMonth").html("+"+reviewCntMonth);
}
// 인기메뉴순위
function popularMenu(menuMap){
	// {치킨텐더 샐러드: 3, 자몽 스파클링: 1, 갈릭 립아이: 2, 멜티드 치즈: 4}

	   let arr = [];
		for(key in menuMap){
			arr.push(menuMap[key]);
		}
	   arr.sort((a,b)=> b-a); 
		// 가장 큰 3개로 key를 찾아 set에 저장하기
		let best = new Set([]); 
		for(key in menuMap){
			if(menuMap[key] == arr[0]){
				best.add(key);
			}
		}
		for(key in menuMap){
			if(menuMap[key] == arr[1]){ 
				best.add(key);
			}
		}
		for(key in menuMap){
			if(menuMap[key] == arr[2]){
				best.add(key);
			}
		}
		// 이제 best에는 순위에 넣을 탑쓰리 메뉴만 들어있다.
	    // 이제 뿌려주자
	   $(".card-body.p-0.pt-3 *").remove(); 
 	   let i = 1; 
	   best.forEach(function(item){
		   
		   let item2 = menuMap[item];
		   $(".card-body.p-0.pt-3").append(
					'<div class="media items-list-1">'
					+'<span class="number col-1 px-0 align-self-center">#'+i+'</span>'
					+'<div class="media-body col-sm-4 col-6 col-xxl-5 px-0"'
					+'tyle="display: flex; align-items: center; ">'
						+'<h4 style="margin : 7px 0px; "> '+item+'</h4>'
					+'</div>'
					+'<div class="media-footer ms-auto col-3 px-0 d-flex align-self-center align-items-center">'
						+'<div>  '
							+'<h3	class="mb-0 font-w600 text-black">'+item2+'</h3>'
						+'</div>'
					+'</div>'
				+'</div>'
		   );
		   i++;
	   });
}
// 방문자 통계
function visitorChart(allDateList,allCntList,resvCntList){
	
	let max = [];
	for(let i=0; i<allCntList.length; i++){
		max[i] = allCntList[i];
	}
	max.sort((a,b)=> b-a);
	
	var ctx = document.getElementById('lineChart_3').getContext('2d');
	var chart = new Chart(ctx, {
	    // The type of chart we want to create
	    type: 'line',

	    // The data for our dataset

		data: {
				defaultFontFamily: 'Poppins',
				labels: allDateList,
				datasets: [
					{
						label: "방문자",
						data:  allCntList,
						borderWidth: "2",
						borderColor : 'rgb(183,222,210)',
						fill: false,
						pointBackgroundColor: 'rgba(0,161,91, 0.5)',
						tension: 0.1
					}, {
						label:  "예약자",
						data: resvCntList,
						borderWidth: "2",
						borderColor : 'rgb(246,166,178)',
						fill: false,
						pointBackgroundColor: 'rgba(254, 176, 25, 1)',
						tension: 0.1
					}
				]
			},

	    		options: {
				legend: false, 
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true, 
							max: Number(max[0])+20, 
							min: 0, 
							stepSize: 20, 
							padding: 10
						}
					}],
					xAxes: [{ 
						ticks: {
							padding: 5
						}
					}]
				}
			}
	});

	
}
// 메뉴판매 통계
function menuChart(menuMap){
	
	
	  let nameArr = [];
	  let cntArr = [];
	  
		for(key in menuMap){
			nameArr.push(key);
			cntArr.push(menuMap[key]);
		}
	  
	  let colors = [					      
	   	  'rgb(183,222,210)',
	      'rgb(246,166,178)',
	      'rgb(247,194,151)',
	      'rgb(255,236,184)',
	      'rgb(144,210,216)',
	   	  'rgb(247,202,201)',
	      'rgb(255,220,219)',
	      'rgb(180,200,234)',
	      'rgb(145,168,208)',
	   	  'rgb(246,161,146)',
	      'rgb(246,176,146)',
	      'rgb(246,196,146)',
	      'rgb(246,207,146)',
	      'rgb(246,217,146)',	   	  
	      'rgb(183,222,210)',
	      'rgb(246,166,178)',
	      'rgb(247,194,151)',
	      'rgb(255,236,184)',
	      'rgb(144,210,216)',
	   	  'rgb(247,202,201)',
	      'rgb(255,220,219)',
	      'rgb(180,200,234)',
	      'rgb(145,168,208)',
	   	  'rgb(246,161,146)',
	      'rgb(246,176,146)',
	      'rgb(246,196,146)',
	      'rgb(246,207,146)',
	      'rgb(246,217,146)'
	];
	  
	  const data = {
			  labels: nameArr,
			  datasets: [{
			    label: 'My First Dataset',
			    data: cntArr,
			    backgroundColor: colors,
			    hoverOffset: 4
			  }]
			};
	
	  const config = {
	    type: 'pie',
	    data: data,
	  };
	  
	  const myChart = new Chart(
			    document.getElementById('myChart'),
			    config
			  );
}




		
		

</script>








</body>
</html>