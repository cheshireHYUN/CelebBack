<%--
* [[개정이력(Modification Information)]]
* 수정일                  수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 26.      서재원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>

<style>
.table td{
padding: 6px 8px;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js">
// 다운 받아서 넣지 말고 CDN을 쓰는 것을 권장함.
</script>

<div class="content-body">
 	<div class="container-fluid">
			<!-- 제목 템플릿 -->
			<div class="row page-titles" style="margin-bottom: 0px;">
			  <div class="col-sm-6 p-md-0">
			      <div class="welcome-text">
			          <h4><strong>손익계산서</strong></h4>
			          <span>매입매출내역 및 영업이익, 당기순이익을 월별, 분기별로 조회할 수 있습니다.</span>
			      </div>
			  </div>
			  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
			      <ol class="breadcrumb">
			          <li class="breadcrumb-item"><a href="javascript:void(0)">주문거래관리</a></li>
			          <li class="breadcrumb-item active"><a href="javascript:void(0)">손익계산서</a></li>
			      </ol>
			  </div>
			</div>
			<!-- 제목 템플릿 끝 -->
			
			<p>
	</div> <!-- 이거 추가하니까 테이블 꽉채워짐 -->


	<div class="container-fluid" style="padding-top: 15px;">
		<div class="row">
					<div class="col-xl-5">
                        <div class="card">
                            <div class="card-header">
                                <a class="page-link" href="javascript:void(0)" onclick="count('prev')">
	                                <i class="la la-angle-left"></i></a>
                                <h4 id="inputMonth" class="card-title"></h4>
                                 <a class="page-link" href="javascript:void(0)" onclick="count('next')">
	                                 <i class="la la-angle-right"></i></a>
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
                                                <td style="background-color:#f6f6f6; text-align: right;" id="frorderPrice">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가맹비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="feeFruse">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수익쉐어비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="feeRoyal">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연체이자</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="feeOverdue">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">Ⅱ. 매출원가</td>
                                                <td class="table-active" style="text-align:right;" id="buyerprodPrice">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;매입가</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="buyerprodPrice2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">Ⅲ. 판매비와관리비</td>
                                                <td class="table-active" style="text-align:right;" id="sna">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인건비</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="headempSalary">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;판매부대비용</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="feeCpn">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-active">Ⅳ. 영업외비용</td>
                                                <td class="table-active" style="text-align:right;" id="donatePrice">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color:#f6f6f6;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;기부금</td>
                                                <td style="background-color:#f6f6f6; text-align: right;" id="donatePrice2">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-danger">Ⅴ. 영업이익</td>
                                                <td style="background-color:#ffeff3; text-align: right; color:#f72b50;" id="operatingProfit">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-danger">Ⅵ. 당기순이익</td>
                                                <td style="background-color:#ffeff3; text-align: right; color:#f72b50;" id="netProfit">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="table-danger">Ⅶ. 영업이익률</td>
                                                <td style="background-color:#ffeff3; text-align: right; color:#f72b50;" id="opm">
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
					</div>
					<div class="col-xl-7 col-lg-12 col-sm-12">
                                <div class="card">
                                   <div class="card-header">
                                    <a class="page-link" href="javascript:void(0)" onclick="chartCount('prev')">
	                                <i class="la la-angle-left"></i></a>
                                	<h4 class="card-title"><strong>6개월 단위별 실적 추이</strong></h4>
                                 	<a class="page-link" href="javascript:void(0)" onclick="chartCount('next')">
	                                <i class="la la-angle-right"></i></a>
                                    </div>
                                    <div class="card-body">
                                        <canvas id="myChart" width="800" height="630"></canvas>
                                    </div>
                                </div>
                    </div>
                    
       </div> <!-- row -->
	</div> <!-- 두번째 container-fluid -->
</div>

<!-- 월 표시용 -->
<script>

// 연도까지 하려면 << 버튼 따로 만들어서 year값만 보내주는 형태면 될 거 같음. 이건 시간날 때 나중에
// S는 StartTag, E는 EndTag를 의미함

var inputMonth = document.getElementById('inputMonth');
const strongS = "<strong>";
const strongE = "</strong>";
var yearS = "<span id='years'>2022년 ";
var yearE = "</span>";
var dateS = "<span id='dates'>";
var dateE = "</span>";
var textSE = "<span id='texts'>월 손익계산서</span>";
// span마다 id를 걸어서 코드를 분리시킨 이유 : innerHTML의 값을 변환시킬 때 월만 변환시키기 위해서임 . dateS와 dateE의 사이가 월이 표시되는 곳이다. month가 올바르겠지만 수정하기귀찮아서 냅둠..

//현재 월을 date에 가져오기
const date = new Date();
var month = date.getMonth() + 1; 
// 왜 +1을 하는가? +1을 해줘야 현재 월을 가져올 수 있다. 자바스크립트는 월을 표시할때 0~11로 하기 때문에 1~12로 가져오고 싶으면 +1을 해줘야 한다.

console.log("지금월은: " + month);

// 1에서 9 사이면 month 앞에 0을 붙여준다.
if (1<= month && 9>= month) {
	month = "0" + month;
} 

inputMonth.innerHTML = strongS + yearS + yearE + dateS + month + dateE + textSE + strongE;

// month는 01~12사이의 값이 되어야하는데 아직 이하, 이상인 숫자는 제한을 안걸었다..

let nowMonth = {"month":month}

// 현재의 월을 컨트롤러로 보내서 데이터들을 가져오는 ajax
$.ajax({
	url: "netProfit",
	data : nowMonth,
	type : "GET",
	dataType : "json",
	success : function(resp, status, jqXHR) {
		
		// 1. 매출액
		var salesRevenueNow = document.getElementById('salesRevenue');
		if(resp.netProfit.salesRevenue==null) {
			salesRevenueNow.innerHTML = "데이터 없음";
		} else {
			salesRevenueNow.innerHTML = resp.netProfit.salesRevenue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 1-1. 제품 판매액
		var frorderPriceNow = document.getElementById('frorderPrice');
		if(resp.netProfit.frorderPrice==null) {
			frorderPriceNow.innerHTML = "데이터 없음";
		} else {
			frorderPriceNow.innerHTML = resp.netProfit.frorderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 1-2. 가맹비
		var feeFruseNow = document.getElementById('feeFruse');
		if(resp.netProfit.feeFruse==null) {
			feeFruseNow.innerHTML = "데이터 없음";
		} else {
    		feeFruseNow.innerHTML = resp.netProfit.feeFruse.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 1-3. 수익쉐어비
		var feeRoyalNow = document.getElementById('feeRoyal');
		if(resp.netProfit.feeRoyal==null) {
			feeRoyalNow.innerHTML = "데이터 없음";
		} else {
			feeRoyalNow.innerHTML = resp.netProfit.feeRoyal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 1-4. 연체이자
		var feeOverdueNow = document.getElementById('feeOverdue');
		if(resp.netProfit.feeOverdue==null) {
			feeOverdueNow.innerHTML = "데이터 없음";
		} else {
    		feeOverdueNow.innerHTML = resp.netProfit.feeOverdue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 2. 매출원가
		var buyerprodPriceNow = document.getElementById('buyerprodPrice');
		if(resp.netProfit.buyerprodPrice==null) {
			buyerprodPriceNow.innerHTML = "데이터 없음";
		} else {
    		buyerprodPriceNow.innerHTML = resp.netProfit.buyerprodPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 2-1. 매입가
		var buyerprodPrice2Now = document.getElementById('buyerprodPrice2');
		if(resp.netProfit.buyerprodPrice==null) {
			buyerprodPrice2Now.innerHTML = "데이터 없음";
		} else {
    		buyerprodPrice2Now.innerHTML = resp.netProfit.buyerprodPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 3. 판관비
		var snaNow = document.getElementById('sna');
		if(resp.netProfit.sna==null) {
			snaNow.innerHTML = "데이터 없음";
		} else {
    		snaNow.innerHTML = resp.netProfit.sna.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 3-1. 인건비
		var headempSalaryNow = document.getElementById('headempSalary');
		if(resp.netProfit.headempSalary==null) {
			headempSalaryNow.innerHTML = "데이터 없음";
		} else {
    		headempSalaryNow.innerHTML = resp.netProfit.headempSalary.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 3-2. 판매부대비용
		var feeCpnNow = document.getElementById('feeCpn');
		if(resp.netProfit.feeCpn==null) {
			feeCpnNow.innerHTML = "데이터 없음";
		} else {
	 			feeCpnNow.innerHTML = resp.netProfit.feeCpn.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 4. 영업외비용
		var donatePriceNow = document.getElementById('donatePrice');
		if(resp.netProfit.donatePrice==null) {
			donatePriceNow.innerHTML = "데이터 없음";
		} else {
    		donatePriceNow.innerHTML = resp.netProfit.donatePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 4-1. 기부금
		var donatePrice2Now = document.getElementById('donatePrice2');
		if(resp.netProfit.donatePrice==null) {
			donatePrice2Now.innerHTML = "데이터 없음";
		} else {
    		donatePrice2Now.innerHTML = resp.netProfit.donatePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 5. 영업이익
		var operatingProfitNow = document.getElementById('operatingProfit');
		if(resp.netProfit.operatingProfit==null) {
			operatingProfitNow.innerHTML = "산정 불가";
		} else {
    		operatingProfitNow.innerHTML = resp.netProfit.operatingProfit.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 6. 당기순이익
		var netProfitNow = document.getElementById('netProfit');
		if(resp.netProfit.netProfit==null) {
			netProfitNow.innerHTML = "산정 불가";
		} else {
    		netProfitNow.innerHTML = resp.netProfit.netProfit.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		}
		
		// 7. 영업이익률
		var opmNow = document.getElementById('opm');
		if(resp.netProfit.opm==null) {
			opmNow.innerHTML = "산정 불가";
		} else {
			opmNow.innerHTML = resp.netProfit.opm + "%";
		}
		
		console.log(resp);
		

	},
	error : function(){
		alert("알 수 없는 에러가 발생했습니다.");
	}
});


// 월을 변경하는 함수
function count(type) {
	
	const resultElement = document.getElementById('dates');
	month = resultElement.innerText;
	
	if(type=='prev') {
		month = parseInt(month) - 1;
	} else if(type=='next') {
		month = parseInt(month) + 1;		
	}
	
	if (1<= month && 9>= month) {
		month = "0" + month;
	} 
	
	resultElement.innerText = month;
	
	// ㅇㅅㅇ
	
 	let prevOrNextMonth = {"month":month};
	
	// 바뀐의 월을 컨트롤러로 보내서 데이터들을 가져오는 ajax 
    $.ajax({
    	url: "netProfit",
    	data : prevOrNextMonth,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {
    		
    		console.log("나와주라.." + resp.netProfit.salesRevenue);
    		
    		// 1. 매출액
    		var salesRevenueUpdate = document.getElementById('salesRevenue');
    		if(resp.netProfit.salesRevenue==null) {
    			salesRevenueUpdate.innerHTML = "데이터 없음";
    		} else {
    			salesRevenueUpdate.innerHTML = resp.netProfit.salesRevenue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 1-1. 제품 판매액
    		var frorderPriceUpdate = document.getElementById('frorderPrice');
    		if(resp.netProfit.frorderPrice==null) {
    			frorderPriceUpdate.innerHTML = "데이터 없음";
    		} else {
    			frorderPriceUpdate.innerHTML = resp.netProfit.frorderPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 1-2. 가맹비
    		var feeFruseUpdate = document.getElementById('feeFruse');
    		if(resp.netProfit.feeFruse==null) {
    			feeFruseUpdate.innerHTML = "데이터 없음";
    		} else {
	    		feeFruseUpdate.innerHTML = resp.netProfit.feeFruse.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 1-3. 수익쉐어비
    		var feeRoyalUpdate = document.getElementById('feeRoyal');
    		if(resp.netProfit.feeRoyal==null) {
    			feeRoyalUpdate.innerHTML = "데이터 없음";
    		} else {
    			feeRoyalUpdate.innerHTML = resp.netProfit.feeRoyal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 1-4. 연체이자
    		var feeOverdueUpdate = document.getElementById('feeOverdue');
    		if(resp.netProfit.feeOverdue==null) {
    			feeOverdueUpdate.innerHTML = "데이터 없음";
    		} else {
	    		feeOverdueUpdate.innerHTML = resp.netProfit.feeOverdue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 2. 매출원가
    		var buyerprodPriceUpdate = document.getElementById('buyerprodPrice');
    		if(resp.netProfit.buyerprodPrice==null) {
    			buyerprodPriceUpdate.innerHTML = "데이터 없음";
    		} else {
	    		buyerprodPriceUpdate.innerHTML = resp.netProfit.buyerprodPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 2-1. 매입가
    		var buyerprodPrice2Update = document.getElementById('buyerprodPrice2');
    		if(resp.netProfit.buyerprodPrice==null) {
    			buyerprodPrice2Update.innerHTML = "데이터 없음";
    		} else {
	    		buyerprodPrice2Update.innerHTML = resp.netProfit.buyerprodPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 3. 판관비
    		var snaUpdate = document.getElementById('sna');
    		if(resp.netProfit.sna==null) {
    			snaUpdate.innerHTML = "데이터 없음";
    		} else {
	    		snaUpdate.innerHTML = resp.netProfit.sna.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 3-1. 인건비
    		var headempSalaryUpdate = document.getElementById('headempSalary');
    		if(resp.netProfit.headempSalary==null) {
    			headempSalaryUpdate.innerHTML = "데이터 없음";
    		} else {
	    		headempSalaryUpdate.innerHTML = resp.netProfit.headempSalary.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 3-2. 판매부대비용
    		var feeCpnUpdate = document.getElementById('feeCpn');
    		if(resp.netProfit.feeCpn==null) {
    			feeCpnUpdate.innerHTML = "데이터 없음";
    		} else {
   	 			feeCpnUpdate.innerHTML = resp.netProfit.feeCpn.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 4. 영업외비용
    		var donatePriceUpdate = document.getElementById('donatePrice');
    		if(resp.netProfit.donatePrice==null) {
    			donatePriceUpdate.innerHTML = "데이터 없음";
    		} else {
	    		donatePriceUpdate.innerHTML = resp.netProfit.donatePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 4-1. 기부금
    		var donatePrice2Update = document.getElementById('donatePrice2');
    		if(resp.netProfit.donatePrice==null) {
    			donatePrice2Update.innerHTML = "데이터 없음";
    		} else {
	    		donatePrice2Update.innerHTML = resp.netProfit.donatePrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 5. 영업이익
    		var operatingProfitUpdate = document.getElementById('operatingProfit');
    		if(resp.netProfit.operatingProfit==null) {
    			operatingProfitUpdate.innerHTML = "산정 불가";
    		} else {
	    		operatingProfitUpdate.innerHTML = resp.netProfit.operatingProfit.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 6. 당기순이익
    		var netProfitUpdate = document.getElementById('netProfit');
    		if(resp.netProfit.netProfit==null) {
    			netProfitUpdate.innerHTML = "산정 불가";
    		} else {
	    		netProfitUpdate.innerHTML = resp.netProfit.netProfit.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    		}
    		
    		// 7. 영업이익률
    		var opmUpdate = document.getElementById('opm');
    		if(resp.netProfit.opm==null) {
    			opmUpdate.innerHTML = "산정 불가";
    		} else {
    			opmUpdate.innerHTML = resp.netProfit.opm + "%";
    		}
    		
    		console.log(resp);
    	},
    	error : function(){
    		alert("알 수 없는 에러가 발생했습니다.");
    	}
    });
	
}

</script>

<!--  차트 데이터 변경을 위한 코드 -->
<script>

var chartDate = new Date();
var chartYear = chartDate.getFullYear();
var chartMonth = chartDate.getMonth() + 1;

console.log(chartYear);
console.log(chartMonth);

var firstMonth = chartMonth - 5
var secondMonth = chartMonth - 4 
var thirdMonth = chartMonth - 3
var fourthMonth = chartMonth - 2
var fifthMonth = chartMonth - 1
var sixthMonth = chartMonth

//ajax로 기본 차트에 띄울 데이터들을 가져와봅시다.
var baseChart = {"chartYear":chartYear, 
				 "firstMonth":firstMonth, "secondMonth":secondMonth, "thirdMonth":thirdMonth, 
				 "fourthMonth":fourthMonth, "fifthMonth":fifthMonth, "sixthMonth":sixthMonth};

	$.ajax({
 	url: "netProfit",
 	data : baseChart,
 	type : "GET",
 	dataType : "json",
 	success : function(resp, status, jqXHR) {
 		
		//alert("차트 기본데이터 가져오기 성공");
		console.log("차트 기본데이터 가져오기 성공");
		
 		for(var i=0; i<resp.netProfitChart.length; i++){
 			if (resp.netProfitChart[i].salesRevenue==null) {
    			resp.netProfitChart[i].salesRevenue = 0;
    		}
 			if (resp.netProfitChart[i].frorderPrice==null) {
    			resp.netProfitChart[i].frorderPrice = 0;
    		}
 			if (resp.netProfitChart[i].feeFruse==null) {
    			resp.netProfitChart[i].feeFruse = 0;
    		}
 			if (resp.netProfitChart[i].feeRoyal==null) {
    			resp.netProfitChart[i].feeRoyal = 0;
    		}
 			if (resp.netProfitChart[i].feeOverdue==null) {
    			resp.netProfitChart[i].feeOverdue = 0;
    		}
 			if (resp.netProfitChart[i].buyerprodPrice==null) {
    			resp.netProfitChart[i].buyerprodPrice = 0;
    		}
 			if (resp.netProfitChart[i].sna==null) {
    			resp.netProfitChart[i].sna = 0;
    		}
    		if (resp.netProfitChart[i].headempSalary==null) {
    			resp.netProfitChart[i].headempSalary = 0;
    		}
    		if (resp.netProfitChart[i].feeCpn==null) {
    			resp.netProfitChart[i].feeCpn = 0;
    		}
    		if (resp.netProfitChart[i].donatePrice==null) {
    			resp.netProfitChart[i].donatePrice = 0;
    		}
    		if (resp.netProfitChart[i].operatingProfit==null) {
    			resp.netProfitChart[i].operatingProfit = 0;
    		}
    		if (resp.netProfitChart[i].netProfit==null) {
    			resp.netProfitChart[i].netProfit = 0;
    		}
		}
		
   		new Chart(document.getElementById("myChart"), {
		       "type": "bar",
		       "data": {
		           "labels": [firstMonth, secondMonth, thirdMonth, fourthMonth, fifthMonth, sixthMonth],
		           "datasets": [{
		               "label": "매출액",
		               "data": [resp.netProfitChart[0].salesRevenue, resp.netProfitChart[1].salesRevenue, 
		            	   resp.netProfitChart[2].salesRevenue, resp.netProfitChart[3].salesRevenue, 
		            	   resp.netProfitChart[4].salesRevenue, resp.netProfitChart[5].salesRevenue],
		               "borderColor": "rgb(255, 99, 132)",
		               "backgroundColor": "rgba(255, 99, 132, 0.2)"
		           }, {
		               "label": "영업이익",
		               "data": [resp.netProfitChart[0].operatingProfit, resp.netProfitChart[1].operatingProfit, 
		            	   resp.netProfitChart[2].operatingProfit, resp.netProfitChart[3].operatingProfit, 
		            	   resp.netProfitChart[4].operatingProfit, resp.netProfitChart[5].operatingProfit],
		               "type": "line",
		               "fill": false,
		               "borderColor": "rgb(54, 162, 235)"
		           }, {
		               "label": "당기순이익",
		               "data": [resp.netProfitChart[0].netProfit, resp.netProfitChart[1].netProfit, 
		            	   resp.netProfitChart[2].netProfit, resp.netProfitChart[3].netProfit, 
		            	   resp.netProfitChart[4].netProfit, resp.netProfitChart[5].netProfit],
		               "type": "line",
		               "fill": false,
		               "borderColor": "rgb(153, 40, 150)"
		           }]
		       },
		       "options": {
		    	   "responsive" : false,
		           "scales": {
		               "yAxes": [{
		                   "ticks": {
		                       "beginAtZero": true
		                   }
		               }]
		           }
		       }
		   });
   		
   		return;
   		
 	},
 	error : function(){
 		alert("차트 기본데이터 가져오는데 알 수 없는 에러가 발생했습니다.");
 	}
 });

// 일단 월이 0이나 13 되는건 생각하지말고 해봅시다.

// 그림차트의 월을 변경해주는 함수	
function chartCount(type) {
	
	if(type=='prev') {
		firstMonth = firstMonth - 1;
		secondMonth = secondMonth - 1;
		thirdMonth = thirdMonth - 1;
		fourthMonth = fourthMonth - 1;
		fifthMonth = fifthMonth - 1;
		sixthMonth = sixthMonth - 1;
	} else if(type=='next') {
		firstMonth = firstMonth + 1;
		secondMonth = secondMonth + 1;
		thirdMonth = thirdMonth + 1;
		fourthMonth = fourthMonth + 1;
		fifthMonth = fifthMonth + 1;
		sixthMonth = sixthMonth + 1;
	}
	
	// ajax로 변화시킬 데이터들을 가져와봅시다.
	
	var prevOrNextChart = {"chartYear":chartYear, 
						   "firstMonth":firstMonth, "secondMonth":secondMonth, "thirdMonth":thirdMonth, 
						   "fourthMonth":fourthMonth, "fifthMonth":fifthMonth, "sixthMonth":sixthMonth};
	
	$.ajax({
    	url: "netProfit",
    	data : prevOrNextChart,
    	type : "GET",
    	dataType : "json",
    	success : function(resp, status, jqXHR) {
    		
    		console.log("차트 변화데이터 가져오기 성공");
    		
     		for(var i=0; i<resp.netProfitChart.length; i++){
     			if (resp.netProfitChart[i].salesRevenue==null) {
	    			resp.netProfitChart[i].salesRevenue = 0;
	    		}
     			if (resp.netProfitChart[i].frorderPrice==null) {
	    			resp.netProfitChart[i].frorderPrice = 0;
	    		}
     			if (resp.netProfitChart[i].feeFruse==null) {
	    			resp.netProfitChart[i].feeFruse = 0;
	    		}
     			if (resp.netProfitChart[i].feeRoyal==null) {
	    			resp.netProfitChart[i].feeRoyal = 0;
	    		}
     			if (resp.netProfitChart[i].feeOverdue==null) {
	    			resp.netProfitChart[i].feeOverdue = 0;
	    		}
     			if (resp.netProfitChart[i].buyerprodPrice==null) {
	    			resp.netProfitChart[i].buyerprodPrice = 0;
	    		}
     			if (resp.netProfitChart[i].sna==null) {
	    			resp.netProfitChart[i].sna = 0;
	    		}
	    		if (resp.netProfitChart[i].headempSalary==null) {
	    			resp.netProfitChart[i].headempSalary = 0;
	    		}
	    		if (resp.netProfitChart[i].feeCpn==null) {
	    			resp.netProfitChart[i].feeCpn = 0;
	    		}
	    		if (resp.netProfitChart[i].donatePrice==null) {
	    			resp.netProfitChart[i].donatePrice = 0;
	    		}
	    		if (resp.netProfitChart[i].operatingProfit==null) {
	    			resp.netProfitChart[i].operatingProfit = 0;
	    		}
	    		if (resp.netProfitChart[i].netProfit==null) {
	    			resp.netProfitChart[i].netProfit = 0;
	    		}
    		}
    		
     		// 새롭게 동적으로 그려지는 차트들
    		new Chart(document.getElementById("myChart"), {
    		       "type": "bar",
    		       "data": {
    		           "labels": [firstMonth, secondMonth, thirdMonth, fourthMonth, fifthMonth, sixthMonth],
    		           "datasets": [{
    		               "label": "매출액",
    		               "data": [resp.netProfitChart[0].salesRevenue, resp.netProfitChart[1].salesRevenue, 
    		            	   resp.netProfitChart[2].salesRevenue, resp.netProfitChart[3].salesRevenue, 
    		            	   resp.netProfitChart[4].salesRevenue, resp.netProfitChart[5].salesRevenue],
    		               "borderColor": "rgb(255, 99, 132)",
    		               "backgroundColor": "rgba(255, 99, 132, 0.2)"
    		           }, {
    		               "label": "영업이익",
    		               "data": [resp.netProfitChart[0].operatingProfit, resp.netProfitChart[1].operatingProfit, 
    		            	   resp.netProfitChart[2].operatingProfit, resp.netProfitChart[3].operatingProfit, 
    		            	   resp.netProfitChart[4].operatingProfit, resp.netProfitChart[5].operatingProfit],
    		               "type": "line",
    		               "fill": false,
    		               "borderColor": "rgb(54, 162, 235)"
    		           }, {
    		               "label": "당기순이익",
    		               "data": [resp.netProfitChart[0].netProfit, resp.netProfitChart[1].netProfit, 
    		            	   resp.netProfitChart[2].netProfit, resp.netProfitChart[3].netProfit, 
    		            	   resp.netProfitChart[4].netProfit, resp.netProfitChart[5].netProfit],
    		               "type": "line",
    		               "fill": false,
    		               "borderColor": "rgb(153, 40, 150)"
    		           }]
    		       },
    		       "options": {
    		    	   "responsive" : false,
    		           "scales": {
    		               "yAxes": [{
    		                   "ticks": {
    		                       "beginAtZero": true
    		                   }
    		               }]
    		           }
    		       }
    		   });
    		// 차트 끝 
    		
/*     		이렇게 변화시키는게 더 안전한거 같은데 작동이 안됨..
			myChart.data.labels = [firstMonth, secondMonth, thirdMonth, fourthMonth, fifthMonth, sixthMonth];
    		
    		myChart.data.datasets[0].data[0] = [resp.netProfitChart[0].salesRevenue, resp.netProfitChart[1].salesRevenue, 
         	   resp.netProfitChart[2].salesRevenue, resp.netProfitChart[3].salesRevenue, 
        	   resp.netProfitChart[4].salesRevenue, resp.netProfitChart[5].salesRevenue];
    		
    		myChart.data.datasets[0].data[1] = [resp.netProfitChart[0].operatingProfit, resp.netProfitChart[1].operatingProfit, 
         	   resp.netProfitChart[2].operatingProfit, resp.netProfitChart[3].operatingProfit, 
        	   resp.netProfitChart[4].operatingProfit, resp.netProfitChart[5].operatingProfit];
    		
    		myChart.data.datasets[0].data[2] = [resp.netProfitChart[0].netProfit, resp.netProfitChart[1].netProfit, 
         	   resp.netProfitChart[2].netProfit, resp.netProfitChart[3].netProfit, 
        	   resp.netProfitChart[4].netProfit, resp.netProfitChart[5].netProfit]; */
    		
    		myChart.update();
    		
    	},
    	error : function(){
    		alert("차트 변화데이터 가져오는데 알 수 없는 에러가 발생했습니다.");
    	}
    });
}
</script>