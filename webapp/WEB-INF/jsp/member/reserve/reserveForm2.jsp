<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 23.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>   

 <!-- jQuery -->
<!--  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
 <!-- iamport.payment.js -->
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
 
 <script>
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
 </script>
 
<body>
    
	<main>
	<div class="hero_single inner_pages background-image" data-background="url(${cPath }/resources/restaurant/img/background-1400-780.jpg)">
	    <div class="opacity-mask" data-opacity-mask="rgba(0, 0, 0, 0.6)">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-xl-9 col-lg-10 col-md-8">
	                    <h1>Order Food</h1>
	                    <p><span class="element"></span></p>
	                </div>
	            </div>
	            <!-- /row -->
	        </div>
	    </div>
	    <div class="frame white"></div>
	</div>
	<!-- /hero_single -->

	<div class="container margin_60_40">
	    <div class="row">
	        <div class="col-lg-8">
	        
	            <h3>Appitizer</h3>
	            <table class="table cart-list menu-gallery">
	                <thead>
	                    <tr>
	                        <th>
	                            Menu
	                        </th>
	                        <th>
	                            Price
	                        </th>
	                        <th>
	                            Order
	                        </th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                <c:forEach items="${appetizerList}" var="MenuVO">
	                    <tr>
	                        <td class="d-md-flex align-items-center">
	                            <figure>
	                            	<a href="img/menu_items/large/1.jpg" title="Photo title" data-effect="mfp-zoom-in">
	                            		<img src="${cPath}${MenuVO.menuThumbImg}" alt="thumb" class="lazy">
	                            	</a>
	                            </figure>
	                            <div class="flex-md-column">
	                                <h4>${MenuVO.menuName}</h4>
	                                <p>
	                                    ${MenuVO.menuText}
	                                </p>
	                                <input type="hidden" value="${MenuVO.menuId}">
	                            </div>
	                        </td>
	                        <td>
	                            <p  class="priceData" style="display:none;">${MenuVO.menuPrice}</p>
	                            <strong>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" /></strong>
	                        </td>
	                        <td class="options">
	                                <a href="#" onclick='return false;'><i class="icon_plus_alt2"></i></a>
	                        </td>
	                    </tr>
	                  </c:forEach>  
	                    
	                    
	                </tbody>
	            </table>
	            
	            
	            <h3>Main Dishes</h3>

	            <table class="table cart-list menu-gallery">
	                <thead>
	                    <tr>
	                        <th>
	                            Menu
	                        </th>
	                        <th>
	                            Price
	                        </th>
	                        <th>
	                            Order
	                        </th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                <c:forEach items="${mainList}" var="MenuVO">
	                    <tr>
	                        <td class="d-md-flex align-items-center">
	                           <figure>
	                            	<a href="img/menu_items/large/5.jpg" title="Photo title" data-effect="mfp-zoom-in">
	                            		<img src="${cPath}${MenuVO.menuThumbImg}"  alt="thumb" class="lazy">
	                            	</a>
	                            </figure> 
	                            <div class="flex-md-column">
	                                <h4>${MenuVO.menuName}</h4>
	                                <p>
	                                    ${MenuVO.menuText}
	                                </p>
	                                <input type="hidden" value="${MenuVO.menuId}">
	                            </div>
	                        </td>
	                        <td>
	                        <p  class="priceData" style="display:none;">${MenuVO.menuPrice}</p>
	                            <strong>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" /></strong>
	                        </td>
	                        <td class="options">
	                            <a href="#" onclick='return false;'><i class="icon_plus_alt2"></i></a>
	                        </td>
	                    </tr>
	                 </c:forEach>
	                 
	                </tbody>
	            </table>
	            
	            
	            
	            
	            <h3>Desserts</h3>
	            <table class="table cart-list menu-gallery">
	                <thead>
	                    <tr>
	                        <th>
	                            Menu
	                        </th>
	                        <th>
	                            Price
	                        </th>
	                        <th>
	                            Order
	                        </th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                <c:forEach items="${dessertList}" var="MenuVO">
	                    <tr>
	                        <td class="d-md-flex align-items-center">
	                          <figure>
	                            	<a href="img/menu_items/large/11.jpg" title="Photo title" data-effect="mfp-zoom-in">
	                            		<img src="${cPath}${MenuVO.menuThumbImg}"   alt="thumb" class="lazy">
	                            	</a>
	                            </figure>
	                            <div class="flex-md-column">

	                                <h4>${MenuVO.menuName}</h4> 
	                                <p>
	                                    ${MenuVO.menuText}
	                                </p>
	                                <input type="hidden" value="${MenuVO.menuId}">
	                            </div>
	                        </td>
	                        <td>
	                        	<p class="priceData" style="display:none;">${MenuVO.menuPrice}</p>
	                            <strong>&#8361; <fmt:formatNumber value="${MenuVO.menuPrice}" pattern="#,###" /></strong> 
	                        </td>
	                        <td class="options">
	                            <a href="#" onclick='return false;'><i class="icon_plus_alt2"></i></a>

	                        </td>
	                    </tr>
                  </c:forEach>  
	                    
	                </tbody>
	            </table>
	        </div>
	        <!-- /col -->
	        <div class="col-lg-4" id="sidebar_fixed">
	            <div class="box_booking">
	                <div class="head">
	                    <h3>Order Summary</h3>
	                </div>
	                <!-- /head -->
	                <div class="main">

	                    <ul class="clearfix" >
	                    <div>
	                    	${resvInfo.year}년 ${resvInfo.month}월 ${resvInfo.day}일 ${resvInfo.time}시, ${resvInfo.people}명 ${resvInfo.selectSit} 좌석으로 예약됩니다.
	                    </div>
	                    </ul>
	                	
	                    <ul class="clearfix" id="bills">
	                    </ul>
	                    
	                    
	                    <ul class="clearfix" >
	                        <li>Subtotal<span id="subtotal">0</span></li>
	                        <li>Discount<span id="discount">0</span></li>

	                    
	                        <li class="total">Total<span id="total">0</span></li>
	                    </ul>
		                    <div class="row opt_order">
		                        <div class="col-6">
		                            <label class="container_radio">미리 결제</small>
		                                <input type="radio" value="option1" name="opt_order" checked>
		                                <span id="rightNow" class="checkmark"></span>
		                            </label>
		                        </div>
		                        <div class="col-6">
		                            <label class="container_radio">현장 결제</small>
		                                <input type="radio" value="option1" name="opt_order">
		                                <span id="meet" class="checkmark"></span>
		                            </label>
		                        </div>
		                    </div>
		                    
<style>
.dropdown-menu {
	max-height : 300px;
	overflow:auto;
}
</style>
		                    
	     	                <!-- <div class="dropdown day" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"> -->
	     	                <div class="dropdown day">
		                        <a href="#" data-bs-toggle="dropdown"><span id="selected_day">Coupon </span></a>
		                        <div class="dropdown-menu">
			                            <div class="dropdown-menu-content">
			                                <div class="radio_select chose_day">
			                                    
			                                    <b>보유 쿠폰</b>
			                                    <br>
			                                    <br>
			                                    <div>
		                                    <ul>
				                                    <c:forEach items="${cpnList}" var="MyCpnVO">
				                                            <li>
				                                            <input type="radio" id="${MyCpnVO.mycpnId}" name="cpn" value='${MyCpnVO.cpnName}' value2='${MyCpnVO.menuId}' value3='${MyCpnVO.lguName}' value4='${MyCpnVO.mycpnId}'>
				                                            <label for="${MyCpnVO.mycpnId}" style='font-size:small;'>${MyCpnVO.cpnName}<em>${MyCpnVO.cpnContent}</em>
				                                            <em style="color:black;">${MyCpnVO.mycpnEndate.substring(0,10)}까지</em></label>
				                                            </li>
													</c:forEach>
											</ul>
												</div>
			                                </div>
			                                <!-- /people_select -->
			                            </div>
		                        </div>
		                    </div>
		                    
		                    
	     	                <div class="dropdown day2" style="display:none;">
		                        <a href="#" data-bs-toggle="dropdown">만나서결제는 쿠폰 이용이 불가능합니다.</a>
		                    </div>



	                    <!-- /dropdown -->
	                    <button id="saveResv" class="btn_1 full-width mb_5">Submit</button>
	                    <div class="text-center"><small>No money charged on this steps</small></div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- /row -->
	</div>
	<!-- /container -->

	</main>
	
	
		<c:forEach items="${cpnList}" var="MyCpnVO">
		       <input type="hidden" value="${MyCpnVO.menuId}">
		</c:forEach>
		
        <input type="hidden" name="year" value="${resvInfo.year}">
        <input type="hidden" name="month" value="${resvInfo.month}">
        <input type="hidden" name="day" value="${resvInfo.day}">
        <input type="hidden" name="time" value="${resvInfo.time}">
        <input type="hidden" name="people" value="${resvInfo.people}">
        <input type="hidden" name="sitId" value="${resvInfo.selectSit}">
        <input type="hidden" name="franId" value="${franId}">
        <input type="hidden" name="memId" value="${memId}">
	
	
	<!-- /main -->
	<script>
	
	// + 버튼 클릭시 이벤트
	$(".icon_plus_alt2").on('click',function(){
		// 메뉴판에 있는 메뉴명, id, 가격 정보를 저장해놓는다
		let menuName = (((($(this).parent()).parent()).parent()).find("h4")).text();
		//let menuPrice2 = (((($(this).parent()).parent()).parent()).find("strong")).text();
		let menuPrice = (((($(this).parent()).parent()).parent()).find(".priceData")).text();
		
		
		
		let menuId = (((($(this).parent()).parent()).parent()).find("input")).val();

		
		// 방금 클릭한 메뉴 아이디가 이미 영수증에 있는 메뉴면 갯수랑 price만 변화하도록
		if(($('#bills').find("#"+menuId)).length == 1){
			let preCnt = ($("#"+menuId).children('a')).data('cnt');
			let postCnt = Number(preCnt)+1;
			let postPrice = postCnt * Number(menuPrice);
			let updateList = "<a href='#' onclick='return false;' data-cnt='"+postCnt+"'>"+postCnt+"x "+menuName+"</a><span>"+postPrice+"</span>";
			($('#bills').find("#"+menuId)).html(updateList);
			
		} else {
			// 이미 추가한 메뉴가 아니면 영수증에 메뉴 추가
	 		let list = "<li id = '"+menuId+"' data-price='"+menuPrice+"'><a href='#' onclick='return false;' data-cnt='1'>1x "+menuName+"</a><span>"+menuPrice+"</span></li>";
			$('#bills').append(list);
		}
		
		// 메뉴삭제이벤트 세팅
		deleteMenu();
		// subtotal 세팅
		calSubTotal();
		// total 세팅
		calTotal();
	});
	
	// 영수증에서 메뉴삭제
	function deleteMenu(){
		$('.main ul li a').on('click', function (c) {
			$(this).parent().fadeOut('slow', function () {
				// 아예 li를 삭제까지 해야함
				$(this).remove();
				calSubTotal();
				calTotal();
			});
		});
	}
	
	
	// subtotal 계산
	function calSubTotal(){
		let subTotal = 0;
		$("#bills").find('span').each(function(index, item){
		 	subTotal += Number($(item).text());
		});	
		$('#subtotal').html(subTotal);
	}
	
	
	// total 계산
	function calTotal(){
		let total = Number($('#subtotal').text()) - Number($('#discount').text());
		$('#total').html(total);
	};
 	
	
	let payMethod = 'now';
	// 결제방식 선택
	$("#meet").on('click',function(){
		$(".dropdown.day").css("display","none");
		$(".dropdown.day2").css("display","block");
		$('#discount').html("0");
		//$('#total').html("0");
		payMethod = 'meet';
	});
	$("#rightNow").on('click',function(){
		$(".dropdown.day").css("display","block");
		$(".dropdown.day2").css("display","none");
		payMethod = 'now';
	});

	// 쿠폰 검증
	let selectCpnId = '';
       	$('.radio_select input[type="radio"]').on("click", function (){
       		// 선택한 쿠폰이 사용 가능한지 menuId를 비교해야 한다
       		let cpnMenuId = $(this).attr('value2');
       		let arr = new Array();
       		$("#bills").find('li').each(function(index, item){
       			let billMenuId = $(item).attr('id');
       			arr.push(billMenuId);
    		});	
       		
       		if (arr.includes(cpnMenuId)){
       			// 영수증에 해당 쿠폰메뉴와 동일한 ID가 있다면
       			let value = $("input[name='cpn']:checked").val();
           	    $('#selected_day').text(value);
           	    // 쿠폰에 해당하는 할인가격 표시 
           	    let cpnPrice = $(this).attr('value3');
           	    $('#discount').text(cpnPrice);  
           	 	selectCpnId = $(this).attr('value4');
           	 	
       		} else if(cpnMenuId == 'ALL') {
       			let value = $("input[name='cpn']:checked").val();
           	    $('#selected_day').text(value);
           	    // 쿠폰에 해당하는 할인가격 표시 
           	    let cpnPrice = $(this).attr('value3');
           	    $('#discount').text(cpnPrice);  
           	 	selectCpnId = $(this).attr('value4');
       		} else {
       			alert("사용조건이 충족되지 않았습니다.");
       		};
       		calTotal();
       	});
	
    var IMP = window.IMP; // 생략 가능
    IMP.init("imp06682244"); // 예: imp00000000
    
    function requestPay(franId, memId, year, month, day, time, people, selectSit, menus, menupara, totalPrice) {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis",
            pay_method: "card",
            merchant_uid : 'merchant_' + new Date().getTime(),
            name: menupara,
            amount: 100,
            buyer_name: memId,
            buyer_tel : '010-1234-5678'
        }, function (rsp) {
        	// 결제검증
        	// rsp에 실제 결제한 금액인 resp.paid.amount가 return된다.
        	// resp.imp_uid를 통해 ajax로 검증을 실행한다.
			jQuery.ajax({
	        	type : "POST",
				beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				},
	        	url : "${cPath}/reserve/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {

	        	let value = jQuery(data).find("amount").text()
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == value){
				// 검증 완료		        	
	                jQuery.ajax({
	    				type : 'post',
	    				url : '${cPath}/reserve/saveReserve',
	    				contentType: 'application/json',
	    				
	    				beforeSend : function(xhr)
	    				{
	    				   xhr.setRequestHeader(header,token);
	    				},
	    				
	    				data : JSON.stringify({ 
	    					franId :franId,
	    					memId : memId,
	    					year : year,
	    					month : month,
	    					day : day,
	    					time : time,
	    					people : people,
	    					selectSit : selectSit,
	    					resvMenu : menus,
	    					payallYn : "Y",
	    					totalPrice : totalPrice,
	    					mycpnId : selectCpnId,
	    					payPg : rsp.imp_uid
	    				})
	                }).done(function (data) {
	                  // 가맹점 서버 결제 API 성공시 로직
	                  alert("결제가 완료되었습니다.");
	                  location.replace('${cPath}/reserve/confirm');
	                });
	                
	        	} else {
	        		alert("결제 실패");
	        		
	        	}
	        });
        	
        });
      }
    
    
	// 제출버튼 클릭
	$('#saveResv').on('click', function(){
		// 메뉴를 array에 저장
		let menus = new Array();
   		$("#bills").find('li').each(function(index, item){
   			let billMenuId = $(item).attr('id');
   			let billMenuCnt = ($(item).find('a')).data('cnt');
   			let billMenuPrice = ($(item)).data('price');
   			menus.push(billMenuId+";"+billMenuCnt+";"+billMenuPrice);
		});	
   		
		let selectMenuCnt = $("#bills").find('li').length;
		let franId = $('input[name=franId]').val();
		let year = $('input[name=year]').val();
		let memId = $('input[name=memId]').val();
		let month = $('input[name=month]').val();
		let day = $('input[name=day]').val();
		let time = $('input[name=time]').val();
		let people = $('input[name=people]').val();
		let selectSit = $('input[name=sitId]').val();
		let totalPrice = $('#total').text();
		
		// 결제 유형에 따라 컨트롤러 분리
		if(payMethod == 'now'){
		// 바로결제
			let menupara = '';
			// 결제api에 띄울 메뉴이름 처리
			if(Number(selectMenuCnt)==1){
				let menufull = ($("#bills").find('a').text()).split('x');
				menupara = menufull[1];
			}else{
				let smc = Number(selectMenuCnt)-1;
				let menufull = ( ($($("#bills").find('a')[0]).text()).split('x') );
				menupara = menufull[1]+' 외 '+smc+'건';
			}
			// 결제api 호출하기
			requestPay(franId, memId, year, month, day, time, people, selectSit, menus, menupara, totalPrice);
			
			 
		} else{
			// 대면결제 - 예약내역을 save하는 컨트롤러로 ajax 통신
       		let resvInfos = JSON.stringify({ 
				franId :franId,
				year : year,
				memId : memId,
				month : month,
				day : day,
				time : time,
				people : people,
				selectSit : selectSit,
				resvMenu : menus,
				payallYn : "N",
				totalPrice : totalPrice
			});
			
 			$.ajax({
				type : 'post',
				url : '${cPath}/reserve/saveReserve',
				contentType: 'application/json',
				data : resvInfos,
				beforeSend : function(xhr)
				{
				   xhr.setRequestHeader(header,token);
				},
				success : function(data){
					if(data == 'success'){
						location.replace('${cPath}/reserve/confirm');
					}
				},
				error : function(data){
					alert("예약이 저장되지 못했습니다!");
				}
			});
		}
	})
	
	
	


	
	</script>
	
	
</body>
	<!-- COMMON SCRIPTS -->
    <script src="${cPath}/resources/restaurant/js/common_scripts.min.js"></script>
    <script src="${cPath}/resources/restaurant/js/common_func.js"></script>
    <script src="${cPath}/resources/restaurant/phpmailer/validate.js"></script>
    
        <!-- SPECIFIC SCRIPTS -->
    <script src="${cPath}/resources/restaurant/js/sticky_sidebar.min.js"></script>
    <script src="${cPath}/resources/restaurant/js/shop_order_func.js"></script>