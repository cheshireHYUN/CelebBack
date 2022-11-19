<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 21.      이혜원      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--**********************************
    Content body start
***********************************-->
<div class="content-body">
	<div class="container-fluid">
		 		<div class="row page-titles">
				  <div class="col-sm-6 p-md-0">
				      <div class="welcome-text">
				          <h4><strong>주문완료</strong></h4>
				          <span>발주완료한 주문현황을 확인합니다.</span>
				      </div>
				  </div>
				  <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
				      <ol class="breadcrumb">
				          <li class="breadcrumb-item"><a href="javascript:void(0)">발주관리</a></li>
				          <li class="breadcrumb-item active"><a href="javascript:void(0)">주문완료</a></li>
				      </ol>
				  </div>
				</div>
		
		<div class="row align-items-center">
					
					<div >
						<div class="card" style="height: 690px">
							<div class="card-body">
								<div class="col-lg-5" style="float:left; margin-top:120px;">
									<img src="${cPath }/resources/restaurant/img/lovelyloopy.png" alt="" class="img-fluid">
								</div>
								<div class="col-lg-7" style="float:right; margin-right:-150px; margin-top:120px;">
									<h2 class="text-black main-title">주문완료</h2>
									<p>고객님의 주문이 정상적으로 완료되었습니다.</p>
									<form class="mt-5">
										<div class="form-group mb-3 pb-3">
											<label class="font-w600">주문번호 : ${scOrderList.frOrderNo}</label><br>
											<label class="font-w600" id=today></label><br> 
											<label class="font-w600">배송지 : ${scOrderList.franAdd}</label>
										</div>
										<div class="form-group mb-3 pb-3">
											<label class="font-w600">주문 상품 확인 (총 ${scOrderList.allQty} 개 / 
								          <fmt:formatNumber value="${scOrderList.frOrderPrice}" pattern="#,###,###,###"/>
								          	원)</label>
										</div>
										<input id="listBtn" class="btn btn-primary" onclick="location.href='/CelebBack/fr/frOrder/orderList'" value="주문내역 보러가기">
<!-- 											<span class="btn-icon-end"> -->
<!-- 												<i class="fa fa-check"></i> -->
<!-- 											</span> -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
	</div>
</div>

<script>
// 주문일자 
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var dateString = year + '-' + month  + '-' + day;
document.getElementById("today").innerHTML = "주문일자 : " + dateString;

// $("#listBtn").append(
// 		$("<span>").attr({
// 			"class" : "btn-icon-end"
// 		}).append(
// 			$("<i>").attr({
// 				"class" : "fa fa-check"
// 			})		
// 		)
// 	)
				
		

</script>
<!--         **********************************
<!--             Content body end -->
<!--         ***********************************--> 
	        
