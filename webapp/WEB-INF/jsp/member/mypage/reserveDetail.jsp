<%--
* [[개정이력(Modification Information)]]
* 수정일               수정자           수정내용
* ----------  ---------  -----------------
* 2022. 8. 22.      정아영           최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Foores - Single Restaurant Version">
    <meta name="author" content="Ansonika">
    
    <link href="${cPath }/resources/restaurant/css/shop.css" rel="stylesheet">
    <script src="${cPath }/resources/restaurant/js/specific_shop.js"></script>

		<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
			<div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-9 col-lg-10 col-md-8">
							<h1>마이페이지</h1>
							<p><span class="element"></span></p>
						</div>
					</div>
					<!-- /row -->
				</div>
			</div>
			<div class="frame white"></div>
		</div>
		<!-- /hero_single -->
		

		<div class="bg_gray">
			<div class="container margin_60_40">
				<div class="box_contacts" style="padding: 30px 30px;">
					<div>
			            <h2 id="resvId">예약번호 : ${resv.resvId }</h2>
			            <br>
			            <table class="table" id="${resv.payPg }">
				            <thead>
				                <tr>
				                    <th>예약 지점</th>
				                    <th>이용 일자</th>
				                    <th>이용 일시</th>
				                    <th>예약 인원</th>
				                    <th>예약 좌석</th>
				                    <th>접수 일시</th>
				                    <th>상태</th>
				                </tr>
				            </thead>
				            <tbody>
				            	<tr>
				            		<td>${resv.franName }</td>
						        	<td>${resv.resvDate }</td>
						        	<td>${resv.resvTime }</td>
						        	<td>${resv.resvPcnt }</td>
						        	<td>${resv.sitId }</td>
						        	<td>${resv.resvAccDate}</td>
						        	<td>${resv.lguName}</td>
				            	</tr>
				            </tbody>     
						</table>
						<br>
						<br>
						<table class="table table-striped" id="resvmenu">
				            <thead>
				            	<tr>
				            		<th colspan="4">예약 메뉴</th>
				            	</tr>
				                <tr>
				                    <th>메뉴</th>
				                    <th>가격</th>
				                    <th>수량</th>
				                    <th>소계</th>
				                </tr>
				            </thead>
				            <tbody id="listBody">
				               
				            </tbody>
				        </table>
				        
		            </div>
		            
		            
					<div class="box_cart" style="margin-right: 10px; padding: 60px 0px 0px 0px;">
						<div class="container">
						<div class="row justify-content-end">
							<div class="col-xl-4 col-lg-4 col-md-6">
						<ul>
							<li>
								<span>Subtotal</span><div id="subtotalSum"></div>
							</li>
							<li>
								<span>Discount Coupon</span><div id="coupon"></div>
							</li>
							<li>
								<span>Total</span><div id="totalSum"></div>
							</li>
						</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- /box_cart -->
					
					<div class="row">
						<div class="box_cart" style="width: 50%; float: left; padding: 30px 505px 10px 0px;">
							<input type="button" class="btn light btn-success" value="예약 목록" onclick="location.href='${cPath}/mypage/reserve'" />
						</div>
						<div class="box_cart" style="width: 50%; float: right; padding: 30px 22px 10px 0px;">
							<input type="button" class="btn light btn-danger" value="예약 취소" data-bs-toggle="modal" data-bs-target="#exampleModal" />
						</div>
					</div>
		    	</div>
		  
			</div>
		</div>
		

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">예약 취소</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <form action="${cPath }/mypage/reserve/${resv.resvId }" method="post" name="notice">
       <sec:csrfInput/>
	      <div class="modal-body">
	      		예약이 취소됩니다.
				<input type="hidden" name="_method" value="PUT">
<%-- 				<input type="hidden" value="${authMember.realMember.adminPw }"> --%>
<!-- 				<input type="password" name="" class="form-control"/> -->
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" id="deleteBtn">확인</button>
	      </div>
		</form>
    </div>
  </div>
</div>		
		
		
<script>
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';

let listBody = $('#listBody');
let subtotalSum = $('#subtotalSum');
let coupon = $('#coupon');
let totalSum = $('#totalSum');

$('#deleteBtn').on("click",function(){
// 	console.log($('table[id]')[0].id);
	let payPg = $('table[id]')[0].id;

// 	console.log($('h2[id="resvId"]')[0].innerHTML.substring(7));
	
	let resvId = $('h2[id="resvId"]')[0].innerHTML.substring(7);
	$.ajax({
		url: "${cPath}/mypage/refund", // 예: http://www.myservice.com/payments/cancel
	    method: "post",
// 	    contentType: "application/json",
	    data: {
	    	"payPg": payPg // 예: ORD20180131-0000011
	    	,"resvId" : resvId
	      },
	    dataType: "json",
	    beforeSend : function(xhr)
	    {
	       xhr.setRequestHeader(header,token);
	    },
		success : function(resp, status, jqXHR) { // json은 javascript코드형태로 들어옴/ status: 성공여부 / jqXHR: XMLHttpRequest
			alert("예약이 정상적으로 취소되었습니다.");
            location.replace('${cPath}/mypage/reserve');
		},
		error : function(jqXHR, status, error) {
			console.log("예약 취소 실패");
			history.go(0);
		}
	});
});

let makeSingleTr = function(index, menu){
//		let aTag = $("<a>").attr("href", "${cPath}/Notice/"+notice.postNo)
//							.text(notice.postTitle)

	 return $('<tr>').append(
		        	$("<td>").html(menu.menuName)
		        	,$("<td>").html(menu.menuPrice.toLocaleString()+"원")
		        	,$("<td>").html(menu.morderQty)
		        	,$("<td>").html(menu.subtotal.toLocaleString()+"원")
   			 );	
}



$(window).on("load",function(event){
		event.preventDefault();
		 
		let url = this.action;
		let method = this.method;
		let data = $(this).serialize();
	
		$.ajax({ 
			url : url,
			data : data,
			method : method,
			dataType : "json"
			,
			success : function(resp, status, jqXHR) { 
				let menuList = resp.menu;
// 				console.log(menuList);
				console.log(resp);
				
// 				const SubtotalSum = resp.bill.subtotalSum;
				let SubtotalSum = menuList[0].subtotalSum;
				let PayCost = 0;
				
				let trTags =[];
				if(menuList && menuList.length>0){ 
						$(menuList).each(function(index, menu){ 
							trTags.push(makeSingleTr(index, menu));
						});                                                                                                      
				}
// 				console.log(menuList[0].subtotalSum);
				listBody.html(trTags);
				
				console.log(resp.bill);
				if(resp.bill==0){
					PayCost = SubtotalSum;
				}else {
					PayCost = resp.bill;
				}
				
				let Coupon = SubtotalSum - PayCost;
				
				subtotalSum.html(SubtotalSum.toLocaleString()+"원");
				coupon.html(Coupon.toLocaleString()+"원");
				totalSum.html(PayCost.toLocaleString()+"원");
				//아래는 없어져도 됨. 대신 쿠폰 활용해서 쓰면 됨
// 				if(menuList.length>0){
// 					subtotalSum.html(menuList[0].subtotalSum.toLocaleString()+"원")
// 				}else{
// 					subtotalSum.html("0원")
// 				}
				
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		return false;
	}).load();

</script>