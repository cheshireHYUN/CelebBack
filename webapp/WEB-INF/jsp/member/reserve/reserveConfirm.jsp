<%--
* [[개정이력(Modification Information)]]
* 수정일       수정자      수정내용
* ----------  ---------  -----------------
* 2022. 8. 24.      최서현      최초작성
* Copyright (c) 2022 by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>  
<body>
	<main class="pattern_2">
		
		<div class="container margin_60_40">
		    <div class="row justify-content-center">

		        <div class="col-lg-4" style="padding:100px 0px">
		        	<div class="box_booking_2">
		                <div class="head">
		                    <div class="title">
		                    <h3>Reservation complete</h3>
		                    		예약내역 확인 - <a href="/CelebBack/mypage/reserve">Get directions</a>
		                </div>
		                </div>
		                <!-- /head -->
		                <div class="main">
		                	<div id="confirm">
								<div class="icon icon--order-success svg add_bottom_15">
									<svg xmlns="http://www.w3.org/2000/svg" width="72" height="72">
										<g fill="none" stroke="#8EC343" stroke-width="2">
											<circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
											<path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
										</g>
									</svg>
								</div>
								<h3>예약요청 완료!</h3>
								<p>예약이 이용완료되면 스탬프가 자동 발급됩니다.</p>
								<p>&#8251; 예약 확정까지 1~2일 정도 소요될 수 있습니다.</p>
							</div>
		                </div>
		            </div>
		            <!-- /box_booking -->
		        </div>
		        <!-- /col -->
		    </div>
		    <!-- /row -->
		</div>
		<!-- /container --> 
		
	</main>
	<!-- /main -->
</body>

<script>
	$(document).ready(function(){
		$('.element_to_stick').addClass("sticky");
		
		
		$(window).on('scroll', function () {
			if ($(this).scrollTop() > 1) {
				$('.element_to_stick').addClass("sticky");
			} else {
				$('.element_to_stick').addClass("sticky");
			}
		});
	});

</script>

	<!-- COMMON SCRIPTS -->
    <script src="${cPath}/resources/restaurant/js/common_scripts.min.js"></script>
    <script src="${cPath}/resources/restaurant/js/common_func.js"></script>
    <script src="${cPath}/resources/restaurant/phpmailer/validate.js"></script>